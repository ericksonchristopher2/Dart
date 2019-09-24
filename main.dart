import 'dart:html';
import 'dart:math' as math;

CanvasElement canvas;
CanvasRenderingContext2D ctx;
ballCreate ball = ballCreate();

void main() {
  canvas = document.getElementById("canvas");
  ctx = canvas.getContext("2d");
  window.animationFrame.then(mainGame);
  //ctx.fillStyle = "blue";
	//ctx.fillRect(0, 0, canvas.width, canvas.height);
}

class ballCreate{
  var x = 50.0;
  var y = 50.0;
  var size = 15.0;
  var velocX = 0.0;
  var velocY = 0.0;
  var ctx;
}

void drawBall(ballCreate ball){
  ctx.save();
  ctx.translate(ball.x, ball.y);
  ctx.fillStyle = '#00FF00';
  ctx.beginPath();
  ctx.arc(0, 0, ball.size, 0, math.pi * 2, true);
  ctx.fill();
  ctx.restore();
}

mainGame(num delta){
  clear();
  ball.x += ball.velocX;
  ball.y += ball.velocY;
  ball.velocX *= 0.99;
  ball.velocY *= 0.99;
  ball.velocX += 0.25;
  ball.velocY += 0.25;
  
  if(ball.x + ball.size > canvas.width){
    ball.x = canvas.width - ball.size;
    ball.velocX = -ball.velocX.abs();
  }
    
  if(ball.y + ball.size > canvas.height){
    ball.y = canvas.height - ball.size;
    ball.velocY = -ball.velocY.abs();
  }
    drawBall(ball);
    window.animationFrame.then(mainGame);
}



void clear(){
  ctx..fillStyle = "blue"
    ..fillRect(0, 0, canvas.width, canvas.height);
}
 
