import serial #Serial imported for Serial communication
import time #Required to use delay functions
 
ArduinoSerial = serial.Serial('com7',9600) #Create Serial port object called arduinoSerialData
time.sleep(2) #wait for 2 secounds for the communication to get established
 
while 1: #Do this forever

    var = int(ArduinoSerial.readline()) #get input from user
    print(var)
    if (var==1):
        print('Door open')
    else:
        print('Door closed')
    time.sleep(0.5)
