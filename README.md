MetroASIR-Docker

Proyecto MetroASIR versionado con contenedores Docker para un despliegue fácil, rápido y portable.
¿Qué es MetroASIR?

MetroASIR es una plataforma digital para centralizar información del Metro de Madrid: mapas, horarios, tarifas y cálculo de trayectos, con atención especial a la accesibilidad.
¿Por qué usar Docker?

    Facilita la instalación y despliegue sin romperte la cabeza.

    Todo el stack (base de datos, backend, frontend) en contenedores separados pero trabajando juntos.

    Puedes levantar todo con un solo comando (docker-compose up).

Estructura del proyecto

    docker-compose.yml: Define los servicios (base de datos, backend, frontend).

    /backend: Código del servidor (API, lógica).

    /frontend: Código de la app web.

    /db: Configuración de la base de datos.

Requisitos

    Tener instalado Docker

    Tener instalado Docker Compose

    Git para clonar el repositorio

Cómo usarlo (modo ninja)

    Clona el repo:

git clone git@github.com:enriquemontalvomejias/MetroASIR-Docker.git
cd MetroASIR-Docker

Levanta todos los contenedores:

    docker-compose up -d

    Espera a que los servicios estén listos (puedes ver logs con docker-compose logs -f).

    Abre tu navegador en http://localhost:3000 (o el puerto que configures).

Cómo parar los contenedores

docker-compose down

Tips extras

    Si cambias código en backend o frontend, recuerda reconstruir con:

docker-compose build

Puedes entrar a un contenedor para debuggear:

    docker exec -it <nombre_contenedor> bash

¿Quieres aportar?

Haz un fork, crea una rama, y manda tu PR. ¡Todo feedback es bienvenido!
Contacto

Enrique Montalvo — GitHub — email@example.com
