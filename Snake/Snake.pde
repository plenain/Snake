int    snakeX = 400;
int    snakeY = 400;
int    snakeDX = 50;
int    snakeDY = 0;
float  appleX;
float  appleY;
int    score = 0;
int[]  history = new int[512];
int    cursor = 1;
int    i;
int    j;

void setup()
{
  size(800, 800);
  frameRate(10);
  apple();
}

void draw()
{
  background(225, 225, 225);
  fill(255, 0, 0);
  noStroke();
  rect(appleX, appleY, 50, 50);
  fill(0, 255, 0);
  snake();
}

void snake()
{
  if (keyCode == UP)
  {
    snakeDX = 0;
    snakeDY = -50;
  }
  if (keyCode == DOWN)
  {
    snakeDX = 0;
    snakeDY = 50;
  }
  if (keyCode == LEFT)
  {
    snakeDX = -50;
    snakeDY = 0;
  }
  if (keyCode == RIGHT)
  {
    snakeDX = 50;
    snakeDY = 0;
  }
  i = cursor;
  if (cursor >= 3)
  {
   while (i >= 2)
   {
     history[i] = history[i - 2];
     i--;
   }
  }
  history[0] = snakeX;
  history[1] = snakeY;
  snakeX = snakeX + snakeDX;
  snakeY = snakeY + snakeDY;
  if (snakeX < 0 || snakeX > 750 || snakeY < 0 || snakeY > 750)
  {
    background(000);
    textSize(65);
    fill(255, 255, 255);
    text("GAME OVER", 200, 300);
    textSize(45);
    fill(255, 0, 0);
    text("SCORE :", 250, 400);
    text(score, 450, 400);
    if(keyPressed)
      exit();
  }
  if (snakeX == appleX && snakeY == appleY)
    {
      score = score + 1;
      cursor = cursor + 2;
      apple();
    }
  rect(snakeX, snakeY, 50, 50);
  i = cursor;
  if (cursor >= 1)
  {
   while(i >= 0)
   {
     j = i;
     j--;
     rect(history[j], history[i], 50, 50);
     i = i-2;
   }
  }
}

void  apple()
{
  appleX = (int)random(16);
  appleX = appleX * 50;
  appleY = (int)random(16);
  appleY = appleY * 50;
}
