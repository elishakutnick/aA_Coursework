// function sum() { 
//   let count = 0;
//   for (let i = 0; i < arguments.length; i++) {
//     count += arguments[i];
//   }
  
//   return count; 
// }

function sum(...args) {
  let count = 0;
  for (let i = 0; i < args.length; i++) {
    count += args[i];
  }

  return count;
}

console.log(sum(1, 2, 3, 4));
console.log(sum(1, 2, 3, 4, 5));

// // ES6 simple myBind with no args
// Function.prototype.myBind = function (ctx) {
//   return () => this.apply(ctx);
// };

// ES6 myBind with arguments
// Function.prototype.myBind = function (ctx, ...bindArgs) {
//   return (...callArgs) => {
//     return this.apply(ctx, bindArgs.concat(callArgs));
//   };
// };


Function.prototype.myBind = function () {
  const fn = this;
  const ctx = arguments[0];
  const arr = arguments.slice(1);
  return function anonymousFunc() {
    return fn.apply(ctx, arr.concat(arguments));
  };
};


Function.prototype.myBind = function (ctx, ...bindArgs) {
  const fn = this;
  return function anonymousFunc(...callArgs) {
    return fn.apply(ctx, bindArgs.concat(callArgs));
  };
};





function curriedSum(numArgs) {
    const numbers = [];
    function _curriedSum(num) {
        numbers.push(num);
        if (numbers.length === numArgs) {
            let total = 0;
            for (let i = 0; i < numbers.length; i++) {
                total += numbers[i];
            }
            return total;
        } else {
            return _curriedSum;
        }
    }
    return _curriedSum;
}

Function.prototype.curry = function (numArgs) {
  const argsArr = [];
  const fn = this;

  return function _curry(num) {
    argsArr.push(num);
    if (argsArr.length === numArgs) {
      return fn(...argsArr);
      // return fn.apply(null, argsArr); 
    } else {
      return _curry;
    }
  }
};



