# import os
# import subprocess
#
#
# def get_interface():
#
#     cmd = "ip addr | grep 'state UP'"
#     ip = subprocess.Popen(
#         cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT
#     )
#     output = ip.communicate()[0]
#     result = str(output.split()[1]).split("'")[1].replace(":", " ")
#     return result
#
#
# print(get_interface())
import psutil


def get_active_network_interface():
    # Obtener todas las interfaces de red
    interfaces = psutil.net_if_addrs()
    stats = psutil.net_if_stats()

    # Recorrer todas las interfaces
    for interface, _ in interfaces.items():
        # Verificar si la interfaz está activa (up)
        if interface in stats and stats[interface].isup and interface != "lo":
            return interface

    # Si no se encuentra una interfaz activa con dirección IP
    return None
