#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofSetBackgroundAuto(false);
    ofBackground(255,255,255);
    saveframe = false;
    
    float width = ofGetWidth() * 0.5;
    float height = ofGetHeight() * 0.5;
    waveX = *new Wave(13, 0, width);
    waveY = *new Wave(23, 10, height);
    rgb.r = 0;
    rgb.g = 0;
    rgb.b = 0;
}

//--------------------------------------------------------------
void ofApp::update(){
    
}

//--------------------------------------------------------------
void ofApp::draw(){
    if(start){
    ofPoint p = *new ofPoint();
    p.x = waveX.CalFunc((int)ofGetFrameNum() * 2*PI/5000) + ofGetWidth()/2;
    p.y = waveY.CalFunc((int)ofGetFrameNum() * 2*PI/5000) + ofGetHeight()/2;
    
    for(auto itr = pList.begin(); itr != pList.end(); ++itr) {
        float dist  = ofDist(p.x, p.y, itr->x, itr->y);
        float alpha = (1000/(dist - 5)) -3;
        ofSetColor(rgb, (int)alpha);
        ofDrawLine(p, *itr);
    }
    
    pList.push_back(p);
    
//    if(saveframe){
////        ofImage img;
////        img.grabScreen(0,0,ofGetWidth(),ofGetHeight());
////        img.save(ofToString((int) ofGetFrameNum()));
//        ofSaveFrame();
//    }
    }
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    if(key == 'f'){
        saveframe = false;
    }else if(key == 's'){
        start = true;
    }
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y ){

}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseEntered(int x, int y){

}

//--------------------------------------------------------------
void ofApp::mouseExited(int x, int y){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
