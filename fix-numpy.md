# Instrucciones para instalar correctamente Python en el sistema

## Contexto

Para todo aquel que ha instalado Numpy (y/o Pandas), lo ha importado y ha intentado ejecutar su programa sin ningun exito, comparto esta solucion.

## Hipotesis

El problema parece ser exclusivo de Windows y como agrega (o mejor dicho, no agrega) los directorios clave de Python recien instalado, a las variables del sistema para que sean reconocidos globalmente.

## Pasos a seguir para solucionar el problema

### Primero: Desinstalar la version que esta causando problema

Todos los Windows tiene una ventana o seccion llamada "agregar o quitar programas" ("add or remove programs" si lo tienen en ingles), es ahi donde pueden desinstalar Python y Python IDLE.

### Segundo: Instalar de nuevo

Usen el instalar que corresponda segun su version de Windows y la arquitectura de su maquina.
Instaladores:

#### Windows 7 (Python 3.8.10)

- [(32-Bits)](https://www.python.org/ftp/python/3.8.10/python-3.8.10.exe)
- [(64-Bits)](https://www.python.org/ftp/python/3.8.10/python-3.8.10-amd64.exe)

#### Windows 10 (Python 3.10.11)

- [(32-Bits))](https://www.python.org/ftp/python/3.10.11/python-3.10.11.exe)
- [(64-Bits)](https://www.python.org/ftp/python/3.10.11/python-3.10.11-amd64.exe)

### Tercero: Añadir los directorios de Python al sistema

Ahora que el sistema operativo tiene instalado Python, **hace falta hacerle saber, en que directorios se encuentra el programa/ejecutable de Python (python.exe) y sus carpetas asociadas**. Para eso vamos añadir la direccion donde esta instalado y la direccion de sus "Scripts" a las "**variables de entorno del sistema**"

- [Como Añadir el directorio "Scripts" de Python a las variables de entorno en Windows (ChatGPT)](https://chat.openai.com/share/8631e698-9b7e-4a65-9857-be7fd950b1fd)
- [Como Añadir el ejecutables Python.exe y el directorio "Scripts" a las variables de entorno en Windows (Youtube)](https://www.youtube.com/watch?v=0bDRUOpec4c)

## Finalmente

Una vez terminado todo este proceso y reiniciado la maquina, deberiamos poder hacer los pasos de la [guia rapida de Numpy](https://github.com/estebanmatias92/curso-python-avanzado-plan-de-estudio-CFL415/blob/main/modulo-3/recursos/numpy.md) para **instalar** e **importar** Numpy y deberiamos poder ejecutar nuestros programas sin problemas.
