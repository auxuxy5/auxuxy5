const decreaseBtn = document.getElementById("decreaseBtn");
const resetBtn = document.getElementById("resetBtn");
const increaseBtn = document.getElementById("increaseBtn");
const countLabel = document.getElementById("countLabel")
const piBtn = document.getElementById("piBtn")
const roundBtn = document.getElementById("roundBtn")
let count = 0;


increaseBtn.onclick = function(){
  count++;
  countLabel.textContent = count;
}

decreaseBtn.onclick = function(){
  count--;
  countLabel.textContent = count;
}

resetBtn.onclick = function(){
  count=0;
  countLabel.textContent = count;
}

piBtn.onclick = function(){
  count=Math.PI
  countLabel.textContent = count;
}

roundBtn.onclick = function(){
  count = Math.round(count)
  countLabel.textContent = count;
}


