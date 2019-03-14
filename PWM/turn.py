import i2cdev
import time

pwm=i2cdev.I2C(0x40,1) # (0x40) address of the I2C bus,(1) I2C bus of the microcontroller.

# Setting the PWM and Duty cycle of 2nd PWM port

PWM0_ON_L=0X01
PWM0_ON_H=0X04
PWM0_OFF_L=0X08
PWM0_OFF_H=0XA3

# Setting the PWM and Duty cycle of 2nd PWM port
PWM1_ON_L=0X01
PWM1_ON_H=0X04
PWM1_OFF_L=0X08
PWM1_OFF_H=0XA3
#time.sleep(0.01) # wait for oscillator'''

# For 1st PWM port
pwm.write(bytes([0x06, 0]))
pwm.write(bytes([0x06, PWM0_ON_L]))
pwm.write(bytes([0x07, 0]))
pwm.write(bytes([0x07, PWM0_ON_H]))
pwm.write(bytes([0x08, 0]))
pwm.write(bytes([0x08, PWM0_OFF_L]))
pwm.write(bytes([0x09, 0]))
pwm.write(bytes([0x09, PWM0_OFF_H]))

# For 2nd PWM port
pwm.write(bytes([0x0A, 0]))
pwm.write(bytes([0x0A, PWM1_ON_L]))
pwm.write(bytes([0x0B, 0]))
pwm.write(bytes([0x0B, PWM1_ON_H]))
pwm.write(bytes([0x0C, 0]))
pwm.write(bytes([0x0C, PWM1_OFF_L]))
pwm.write(bytes([0x0D, 0]))
pwm.write(bytes([0x0D, PWM1_OFF_H]))

