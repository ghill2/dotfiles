import sys
import ast
import argparse
import subprocess
from pathlib import Path
import pyautogui

def my_method1():
    print("my_method1 has been run")

def my_method2():
    print("my_method2 has been run")

def extract_dmg():
    """
    7z x /Users/g1/Downloads/new_folder/LAN_SpeedTest.dmg -o/Users/g1/Downloads/new_folder/ -y
    """
    paths = _get_finder_items()
    for path in paths:
        cmd = f'7z x {path} -o{path.parent} -y'
        subprocess.run(cmd, shell=True, text=True, capture_output=True).stdout.strip()

def _corsearch_left():
    pyautogui.keyUp("alt")
    pyautogui.click(x=377, y=805)
    pyautogui.press('pagedown', presses=5)
    pyautogui.keyUp("down")

def _corsearch_right():
    pyautogui.keyUp("alt")
    pyautogui.click(x=616, y=805)
    pyautogui.press('pagedown', presses=5)
    pyautogui.keyUp("down")

def _corsearch_down():
    pyautogui.keyUp("alt")
    pyautogui.press('pagedown', presses=5)
    pyautogui.keyUp("down")

def _corsearch_up():
    pyautogui.keyUp("alt")
    pyautogui.press('pageup', presses=5)
    pyautogui.keyUp("down")

def get_front_application() -> str:
    import pygetwindow as gw
    frontmost_window = gw.getActiveWindow()
    frontmost_app = frontmost_window.title().lower().strip()
    return frontmost_app

def _get_finder_items() -> list[Path]:
    script = """
    set pathList to ""
    tell application "Finder"
        set theSelection to the selection
            if theSelection = {} then return ""
        repeat with theItem in theSelection
            set pathList to pathList & POSIX path of (theItem as text) & linefeed
        end repeat
    end tell
    return text 1 through -2 of pathList
    """

    # Execute the osascript command
    output = subprocess.check_output(['osascript', '-e', script], text=True).strip()
    
    if output == "":
        return []
    
    # Split the output into a list of file paths
    return list(map(Path, output.split('\n')))



if __name__ == "__main__":
    # import easygui; easygui.msgbox(sys.argv[1])
    # from pync import Notifier; Notifier.notify('SKHD configuration has been reloaded', title='SKHD Reloaded')
    
    if len(sys.argv) > 1:
        print(sys.argv[1])
        globals()[sys.argv[1]]()  # run command

# def main():
#     # replaced by shell script so the menu appears faster, leaving here for now.
#     import subprocess
#     commands = _extract_functions(__file__)
#     print(commands)

#     command_str = '\n'.join(commands)
#     cmd = f'echo "{command_str}" | choose'
#     result = subprocess.run(cmd, shell=True, text=True, capture_output=True).stdout.strip()
    
#     print(result)
    
#     globals()[result]()  # run command

# def _extract_functions(file_path):
#     """UNUSED FOR NOW, using shell script version"""
#     with open(file_path, 'r') as file:
#         tree = ast.parse(file.read())

#     function_names = []
#     for node in ast.walk(tree):
#         if isinstance(node, ast.FunctionDef):
#             if not node.name.startswith("_"):
#                 function_names.append(node.name)
    
#     return function_names


    # for arg in sys.argv[2:]:
        # print(arg)
    
    # print(get_active_finder_items())
    # get_finder_items
    # extract_dmg()

    

# if key == "alt+leftarrow":
# elif key == "alt+rightarrow":
# elif key == "alt+downarrow":
# elif key == "alt+uparrow":

# import objc
# from AppKit import NSPasteboard, NSURL

# def get_active_finder_items():
#     # Get the general pasteboard
#     pasteboard = NSPasteboard.generalPasteboard()

#     # Define the NSURL class and read options
#     url_class = objc.lookUpClass("NSURL")
#     options = {
#         NSPasteboard.ReadingFileURLsOnlyKey: True,
#         NSPasteboard.URLReadingFileURLsOnlyKey: True
#     }

#     # Get the file URLs from the pasteboard
#     urls = pasteboard.readObjectsForClasses_options_([url_class], options=options)

#     # Filter and return the file paths
#     file_paths = [url.path() for url in urls if url.isFileURL()]
#     return file_paths