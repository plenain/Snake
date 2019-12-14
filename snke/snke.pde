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
int    dead = 0;

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
  if (dead == 0)
    snake();
  else
    uSuck();
}

void snake()
{
  if (keyCode == UP && snakeDY != 50)
  {
    snakeDX = 0;
    snakeDY = -50;
  }
  if (keyCode == DOWN && snakeDY != -50)
  {
    snakeDX = 0;
    snakeDY = 50;
  }
  if (keyCode == LEFT && snakeDX != 50)
  {
    snakeDX = -50;
    snakeDY = 0;
  }
  if (keyCode == RIGHT && snakeDX != -50)
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
    dead = 1;
    uSuck();
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
     if (snakeX == history[j] && snakeY == history[i])
     {
       dead = 1;
       uSuck();
       break;
     }
     if (appleX == history[j] && appleY == history[i])
       apple();
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

void  uSuck()
{
  background(000);
  textSize(65);
  fill(255, 255, 255);
  text("GAME OVER", 200, 300);
  textSize(45);
  fill(255, 0, 0);
  text("SCORE :", 250, 400);
  text(score, 450, 400);
  if (key == TAB)
  {
    key = 'B';
    snakeX = 400;
    snakeY = 400;
    snakeDX = 50;
    snakeDY = 0;
    score = 0;
    cursor = 1;
    dead = 0;
  }
  else if (keyPressed)
    exit();
}
