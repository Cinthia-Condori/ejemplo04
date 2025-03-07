FROM ruby:3.2
#FROM ubuntu:latest

RUN apt-get update -qq && apt-get install -y \
build-essential \
nodejs \
yarn \
postgresql-client\
&& rm -rf /var/lib/apt/lists/*

RUN git config --global user.name "Julio"
RUN git config --global user.email "jucegp@gmail.com"

WORKDIR /usr/src/app

RUN gem install rails -v 7.1.0

EXPOSE 3000

# 1. Elaborar el Dockerfile en una carpeta vacía
# 2. Construir la imágen del contenedor
#    docker build -t rubybasico:v1 .
# 3. Montar el contenedor
#    docker run -it --rm -v .:/usr/src/app -p 3000:3000 --name appmvc rubybasico:v1 bash
# 4. Crear un proyecto
#    rails new .
# 5. Establecer permisos desde el anfitrion
#    sudo chown -R usuario:grupo *
# 6. Lanzar el servidor
#    rails server -b 0.0.0.0
# 7. Abrir otra terminal
#    docker exec -it appmvc bash
