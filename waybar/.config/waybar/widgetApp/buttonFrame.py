import customtkinter
from PIL import Image
import subprocess
from typing import Dict, List
from functools import partial


class buttonFrame(customtkinter.CTkFrame):
    def __init__(self, master) -> None:
        super().__init__(master)
        self.mPosx: int = 0
        self.mPosy: int = 0
        self.mCommands: Dict[str, List[str]] = {}
        self.mImagePath: Dict[str, customtkinter.CTkImage] = {}
        self.mButtons: Dict[str, customtkinter.CTkButton] = {}

    def execCommand(self, name: str):
        subprocess.run(
            self.mCommands[name], shell=True, capture_output=False, text=False
        )

    def addButton(self, name: str, command: List[str], pathImage: str):
        if (self.mPosy >= 3):
            self.mPosy = 0
            self.mPosx += 1
        if (self.mPosy < 3) and (self.mPosx < 2):
            self.mCommands[name] = command
            self.mImagePath[name] = customtkinter.CTkImage(
                light_image=Image.open(pathImage),
                dark_image=Image.open(pathImage),
                size=(70, 70),
            )
            self.mButtons[name] = customtkinter.CTkButton(
                self,
                text="",
                image=self.mImagePath[name],
                width=70,
                height=70,
                command=partial(self.execCommand, name),
                compound="left",
            )
            self.mButtons[name].grid(
                row=self.mPosy, column=self.mPosx, padx=2, pady=2, sticky="ew"
            )
            self.mPosy += 1
