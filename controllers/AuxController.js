const database = require('../database/database');
const { dateForQuery } = require('../public/js/utilities');
const fs = require('fs');

const insertMetas = (meta, data) => {

  let queryInsertLogMeta;

  database.connect((err) => {
    if (meta === "fisicas") {
      // Inserção Metas
      queryInsertLogMeta = "INSERT INTO log_metas_fisicas(CD_METAS_FISICAS, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO) VALUES (" + data.body.cd_metas_fisicas + ", " + data.body.evidpres + ", '" + data.body.justifications + "', " + data.body.julgcomis + ")";
      database.query(queryInsertLogMeta, () => { });

      //Inserção de arquivos
      insertDocs(data);

    }
    else {

      queryInsertLogMeta = "INSERT INTO log_metas_qualit(CD_METAS_QUALIT, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO) VALUES (" + data.body.cd_metas_qualit + ", " + data.body.evidpres + ", '" + data.body.justifications + "', " + data.body.julgcomis + ")";
      database.query(queryInsertLogMeta, () => { });

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

  return ({ meta, data });
};

const updateMetas = (meta, data) => {

  // console.log("DELETE FROM metas_fontes_fisicas WHERE CD_METAS_FISICAS = " + data.body.cd_metas_fisicas + " AND CD_FONTES_EVIDENCIAS_FISICAS IN ("+ data.body.docs +") AND DATE_FORMAT(DT_VINCULACAO, '%Y-%m') = '" + dateForQuery() + "'");
  // console.log(data.body.docs ? true : false);

  database.connect((err) => {

    if (meta === "fisicas") {
      const queryDataUpdate = "UPDATE log_metas_fisicas SET NR_EVID_APRESENTA = " + data.body.evidpres + ", DS_JUSTIFIC = '" + data.body.justifications + "', NR_JULG_COMISSAO = " + data.body.julgcomis + " WHERE CD_METAS_FISICAS = " + data.body.cd_metas_fisicas + " AND DATE_FORMAT(DT_CRIACAO, '%Y-%m') = '" + dateForQuery() + "'";
      database.query(queryDataUpdate, (err, result, fields) => {
        // console.log({ err, updateFisic: result });
      });

      if(data.body.docs) {
        database.query("DELETE FROM metas_fontes_fisicas WHERE CD_METAS_FISICAS = " + data.body.cd_metas_fisicas + " AND CD_FONTES_EVIDENCIAS_FISICAS IN ("+ data.body.docs +") AND DATE_FORMAT(DT_VINCULACAO, '%Y-%m') = '" + dateForQuery() + "'",
        (err, result, fields) => {
        // console.log({ err, deleteFisic: result });
        });

        database.query("DELETE FROM fontes_evidencias_fisica WHERE CD_DOC IN ("+ data.body.docs +")",
        (err, result, fields) => {})

        data.files.forEach(file => {
          fs.unlink(file.destination + file.filename,
          (err) => {
            if(err) throw err;
            console.log("O arquivo " + data.files[0].filename + " foi deletado!");
          })
        });

      }

      if(data.files.length)
        insertDocs("fisicas",data);
        
    }
    else {
      const queryDataUpdate = "UPDATE log_metas_qualit SET NR_EVID_APRESENTA = " + data.body.evidpres + ", DS_JUSTIFIC = '" + data.body.justifications + "', NR_JULG_COMISSAO = " + data.body.julgcomis + " WHERE CD_METAS_QUALIT = " + data.body.cd_metas_qualit + " AND DATE_FORMAT(DT_CRIACAO, '%Y-%m') = '" + dateForQuery() + "'";
      database.query(queryDataUpdate, () => { });

      if(data.body.docs) {
        database.query("DELETE FROM metas_fontes_qualit WHERE CD_METAS_QUALIT = " + data.body.cd_metas_qualit + " AND CD_FONTES_EVIDENCIAS_QUALIT IN ("+ data.body.docs +") AND DATE_FORMAT(DT_VINCULACAO, '%Y-%m') = '" + dateForQuery() + "'",
        (err, result, fields) => {
        // console.log({ err, deleteFisic: result });
        });

        database.query("DELETE FROM fontes_evidencias_qualit WHERE CD_DOC IN ("+ data.body.docs +")",
        (err, result, fields) => {})

        data.files.forEach(file => {
          fs.unlink(file.destination + file.filename,
          (err) => {
            if(err) throw err;
            console.log("O arquivo " + data.file.filename + " foi deletado!");
          });
        });

      }

      if(data.files.length)
        insertDocs("qualit", data);

    }

  });

  return ({ meta, data });
};

const insertDocs = (meta, data) => {
  if(meta === "fisicas") {
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
  }else{
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

}

module.exports = {
  insertMetas,
  updateMetas
}
