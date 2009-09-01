/**
 * PanTiltControl
 *
 * Uses an analog joystick to control a servo pan/tilt mount. The prototype
 * used a joystick from Sparkfun and a pan/tilt assembly from Seeed Studio.
 * One axis of the joystick controls the pan, the other controls the tilt.
 */

#include <Servo.h> 

Servo horzServo;  // Create a servo object for the pan (horizontal) servo
Servo vertServo;  // Create a servo object for the tilt (vertical) servo

int horzPin = 0;  // Analog input for the joystick horizontal axis
int vertPin = 1;  // Analog input for the joystick vertical axis
int vertVal;      // Value read from the vertical axis
int horzVal;      // Value read from the horizontal axis

/**
 * Setup
 */
void setup()
{
  horzServo.attach(9);    // Use pin 9 PWM output for horizontal servo
  vertServo.attach(10);   // Use pin 10 PWM output for vertical servo
}

/**
 * Main program loop
 */
void loop()
{
  horzVal = analogRead(horzPin);             // Read joystick horizontal position
  horzVal = map(horzVal, 0, 1023, 0, 179);   // Scale reading to suit servo
  horzServo.write(horzVal);                  // Move servo to required position

  vertVal = analogRead(vertPin);             // Read joystick vertical position
  vertVal = map(vertVal, 0, 1023, 0, 179);   // Scale reading to suit servo
  vertServo.write(vertVal);                  // Move servo to required position

  delay(15);                                 // Give the servos time to settle
}
