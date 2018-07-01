//
//  Wave.hpp
//  Lissajous
//
//  Created by 梶田悠 on 2017/11/10.
//

#ifndef Wave_hpp
#define Wave_hpp

#include <stdio.h>

class Wave {
public:
    float freq;
    float phi;
    float amp;

    Wave(float freq, float phi, float amp);
    Wave();
    float CalFunc(float x);
};

#endif /* Wave_hpp */

