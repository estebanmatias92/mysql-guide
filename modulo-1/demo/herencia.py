class Vehiculo:
    def arrancar(self):
        print("El vehículo ha arrancado")

class Coche(Vehiculo):  # Coche hereda de Vehiculo
    pass

mi_coche = Coche()
mi_coche.arrancar()  # El vehículo ha arrancado