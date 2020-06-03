// console.log("Webpack is working!")

const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

window.MovingObject = MovingObject;

document.addEventListener('DOMContentLoaded', function () {
  const canvasEle = document.getElementById('game-canvas');
  const ctx = canvasEle.getContext('2d');
  const movingObj = new MovingObject({ pos: [100, 100], vel: 20, radius: 10, color: 'red'})
  movingObj.draw(ctx);
  movingObj.move();
  const asteroidOne = new Asteroid({ pos: [30, 30] });
  asteroidOne.draw(ctx);
});

