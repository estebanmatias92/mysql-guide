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