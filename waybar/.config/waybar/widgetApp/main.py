from App import App

if __name__ == "__main__":
    app = App()

    app.mWebFrame.addButton(
        "github", ["firefox -new-tab 'https://github.com/AkaiNishin?tab=repositories'"], "Images/githublogo.jpg"
    )
    app.mWebFrame.addButton(
        "tec", ["firefox -new-tab 'https://tecdigital.tec.ac.cr/dotlrn/index'"], "Images/teclogo.png"
    )
    app.mWebFrame.addButton(
        "onedrive", ["firefox -new-tab 'https://estudianteccr-my.sharepoint.com/my'"], "Images/onedrive.png"
    )
    app.mWebFrame.addButton(
        "youtube", ["firefox -new-tab 'https://www.youtube.com'"], "Images/youtube.png"
    )
    app.mWebFrame.addButton(
        "googledrive", ["firefox -new-tab 'https://drive.google.com/drive/my-drive'"], "Images/googledrive.jpg"
    )
    app.mWebFrame.addButton(
        "animelist", ["firefox -new-tab 'https://myanimelist.net/profile/AkaiNishin'"], "Images/MyAnimeList_Logo.png"
    )
    
    app.mMemFrame.addButton(
        "books", ["nautilus ~/Documents/Books"], "Images/books.png"
    )
    app.mMemFrame.addButton(
        "videos", ["nautilus ~/Videos"], "Images/videos.png"
    )
    app.mMemFrame.addButton(
        "steam", ["nautilus ~/"], "Images/steam.jpg"
    )
    app.mMemFrame.addButton(
        "programming", ["nautilus ~/Documents/Programming"], "Images/cpp.png"
    )
    app.mMemFrame.addButton(
        "uni", ["nautilus ~/Documents/University"], "Images/electronica.jpg"
    )
    app.mMemFrame.addButton(
        "launcher", ["rofi -show drun"], "Images/arch.jpg"
    )
    app.mainloop()
