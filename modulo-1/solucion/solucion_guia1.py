"""
    Ejercicio 1
"""

class Calculadora:
    def suma(self, a, b):
        return a + b

    def resta(self, a, b):
        return a - b

    def multiplicacion(self, a, b):
        return a * b

    def division(self, a, b):
        return a / b

# Uso de la clase
calculadora = Calculadora()
print(calculadora.suma(10, 5))  # 15
print(calculadora.resta(10, 5))  # 5
print(calculadora.multiplicacion(10, 5))  # 50
print(calculadora.division(10, 5))  # 2.0



"""
    Ejercicio 2
"""

class CuentaBancaria:
    def __init__(self, titular, saldo):
        self.__titular = titular
        self.__saldo = saldo

    # Getter
    def get_saldo(self):
        return self.__saldo

    # Setter
    def set_saldo(self, saldo):
        self.__saldo = saldo

    def depositar(self, cantidad):
        self.__saldo += cantidad

    def retirar(self, cantidad):
        if self.__saldo >= cantidad:
            self.__saldo -= cantidad
        else:
            print('Saldo insuficiente')

# Uso de la clase
cuenta = CuentaBancaria('John Doe', 1000)
cuenta.depositar(500)
print(cuenta.get_saldo())  # 1500
cuenta.retirar(200)
print(cuenta.get_saldo())  # 1300



"""
    Ejercicio 3
"""

class Animal:
    def comer(self):
        print('El animal está comiendo')

    def dormir(self):
        print('El animal está durmiendo')

class Perro(Animal):
    def ladrar(self):
        print('El perro está ladrando')

class Gato(Animal):
    def ronronear(self):
        print('El gato está ronroneando')

# Uso de las clases
perro = Perro()
perro.comer()
perro.ladrar()

gato = Gato()
gato.dormir()
gato.ronronear()



"""
    Ejercicio 4
"""

class Animal:
    def hacer_sonido(self):
        pass

class Perro(Animal):
    def hacer_sonido(self):
        print('El perro hace: Guau Guau!')

class Gato(Animal):
    def hacer_sonido(self):
        print('El gato hace: Miau Miau!')

# Uso de las clases
perro = Perro()
perro.hacer_sonido()  # El perro hace: Guau Guau!

gato = Gato()
gato.hacer_sonido()  # El gato hace: Miau Miau!



"""
    Ejercicio 5
"""

from abc import ABC, abstractmethod
import math

class Figura(ABC):
    @abstractmethod
    def calcular_area(self):
        pass

    @abstractmethod
    def calcular_perimetro(self):
        pass

class Circulo(Figura):
    def __init__(self, radio):
        self.radio = radio

    def calcular_area(self):
        return math.pi * (self.radio ** 2)

    def calcular_perimetro(self):
        return 2 * math.pi * self.radio

class Rectangulo(Figura):
    def __init__(self, ancho, alto):
        self.ancho = ancho
        self.alto = alto

    def calcular_area(self):
        return self.ancho * self.alto

    def calcular_perimetro(self):
        return 2 * (self.ancho + self.alto)

# Uso de las clases
circulo = Circulo(5)
print(circulo.calcular_area())  # 78.53981633974483
print(circulo.calcular_perimetro())  # 31.41592653589793

rectangulo = Rectangulo(4, 7)
print(rectangulo.calcular_area())  # 28
print(rectangulo.calcular_perimetro())  # 22


"""
    Ejercicio 6
"""

class Empleado:
    def __init__(self, nombre, edad, salario):
        self.nombre = nombre
        self.edad = edad
        self.salario = salario

    def aumentar_salario(self, aumento):
        self.salario += aumento

class Gerente(Empleado):
    def aumentar_salario(self, aumento, bonificacion=1.5):
        # Aumento con bonificación para el Gerente
        self.salario += aumento * bonificacion

class Asistente(Empleado):
    pass

# Uso de las clases
gerente = Gerente('Bob', 45, 90000)
gerente.aumentar_salario(5000)
print(gerente.salario)  # 97500.0

asistente = Asistente('Alice', 25, 50000)
asistente.aumentar_salario(5000)
print(asistente.salario)  # 55000
