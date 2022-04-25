# fondeadora_frase

Decidi hacer un proyecto con una UI super sensilla, pero cumplidora con los requisitos solicitados.
Como solicitaron, me base mas en armar una estructura con capas, bien estructurada, aplicando CLEAN con inyeccion de dependenciasb y separada por modulos.

En la carpeta features van a encontra mis unicos 2 "modulos" de esta app. Dentro de las mismas van a encontrar 2 carpetas mas: domain y presentation.

En la carpeta presentation se encuentra la capa de presentacion con sus respectivas carpetas: pages, widgets, y de proovedor de estados (en mi caso elegi provider ya que se me hacia mas sensillo y rapido de aplicar). 
A la altura de la carpeta features se encuentra la carpeta core con sus carpetas hijas, templates, utils, widgets y los archivos de app, con las rutas y los providers.
En esta carpeta decidi agregar todo lo que tiene en comun el app y que puede ser utilizado en distintos modulos.

En la carpeta domain se encuentra la capa de dominio con sus carpetas: entities, usercases, repositories y api(esta ultima es una carpeta que me gusta agregar a mi ya que dentro puedo agregar directa los llamados al api que tenga que usar y estas url quedan en esta capa, solamente utilizo esta clase y el metodo que quiero usar en la capa de presentacion para traer las respuestas).

Tambien, a la altura de features y core, se encuentra la carpeta data, la cual tiene la capa de datos que cuenta con la siguientes carpetas: datasource, models y repository.

Por ultimo, se encuentra la carpeta de test separada en unit test y widget test.
Se testeo lo mas posible, unicamente no vi relevante testear el contenido de las carpetas api ya que durante los test testeo esos metodos de diferente manera.

Las credenciales para ingresar al app son:

[
    {
        "email" : "asd@asd.com", 
        "password" : "Asd1234." 
    },
    {
        "email" : "fondeadora@fondeadora.com", 
        "password" : "Fond1234." 
    },
    {
        "email" : "maxi@maidana.com", 
        "password" : "Maxi1234." 
    }
]

Cualquier inquietud o consulta estoy a su disposicion.

Espero que cumpla con las espectativas.
Saludos.
