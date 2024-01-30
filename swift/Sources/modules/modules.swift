// To build use: swiftc -emit-library modules.swift 
////////////////////////////////////////////////////////////////////
import Cocoa
// import GenericJSON
// import SwiftyJSON
// print(visibleWindows)
// import Python
import PythonKit
import Foundation

@_cdecl("add")
public func add (x: Int, y: Int) -> Int {
    return x+y``
}
// public struct modules { 
//     public init() {

//  }
// }
//     public private(set) var text = "Hello, World!"

//     


// @_cdecl("strlen")
// public func strlen (x: UnsafePointer<CChar>) -> Int{
//     let s : String = "\(String(cString: x))"
//     return s.count
// }

// extension Encodable {
//   fileprivate func encode(to container: inout SingleValueEncodingContainer) throws {
//     try container.encode(self)
//   }
// }

// struct AnyEncodable : Encodable {
//   var value: Encodable
//   init(_ value: Encodable) {
//     self.value = value
//   }
//   func encode(to encoder: Encoder) throws {
//     var container = encoder.singleValueContainer()
//     try value.encode(to: &container)
//   }
// }

struct Window : Encodable {
    let name: String?
    let pid: Int?
    let bounds: [String: Int]?
}

@_cdecl("getWindows")
public func getWindows ()  -> UnsafePointer<CChar>{
    let options = CGWindowListOption(arrayLiteral: .excludeDesktopElements, .optionOnScreenOnly)
    let windowsListInfo = CGWindowListCopyWindowInfo(options, CGWindowID(0))
    let infoList = windowsListInfo as! [[String:Any]]
    let visibleWindows = infoList.filter{ $0["kCGWindowLayer"] as! Int == 0 }
    // print(visibleWindows[0])
    // print(type(of: visibleWindows[0]))
    // print(type(of: visibleWindows[0]["kCGWindowOwnerName"]))
    
    var arr = [Window]()
    for item in visibleWindows {
        arr.append(Window(
            name: item["kCGWindowOwnerName"] as?  String,
            pid: item["kCGWindowOwnerPID"]  as? Int,
            bounds: item["kCGWindowBounds"] as? [String: Int]
        ));
    }

    var ret : String = "My name is"
    let encoder = JSONEncoder()
    if let jsonData = try? encoder.encode(arr) {
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            // print(jsonString, type(of: jsonString))
            ret = jsonString
            // UnsafePointer<CChar>()    
        }
    }
    return UnsafePointer<CChar>(ret)
    // for (key, value) in visibleWindows[0] {
    //     print(type(of: value));
    //     print(type(of: value["kCGWindowBounds"]));
        // let v =  value as! [String: Any];
        // print(type(of: v["kCGWindowBounds"]))
        // for (k, v) in v["kCGWindowBounds"] as! [NSString: NSNumber] {
        //     print(k, v)   
        // }
        
        // print("(\(key),\(value))");
        
        // print(value.dynamicType)
    // }

    // let windowDict = {};
    // for (key, value) in visibleWindows[0] {
        
    //     switch value {
    //         case is NSNumber:
    //             print("I'm a Int")
            
    //         case is NSString: print("I'm a string")
    //         case is [String: Int]: print("I'm a [String: Int]")
    //         case is Bool: print("I'm a boolean")
    //         default: print("I'm not a string")
    //     }
    // }
    // for (key, value) in visibleWindows[0] {
    //     print(key)
    //     switch value {
    //         case is Bool: print("I'm a boolean")
    //         case is String: print("I'm a string")
    //         case is Int: print("I'm a Int")
    //         case is [String: Int]: print("I'm a [String: Int]")
    //         default: print("I'm not a string")
    //     }
    // }
    // let json: JSON = [
    //     "foo": "foo",
    //     "bar": 1,
    // ]

    // "{"bar":1,"foo":"foo"}"
    // let ret = try String(data: try JSONEncoder().encode(json), encoding: .utf8)!
    // print(visibleWindows[0]["kCGWindowBounds"] as! [String: Int])
    // print(visibleWindows[0])
    
    // var windowDict = {};
    // for (key, value) in visibleWindows[0] {
    //     windowDict[key] = try JSONSerialization.data(withJSONObject: value, options: .prettyPrinted)
    // }
    // let dic = ["2": "B", "1": "A", "3": "C"]
    
        
    // }
    
    
    
    
}

// @_cdecl("objc_autoreleaseReturnValue")
// public func objc_autoreleaseReturnValue (x: Int) -> Int {
//     return 0
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

// @_cdecl("getDict")
// public func getString () -> PythonObject {
//     // let pythonDict: PythonObject = ["foo": [0], "bar": [1, 2, 3]]
//     let pythonString: PythonObject = "Hello Python!"
//     return pythonString
// }


