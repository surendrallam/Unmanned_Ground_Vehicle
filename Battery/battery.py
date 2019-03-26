# ADS1115 single-shot mode



import i2cdev, os
from time import sleep

ADS1115 = i2cdev.I2C(0x48,0) # Address = 0x48, I2C bus = 0
correct=13.646

Lr=297
Lg=394
Lb=393
Burzzer=466

def ADS1115_read():
  sleep(0.001)
  ADS1115.write(bytes([int(1),int(197),int(131)])) # write config =1 & chanel 0 + FSE 2v + single shot & 128hz + b00011
  sleep(0.008) # wait for conversion
  ADS1115.write(bytes([int(0)])) # change the pointer to measurment buffer
  sleep(0.001)
  c0 = int.from_bytes(ADS1115.read(2), byteorder='big')
  out = c0
  return out

while True:
	ADS=float(ADS1115_read())
	const=(2.0/32676)
	error=ADS*const
	voltage=correct*error
	volt= float("{0:.2f}".format(voltage))
	print("Battery Voltage: ",volt)

	if volt >= 24.00:
		print('Battery is 90%')
		os.system('echo 0 > /sys/class/gpio/gpio466/value')
		os.system('echo 1 > /sys/class/gpio/gpio388/value')
		os.system('echo 0 > /sys/class/gpio/gpio393/value')
		os.system('echo 0 > /sys/class/gpio/gpio394/value')

	elif 23.00<=volt<24.00:
		print('Battery is 75%')
		os.system('echo 0 > /sys/class/gpio/gpio466/value')
		os.system('echo 1 > /sys/class/gpio/gpio394/value')
		os.system('echo 0 > /sys/class/gpio/gpio393/value')
		os.system('echo 0 > /sys/class/gpio/gpio388/value')

	elif 22.2<=volt<23.00:
		print('Battery is 50%')
		os.system('echo 0 > /sys/class/gpio/gpio466/value')
		os.system('echo 1 > /sys/class/gpio/gpio394/value')
		os.system('echo 0 > /sys/class/gpio/gpio393/value')
		os.system('echo 0 > /sys/class/gpio/gpio388/value')

	elif 21.00<=volt<22.2:
		print('Battery is 25%')
		os.system('echo 0 > /sys/class/gpio/gpio466/value')
		os.system('echo 1 > /sys/class/gpio/gpio393/value')
		os.system('echo 0 > /sys/class/gpio/gpio394/value')
		os.system('echo 0 > /sys/class/gpio/gpio388/value')

	elif 20.50<=volt<21.00:
		print('Battery is 10%')
		os.system('echo 1 > /sys/class/gpio/gpio466/value')
		os.system('echo 1 > /sys/class/gpio/gpio393/value')
		os.system('echo 0 > /sys/class/gpio/gpio394/value')
		os.system('echo 0 > /sys/class/gpio/gpio388/value')

	elif 19.80<=volt<20.50:
		print('Battery is getting switched OFF.\n "PLEASE CHARGE ME TO WORK."')
		os.system('echo 1 > /sys/class/gpio/gpio466/value')
		os.system('echo 0 > /sys/class/gpio/gpio394/value')
		os.system('echo 0 > /sys/class/gpio/gpio393/value')
		os.system('echo 1 > /sys/class/gpio/gpio388/value')
		sleep(10)
		os.system('shutdown now')
	else:
		os.system('echo 1 > /sys/class/gpio/gpio466/value')
		os.system('echo 0 > /sys/class/gpio/gpio394/value')
		os.system('echo 0 > /sys/class/gpio/gpio393/value')
		os.system('echo 0 > /sys/class/gpio/gpio388/value')
		print("Please insert the Battery balance port")
		pass
	sleep(5)
