class Body {
  int id = 0;
  float angle = 0; 
  color col = 0;
 
  float ellipseArea = 0;
  float height = 0;
  float width = 0;
  PVector pos = null;
  
  Body(int id, PVector pos, float h, float w, float a, color c) {
    this.id = id;
    this.pos = pos;
    this.height = h;
    this.width = w;
    this.angle = a;
    this.col = c;
  }
  
  void update() {
  }
  
  void display() {
    noStroke();
    fill(this.col);
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(radians(this.angle));
    ellipse(0, 0, this.width, this.height);
    popMatrix();
  }
}