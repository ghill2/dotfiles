import listen
import os
from setproctitle import setproctitle
import signal
import subprocess
import pyautogui
from pathlib import Path

PROC_NAME = 'KeyboardListener'

def asrun(ascript):
  "Run the given AppleScript and return the standard output."
  osa = subprocess.run(['/usr/bin/osascript', '-'], input=ascript, text=True, capture_output=True)
  if osa.returncode == 0:
    return osa.stdout.rstrip()
  else:
    return None
    # raise ChildProcessError(f'AppleScript: {osa.stderr.rstrip()}')

def asquote(astr):
  "Return the AppleScript equivalent of the given string."
  astr = astr.replace('"', '" & quote & "')
  return '"{}"'.format(astr)

def get_front_application() -> str:
    import pygetwindow as gw
    frontmost_window = gw.getActiveWindow()
    frontmost_app = frontmost_window.title().lower().strip()
    return frontmost_app

def handle_interrupt(signal, frame):
    print("Ctrl+C pressed. Exiting...")
    os.system(f'killall {PROC_NAME}')
    os.kill(os.getpid(), signal.SIGQUIT)
    exit(0)

def is_browser() -> bool:
    return get_front_application() in ("firefox", "safari", "chrome")
   
def on_key(key: str):
    # https://pyautogui.readthedocs.io/en/latest/keyboard.html#keyboard-keys
    
    front_app = get_front_application()
    print(front_app, key)
    # to_restore = []
    # for mod in "shift ctrl cmd alt".split():
    #     if mod in key:
    #         pyautogui.keyUp(mod)
    #         to_restore.append(mod)
        
    if front_app == "firefox" or front_app == "safari":
        if key == "alt+leftarrow":
            pyautogui.keyUp("alt")
            pyautogui.click(x=377, y=805)
            pyautogui.press('pagedown', presses=5)
            pyautogui.keyUp("down")
        elif key == "alt+rightarrow":
            pyautogui.keyUp("alt")
            pyautogui.click(x=616, y=805)
            pyautogui.press('pagedown', presses=5)
            pyautogui.keyUp("down")
        elif key == "alt+downarrow":
            pyautogui.keyUp("alt")
            pyautogui.press('pagedown', presses=5)
            pyautogui.keyUp("down")
        elif key == "alt+uparrow":
            pyautogui.keyUp("alt")
            pyautogui.press('pageup', presses=5)
            pyautogui.keyUp("down")
    
    if key == "cmd+return":
        commands()
        # commands_sh = Path(__file__).parent.parent / "commands/commands.sh"
        
        # subprocess.run(['sh', commands_sh], capture_output=True)

    # for key in to_restore:
    #    pyautogui.keyDown(key)
def commands():
   from commands.commands import main
   main()

if __name__ == "__main__":
    setproctitle(PROC_NAME)
    signal.signal(signal.SIGINT, handle_interrupt)
    listen.set_proc_title()
    listen.register_callback(on_key)
    listen.start()



# Application focus decorator
# def application_focused(fn, app):
#     def wrapper(*args, **kwargs):
#         if get_front_application().lower() == app:
#             return fn(*args, **kwargs)
#     return wrapper



