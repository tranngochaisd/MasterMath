import "package:flutter/material.dart";

class _level {
  int enable;
  int level;
  int aboveArgument;
  int bottomArgument;
  int score;

  //BuildContext context;

  _level(this.enable, this.level, this.aboveArgument, this.bottomArgument,this.score);
}

int dataTransmission(){
  List<_level>levelAdd =[
    _level(1,1,1,100,0),
    _level(0,2,1,100,0),
    _level(0,3,-10,100,0),
    _level(0,4,-100,100,0),
    _level(0,6,-100,100,0),
    _level(0,7,100,1000,0),
    _level(0,8,-100,1000,0),
    _level(0,9,-1000,1000,0),
    _level(0,10,1,100,0),
    _level(0,11,1,100,0),

  ];
  return 0;
}