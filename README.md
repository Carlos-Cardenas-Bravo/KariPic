
# DESARROLLO RUBY ON RAILS PARA EMPRENDIMIENTOS DE TIPO STARTUP

Desafío - Utilizar Amazon S3 en proyecto en Rails






## Autor

- [@Carlos-Cardenas-Bravo](https://github.com/Carlos-Cardenas-Bravo)


## Lógica utilizada

Se generó una app según lo indicado del tipo portafolio de fotos.

Se generaron roles dentro de los usuarios manejados con devise, de forma que el administrador (Fotografa) fuera el único que puediera subir sus fotos, borrar cualquier comentario realizado a las fotografías, además de poder borrarlas y editarlas.

Los usuarios normales (registrados) pueden comentar cualquier fotografía. También pueden borrar los comentarios que ellos puedan haber realizado.

Los visitantes (usuarios no registrados) pueden ver el listado de fotografías, entrar a ellas, ver los comentarios, pero no pueden comentar las fotografías.

Se agregó el campo de nombre y foto de perfil al registro. Además al realizar un comentario sale su foto de perfil. Si no tiene foto de perfil saldrá una genérica

Las claves de base de datos y Mailtrap (con el cual se probó la restitución de contraseña) se manejan con Figaro.

Se utilizó Active Storage y S3 para guardar las imagenes (las claves del bucket y usuario quedaron resaguardadas por Figaro). Y se utilizó la gema ImageProcessing para conservar la relación ancho, alto de las fotografías paro adecuarlas a un formato máximo de 800x600 pixeles y la fotos de perfiles a 200x200 pixeles.

Se documentaron los modelos con la gema annotate.

Para probar la app con el rol de Administrador se debe usar:

email: admin@admin.com

password: 123456

Se ocupó el framework de css Bulma para darle estilo a la aplicación.


## Versiones Utilizadas

Para tener una funcionalidad completa de la aplicación debes tener las siguientes versiones de los softwares utilizados.

`Ruby 3.3.3`

`Rails 7.2.1 `


## 🚀 About Me
I'm a human apprentice

