import mysql.connector
import random
from datetime import datetime, timedelta

# Configuración de la conexión a la base de datos
config = {
    'user': 'root',
    'password': 'contraseña_root',
    'host': 'localhost',
    'database': 'basededatos',
    'port': '3306',
}

# Función para insertar valores sintéticos en la tabla Usuario
def insertar_usuarios(cursor, num_usuarios):
    for i in range(num_usuarios):
        nombre = f"Usuario {i+1}"
        email = f"usuario{i+1}@example.com"
        cursor.execute("INSERT INTO Usuario (nombre, email) VALUES (%s, %s)", (nombre, email))

# Función para insertar valores sintéticos en la tabla Parcela
def insertar_parcelas(cursor, num_parcelas):
    for i in range(num_parcelas):
        nombre = f"Parcela {i+1}"
        ubicacion = f"Ubicación {i+1}"
        cursor.execute("INSERT INTO Parcela (nombre, ubicacion) VALUES (%s, %s)", (nombre, ubicacion))

# Función para insertar valores sintéticos en la tabla Dispositivo
def insertar_dispositivos(cursor, num_dispositivos):
    tipos_dispositivos = ["Tipo A", "Tipo B", "Tipo C"]
    for i in range(num_dispositivos):
        nombre = f"Dispositivo {i+1}"
        tipo = random.choice(tipos_dispositivos)
        cursor.execute("INSERT INTO Dispositivo (nombre, tipo) VALUES (%s, %s)", (nombre, tipo))

# Función para generar una fecha aleatoria dentro de un rango
def fecha_aleatoria(start_date, end_date):
    delta = end_date - start_date
    random_days = random.randint(0, delta.days)
    return start_date + timedelta(days=random_days)

# Función para insertar valores sintéticos en la tabla Medida
def insertar_medidas(cursor, num_medidas, num_sensores):
    start_date = datetime(2024, 1, 1)
    end_date = datetime(2024, 4, 1)
    for i in range(num_medidas):
        id_sensor = random.randint(1, num_sensores)
        fecha = fecha_aleatoria(start_date, end_date)
        valor = random.uniform(0, 100)
        cursor.execute("INSERT INTO Medida (id_sensor, valor, fecha) VALUES (%s, %s, %s)", (id_sensor, valor, fecha))

# Establecer conexión con la base de datos
conexion = mysql.connector.connect(**config)
cursor = conexion.cursor()

# Insertar valores sintéticos en las tablas
insertar_usuarios(cursor, 5)
insertar_parcelas(cursor, 3)
insertar_dispositivos(cursor, 4)
insertar_medidas(cursor, 20, 4)  # 20 medidas con 4 sensores

# Confirmar la transacción y cerrar la conexión
conexion.commit()
conexion.close()
