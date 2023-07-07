# Example of Python 3: Swift > Python ffi
# https://gist.github.com/jiaaro/e111f0f64d0cdb8aca38?permalink_comment_id=3289118#gistcomment-3289118
from typing import List
import ctypes
import json
# '/usr/lib64/python3.6/lib-dynload/libmodules.so'

modules = ctypes.CDLL('/Users/g1/BU/dotfiles/modules/.build/x86_64-apple-macosx/debug/libmodules.dylib')

modules.add.argtypes = (ctypes.c_int, ctypes.c_int)

def add(x,y):
    result = modules.add(ctypes.c_int(x), ctypes.c_int(y))
    return int(result)

# modules.getWindows.argtypes = (ctypes.c_char_p,)
modules.getWindows.restype = ctypes.c_char_p
def getWindows() -> List[dict]:
    return json.loads(modules.getWindows().decode())
    
# def getString(x):
#     y = ctypes.c_char_p(x.encode())
#     return modules.getString(y).decode()

if __name__ == "__main__":
    print(modules.add(28, 42))
    print(getWindows()[0])
        
    # print(modules.strlen('I compute the length of this string!'))
