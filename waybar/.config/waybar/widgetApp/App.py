import customtkinter
from buttonFrame import buttonFrame
from PIL import Image
import subprocess


class App(customtkinter.CTk):
    def __init__(self) -> None:
        super().__init__()
        self.geometry("370x400")
        self.title("bannerWidget")
        self.resizable(False, False)

        self.mImageAvatar = customtkinter.CTkImage(
            light_image=Image.open("Images/kurejiollie.jpg"),
            dark_image=Image.open("Images/kurejiollie.jpg"),
            size=(140, 140),
        )
        self.mAvatarLabel = customtkinter.CTkLabel(
            self, text="", image=self.mImageAvatar)
        self.mAvatarLabel.grid(row=0, column=0, padx=2, pady=2, sticky="nsw")

        self.mCalendarLabel = customtkinter.CTkLabel(
            self,
            text=subprocess.run(["cal"], shell=True, capture_output=True, text=True).stdout,
            width=140,
            height=140,
            font=("Arial", 15),
            anchor="w"
        )
        self.mCalendarLabel.grid(row=0, column=1, padx=2, pady=2, sticky="nsw")

        self.mMemFrame = buttonFrame(self)
        self.mMemFrame.grid(row=1, column=0, padx=2, pady=2, sticky="nsw")

        self.mWebFrame = buttonFrame(self)
        self.mWebFrame.grid(row=1, column=1, padx=2, pady=2, sticky="nsw")
