# Project 1: "Self Service Password Reset"

## Enunciado

Somos una organización que requiere una solución de software de reseteo de contraseñas. Para eso contratan a los miembros del curso "Equipos Ágiles con Azure DevOps" del MUG.

En este documento se encuentra el contexto, los requerimientos funcionales, los requerimientos no funcionales, los datos tecnológicos, y datos del equipo + tiempos que se autorizaron para el desarrollo.

Se acordó que la solución tendrá un marco de gestión preferentemente ágil, utilizando:

* Un descubrimiento inicial de 1 sprint. A esto lo llamamos "Sprint inicial".
* Un total de 8 sprints posteriores de entregables iterativos e incrementales.
* Dos Epics: uno para los requerimientos básicos y otro para los requerimientos avanzados.
* Features & User Stories con Story Points similares.
* Reuniones diarias.
* La reunión de inicio y cierre de sprint se realizará en una sola jornada.
* No se esperan incrementos en la inversión.
* Se acordó un 20% de "movilidad" de funcionalidades (es decir, funcionalidades que pueden quedar afuera / agregarse).
* Cada sprint durará, sin excepciones, 14 días.
* La alocación de los perfiles full time será estable.

## Contexto

* La organización 10 oficinas, de las cuales en 1 están los servidores y el resto se conecta a través de redes privadas hacia la misma.
* La organización tiene 5000 usuarios que trabajan localmente (en cada oficina) y remotamente, en una proporción del 50% y el 50% aproximadamente.
* Se calcula que un 10% de los usuarios tiene problemas con su contraseña en forma mensual.
* Existe una mesa de ayuda que trabaja en la oficina donde están los servidores, que atiende presencialmente y en forma no presencial (llamados, Teams, chat) a los usuarios que tienen problemas. El equipo de mesa de ayuda está conformado por 2 personas que realizan sus tareas de 9 a 18 horas.
* Se requiere que la mesa de ayuda deje de atender solicitudes de reseteo de contraseña, por temas de seguridad y rapidez en las respuestas. Seguridad debido a que la contraseña inicial es conocida por la mesa de ayuda, y rapidez porque los usuarios tienen un tiempo promedio de atención de 45 minutos para resolver su situación.

## Requerimientos Funcionales Básicos

* El usuario que conoce su contraseña debe poder cambiarla, iniciando sesión antes con sus credenciales de servicio de directorio y, en el momento de cambiarla, con un segundo factor de autenticación.
* El usuario que no conoce su contraseña debe poder resetearla, utilizando al menos 2 factores de validación de identidad.
* El cambio de contraseña o recuperación de contraseña deben impactar inmediatamente en el servicio de directorio. Si esto no ocurre, el usuario debe ser notificado.
* Los factores de autenticación / validación de identidad pueden ser: correo electrónico alternativo y mensaje SMS. En ambos casos, será un número de 6 cifras.
* En caso que un usuario no tenga datos cargados de recuperación (correo electrónico alternativo, número de teléfono) deberá poder hacerlo con un inicio de sesión válido (es decir, usando su contraseña). Si no la conoce o se la olvidó, deberá contactarse con mesa de ayuda para que ellos se la reseteen.
* La validez del número enviado por los factores de autenticación / validación de identidad tendrá un máximo de 15 minutos. Si una acción de cambio de contraseña o reseteo sucede luego de este tiempo, no podrá ser efectivizado.
* La solución deberá soportar usuarios de Windows Server Active Directory.
* El inicio de sesión al sistema deberá validarse con el servicio de directorio. No se espera que se alojen claves en la solución de software.
* En caso de inicios de sesión errados, deberá poder parametrizarse la cantidad máxima. Se espera que esta cantidad sea menor a la máxima soportada por el servicio de directorio.
* Las acciones de cambio de contraseña y resteo de contraseña se podrán realizar con un máximo de 2 veces por día.

## Requerimientos Funcionales Avanzados

* Si un usuario desea cambiar o resetear su contraseña, deberá validarse que lo haga desde un mismo navegador. No podrá iniciar el proceso en un navegador y seguir en otro distinto a la sesión iniciada (hablamos de la sesión del navegador, hilo de proceso). En caso que se detecte que se intenta continuar un proceso en otro navegador, el sistema deberá denegar la acción, no permitir continuar trabajando en ese límite de seguridad (factor, clave esperada, etc) y logueará la acción no finalizada exitosamente.
* El sistema deberá soportar parametrización de los minutos de validez del código enviado por los factores de autenticación / validación de identidad.
* El sistema deberá soportar parametrización de datos de los servicios de directorio: dirección, usuario de servicio, clave de servicio, datos de seguridad, etc.
* La solución deberá soportar usuarios de Open LDAP con Linux en forma simultánea a Windows Server Active Directory.
* La solución deberá soportar parametrización de la cantidad de veces que un usuario puede realizar acciones de cambio de contraseña y reseteo de contraseña.

## Datos Tecnológicos

* La organización cuenta con un 80% de los usuarios en Windows Server Active Directory, y un 20% en Open LDAP de Linux. Los usuarios se autentican con un username en formato correo electrónico (que coincide con su correo electrónico) y se ha validado que NO se repiten nombres de usuario en los distintos servicios de directorio. El servicio de directorio de Windows Server tiene el formato "user@organizacion1.com", y el servicio de directorio de Open LDAP tiene el formato "user@organizacion2.com".
* La solución puede ser instalada en una nube pública. La organización ya tiene Azure, por lo cual es la única considerada.
* Azure no tiene conectividad, en la actualidad, con la infraestructura de servidores de la oficina on-premises. En caso que se requiera, se puede configurar una VPN site-to-site.

## Requerimientos No Funcionales

* La solución debe poder ser accedida vía Web desde cualquier lugar y cualquier dispositivo superior a 5".
* La solución debe ser Web.
* La solución debe ser alojada en PaaS, tanto para el cómputo como para la base de datos.
* La solución debe tener un SLA del 99.9% o superior.
* La solución debe evitar contar con datos locales de los usuarios, limitándose a los funcionalmente necesarios en base al análisis realizado por el equipo de desarrollo.
* Las siguientes actividades del usuario deben ser logueadas: inicio de sesión al sistema, cierre de sesión en el sistema (ya sea por acción del usuario o por vencimiento de la sesión), intentos completados de reseteo de contraseña, intentos completados de cambio de contraseña, intentos no completados de reseteo de contraseña e intentos no completados de cambios de contraseña.

La solución de reseteo de contraseñas debe trabajar con identidades que están alojadas en Active Directory de Windows Server (LDAP) y Open LDAP de Linux, si bien la prioridad es primero dar soporte a Active Directory y luego, cuando se logre ese entregable, recién se debería comenzar a dar soporte para LDAP de Linux.

## Equipo de Trabajo

* 1 persona que cumplirá el rol de Analista Funcional + Analista de QA para Testing. Su alocación es del 100% del tiempo durante el desarrollo del proyecto.
* 2 desarrolladores de software full stack en .NET. Su alocación es del 100% del tiempo durante el desarrollo del proyecto.
* 1 persona especialista en operaciones de software (DevOps) con alocación a demanda.
* 1 persona que facilitará la gestión de reportes e informes con alocación mínima a demanda.
* 1 Product Owner por parte del cliente. En este caso será Pablo Di Loreto.