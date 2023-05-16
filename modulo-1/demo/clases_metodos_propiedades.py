class Coche:
    color = "rojo"  # propiedad de la clase
    def arrancar(self):  # método de la clase
        print("El coche ha arrancado")

mi_coche = Coche()  # creando un objeto de la clase Coche
print(mi_coche.color)  # accediendo a una propiedad del objeto
mi_coche.arrancar()  # llamando a un método del objeto