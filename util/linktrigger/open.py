from pathlib import Path
import os
import subprocess
import sys
import pyautogui
import time
"""
Link Format:
video://1.01 Module introduction.mp4 1
"""

def asrun(ascript):
    # Run the given AppleScript and return the standard output.
    osa = subprocess.run(
        ["/usr/bin/osascript", "-"], input=ascript, text=True, capture_output=True
    )
    if osa.returncode == 0:
        return osa.stdout.rstrip()
    else:
        print(osa.stderr.rstrip())
        pass

def parse_text(input) -> tuple[str, int]:
    """
    Parse a link from text
    Enqueue method walkthrough - video://7.305 Queues List-based implementation.mp4 196 > 7.305 Queues List-based implementation.mp4 196
    [mylink](Enqueue method walkthrough - video://7.305 Queues List-based implementation.mp4 196) > 7.305 Queues List-based implementation.mp4 196
    """
    print(input)
    input = input.split("video://")[1].replace("\n", "")

    try:
        parts = input.split()
        filename = " ".join(parts[:-1])
        seconds = int("".join([c for c in parts[-1] if c.isdigit()])) # only keep digits
    except Exception as e:
        show_dialog(f"""Error when parsing file-name {e}""")
    return filename, seconds

def _open_video(filename, seconds):
    print(f"{filename} at seconds {seconds}")
    # assert filename == "9.007 Heaps deletion (extract maximum).mp4"

    VIDEOS_DIR = str(Path("~/BU_LARGE/VIDEOS/").expanduser())

    path = find(filename, VIDEOS_DIR)
    print(path)

    if path is None:
        msg = f"{filename} not found in {VIDEOS_DIR}"
        print(msg)
        # show_dialog(msg)
        # quit()
        return
    """
    open -a /Applications/VLC.app "/Users/g1/BU_LARGE/VIDEOS/agile-algos2-dnw-gp-all-vids/algos-data-structures-2/9.007 Heaps deletion (extract maximum).mp4"
    
    """
    filename = asrun('tell application "VLC" to return name of current item')
    if os.path.basename(path) != filename:
        print(f"Opening {path}")

        # Using a custom library to be able to open filenames with brackets
        vlcopen = os.path.join(os.path.dirname(__file__), "vlc-open")
        os.system(f'bash {vlcopen} "file:////{path}"')
        # time.sleep(1)

        timeout = 2
        start = time.perf_counter()
        while True:
            # time.sleep(0.05) # If the video is not opened already, VLC needs more time before setting the seconds
            filename = asrun('tell application "VLC" to return name of current item')
            if filename == os.path.basename(path):
                break
            elapsed = time.perf_counter - start
            if elapsed >= timeout:
                break

    asrun(f'tell application "VLC" to set current time to {seconds}')
    asrun(f'tell application "VLC" to if not playing then play')

def from_clipboard() -> None:
    text = asrun("return (the clipboard as text)")
    print(text)
    filename, seconds = parse_text(text)
    _open_video(filename, seconds)

def from_pycharm() -> None:
    from pynput.keyboard import Key, Controller

    keyboard = Controller()

    with keyboard.pressed(Key.cmd):
        keyboard.tap('c')
        time.sleep(0.1)
    keyboard.tap(Key.esc)

    from_clipboard()

def asquote(astr):
    # Return the AppleScript equivalent of the given string.
    astr = astr.replace('"', '" & quote & "')
    return '"{}"'.format(astr)

def find(filename, folder):
    # NOTE: url scheme trigger needs fd as absolute path.
    from shlex import quote
    filename = filename.replace("(", r"\(").replace(")", r"\)") # finds filenames containingbrackets with this
    # filename = quote
    result = subprocess.run(
        ["/usr/local/bin/fd", f"{filename}", f"{os.path.expanduser(folder)}"],
        capture_output=True,
        text=True,
    )

    path = result.stdout.strip()
    return path if path else None

def show_dialog(msg):
    asrun(f'display dialog "{msg}"')

if __name__ == "__main__":
    if len(sys.argv) == 1:
        input = "video://1.01 Module introduction.mp4 1"
    else:
        input = sys.argv[1]

    open_link(input)


# from subprocess import check_output
# out = check_output(["fd", f'"{file_name}"', f'"{videos_dir}"'])
# f'fd "{file_name}" "{os.path.expanduser(videos_dir)}"'
# subprocess.run(["fd", f'"{file_name}"', f'"{videos_dir}"'],text=True, capture_output=True)
# try:
#     input = "".join(input[:-1]).replace("video://", "")
# except Exception:
#     show_dialog("Error when parsing input.")