// #[pyclass]
// pub struct KeyboardListener {
//     callback: &PyFunction
// }
    

    
// impl KeyboardListener {
//     fn new(value: i32) -> Self {
//         MyClass { value }
//     }

// }

fn _callback(event: Event) {
    println!("My callback {:?}", event);
    match event.name {
        Some(string) => {
            println!("User wrote {:?}", string);
            self.callback(event.name.unwrap());
        },
        None => (),
    }
}

fn _callback(&self, event: EventWrapper) {
    println!("My callback {:?}", event);
    match event.name() {
        Some(string) => {
            println!("User wrote {:?}", string);
            Python::with_gil(|py| {
                let args = (event.name().unwrap(),);
                self.callback.as_ref().expect("REASON").call1(py, args);
            })
                // let kwargs = PyDict::new(py);
            
            
        },
        None => (),
    }

#[derive(Clone, Debug)]
#[pyclass]
struct EventWrapper(Event);

#[pymethods]
impl EventWrapper {
    #[getter]
    fn name(&self) -> Option<String> {
        self.0.name.clone()
    }
}


#[pymethods]
impl MyClass {
    #[new]
    fn new(callback: &PyFunction) -> Self {
        MyClass { callback: None }
    }
    
}

#[pyclass]
pub struct MyClass {
    pub callback: Option<PyObject> // Option<Py<PyFunction>> // &PyFunction
}