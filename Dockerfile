#Использую образ python в качестве базового образа:
FROM python:3.9
#Установка переменной среды для предотвращения буферизации вывода Python:
ENV PYTHONUNBUFFERED 1
#Определяем рабочую директорию, если ее не существует в образе, она будет создана Docker-ом автоматически:
WORKDIR /code
#Копируем все файлы и директории в директорию /code/
COPY . /code/
#Установка зависимостей python
RUN pip install -r requirements.txt
#Указание точки монтирования для того, чтобы файлы в ней были доступны в хостовой системе (при запуске нужно указать
#директорию хостовой системы для точки монтирования
VOLUME ["/code/db"]
#Указываем, какой порт будет слушать контейнер (просто декларативное заявление)
EXPOSE 8000
#Выполняем команду, которая будет запускать сервер с указанием адреса и порта
CMD sh init.sh && python:3.9 manage.py runserver 0.0.0.0:8000
