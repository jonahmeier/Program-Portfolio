int sea = 50;

int cols, rows;
int scl = 20;

int w = 2000;
int h = 2000;

float view = 70;

float[][] terrain;

float tide =0;

float xturn = 0;

float turnsp = .1;

float speed = .005;
void setup(){
  
size(600,600,P3D);

cols = w / scl;
rows = h / scl;



terrain = new float[cols][rows];

}

void draw(){
  tide -= speed;
  
  float yoff = tide;
  for(int y = 0; y < rows; y++){ 
    float xoff = 0;
    for(int x = 0; x < cols; x++){
      terrain[x][y] = map(noise(xoff,yoff),0,1,-sea,sea); 
      xoff += 0.1;
    }
    yoff += 0.1;
  }
background(0);
noStroke();
fill(0,0,255,100);
translate(width / 2, height / 2);

rotateX(radians(-mouseY)); 
  rotate(radians(-mouseX));
translate(-w / 2, -h / 2);
  

  
  for(int y = 0; y < rows - 1; y++){
    beginShape(TRIANGLE_STRIP);
    for(int x = 0; x < cols; x++){

          vertex(x*scl,y*scl, terrain[x][y]);
          vertex(x*scl,(y + 1)*scl,terrain[x][y+1 ] );

    }
    endShape();
  }
}