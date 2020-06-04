const View = require('./ttt-view.js');
const Game = require('../../tic_tac_toe_nodeSolution/game.js');

$(() => {
    const $contEle = $('.ttt');
    const game = new Game();
    const view = new View(game, $contEle);
  });
