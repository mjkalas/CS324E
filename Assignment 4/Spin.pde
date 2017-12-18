/*
Spin generates spinning behavior in objects
(x,y) determines object position
speed determines change in angle per frame
*/
class Spin {
 float x, y, z, speed;
 float angle = 0.0;
 
 Spin() {
  x = 0;
  y = 0;
  z = 0;
  speed = 0;
 }
 
 Spin(float _x, float _y, float _z, float _speed) {
   x = _x;
   y = _y;
   z = _z;
   speed = _speed;
 }
 
 void update() {
  angle += speed; 
 }
 
}