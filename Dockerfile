# https://hub.docker.com/_/microsoft-dotnet-core
FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build
WORKDIR /source

# copy csproj and restore as distinct layers
COPY *.sln .
COPY aspnetapp/*.csproj ./aspnetapp/
RUN dotnet restore

# copy everything else and build app
COPY aspnetapp/. ./aspnetapp/
WORKDIR /source/aspnetapp
RUN dotnet publish -c release -o /app --no-restore

# final stage/image
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app
COPY --from=build /app ./
ENTRYPOINT ["dotnet", "DotNetCoreSqlDb.dll"]
ARG MyDbConnection
ENV ConnectionStrings__MyDbConnection=$MyDbConnection
#ENV ConnectionStrings__MyDbConnection="Server=tcp:aspdonte-docker-app.database.windows.net,1433;Initial Catalog=test;Persist Security Info=False;User ID=admindod;Password=Rekord32;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
