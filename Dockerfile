# Этап 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Копируем файл проекта
COPY IsLabApp.csproj .
RUN dotnet restore

# Копируем остальной код
COPY . .

# Публикуем приложение
RUN dotnet publish -c Release -o /app/publish

# Этап 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

# Копируем опубликованное приложение
COPY --from=build /app/publish .

# Настройка порта
EXPOSE 8080
ENV ASPNETCORE_URLS=http://+:8080

# Запуск
ENTRYPOINT ["dotnet", "IsLabApp.dll"]
