const timedisplay = document.querySelector("#timedisplay");
const startBtn = document.querySelector("#start");
const pauseBtn = document.querySelector("#pause");
const resetBtn = document.querySelector("#reset");

let starttime = 0;
let elapsedtime = 0;
let currenttime = 0;
let paused = true;
let intervalid;
let hrs = 0;
let mins = 0;
let secs = 0;

startBtn.addEventListener("click", () => {
  if (paused){
    paused = false;
    starttime = Date.now() - elapsedtime;
    intervalid = setInterval(updatetime, 75);
  }
});
pauseBtn.addEventListener("click", () => {
  if (!paused){
    paused = true;
    elapsedtime = Date.now() - starttime;
    clearInterval(intervalid);
  }
});
resetBtn.addEventListener("click", () => {
  paused = true;
  clearInterval(intervalid);
  starttime = 0;
  elapsedtime = 0;
  currenttime = 0;
  hrs = 0;
  mins = 0;
  secs = 0;
  timedisplay.textContent = "00:00:00"
});

function updatetime(){
  elapsedtime = Date.now() - starttime;

  secs = Math.floor((elapsedtime / 1000) % 60);
  mins = Math.floor((elapsedtime / (1000 * 60)) % 60);
  hrs = Math.floor((elapsedtime / (1000 * 60 * 60)) % 60);

  function pad(unit){
    return (("0") + unit).length > 2 ? unit: "0" + unit;
  }

  secs = pad(secs);
  mins = pad(mins);
  hrs = pad(hrs);

  timedisplay.textContent = `${hrs}:${mins}:${secs}`;

  
}