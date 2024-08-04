const mybutton = document.getElementById("mybutton")
const mylabel = document.getElementById("mylabel")
const min = 1;
const max = 6;
let randomnum;

mybutton.onclick = function() {
  randomnum = Math.floor(Math.random() * max) + min;
  mylabel.textContent = randomnum
}