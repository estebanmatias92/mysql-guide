# Creo mi clase para instanciar luego
class Persona():
    def __init__(self, nombre, edad, DNI):
        self.nombre = nombre
        self.edad = edad
        self.DNI = DNI
    
    def mostrar(self):
        print(f"Nombre:\t{self.nombre}"
              + f"\nEdad:\t{self.edad}"
              + f"\nDNI:\t{self.DNI}")

# Creo mi objeto a partir de mi clase Persona
persona1 = Persona("Matias", 30, 64654654)
persona1.mostrar()




# Creo de nuevo la clase persona
class Persona():
    pass

# Intento usar la clase para crear otro objeto
persona2 = Persona()
persona2.mostrar()