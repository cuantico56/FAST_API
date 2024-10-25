
from fastapi import Depends, FastAPI, HTTPException, Security, staticfiles, File, UploadFile
from typing import Annotated
from pathlib import Path
import aiofiles
import re
import shutil
from fastapi.security import HTTPBasic, HTTPBasicCredentials
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import HTMLResponse
import xml.etree.ElementTree as ET
import csv
import time

import uvicorn

app = FastAPI()
# Inicializar el diccionario
Municipios = {}
Provincias={}
# Abrir el archivo CSV para cargar datso de municipios y provincias
with open('Municipios.csv', mode='r',encoding="utf-8") as file1:
    # Leer el archivo CSV
    reader1 = csv.reader(file1)
    # Iterar sobre las filas del archivo
    for row in reader1:
        # Asignar la columna 'codigo' como clave y 'nombre' como valor
        codigo, nombre = row
        Municipios[codigo] = nombre

with open('Provincias.csv', mode='r',encoding="utf-8") as file2:
    # Leer el archivo CSV
    reader2 = csv.reader(file2)
    # Iterar sobre las filas del archivo
    for row in reader2:
        # Asignar la columna 'codigo' como clave y 'nombre' como valor
        codigo, nombre = row
        Provincias[codigo] = nombre       
        
        
# Allow all origins (for development purposes)
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Adjust this to specific origins in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
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
    
    
@app.post("/Files", tags=["Endpoints"])
async def write_Files(valorxml: UploadFile = File(...), valorxsl: UploadFile = File(...)):
    try:
        newxml= await valorxml.read ()
        # Guardar el archivo XMl
        # Parsear el XML desde la cadena
        # Definir el espacio de nombres
        root = ET.fromstring(newxml)

        eNCF=root.find('.//eNCF').text
        RNCEmisor=root.find('.//RNCEmisor').text
        RNCComprador=root.find('.//RNCComprador').text
        MontoTotal=root.find('.//MontoTotal').text
        FechaHoraFirma=root.find('.//FechaHoraFirma').text
        Muni= root.find('.//Municipio').text
        provi= root.find('.//Provincia').text 
        Municipio= Municipios[Muni]
        Provincia =Provincias[provi]
        start_time = time.time()
        siggg=root.find('.//{*}SignatureValue').text[:6]
        end_time = time.time()
        print(f"Primera rutina: {end_time - start_time} segundos")
        signature = None
        
        start_time = time.time()
        for elem in root.iter():
            if elem.tag == '{http://www.w3.org/2000/09/xmldsig#}SignatureValue':
                signature = elem.text[:6]
                break
        end_time = time.time()
        print(f"Segunda rutina: {end_time - start_time} segundos")
        print(signature)

        
        
        with open("test1.xml", "wb") as xml_file:
            shutil.copyfileobj(valorxml.file, xml_file)

        # Guardar el archivo XSL
        with open("test1.xsl", "wb") as xsl_file:
            shutil.copyfileobj(valorxsl.file, xsl_file)

        return {"status": "success", "message": "Archivos guardados con éxito."}
    except Exception as e:
        raise HTTPException(status_code=500, detail=f"Error al guardar los archivos: {str(e)}")




 #Para hacer debugging   
if __name__=='__main__':
  uvicorn.run(app,host='192.168.1.2',port=8078)
    
