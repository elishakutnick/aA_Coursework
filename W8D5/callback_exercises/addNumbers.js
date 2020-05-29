const readline = require('readline');

const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum, numsLeft, completionCallback) { 
  if (numsLeft > 0) {
    reader.question('Enter number: ', function (userNum) {
      let ourNum = parseInt(userNum);
      sum += ourNum;
      console.log(`Current Sum is ${sum}`);
      
      addNumbers(sum, numsLeft - 1, completionCallback);
    });
  } else { 
    completionCallback(sum);
  }
}

function completionCallback(sum) { 
  console.log(`Total Sum is ${sum}`);
  reader.close();
};

addNumbers(0, 3, sum => console.log(`Total Sum was ${sum}`));