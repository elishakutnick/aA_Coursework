const readline = require("readline");

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
}); 

function askIfGreaterThan(el1, el2, callback) { 
   // Prompt user to tell us whether el1 > el2; pass true back to the
  // callback if true; else false.
  reader.question(
    `Is ${el1} greater than ${el2}? Please answer Yes or No `, 
    function (userAnswer) { 
      if (userAnswer === 'Yes') {
        callback(true);
      } else { 
        callback(false);
      }
    }
  )}


function innerBubbleSortLoop(array, i, madeAnySwaps, outerBubbleSortLoop){

    if( i === (array.length - 1)){
        outerBubbleSortLoop(madeAnySwaps);
        return;
    } else {
        askIfGreaterThan(array[i], array[i+1],function(isGreaterThan){
            if(isGreaterThan){
                [array[i], array[i + 1]] = [array[i + 1], array[i]];
                madeAnySwaps = true;
            }
            innerBubbleSortLoop(array, i + 1, madeAnySwaps, outerBubbleSortLoop);
        }
        )
    }
}

function absurdBubbleSort(array, sortCompletionCallback) {
  function outerBubbleSortLoop(madeAnySwaps) {
    // Begin an inner loop if you made any swaps. Otherwise, call
    // `sortCompletionCallback`.
    if(madeAnySwaps){
        innerBubbleSortLoop(array, 0, false, outerBubbleSortLoop);
    } else {
        sortCompletionCallback(array);
    }
  }
  outerBubbleSortLoop(true);
}

absurdBubbleSort([3, 2, 1], function(arr) {
  console.log("Sorted array: " + JSON.stringify(arr));
  reader.close();
});