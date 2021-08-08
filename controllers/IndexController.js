const express = require('express');
const database = require('../database/database');

const fisicas = (req, res) => {
  database.connect(function(err) {
  
    database.query("SELECT CD_PROCESSO, DS_NOME FROM processos; SELECT p.CD_PROCESSO, s.DS_NOME, mf.NR_META, mf.NR_CONSTATACOES, mf.NR_EVID_APRESENTA, mf.DS_JUSTIFIC FROM metas_fisicas mf INNER JOIN setores s ON s.CD_SETOR = mf.CD_SETOR INNER JOIN processos p ON p.CD_PROCESSO = mf.CD_PROCESSO",
      ( err, result, fields ) => {

        result[0].forEach(value => {
          value.id = value.DS_NOME.substr(0, 2);
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
  database.connect(function(err) {
  
      database.query("SELECT CD_SETORES, DS_NOME FROM setores; SELECT * FROM metas_qualit INNER JOIN ",
        ( err, result, fields ) => {
  
          result[0].forEach(value => {
            value.id = value.DS_NOME.substr(0, 2);
          });
  
          res.render('metasqualitativas/index', {
            setors: result[0],
            physics_goals: result[1]
          });
  
        }
      );

      database.query("SELECT p.CD_PROCESSO, s.DS_NOME, mf.NR_META, mf.NR_CONSTATACOES, mf.NR_EVID_APRESENTA, mf.DS_JUSTIFIC FROM metas_fisicas mf INNER JOIN setores s ON s.CD_SETOR = mf.CD_SETOR INNER JOIN processos p ON p.CD_PROCESSO = mf.CD_PROCESSO WHERE p.CD_PROCESSO = 1", function (err, result, fields) {

        res.render('metasqualitativas/index', {
          result: result
        });

      });
  
  });
};

module.exports = {
  fisicas,
  qualitativas
};

