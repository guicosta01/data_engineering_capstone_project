FROM mysql:8.0

# Define a variável de ambiente para a senha do root
ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_DATABASE=mydb
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword


COPY /scripts /scripts
# Expondo a porta do MySQL
EXPOSE 3306
