import time
import math
from test_arduino_1 import pyArduino
import subprocess

while 1:
    ar_input = pyArduino('com7',2)
    if ar_input == "HIGH":
        subprocess.call([r'C:\Users\Varad\Downloads\image_process.bat'])
        time.sleep(2)
    else:
        time.sleep(2)
