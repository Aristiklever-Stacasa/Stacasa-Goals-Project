const express = require('express');
const database = require('../database/database');

const fisicas = (req, res) => {
  database.connect(function (err) {

    database.query("SELECT CD_PROCESSO, DS_NOME FROM processos; SELECT mf.CD_METAS_FISICAS, p.CD_PROCESSO, s.DS_NOME, mf.NR_META, mf.NR_CONSTATACOES, mf.NR_EVID_APRESENTA, mf.DS_JUSTIFIC FROM metas_fisicas mf INNER JOIN setores s ON s.CD_SETOR = mf.CD_SETOR INNER JOIN processos p ON p.CD_PROCESSO = mf.CD_PROCESSO",
      (err, result, fields) => {

        result[0].forEach(value => {
          value.id = value.DS_NOME.split(' ')[0];
        });

        res.render('metasfisicas/index', {
          process: result[0],
          physics_goals: result[1]
        });

      }
    );

  });
};

const qualitativas = (req, res) => {
  database.connect(function (err) {

    database.query("SELECT DISTINCT s.CD_SETOR, s.DS_NOME SETOR FROM metas_qualit mq INNER JOIN setores s ON mq.CD_SETOR = s.CD_SETOR; SELECT mq.CD_METAS_QUALIT, s.CD_SETOR, s.DS_NOME, mq.DS_NOME, mq.NR_CONSTATACOES, mq.NR_EVID_APRESENTA, mq.DS_JUSTIFIC FROM metas_qualit mq INNER JOIN setores s ON mq.CD_SETOR = s.CD_SETOR",
      (err, result, fields) => {

        result[0].forEach(value => {
          value.id = value.SETOR.split(' ')[0];
        });

        res.render('metasqualitativas/index', {
          setors: result[0],
          qualitative_goals: result[1]
        });

      }
    );

  });
};

const file = (req, res) => {
  //res.json({file: req.files, body: req.body});
  let files = req.files;
  let body = req.body;

  database.connect(function (err) {

    database.query("UPDATE metas_fisicas SET NR_EVID_APRESENTA = " + body.evidpres + ", DS_JUSTIFIC = '"  + body.justifications + "', NR_JULG_COMISSAO = " + body.julgcomis + " WHERE CD_METAS_FISICAS = " + body.CD_METAS_FISICAS, (err, result, fields) => {

          //Inserção de arquivos
          files.forEach(file => {
            database.query("INSERT INTO fontes_evidencias_fisica (DS_NOME, DS_DIRETORIO) VALUES ('" + file.filename + "', '" + file.destination + file.filename + "')", (err, insert_file, fields) => {
              //console.log({ files, body, err, insertedId: insert_file.insertId });

              let cd_doc = insert_file.insertId;

              database.query("INSERT INTO metas_fontes_fisicas (CD_METAS_FISICAS, CD_FONTES_EVIDENCIAS_FISICAS) VALUES (" + body.CD_METAS_FISICAS + ", " + cd_doc + ")",
              (err, resultBind, fields) => {
                  //console.log({ insertedId: insert_file.insertId, resultBind });
              });

            });
            
          });

          res.redirect('back');
          
        }
    );
  });
  

  //res.json(files);
  //res.send(files[0]['filename']);

  
  //res.send(files[0]['fieldname']);
  //res.redirect('back');

  /*metas_fisicas -> fontes_evidencias_fisica -> metas_fontes_fisicas*/

  /*
  --Metas Físicas--
  UPDATE metas_fisicas
  SET NR_EVID_APRESENTA = body.evidpres, DS_JUSTIFIC = body.justifications,
  NR_JULG_COMISSAO = body.julgcomis, NR_SALDO = body.value4
  WHERE condition;

  --Arquivo--
  DS_NOME = filename
  DS_DIRETORIO = path

  --Relação Meta_Arquivo--
  CD_METAS_FISICAS
  CD_FONTES_EVIDENCIAS_FISICAS
  */

  /*
  fieldname	"physycfile"
  originalname	"mpdf.pdf"
  encoding	"7bit"
  mimetype	"application/pdf"
  destination	"uploads/"
  filename	"mpdf.pdf"
  path	"uploads\\mpdf.pdf"
  size	115965

  evidpres	"230"
  julgcomis	"12.0"
  justifications	"ergfdgsfdgsfdg"
  */
};

module.exports = {
  fisicas,
  qualitativas,
  file
};

