PShader albers;

HelperFunctions hf = new HelperFunctions();

void setup() {
 size(640, 360, P2D); 
 noStroke();

 albers = loadShader("albers.glsl"); 
 albers.set("iResolution", float(width), float(height));
 albers.set("time", millis() / 500.0);

}

void draw() {
 shader(albers);
 rect(0.0, 0.0, width, height);
 albers.set("time", millis() / 500.0);
}

void keyPressed() {
  if (key==' ') {
    hf.save("img");
  }
}
