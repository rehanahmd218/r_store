import tkinter as tk
from tkinter import filedialog, messagebox
import os

def select_folder():
    folder_selected = filedialog.askdirectory()
    if folder_selected:
        files = os.listdir(folder_selected)
        files = [f for f in files if os.path.isfile(os.path.join(folder_selected, f))]
        output_file = 'File Names.txt'
        with open(output_file, "w") as f:
            for file_name in files:
                f.write(file_name + "\n")
        messagebox.showinfo("Success", f"File names saved to {output_file}")

root = tk.Tk()
root.title("Folder File Lister")
root.geometry("300x120")

label = tk.Label(root, text="Select a folder to list its files:")
label.pack(pady=10)

select_btn = tk.Button(root, text="Select Folder", command=select_folder)
select_btn.pack(pady=10)

root.mainloop()