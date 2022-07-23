let salaries = {John: 100,
                Ann: 160,
                Pete: 130};

var sum = 0;

for (let key in salaries) {
  sum += salaries[key];
}

console.log(sum)

let menu = {
  width: 200,
  height: 300,
  title: "My menu"
};

function multiplyNumeric(obj) {
  for (let key in obj) {
    if (typeof obj[key] == 'number') {
      obj[key] *= 2;
    }
  }
}

multiplyNumeric(menu);

console.log(menu);

function checkEmailId(str){
  if(str.includes("@") && str.includes(".") ){
    var atSymbolPositon = str.indexOf("@");
    var periodPositon = str.indexOf(".");
    if((periodPositon - atSymbolPositon > 1)){
      return true;
    }
  }
  return false;
}

let text1 = "mom12345@gmail.com";
let bool1 = checkEmailId(text1);
console.log(bool1)

let text2 = "m.om12.345@gmailcom";
let bool2 = checkEmailId(text2);
console.log(bool2)

let text3 = "mom12345gmailcom";
let bool3 = checkEmailId(text3);
console.log(bool3)

function truncate(str, maxlength) {
  if(str.length > maxlength){
    str = str.slice(0, maxlength - 1) + '…';
  }
  return str
}

console.log(truncate("What I'd like to tell on this topic is:", 20));
console.log(truncate("Hi everyone!", 20));

const styles = ["James", "Brennie"];
console.log(styles);

styles.push("Robert")
console.log(styles);

let middle = Math.floor(styles.length/2);
styles[middle] = "Calvin";
console.log(styles);

styles.shift();
console.log(styles);

styles.unshift("Rose");
styles.unshift("Regal");
console.log(styles);