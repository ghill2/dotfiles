#![allow(unused_imports)]

use pyo3::prelude::*;
use rdev::Event;
use rdev::EventType;
use rdev::listen as listen_other;
use pyo3::types::PyFunction;
use pyo3::types::PyDict;
use std::any::TypeId;
use std::any::Any;
use rdev::Key;
use proctitle::set_title;
use ctrlc;
use core_graphics::event::CGKeyCode;
use std::convert::TryInto;
use core::any::type_name;
use std::mem;
use std::collections::HashMap;
use lazy_static::lazy_static;
use std::sync::Mutex;
use itertools::sorted;
use itertools::Itertools;

lazy_static! {
    static ref NAME_MAP: HashMap<&'static str, &'static str> = {
        let mut map: HashMap<&str, &str> = HashMap::new();
        map.extend([
            ("metaleft", "cmd"),
            ("metaright", "cmd"),
            ("shiftleft", "shift"),
            ("shiftright", "shift"),
            ("controlleft", "ctrl"),
            ("altgr", "alt"),
            ("unknown(62)", "ctrl"),
        ]);
        map
    };
}

lazy_static! {
    static ref MODIFIERS: Mutex<HashMap<&'static str, bool>> = {
        let mut map: HashMap<&str, bool> = HashMap::new();
        map.extend([
            ("shift", false),
            ("ctrl", false),
            ("alt", false),
            ("cmd", false),
        ]);
        Mutex::new(map)
    };
}

static mut callback: Option<PyObject> = None; // Option<Py<PyFunction>> // &PyFunction
// run create_string_for_key
// code: u32, flags: CGEventFlags
fn print_type_of<T>(_: &T) {
    println!("{}", std::any::type_name::<T>())
}

fn _callback(event: Event) {
    // println!("{:?}", event.name);
    match event.event_type {
        EventType::KeyPress(key) | EventType::KeyRelease(key) => {
            let s = format!("{:?}", key)
                    .to_lowercase()
                    .replace("key", "")  // normal keys have key prepended
                    .replace("unknown", "")  // unknown keys have unknown prepended
                    .replace("(", "") // unknown keys have brackets
                    .replace(")", "")  // unknown keys have brackets
                    .replace("num", "")  // keys 1 to 0 have num prepended
                    ;
            let mut key = s.as_str();
            
            key = NAME_MAP.get(key).unwrap_or(&key);
            
            
            let mut modifiers = MODIFIERS.lock().unwrap();

            // Update the value if the key exists
            if let Some(value) = modifiers.get_mut(key) {
                *value = match event.event_type {
                    EventType::KeyPress(key) => true,
                    EventType::KeyRelease(key) => false,
                    _ => todo!()
                };
                return;  // don't send modifier keys
            }
            
            match event.event_type {
                EventType::KeyRelease(key) => return,
                _ => {}
            };
            
            
            // print_type_of(&mod_str);
            let mod_str = modifiers
                            .iter()
                            .filter(|(_, &value)| value)
                            .map(|(&key, _)| key)
                            .collect:: <Vec<_>>()
                            .join("+");
            
            
            let mod_str: String = modifiers
                .iter()
                .filter(|(_, &value)| value)
                .map(|(&key, _)| key)
                .collect::<Vec<&str>>()
                .iter()
                .sorted()
                .join("+")
                ;
            
            let tmp = vec![mod_str.as_str(), key].join("+").to_string().to_owned();
            let value = tmp.trim_start_matches('+');
            
            // println!("{}", value);
            Python::with_gil(|py| {
                unsafe {  // error[E0133]: use of mutable static is unsafe and requires unsafe function or block
                    callback.as_ref().expect("REASON").call1(py, (value,));
                }
            })

            // let args = (key, press_or_release, );

            // let press_or_release = match event.event_type {
            //     EventType::KeyPress(key) => "press",
            //     EventType::KeyRelease(key) => "release",
            //     _ => todo!()
            // };
            // let args = (key, press_or_release, );

            // println!("{}", key);
            
        },
        _ => return,
    }
    

}

#[pyfunction]
fn start() {
    
    
    
    
    
    // This will block.
    if let Err(error) = listen_other(_callback) {
        println!("Error: {:?}", error)
    }
}

#[pyfunction]
fn register_callback(_callback: &PyFunction) {
    unsafe {
        callback = Some(_callback.into());
    }
}
#[pyfunction]
fn set_proc_title() {
    set_title("KeyboardListener");
}


/// A Python module implemented in Rust.
#[pymodule]
fn listen(_py: Python, m: &PyModule) -> PyResult<()> {
    m.add_function(wrap_pyfunction!(start, m)?)?;
    m.add_function(wrap_pyfunction!(register_callback, m)?)?;
    m.add_function(wrap_pyfunction!(set_proc_title, m)?)?;
    Ok(())
}
