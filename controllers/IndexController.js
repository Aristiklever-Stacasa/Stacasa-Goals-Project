const express = require('express');
const database = require('../database/database');

const fisicas = (req, res) => {
  database.connect(function (err) {

    database.query("SELECT CD_PROCESSO, DS_NOME FROM processos; SELECT p.CD_PROCESSO, s.DS_NOME, mf.NR_META, mf.NR_CONSTATACOES, mf.NR_EVID_APRESENTA, mf.DS_JUSTIFIC FROM metas_fisicas mf INNER JOIN setores s ON s.CD_SETOR = mf.CD_SETOR INNER JOIN processos p ON p.CD_PROCESSO = mf.CD_PROCESSO",
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

    database.query("SELECT DISTINCT s.CD_SETOR, s.DS_NOME SETOR FROM metas_qualit mq INNER JOIN setores s ON mq.CD_SETOR = s.CD_SETOR; SELECT s.CD_SETOR, s.DS_NOME, mq.DS_NOME, mq.NR_CONSTATACOES, mq.NR_EVID_APRESENTA, mq.DS_JUSTIFIC FROM metas_qualit mq INNER JOIN setores s ON mq.CD_SETOR = s.CD_SETOR",
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
  res.redirect('back');
};

module.exports = {
  fisicas,
  qualitativas,
  file
};

