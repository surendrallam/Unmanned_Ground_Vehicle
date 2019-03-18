import i2cdev
import numpy
import time


v1=0X1
v2=0X00
v3=0X8
v4=0XA3

pwm=i2cdev.I2C(0x40,1) # (0x40) address of the I2C bus,(1) I2C bus of the microcontroller.

time.sleep(0.0001)

#for 1st PWM port
pwm.write(bytes([0x06, 0]))
pwm.write(bytes([0x06, v1]))
pwm.write(bytes([0x07, 0]))
pwm.write(bytes([0x07, v2]))
pwm.write(bytes([0x08, 0]))
pwm.write(bytes([0x08, v3]))
pwm.write(bytes([0x09, 0]))
pwm.write(bytes([0x09, v4]))

# for 2nd PWM port
pwm.write(bytes([0x0A, 0]))
pwm.write(bytes([0x0A, v1]))
pwm.write(bytes([0x0B, 0]))
pwm.write(bytes([0x0B, v2]))
pwm.write(bytes([0x0C, 0]))
pwm.write(bytes([0x0C, v3]))
pwm.write(bytes([0x0D, 0]))
pwm.write(bytes([0x0D, v4]))

print('reset')
print('finished')


