# Paradigma de Programacion Orientada a Objetos

---

## Clases vs Objetos, Metodos vs Propiedades

**Clase:** En Python, una clase es como un plano que define un tipo de objeto. Piensa en ello como el molde para un objeto. Define las características y comportamientos que tendrán los objetos creados a partir de ella.

**Objeto:** Un objeto es una instancia de una clase, es decir, es como un ejemplar individual que se ha creado a partir de ese molde que es la clase. Si la clase es un molde para hacer galletas, un objeto sería una galleta que has hecho usando ese molde.

**Propiedades o Atributos:** Las propiedades (también llamadas atributos) son las características que definen a un objeto. Son como las variables que pertenecen a un objeto. Por ejemplo, si tienes una clase `Coche`, algunas de sus propiedades podrían ser `color`, `modelo` y `marca`.

**Métodos:** Los métodos son las acciones que puede realizar un objeto. Son como funciones que pertenecen a un objeto. Siguiendo con el ejemplo de la clase `Coche`, algunos de sus métodos podrían ser `arrancar()`, `acelerar()` y `frenar()`.

```python
class Coche:
    color = "rojo"  # propiedad de la clase
    def arrancar(self):  # método de la clase
        print("El coche ha arrancado")

mi_coche = Coche()  # creando un objeto de la clase Coche
print(mi_coche.color)  # accediendo a una propiedad del objeto
mi_coche.arrancar()  # llamando a un método del objeto
```

---

## Encapsulamiento (Modificadores de Acceso)

El encapsulamiento en la programación orientada a objetos es como poner una cerca alrededor de los atributos y métodos de una clase para mantenerlos seguros. Esto significa que haces que estos atributos y métodos sean 'privados', de tal manera que no se puedan modificar directamente desde fuera de la clase. De esta forma, puedes controlar cómo se utilizan y cambian, previniendo cambios no deseados o no autorizados.

```python
class Coche:
    def __init__(self):
        self.__color = "rojo"  # atributo privado

    def obtener_color(self):  # getter
        return self.__color

    def establecer_color(self, color):  # setter
        self.__color = color

mi_coche = Coche()
print(mi_coche.obtener_color())  # rojo
mi_coche.establecer_color("azul")
print(mi_coche.obtener_color())  # azul
```

---

## Herencia

La herencia, en la programación orientada a objetos, es como un proceso de 'paso de características'. Te permite crear una nueva clase que toma y puede usar todos los métodos y propiedades de una clase existente. Esto es útil porque te permite reutilizar el código y establecer relaciones de 'tipo de' entre las clases, lo que significa que puedes pensar en la nueva clase como un subtipo o una especie de la clase de la que heredó.

```python
class Vehiculo:
    def arrancar(self):
        print("El vehículo ha arrancado")

class Coche(Vehiculo):  # Coche hereda de Vehiculo
    pass

mi_coche = Coche()
mi_coche.arrancar()  # El vehículo ha arrancado
```

---

## Polimorfismo

El polimorfismo, en programación orientada a objetos, es la capacidad de utilizar una misma acción o método de diferentes formas, dependiendo del tipo de objeto o de datos con el que se esté trabajando. Es como si tuvieras una única 'forma' (función o método) que puede 'adaptarse' o 'tomar muchas formas' (polimorfismo) para trabajar con diferentes tipos de objetos.

```python
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
```

---

## Clases Abstractas (Interfaces)

Una clase abstracta, también conocida como interfaz, es como un modelo o plantilla que define ciertas funciones o métodos que otras clases deben implementar. No puedes crear un objeto directamente a partir de una clase abstracta, sino que otras clases deben heredar de ella y proporcionar las implementaciones específicas de los métodos definidos. Es como un contrato que obliga a las clases que lo heredan a seguir ciertas 'reglas' o estructuras.

```python
from abc import ABC, abstractmethod

class Animal(ABC):
    @abstractmethod
    def hacer_sonido(self):
        pass

class Perro(Animal):
    def hacer_sonido(self):
        print("Guau")

mi_perro = Perro()
mi_perro.hacer_sonido
```

---
