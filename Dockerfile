FROM mcr.microsoft.com/dotnet/sdk:9.0 AS dev
WORKDIR /app

ENV ASPNETCORE_URLS=http://+:80
ENV ASPNETCORE_ENVIRONMENT=Development
ENV DOTNET_USE_POLLING_FILE_WATCHER=1

EXPOSE 80

COPY ["Kono.sln", "./"]
COPY ["KonoApi/KonoApi.csproj", "KonoApi/"]
COPY ["Kono.Identity/Kono.Identity.csproj", "Kono.Identity/"]

RUN dotnet restore "Kono.sln"

COPY . .
WORKDIR "/app/KonoApi"

ENTRYPOINT ["dotnet", "watch", "run", "--urls", "http://0.0.0.0:80"]