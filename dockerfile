FROM node:16

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем все файлы
COPY . .

# Устанавливаем зависимости
RUN npm install

# Собираем приложение
RUN npm install --production
RUN npm i @vue/cli-service
RUN npm run build

# Открываем порт 5000
EXPOSE 4174

# Команда для запуска приложения
RUN npm run preview