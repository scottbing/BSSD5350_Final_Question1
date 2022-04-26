PShader albers;

void setup() {
 size(300, 300, P2D); 
 noStroke();

 albers = loadShader("albers.glsl"); 
 albers.set("iResolution", float(width), float(height));
 noLoop();
}

void draw() {
  albers.set("baseColor", random(255)/255.0, random(255)/255.0, random(255)/255.0); // color from 0 - 1
  albers.set("backgroundColor", random(255)/255.0, random(255)/255.0, random(255)/255.0); // color from 0 - 1
  albers.set("rectTwoColor", random(255)/255.0, random(255)/255.0, random(255)/255.0); // color from 0 - 1
  albers.set("rectThreeColor", random(255)/255.0, random(255)/255.0, random(255)/255.0); // color from 0 - 1
  shader(albers);
  rect(0.0, 0.0, width, height);
}
