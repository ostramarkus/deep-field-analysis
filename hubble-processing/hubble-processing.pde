ArrayList<Body> bodies;
Table table;
float cHeight = 0;
float cWidth = 0;
PVector cCenter = new PVector();
float zoom = 1;

void setup() {
  colorMode(HSB, 180, 255, 255);
  //fullScreen();
  size(800, 800);
  cHeight = height;
  cWidth = height;
  cCenter = new PVector(width * 0.5 - cWidth * 0.5, 0); 
  bodies = new ArrayList<Body>();
  table = loadTable("data/output.csv", "header");

  println(table.getRowCount() + " total rows in table"); 

  for (TableRow row : table.rows()) {
    /* 
     int id = row.getInt("id");
     String species = row.getString("species");
     String name = row.getString("name");
     println(name + " (" + species + ") has an ID of " + id);     
     */

    int id = row.getInt("id");
    float posX = row.getFloat("pos_x") * cWidth;
    float posY = row.getFloat("pos_y") * cHeight;

    PVector pos = new PVector(posX, posY);

    float w = row.getFloat("width") * cWidth;
    float h = row.getFloat("height") * cHeight;
    float a = row.getFloat("angle") + 90;

    float cHue = abs(row.getFloat("c_hue") + 90);
    float cSat = row.getFloat("c_sat");
    float cVal = row.getFloat("c_val");
    
    color c = color(cHue, cSat, cVal);
    
    Body b = new Body(id, pos, w, h, a, c);
    bodies.add(b);
    println(bodies.size());
  }
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e * 0.01;
}

void draw() {
  if (mousePressed) {
    cCenter.x += mouseX - pmouseX;
    cCenter.y += mouseY - pmouseY;
  }
  
  background(0);
  pushMatrix();
  translate(cCenter.x, cCenter.y);
  scale(zoom);
  for (Body b : bodies) {
    b.update();
    b.display();
  }
  popMatrix();
  
}