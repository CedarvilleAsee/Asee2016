#include "constants.h"
#include "nose.h"
#include "wheels.h"
#include "rings.h"
#include <Arduino.h>
#include <Servo.h>

//Serial:  USB
//Serial1: bluetooth
#define prt Serial3
//#define DEBUG

extern bool isDropping;
extern int pathCounter;
extern State currentState;
extern Servo ringServo;

extern int wall_L;
extern int wall_LS;
extern int wall_RS;
extern int wall_R;
extern int wall_Far;
extern int snorkle;

void rings::dropRings() {
    static int droppedState[] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    static int hasDropped[] = { false, false, false, true, true, true, false, false, false, false, false};
    static State lastState = OFF_WALL;
    static State ringState = OFF_WALL;
    static int pathLatch = -1;
    static bool done012 = false;
    static bool seeWall = false;
    
    static bool isDropped = false;
    #ifdef DEBUG
    prt.print("RS: ");
    prt.print(ringSense);
    prt.print("  ");
    #endif
    
    if (pathLatch == -1 && wall_RS > DIST_START_TURN && !hasDropped[pathCounter]) {
        pathLatch = pathCounter;
    } else if (pathLatch != -1 && hasDropped[pathLatch] && !isDropping) {
        pathLatch = -1;
    }
    
    if(snorkle < 400) {
        ringState = OFF_WALL;
    } else {
        ringState = ON_WALL;
    }
    
    if (currentState == MIDDLE_AREA2) {
        done012 = true;
    }
    
    switch(pathLatch) {
        case 0:
        case 1:
        case 2:
            if (!hasDropped[pathLatch] && ringState == ON_WALL && lastState == ON_WALL && !isDropping) {
                dropRing();
                hasDropped[pathLatch] = true;
            }
            break;
        case 6:
            if(!hasDropped[pathLatch] && ringState == ON_WALL && lastState == ON_WALL) {
                dropRing();
                hasDropped[pathLatch] = true;
            }
            break;
        case 8:
            if(!hasDropped[pathLatch] && ringState == ON_WALL && lastState == ON_WALL) {
                dropRing();
                hasDropped[pathLatch] = true;
            }
            break;
    }
    
    lastState = ringState;
  
}


void rings::dropRing() {
        analogWrite(WHEEL_PWM_FR,255);
        isDropping = true;
}

void rings::stopRing()  {
    static bool getInTheHole = false;
    if (digitalRead(RING_DISPENSER_R2) == 0 && !getInTheHole) {
        return;
    }
    
    if (digitalRead(RING_DISPENSER_R2) != 0 && !getInTheHole) {
        getInTheHole = true;
        return;
    } 
    
    if (digitalRead(RING_DISPENSER_R2) == 0 && getInTheHole) {
        getInTheHole = false;
        analogWrite(WHEEL_PWM_FR,0);
        isDropping = false;
        return;
    }
}
