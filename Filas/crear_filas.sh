#Este script crea un registro de qos llamado "fila" y le asigna una configuracion
#para usar 10000000 bytes

# Posteriormente, crea tres filas llamadas "1, 2, 3" y les asigna un identificador de 1
# Adicionalmente, les asigna capacidades a cada una de ellas
ovs-vsctl -- set port s1-eth4 qos=@fila -- \
--id=@fila create qos type=linux-htb \
other-config:max-rate=10000000 \ #Ancho de banda total
queues:1=@q1 \
queues:2=@q2 \
queues:3=@q3 -- \
--id=@q1 create queue other-config:max-rate=5000000 -- \ #Fila alto bw
--id=@q2 create queue other-config:max-rate=2500000 -- \ # Fila medio bw
--id=@q3 create queue other-config:max-rate=2500000      # Fila bajo bw


# Puede usar este script como base para crear las filas que necesite, para eso debe
# agregar o quitar lineas que comienzan con "queues...", cada linea de esas representa una fila

# Agregar o quitar lineas que empiezan con --id=... cada una de esas lineas configura la fila indicada por el id
