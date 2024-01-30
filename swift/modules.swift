// To build use: swiftc -emit-library modules.swift 
////////////////////////////////////////////////////////////////////
// import Cocoa

// let options = CGWindowListOption(arrayLiteral: .excludeDesktopElements, .optionOnScreenOnly)
// let windowsListInfo = CGWindowListCopyWindowInfo(options, CGWindowID(0))
// let infoList = windowsListInfo as! [[String:Any]]
// let visibleWindows = infoList.filter{ $0["kCGWindowLayer"] as! Int == 0 }

// print(visibleWindows)
// import Python
import PythonKit
import Foundation

@_cdecl("add")
public func add (x: Int, y: Int) -> Int {
	return x+y
}

// @_cdecl("strlen")
// public func strlen (x: UnsafePointer<CChar>) -> Int{
//     let s : String = "\(String(cString: x))"
//     return s.count
// }

// @_cdecl("myname")
// public func myname (x: UnsafePointer<CChar>) -> UnsafePointer<CChar>{
//     let ret : String = "My name is \(String(cString: x))"
//     return UnsafePointer<CChar>(ret)
// }


// extension String {
//   func toPyString() -> PythonObject {
//     let len = Array(self.utf8).count
//     return Python.PyUnicode_AsEncodedString(self.utf8,"utf-8","strict")
//   }
// //   static func fromPyString(pyString: PythonObject) -> String? {
// //     let cstring = PyString_AsString(pyString)
// //     return String.fromCString(cstring)
// //   }
// }
// Some stuff to make writing Swift code easier on you :)
// public typealias PythonObject = UnsafeMutablePointer<Python.PyObject>

// @_cdecl("getString")
// public func getString () -> PythonObject {
//     return "Returned string value".toPyString()
// }


