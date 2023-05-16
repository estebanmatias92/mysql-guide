class Coche:
    def arrancar(self):
        print("El coche ha arrancado")

class Moto:
    def arrancar(self):
        print("La moto ha arrancado")

def arrancar_vehiculo(vehiculo):
    vehiculo.arrancar()

mi_coche = Coche()
mi_moto = Moto()
arrancar_vehiculo(mi_coche)  # El coche ha arrancado
arrancar_vehiculo(mi_moto)  # La moto ha arrancado