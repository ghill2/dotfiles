import sys
from PyQt5.QtWidgets import QApplication, QWidget, QVBoxLayout, QLabel, QListWidget, QPushButton, QListWidgetItem, QMainWindow, QAction

class SelectorApp(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowTitle('Selector GUI')

        self.central_widget = QWidget(self)
        self.setCentralWidget(self.central_widget)

        self.layout = QVBoxLayout()
        self.central_widget.setLayout(self.layout)

        self.label = QLabel("Selected Option: ", self)
        self.layout.addWidget(self.label)

        self.list_widget = QListWidget(self)
        self.layout.addWidget(self.list_widget)

        self.add_action("Option 1")
        self.add_action("Option 2")
        self.add_action("Option 3")

        self.button = QPushButton("Perform Action", self)
        self.button.clicked.connect(self.perform_action)
        self.layout.addWidget(self.button)

        self.create_menu()

    def create_menu(self):
        menu_bar = self.menuBar()

        # File menu
        file_menu = menu_bar.addMenu("File")

        exit_action = QAction("Exit", self)
        exit_action.triggered.connect(self.close)
        file_menu.addAction(exit_action)

        # Help menu
        help_menu = menu_bar.addMenu("Help")

        about_action = QAction("About", self)
        about_action.triggered.connect(self.show_about_dialog)
        help_menu.addAction(about_action)

    def add_action(self, action_name):
        item = QListWidgetItem(action_name)
        self.list_widget.addItem(item)

    def perform_action(self):
        selected_items = self.list_widget.selectedItems()
        if not selected_items:
            return

        selected_option = selected_items[0].text()
        self.label.setText("Selected Option: " + selected_option)
        # Perform action based on the selected option
        if selected_option == "Option 1":
            print("Performing Action 1...")
        elif selected_option == "Option 2":
            print("Performing Action 2...")
        elif selected_option == "Option 3":
            print("Performing Action 3...")
        else:
            print("Unknown Option")

    def show_about_dialog(self):
        about_text = "This is a Selector GUI application."
        QMessageBox.about(self, "About", about_text)

if __name__ == '__main__':
    app = QApplication(sys.argv)
    selector_app = SelectorApp()
    selector_app.show()
    sys.exit(app.exec_())