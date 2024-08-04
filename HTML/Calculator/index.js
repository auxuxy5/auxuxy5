const display = document.getElementById("display");

function backspace(){
  display.value = display.value.toString().slice(0,-1);
}

function appendTodisplay(input) {
  switch (input) {
    case 'P1':
      display.value += "("
      break
    case 'P2':
      display.value += ")"
      break
    default:
      display.value += input
  }
}





function cleardisplay() {
  display.value = ""
}

function calculate() {
  try{
    display.value = eval(display.value)
  }
  catch(error){
    display.value = "Error"
  }
}