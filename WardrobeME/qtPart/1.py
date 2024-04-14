import sys
from PyQt5 import uic 
from PyQt5.QtWidgets import QApplication, QWidget, QMainWindow, QPushButton, QDialog, QMessageBox
from PyQt5.QtWidgets import QMainWindow, QLabel
from PyQt5.QtGui import *
from PyQt5.QtCore import *
from PyQt5 import QtSql
import MySQLdb as mdb

class MainWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        uic.loadUi('wME_MainWindow.ui', self)
        self.newclothes.clicked.connect(self.open_new_clothes_window)
        self.newclothes.clicked.connect(self.close_main_window)
        self.newoutfits.clicked.connect(self.open_new_outfits_window)
        self.outfitslist.clicked.connect(self.open_outfits_list_window)

    def open_new_clothes_window(self):
        self.new_clothes_window = NewClothesWindow(self)
        self.new_clothes_window.show()

    def open_new_outfits_window(self):
        self.new_outfits_window = NewOutfitsWindow(self)
        self.new_outfits_window.show()
    
    def open_outfits_list_window(self):
        self.outfits_list_window = OutfitsListWindow(self)
        self.outfits_list_window.show()

    def close_main_window(self):
        self.mw = MainWindow()
        self.mw.close

class NewClothesWindow(QMainWindow):
    def __init__(self, *args):
        super().__init__()
        uic.loadUi('wME_NewClothesWindow.ui', self)
        self.setWindowTitle('New Clothes')
        self.shkaficon.clicked.connect(self.open_main_window)

    def open_main_window(self):
        self.main_window = MainWindow()
        self.ncw = NewClothesWindow()
        self.shkaficon.clicked.connect(self.ncw.close)
        self.main_window.show()


class NewOutfitsWindow(QMainWindow):
    def __init__(self, *args):
        super().__init__()
        uic.loadUi('wME_NewOutfitsWindow.ui', self)
        self.setWindowTitle('New Outfits')
        self.shkaficon1.clicked.connect(self.open_main_window1)

    def open_main_window1(self):
        self.main_window1 = MainWindow()
        self.main_window1.show()

class OutfitsListWindow(QMainWindow):
    def __init__(self, *args):
        super().__init__()
        uic.loadUi('wME_OutfitsListWindow.ui', self)
        self.setWindowTitle('Outfit Selection')
        self.shkaficon2.clicked.connect(self.open_main_window2)

    def open_main_window2(self):
        self.main_window2 = MainWindow()
        self.main_window2.show()

if __name__ == '__main__':
    app = QApplication(sys.argv)
    ex = MainWindow()
    ex.show()
    sys.exit(app.exec())