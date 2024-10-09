from fastapi import FastAPI, HTTPException
from pathlib import Path
import aiofiles

app = FastAPI()
app.title="MonedaVe"

# Ruta a tu archivo .txt (ajusta la ruta según tu sistema)
file_path = Path(__file__).parent / "Moneda.txt"

@app.get("/read")
async def read_text_file():
    try:
        async with aiofiles.open(file_path, 'r') as f:
            content = await f.read()
        return {"Valor": content}
    except FileNotFoundError:
        raise HTTPException(status_code=404, detail="Archivo no encontrado")

@app.post("/write")
async def write_to_file(value: str):
    """Escribe un valor al archivo Moneda.txt, sobrescribiendo el contenido existente."""
    try:
        async with aiofiles.open(file_path, 'w') as f:  # Utiliza aiofiles.open para abrir el archivo de forma asíncrona
            await f.write(value)  # Escribe el valor
        return {"message": "Valor escrito exitosamente."}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error al escribir: {str(e)}")
    
