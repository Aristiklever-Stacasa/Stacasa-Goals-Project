const express = require('express');
const database = require('../database/database');

const dateForQuery = () => {
  let currentMonth = new Date().getMonth() + 1;
  if(currentMonth > 9)
    return (new Date().getFullYear() + "-" + currentMonth);
  
  return (new Date().getFullYear() + "-0" + currentMonth);
};

const fisicas = (req, res) => {
  database.connect(function (err) {

    const queryProcess = "SELECT CD_PROCESSO, DS_NOME FROM processos";
    const queryMetasFisicasCurrentDate = "SELECT mf.CD_METAS_FISICAS, p.CD_PROCESSO, s.DS_NOME, mf.NR_META, mf.NR_CONSTATACOES, lmf.NR_EVID_APRESENTA, lmf.DS_JUSTIFIC, lmf.NR_JULG_COMISSAO FROM metas_fisicas mf LEFT JOIN (SELECT CD_METAS_FISICAS, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO, NR_SALDO FROM log_metas_fisicas lmf WHERE lmf.DT_CRIACAO LIKE '" + dateForQuery() + "%') lmf ON lmf.CD_METAS_FISICAS = mf.CD_METAS_FISICAS INNER JOIN setores s ON s.CD_SETOR = mf.CD_SETOR INNER JOIN processos p ON p.CD_PROCESSO = mf.CD_PROCESSO";
    const queryDocuments = "SELECT mff.CD_METAS_FONTES_FISICAS, mff.CD_METAS_FISICAS, mff.CD_FONTES_EVIDENCIAS_FISICAS, fef.CD_DOC, fef.DS_NOME, fef.DS_DIRETORIO FROM metas_fontes_fisicas mff INNER JOIN fontes_evidencias_fisica fef ON mff.CD_FONTES_EVIDENCIAS_FISICAS = fef.CD_DOC WHERE mff.DT_VINCULACAO LIKE '" + dateForQuery() + "%'";

    database.query(queryProcess + "; " + queryMetasFisicasCurrentDate + "; " + queryDocuments,
      (err, result, fields) => {

        result[0].forEach(value => {
          value.id = value.DS_NOME.split(' ')[0];
        });

        res.render('metasfisicas/index', {
          process: result[0],
          physics_goals: result[1],
          documents: result[2]
        });

      }
    );

  });
};

const qualitativas = (req, res) => {
  database.connect(function (err) {

    const setors = "SELECT DISTINCT s.CD_SETOR, s.DS_NOME SETOR FROM metas_qualit mq INNER JOIN setores s ON mq.CD_SETOR = s.CD_SETOR";
    const queryMetasQualitCurrentDate = "SELECT mq.CD_METAS_QUALIT, s.CD_SETOR, s.DS_NOME, mq.DS_NOME, mq.NR_CONSTATACOES, lmq.NR_EVID_APRESENTA, lmq.DS_JUSTIFIC, lmq.NR_JULG_COMISSAO FROM metas_qualit mq LEFT JOIN (SELECT CD_METAS_QUALIT, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO FROM log_metas_qualit lmq WHERE lmq.DT_CRIACAO LIKE '" + dateForQuery() + "%') lmq ON lmq.CD_METAS_QUALIT = mq.CD_METAS_QUALIT INNER JOIN setores s ON s.CD_SETOR = mq.CD_SETOR";
    const queryDocuments = "SELECT mfq.CD_METAS_FONTES_QUALIT, mfq.CD_METAS_QUALIT, mfq.CD_FONTES_EVIDENCIAS_QUALIT, feq.CD_DOC, feq.DS_NOME, feq.DS_DIRETORIO FROM metas_fontes_qualit mfq INNER JOIN fontes_evidencias_qualit feq ON mfq.CD_FONTES_EVIDENCIAS_QUALIT = feq.CD_DOC WHERE mfq.DT_VINCULACAO LIKE '" + dateForQuery() + "%'";

    database.query(setors + "; " + queryMetasQualitCurrentDate + "; " + queryDocuments,
      (err, result, fields) => {

        result[0].forEach(value => {
          value.id = value.SETOR.split(' ')[0];
        });

        // res.json(result[2]);

        res.render('metasqualitativas/index', {
          setors: result[0],
          qualitative_goals: result[1],
          documents: result[2]
        });

      }
    );

  });
};

const fisicDataInsert = (req, res) => {
  let body = req.body;
  let files = req.files;

  // res.json({ files, body });

  database.connect(function (err) {
    database.query("SELECT COUNT(*) length FROM log_metas_fisicas WHERE CD_METAS_FISICAS = "+ body.cd_metas_fisicas +" AND DT_CRIACAO LIKE '" + dateForQuery() + "%'",
    (err, result, fields) => {
      if(result[0].length)
        res.json({ res: 'update' });
        // update("fisicas", {body, files});
      else {
        // res.json(insertMetas("fisicas", { body, files }));
        insertMetas("fisicas", { body, files });
      }

    });
    /*
    const insertLogMetasFisicas = "INSERT INTO log_metas_fisicas(CD_METAS_FISICAS, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO) VALUES (" + body.cd_metas_fisicas + ", " + body.evidpres + ", '" + body.justifications + "', " + body.julgcomis + ")";
    // const updateLast = "UPDATE metas_fisicas SET NR_EVID_APRESENTA = " + body.evidpres + ", DS_JUSTIFIC = '"  + body.justifications + "', NR_JULG_COMISSAO = " + body.julgcomis + " WHERE CD_METAS_FISICAS = " + body.CD_METAS_FISICAS;

    // Inserção de Meta
    database.query(insertLogMetasFisicas, (err, result, fields) => {
      // res.json(result);
    });

    //Inserção de arquivos
    files.forEach(file => {
      database.query("INSERT INTO fontes_evidencias_fisica (DS_NOME, DS_DIRETORIO) VALUES ('" + file.filename + "', '" + file.destination + file.filename + "')",
        (err, insert_file, fields) => {
          // res.json({ files, body, err, insertedId: insert_file.insertId });

          let cd_doc = insert_file.insertId;

          database.query("INSERT INTO metas_fontes_fisicas (CD_METAS_FISICAS, CD_FONTES_EVIDENCIAS_FISICAS) VALUES (" + body.cd_metas_fisicas + ", " + cd_doc + ")",
            (err, resultBind, fields) => {
              // console.log({ body, insertedId: cd_doc, resultBind });
            });

        });
    });*/
  });

  res.redirect('back');
};

const qualitDataInsert = (req, res) => {
  let body = req.body;
  let files = req.files;

  // res.json({ body, files });

  database.connect(function (err) {
    database.query("SELECT COUNT(*) length FROM log_metas_qualit WHERE CD_METAS_QUALIT = "+ body.cd_metas_qualit +" AND DT_CRIACAO LIKE '" + dateForQuery() + "%'",
    (err, result, fields) => {
      if(result[0].length)
        res.json({ res: 'update' });
        // update("fisicas", {body, files});
      else {
        // res.json(insertMetas("fisicas", { body, files }));
        insertMetas("qualit", { body, files });
      }

    });
    /*
    const insertLogMetasQualit = "INSERT INTO log_metas_qualit(CD_METAS_QUALIT, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO) VALUES (" + body.cd_metas_qualit + ", " + body.evidpres + ", '" + body.justifications + "', " + body.julgcomis + ")";
    

    // Inserção de Meta
    database.query(insertLogMetasQualit, (err, result, fields) => {
      // res.json({ err, result });
    });

    // Inserção de arquivos
    files.forEach(file => {
      database.query("INSERT INTO fontes_evidencias_qualit (DS_NOME, DS_DIRETORIO) VALUES ('" + file.filename + "', '" + file.destination + file.filename + "')",
        (err, insert_file, fields) => {
          // res.json({ files, body, err, insertedId: insert_file.insertId });

          let cd_doc = insert_file.insertId;

          database.query("INSERT INTO metas_fontes_qualit (CD_METAS_QUALIT, CD_FONTES_EVIDENCIAS_QUALIT) VALUES (" + body.cd_metas_qualit + ", " + cd_doc + ")",
            (err, resultBind, fields) => {
              // console.log({ body, insertedId: cd_doc, resultBind });
            });

        });
    });*/
  });

  res.redirect('/metas/qualitativas');
};

const insertMetas = (meta, data) => {

  let queryInsertLogMeta;

  database.connect((err) => {
    if(meta === "fisicas")
    {
      // Inserção Metas
      queryInsertLogMeta = "INSERT INTO log_metas_fisicas(CD_METAS_FISICAS, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO) VALUES (" + data.body.cd_metas_fisicas + ", " + data.body.evidpres + ", '" + data.body.justifications + "', " + data.body.julgcomis + ")";
      database.query(queryInsertLogMeta, () => {});
      
      //Inserção de arquivos
      data.files.forEach(file => {
        database.query("INSERT INTO fontes_evidencias_fisica (DS_NOME, DS_DIRETORIO) VALUES ('" + file.filename + "', '" + file.destination + file.filename + "')",
          (err, insert_file, fields) => {
            // res.json({ files, body, err, insertedId: insert_file.insertId });

            const cd_doc = insert_file.insertId;

            database.query("INSERT INTO metas_fontes_fisicas (CD_METAS_FISICAS, CD_FONTES_EVIDENCIAS_FISICAS) VALUES (" + data.body.cd_metas_fisicas + ", " + cd_doc + ")",
              (err, resultBind, fields) => {
                // console.log({ body, insertedId: cd_doc, resultBind });
              });

          });
      });

    }
    else {
      queryInsertLogMeta = "INSERT INTO log_metas_qualit(CD_METAS_QUALIT, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO) VALUES (" + data.body.cd_metas_qualit + ", " + data.body.evidpres + ", '" + data.body.justifications + "', " + data.body.julgcomis + ")";
      database.query(queryInsertLogMeta, () => {});

      // Inserção de arquivos
      data.files.forEach(file => {
        database.query("INSERT INTO fontes_evidencias_qualit (DS_NOME, DS_DIRETORIO) VALUES ('" + file.filename + "', '" + file.destination + file.filename + "')",
          (err, insert_file, fields) => {
            // res.json({ files, data.body, err, insertedId: insert_file.insertId });

            let cd_doc = insert_file.insertId;

            database.query("INSERT INTO metas_fontes_qualit (CD_METAS_QUALIT, CD_FONTES_EVIDENCIAS_QUALIT) VALUES (" + data.body.cd_metas_qualit + ", " + cd_doc + ")",
              (err, resultBind, fields) => {
                // console.log({ body, insertedId: cd_doc, resultBind });
              });

          });
      });
    }
  
  });

  return({meta, data});
};

const updateMetas = (meta, data) => {
  database.connect((err) => {
    if(meta === "fisicas")
    {
      const queryDataUpdate = "UPDATE TABLE log_metas_fisicas SET NR_EVID_APRESENTA = "+ data.body.evidpres +", DS_JUSTIFIC = '"+ data.body.justifications +"', NR_JULG_COMISSAO = "+ data.body.julgcomis +" WHERE CD_METAS_QUALIT = "+ body.cd_metas_fisicas +" AND DT_CRIACAO LIKE '" + dateForQuery() + "%'"
    }
    else {
      // const updateLast = "UPDATE metas_fisicas SET NR_EVID_APRESENTA = " + body.evidpres + ", DS_JUSTIFIC = '"  + body.justifications + "', NR_JULG_COMISSAO = " + body.julgcomis + " WHERE CD_METAS_FISICAS = " + body.CD_METAS_FISICAS;
    }
  });
};

module.exports = {
  fisicas,
  qualitativas,
  fisicDataInsert,
  qualitDataInsert
};

