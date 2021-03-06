#include <Servo.h>
#include "LineSensor.h"
#include "steering.h"
#include "constants.h"
using namespace steering;


    int const LINE_SENSOR_PINS = 8;
    int const steeringPin = 3;

    //the array is the pins L3, L2 ... R2, R3
    LineSensor lineSensor( new int [8] {12, 11, 10, 9, 8, 7, 4, 2}, LINE_SENSOR_PINS );
    int* data = new int[8];

    Servo steeringMotor;
    int input = 0;
    bool go = false;

void setup() {

    steeringMotor.attach(steeringPin); //attach servo to pin 3

    Serial.begin(9600);

    pinMode(PWMR, OUTPUT);
    pinMode(PWML, OUTPUT);
    delay(1000);
    
}

void loop() {

   // delay(500);
    if (Serial.peek() != -1) {
        input = 0;
          Serial.println(Serial.peek());
          delay(5);
        while(Serial.available()) {
          Serial.println(input*10 + (Serial.peek()-'0'));
          input = input*10 + (Serial.read()-'0');
        }
    } 
    
   // if (go == 1){
        steer(lineSensor, LINE_SENSOR_PINS, steeringMotor, input);
        lineSensor.getCurrent(data);
        if (millis()%1000 == 0) {
        for (int i = 0; i < 8; ++i) {
            Serial.print(data[i]);
        }    
        Serial.println(' ');
        }
    //} else {
      
  //analogWrite(PWMR, 0);
  //analogWrite(PWML, 0);
   // }
}
