import random
import datetime

def main():
    # Abrir archivo para guardar los inserts
    with open("inserts.sql", "w") as file:

        # Entradas del usuario
        id_modelo_avion = int(input("Ingresa la ID del modelo del avión: "))
        id_aeropuerto_partida = int(input("Ingresa la ID del aeropuerto de partida: "))
        id_aeropuerto_destino = int(input("Ingresa la ID del aeropuerto de destino: "))
        cantidad_asientos = int(input("Ingresa la cantidad de asientos posibles para el avión: "))
        cantidad_pasajeros = int(input("Ingresa la cantidad de pasajeros: "))
        cantidad_azafatas = int(input("Ingresa la cantidad de azafatas: "))
        tiempo_partida_str = input("Ingresa la fecha y hora estimada de partida (YYYY-MM-DD HH:MM:SS): ")
        tiempo_llegada_str = input("Ingresa la fecha y hora estimada de llegada (YYYY-MM-DD HH:MM:SS): ")

        # Convertir las fechas ingresadas por el usuario
        tiempo_partida = datetime.datetime.strptime(tiempo_partida_str, "%Y-%m-%d %H:%M:%S")
        tiempo_llegada = datetime.datetime.strptime(tiempo_llegada_str, "%Y-%m-%d %H:%M:%S")

        # Crear vuelo
        vuelo_insert = f"""
        INSERT INTO vuelo (id_status_vuelo, tiempo_partida, tiempo_llegada, tiempo_partida_aprox, tiempo_llegada_aprox, id_avion, id_aeropuerto_partida, id_aeropuerto_arribo)
        VALUES (1, '{tiempo_partida}', '{tiempo_llegada}', '{tiempo_partida}', '{tiempo_llegada}', {id_modelo_avion}, {id_aeropuerto_partida}, {id_aeropuerto_destino});
        """
        file.write("-- Insertar vuelo\n")
        file.write(vuelo_insert + "\n")

        # Generar asientos vacíos
        asientos_ocupados = cantidad_pasajeros
        asientos_vacios = cantidad_asientos - asientos_ocupados

        file.write("-- Insertar asientos vacíos\n")
        for i in range(1, asientos_vacios + 1):
            es_ventana = random.choice([True, False])
            id_clase = random.choice([1, 2, 3])  # Asignar clase aleatoria (1: Económica, 2: Business, 3: Primera)
            asiento_insert = f"""
            INSERT INTO asiento (id_avion, id_clase, es_ventana)
            VALUES ((SELECT id_avion FROM avion WHERE id_avion = {id_modelo_avion}), {id_clase}, {es_ventana});
            """
            file.write(asiento_insert + "\n")

        # Generar asientos ocupados y asignar pasajeros
        file.write("-- Insertar asientos ocupados y generar pasajeros\n")
        for i in range(asientos_vacios + 1, cantidad_asientos + 1):
            # Crear cliente
            nombre_cliente = f"Pasajero_{random.randint(1000, 9999)}"
            identificacion_cliente = random.randint(20000000, 48000000)
            cliente_insert = f"""
            INSERT INTO cliente (nombre, numero_tel, email, identificacion, tipo_identificacion, fecha_nacimiento, activo)
            VALUES ('{nombre_cliente}', '123456789', '{nombre_cliente.lower()}@example.com', '{identificacion_cliente}', 'Documento Nacional de Identidad Argentino', '1990-01-01', True);
            """
            file.write(cliente_insert + "\n")

            # Crear pasaje
            costo_base = round(random.uniform(100, 1000), 2)
            pasaje_insert = f"""
            INSERT INTO pasaje (id_cliente, id_vuelo, costo_base, id_status, flexible, activo)
            VALUES ((SELECT id_cliente FROM cliente ORDER BY id_cliente DESC LIMIT 1), (SELECT id_vuelo FROM vuelo ORDER BY id_vuelo DESC LIMIT 1), {costo_base}, 1, False, True);
            """
            file.write(pasaje_insert + "\n")

            # Crear asiento para el pasajero
            es_ventana = random.choice([True, False])
            id_clase = random.choice([1, 2, 3])
            asiento_insert = f"""
            INSERT INTO asiento (id_avion, id_clase, es_ventana)
            VALUES ((SELECT id_avion FROM avion WHERE id_avion = {id_modelo_avion}), {id_clase}, {es_ventana});
            """
            file.write(asiento_insert + "\n")

            # Asignar asiento y crear check-in
            check_in_insert = f"""
            INSERT INTO check_in (id_pasaje, id_asiento, id_status_check_in, activo)
            VALUES ((SELECT id_pasaje FROM pasaje ORDER BY id_pasaje DESC LIMIT 1), (SELECT id_asiento FROM asiento ORDER BY id_asiento DESC LIMIT 1), 1, True);
            """
            file.write(check_in_insert + "\n")

            # Crear recibo
            id_metodo_pago = random.choice([1, 2, 3])
            recibo_insert = f"""
            INSERT INTO recibo (id_pasaje, id_metodo_pago)
            VALUES ((SELECT id_pasaje FROM pasaje ORDER BY id_pasaje DESC LIMIT 1), {id_metodo_pago});
            """
            file.write(recibo_insert + "\n")

            # Crear tarifas asociadas al recibo
            tarifas = [
                ("IVA", round(random.uniform(10, 50), 2)),
                ("Costo Neto", round(random.uniform(100, 500), 2)),
                ("Seguridad", round(random.uniform(20, 100), 2)),
                ("Costos Varios", round(random.uniform(5, 20), 2))
            ]
            file.write("-- Insertar tarifas\n")
            for detalle, monto in tarifas:
                tarifa_insert = f"""
                INSERT INTO tarifa (id_recibo, detalle, monto)
                VALUES ((SELECT id_recibo FROM recibo ORDER BY id_recibo DESC LIMIT 1), '{detalle}', {monto});
                """
                file.write(tarifa_insert + "\n")

            # Crear entre 0 y 3 equipajes
            file.write("-- Insertar equipajes\n")
            for _ in range(random.randint(0, 3)):
                equipaje_insert = f"""
                INSERT INTO equipaje (id_check_in, estado, peso, codigo, tipo, activo)
                VALUES ((SELECT id_check_in FROM check_in ORDER BY id_check_in DESC LIMIT 1), 'En camino', {round(random.uniform(5, 30), 2)}, 'EQ{random.randint(1000, 9999)}', 'Maleta', True);
                """
                file.write(equipaje_insert + "\n")

        # Asignar pilotos y azafatas al vuelo
        file.write("-- Insertar pilotos y azafatas\n")
        for _ in range(2):  # Generar 2 pilotos
            nombre_piloto = f"Piloto_{random.randint(1000, 9999)}"
            identificacion_piloto = random.randint(20000000, 48000000)
            piloto_insert = f"""
            INSERT INTO staff (nombre, identificacion, tipo_identificacion, fecha_nacimiento, fecha_inicio_empleo, activo)
            VALUES ('{nombre_piloto}', '{identificacion_piloto}', 'Documento Nacional de Identidad Argentino', '1980-01-01', '{datetime.datetime.now().date()}', True);
            """
            file.write(piloto_insert + "\n")
            vuelo_staff_insert = f"""
            INSERT INTO vuelo_staff (id_vuelo, id_staff)
            VALUES ((SELECT id_vuelo FROM vuelo ORDER BY id_vuelo DESC LIMIT 1), (SELECT id_staff FROM staff ORDER BY id_staff DESC LIMIT 1));
            """
            file.write(vuelo_staff_insert + "\n")

        for _ in range(cantidad_azafatas):  # Generar azafatas
            nombre_azafata = f"Azafata_{random.randint(1000, 9999)}"
            identificacion_azafata = random.randint(20000000, 48000000)
            azafata_insert = f"""
            INSERT INTO staff (nombre, identificacion, tipo_identificacion, fecha_nacimiento, fecha_inicio_empleo, activo)
            VALUES ('{nombre_azafata}', '{identificacion_azafata}', 'Documento Nacional de Identidad Argentino', '1990-01-01', '{datetime.datetime.now().date()}', True);
            """
            file.write(azafata_insert + "\n")
            vuelo_staff_insert = f"""
            INSERT INTO vuelo_staff (id_vuelo, id_staff)
            VALUES ((SELECT id_vuelo FROM vuelo ORDER BY id_vuelo DESC LIMIT 1), (SELECT id_staff FROM staff ORDER BY id_staff DESC LIMIT 1));
            """
            file.write(vuelo_staff_insert + "\n")

    print("Vuelo creado y datos generados con éxito. Los inserts se han guardado en 'inserts.sql'.")

if __name__ == "__main__":
    main()
