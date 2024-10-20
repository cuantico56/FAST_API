
from fastapi import Depends, FastAPI, HTTPException, Security, staticfiles
from typing import Annotated
from pathlib import Path
import aiofiles
import re
from fastapi.security import HTTPBasic, HTTPBasicCredentials

from fastapi.responses import HTMLResponse
import uvicorn

app = FastAPI()
app.title="MonedaVe"
app.mount("/static", staticfiles.StaticFiles(directory="static"), name="static")
# Securely store username and password (environment variables recommended)
username = "admin"
password = "sam"  # Replace with a strong password
security = HTTPBasic()

# Function to check credentials (consider using a hasher like argon2)
async def verify_credentials(credentials: Annotated[HTTPBasicCredentials, Depends(security)]):
    # Perform your authentication logic here (e.g., check username/password against database)
    if credentials.username == username and credentials.password == password:  # Replace with your credentials
        return True
    return False

# Ruta a tu archivo .txt (ajusta la ruta según tu sistema)
file_path = Path(__file__).parent / "Moneda.txt"

@app.get("/", include_in_schema=False)
async def read_index():
    # Obtener la ruta absoluta del archivo index.html
    file_path = Path(__file__).parent / "index.html"

    # Leer el contenido del archivo
    with open(file_path, 'r',encoding='utf-8') as f:
        html_content = f.read()

    return HTMLResponse(content=html_content)

@app.get("/read",tags=["Endpoints"])
async def read_text_file():
    try:
        async with aiofiles.open(file_path, 'r') as f:
            content = await f.read()
        return {"Valor": content}
    except FileNotFoundError:
        raise HTTPException(status_code=404, detail="Archivo no encontrado")

@app.post("/write", tags=["Endpoints"])
async def write_to_file(value: str,authenticated: bool = Depends(verify_credentials)):
 if not authenticated:
     raise HTTPException(status_code=401, detail="Unauthorized")
 else:

    try:
        valuefloat = float(re.findall(r'-?\d+(?:\.\d+)?', value.replace(',','.'))[0])
        valuestring = f"{valuefloat:.2f}"

        async with aiofiles.open(file_path, 'w') as f:
            await f.write(valuestring + " USD")
        return {"message": "Valor escrito exitosamente."}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error al escribir: {str(e)}")



 #Para hacer debugging   
#if __name__=='__main__':
#  uvicorn.run(app,host='192.168.1.2')
    
