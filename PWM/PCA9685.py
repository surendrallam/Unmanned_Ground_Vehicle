import i2cdev
import numpy
import time


pwm=i2cdev.I2C(0x40,1) # (0x40) address of the I2C bus,(1) I2C bus of the microcontroller.


'''Reset POWM'''
pwm.write(bytes([0xFA, 0]))     # zero all pin
pwm.write(bytes([0xFB, 0]))     # zero all pin
pwm.write(bytes([0xFC, 0]))     # zero all pin
pwm.write(bytes([0xFD, 0]))     # zero all pin
pwm.write(bytes([0x01, 0x04]))  # The 16 LEDn outputs are configured with a totem pole structure.
pwm.write(bytes([0x00, 0x01]))  #PCA9685 responds to LED All Call I2C-bus address
time.sleep(0.01)  # wait for oscillator

'''
Set the PWM frequency to the provided value in hertz.
The maximum PWM frequency is 1526 Hz if the PRE_SCALE register is set "0x03h".
The minimum PWM frequency is 24 Hz if the PRE_SCALE register is set "0xFFh".
he PRE_SCALE register can only be set when the SLEEP bit of MODE1 register is set to logic 1.
'''

freq_hz=100
freq_hz=freq_hz*0.9 #correction
prescale = int(numpy.floor(25000000.0/(4096.0*float(freq_hz))-1))    # datasheet equation
print("prescale = " , prescale )
pwm.write(bytes([0x00, 0x10]))
time.sleep(1)
pwm.write(bytes([0xFE, prescale]))
pwm.write(bytes([0x00, 0x80]))
time.sleep(1)
pwm.write(bytes([0x00, 0x00]))
time.sleep(1)
pwm.write(bytes([0x01, 0x04]))
time.sleep(1)

def set_pwm(channel, value):
  x=min(4095,value)
  x=max(0,x)
  """Sets a single PWM channel."""
  LED0_ON_L          = 0x06
  LED0_ON_H          = 0x07
  LED0_OFF_L         = 0x08
  LED0_OFF_H         = 0x09
  pwm.write(bytes([(LED0_ON_L+4*channel), 0]))
  pwm.write(bytes([(LED0_ON_H+4*channel), 0]))
  pwm.write(bytes([(LED0_OFF_L+4*channel), (x & 0xFF)]))
  pwm.write(bytes([(LED0_OFF_H+4*channel), (x >> 8)]))

print('test')

set_pwm(0, 0)
set_pwm(3, 1)
set_pwm(4, 10)
set_pwm(7, 100)
set_pwm(8, 1000)
set_pwm(11, 2048)
set_pwm(12, 3072)
set_pwm(15, 4095)

print('finished')
