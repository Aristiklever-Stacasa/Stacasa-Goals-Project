const express = require('express');
const database = require('../database/database');
const { dateForQuery } = require('../public/js/utilities');
const { insertMetas, updateMetas } = require('./AuxController');

const indexFisicas = (req, res) => {
  var date = "";

  database.connect(function (err) {
    if (req.params.date) {
      // console.log(req.params);
      date = req.params.date;
    }
    else
      date = dateForQuery();

    const queryProcess = "SELECT CD_PROCESSO, DS_NOME FROM processos;";
    const queryMetasFisicasCurrentDate = "SELECT mf.CD_METAS_FISICAS, p.CD_PROCESSO, s.DS_NOME, mf.NR_META, mf.NR_CONSTATACOES, lmf.NR_EVID_APRESENTA, lmf.DS_JUSTIFIC, lmf.NR_JULG_COMISSAO FROM metas_fisicas mf LEFT JOIN (SELECT CD_METAS_FISICAS, NR_EVID_APRESENTA, DS_JUSTIFIC, NR_JULG_COMISSAO, NR_SALDO FROM log_metas_fisicas lmf WHERE lmf.DT_CRIACAO LIKE '" + date + "%') lmf ON lmf.CD_METAS_FISICAS = mf.CD_METAS_FISICAS INNER JOIN setores s ON s.CD_SETOR = mf.CD_SETOR INNER JOIN processos p ON p.CD_PROCESSO = mf.CD_PROCESSO;";
    const queryDocuments = "SELECT mff.CD_METAS_FONTES_FISICAS, mff.CD_METAS_FISICAS, mff.CD_FONTES_EVIDENCIAS_FISICAS, fef.CD_DOC, fef.DS_NOME, fef.DS_DIRETORIO FROM metas_fontes_fisicas mff INNER JOIN fontes_evidencias_fisica fef ON mff.CD_FONTES_EVIDENCIAS_FISICAS = fef.CD_DOC WHERE mff.DT_VINCULACAO LIKE '" + date + "%';";

    // + queryMetasFisicasCurrentDate + "; "

    database.query(queryProcess + queryMetasFisicasCurrentDate,
      (err, result, fields) => {

        result[0].forEach(value => {
          value.id = value.DS_NOME.split(' ')[0];
        });

        // console.log(result[1]);
        database.query(queryDocuments,
          (err, docs, fields) => {

            res.render('metasfisicas/index', {
              process: result[0],
              physics_goals: result[1],
              documents: docs
            });

          });

      }
    );

  });
};

const fisicaManagementData = (req, res) => {
  let body = req.body;
  let files = req.files;

  if (body.evidpres == "")
    body.evidpres = 0;
  // res.json({ files, body });

  database.connect(function (err) {
    database.query("SELECT COUNT(*) length FROM log_metas_fisicas WHERE CD_METAS_FISICAS = " + body.cd_metas_fisicas + " AND DT_CRIACAO LIKE '" + dateForQuery() + "%'",
      (err, result, fields) => {
        if (result[0].length)
          console.log();
        // res.json({ res: 'update' });
        //updateMetas("fisicas", { body, files });
        else {
          // res.json(insertMetas("fisicas", { body, files }));
          insertMetas("fisicas", { body, files });
        }

      });

  });

  res.redirect('/');
};

module.exports = {
  indexFisicas,
  fisicaManagementData
}
