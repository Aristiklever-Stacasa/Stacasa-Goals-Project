const express = require('express');
const database = require('../database/database');
const { dateForQuery } = require('../public/js/utilities');
const { insertMetas, updateMetas } = require('./AuxController');

const indexQualit = (req, res) => {
  var date = "";

  database.connect(function (err) {
    if (req.params.date) {
      //console.log(req.params);
      date = req.params.date;
    } else {
      date = dateForQuery();
    }

    const setors = "SELECT DISTINCT s.CD_SETOR, s.DS_NOME SETOR FROM metas_qualit mq INNER JOIN setores s ON mq.CD_SETOR = s.CD_SETOR";
    const queryMetasQualitCurrentDate = "SELECT mq.CD_METAS_QUALIT, s.CD_SETOR, s.DS_NOME, mq.DS_NOME, mq.NR_CONSTATACOES, lmq.NR_EVID_APRESENTA, lmq.DS_JUSTIFIC, lmq.NR_JULG_COMISSAO FROM metas_qualit mq LEFT JOIN (SELECT CD_METAS_QUALIT, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO FROM log_metas_qualit lmq WHERE lmq.DT_CRIACAO LIKE '" + date + "%') lmq ON lmq.CD_METAS_QUALIT = mq.CD_METAS_QUALIT INNER JOIN setores s ON s.CD_SETOR = mq.CD_SETOR";
    const queryDocuments = "SELECT mfq.CD_METAS_FONTES_QUALIT, mfq.CD_METAS_QUALIT, mfq.CD_FONTES_EVIDENCIAS_QUALIT, feq.CD_DOC, feq.DS_NOME, feq.DS_DIRETORIO FROM metas_fontes_qualit mfq INNER JOIN fontes_evidencias_qualit feq ON mfq.CD_FONTES_EVIDENCIAS_QUALIT = feq.CD_DOC WHERE mfq.DT_VINCULACAO LIKE '" + date + "%'";

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


const qualitDataManagement = (req, res) => {
  let body = req.body;
  let files = req.files;

  if (body.evidpres == "")
    body.evidpres = 0;

  // res.json({ body, files });

  database.connect(function (err) {
    database.query("SELECT COUNT(*) length FROM log_metas_qualit WHERE CD_METAS_QUALIT = " + body.cd_metas_qualit + " AND DT_CRIACAO LIKE '" + dateForQuery() + "%'",
      (err, result, fields) => {
        if (result[0].length)
          updateMetas("qualit", { body, files });
        // res.json({ res: 'update' });
        else
          insertMetas("qualit", { body, files });
          // res.json(insertMetas("fisicas", { body, files }));

      });

  });

  res.redirect('/metas/qualitativas');
};

module.exports = {
  indexQualit,
  qualitDataManagement
}
