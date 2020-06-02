Function.prototype.inherits = function (SuperClass, SubClass) {
    function Surrogate () { }
    Surrogate.prototype = SuperClass.prototype;
    SubClass.prototype = new Surrogate();
    SubClass.prototype.constructor = SubClass;
}

function MovingObject() {}

MovingObject.prototype.moves = function () {
    return "I'm moving";
}

function Ship () {}
Ship.inherits(MovingObject, Ship);

function Asteroid () {}
Asteroid.inherits(MovingObject, Asteroid);

// let titanic = new Ship;
// console.log(titanic.moves);

let rock = new Asteroid;
console.log(rock.moves());