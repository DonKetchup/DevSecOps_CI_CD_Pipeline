# 1. Imagen base ligera de python
FROM python:3.15-slim

# 2. Buenas prácticas de Python en contenedores
ENV PYTHONDONTWRITEBYTECODE=1 \                                                                                
    PYTHONUNBUFFERED=1                                                                                         
                                                                                                               
# 3. Directorio de trabajo dentro del contenedor
WORKDIR /app

# 4. Copiar e instalar SOLO dependencias de producción
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Crear un usuario sin privilegios (nunca correr como root)
RUN useradd --create-home --uid 10001 appuser

# 6. Copiar únicamente el código de la aplicación
COPY app/ ./app/

# 7. Cambiar al usuario no-root
USER 10001

# 8. Documentar el puerto y arrancar el servidor
EXPOSE 8000
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]