from fastapi import FastAPI, HTTPException
from pathlib import Path

app = FastAPI()

# Ruta a tu archivo .txt (ajusta la ruta según tu sistema)
file_path = Path(__file__).parent / "Moneda.txt"

@app.get("/read")
def read_text_file():
    try:
        with open(file_path, 'r') as f:
            content = f.read()
        return {"Valor": content}
    except FileNotFoundError:
        raise HTTPException(status_code=404, detail="Archivo no encontrado")
