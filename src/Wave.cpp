//
//  Wave.cpp
//  Lissajous
//
//  Created by 梶田悠 on 2017/11/10.
//

#include "Wave.hpp"
#include "ofMain.h"
Wave::Wave(float freq, float phi, float amp){
    this->freq = freq;
    this->phi = phi;
    this->amp = amp;
}

Wave::Wave(){
    
}

float Wave::CalFunc(float x){
    return  sin(x * freq + phi)*amp;
}
