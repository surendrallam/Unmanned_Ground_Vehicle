import i2cdev
import time


pwm=i2cdev.I2C(0x40,1)


pwm.write(bytes([0xFA, 0]))     # zero all pin
pwm.write(bytes([0xFB, 0]))     # zero all pin
pwm.write(bytes([0xFC, 0]))     # zero all pin
pwm.write(bytes([0xFD, 0]))     # zero all pin
pwm.write(bytes([0x01, 0x04]))  # The 16 LEDn outputs are configured with a totem pole structure.
pwm.write(bytes([0x00, 0x01]))  #PCA9685 responds to LED All Call I2C-bus address
