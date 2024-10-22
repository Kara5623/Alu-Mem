import tkinter as tk
from tkinter import filedialog, messagebox

def select_file(text_widget):
    file_path = filedialog.askopenfilename()
    if file_path:
        try:
            with open(file_path, 'r') as file:
                content = file.read()
                text_widget.delete(1.0, tk.END)
                text_widget.insert(tk.END, content)
        except FileNotFoundError:
            messagebox.showerror("Error", "File not found.")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to read file: {str(e)}")

def save_report(text_widget):
    file_path = filedialog.asksaveasfilename(defaultextension=".txt")
    if file_path:
        try:
            with open(file_path, 'w') as file:
                content = text_widget.get(1.0, tk.END)
                file.write(content.strip())
                messagebox.showinfo("Success", "Report saved successfully!")
        except Exception as e:
            messagebox.showerror("Error", f"Failed to save file: {str(e)}")

def exit_app(window):
    if messagebox.askokcancel("Exit", "Are you sure you want to exit?"):
        window.destroy()

def decode_text(text_widget):
    content = text_widget.get(1.0, tk.END).strip()
    try:
        binary_lines = []
        for line in content.splitlines():
            if line.strip():
                parts = line.split()
                if len(parts) >= 3:  # Asegúrate de que haya al menos tres partes (SUMA A3 B7)
                    # Extraer los valores hexadecimales (asumiendo que son siempre el segundo y tercer valor)
                    hex_values = parts[1:3]
                    binary_values = []
                    for hex_value in hex_values:
                        # Convertir de hexadecimal a binario y quitar el prefijo '0b'
                        binary_value = bin(int(hex_value, 16))[2:]  # Convertir a binario
                        binary_values.append(binary_value.zfill(8))  # Asegurarse de que tenga al menos 8 bits

                    binary_lines.append(' '.join(binary_values))  # Combinar los resultados

        text_widget.delete(1.0, tk.END)
        text_widget.insert(tk.END, '\n'.join(binary_lines))
    except ValueError:
        messagebox.showerror("Error", "Invalid hexadecimal input.")
    except Exception as e:
        messagebox.showerror("Error", f"Failed to decode text: {str(e)}")

def create_gui():
    window = tk.Tk()
    window.title("Text Analyzer")
    window.geometry("700x600")

    title_label = tk.Label(window, text="Text Analyzer", font=("Arial", 24))
    title_label.pack(pady=10)

    text_widget = tk.Text(window, height=20, width=80)
    text_widget.pack(pady=10)

    tk.Button(window, text="Select file", command=lambda: select_file(text_widget)).pack(pady=5)
    tk.Button(window, text="Save Report", command=lambda: save_report(text_widget)).pack(pady=5)
    tk.Button(window, text="Decodificar", command=lambda: decode_text(text_widget)).pack(pady=5)
    tk.Button(window, text="Exit", command=lambda: exit_app(window)).pack(pady=5)

    window.mainloop()

# Ejecutar la GUI
create_gui()
