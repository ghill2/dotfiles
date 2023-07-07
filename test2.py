# import pyautogui
# import time
# for _ in range(5):
    # time.sleep(0.0001)
    # pyautogui.press('pagedown', interval=0.0001)
    # pyautogui.typewrite('down')
# import pyautogui; pyautogui.press('pagedown', presses=5, interval=0)
# import pyautogui; pyautogui.scroll(-20)


import subprocess
import threading

def monitor_stdout(process):
    # Continuously read from the subprocess's stdout
    for line in iter(process.stdout.readline, b''):
        if line != "\n":
            print(line.strip())

# Run the subprocess command
command = ['skhd', '-o']
process = subprocess.Popen(command, stdout=subprocess.PIPE, universal_newlines=True)

# Start a separate thread to monitor the stdout
thread = threading.Thread(target=monitor_stdout, args=(process,))
thread.start()

# Wait for the subprocess to finish
process.wait()

# Wait for the monitoring thread to complete
thread.join()
