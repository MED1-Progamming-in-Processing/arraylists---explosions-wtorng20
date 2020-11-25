ArrayList<Circle> circles = new ArrayList<Circle>();
int clicked;

void setup() {
  size(500, 500);
}

void mousePressed() {
  for (int i = 0; i < 100; i++) {
    circles.add(new Circle(mouseX, mouseY));
  }
  if (clicked == 3) {
    clicked = 1;
  } else { 
    clicked = clicked +1;
    println(clicked);
  }
}

void draw() {
  background(200);

  for (int i = circles.size()-1; i >= 0; i--) {
    circles.get(i).move();
    circles.get(i).display();

    if (circles.get(i).isOffScreen()) {
      circles.remove(i);
    }
  }
}

class Circle {

  float x;
  float y;
  float xSpeed = random(-3, 3);
  float ySpeed = random(-3, 3);

  float yAcc = 0.03;

  Circle(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void move() {
    ySpeed = ySpeed  + yAcc;
    xSpeed = xSpeed;
    x += xSpeed ;
    y += ySpeed;
  }


  void display() {
    if (clicked==1) {
    ellipse(x, y, 20, 20);
  } else if (clicked==2) {
    rect(x, y, 20, 20);
  } else if (clicked==3) {
    triangle(x, y, x+20, y+20, x-20, y+20);
  }
}


boolean isOffScreen() {
  return x < 0 || x > width || y < 0 || y > height;
}
}
