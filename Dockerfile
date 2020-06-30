#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.
#
#FROM mcr.microsoft.com/dotnet/core/aspnet:2.2-stretch-slim AS base
#WORKDIR /app
#EXPOSE 80
#
#FROM mcr.microsoft.com/dotnet/core/sdk:2.2-stretch AS build
#WORKDIR /src
#COPY ["WebTest/WebTest.csproj", "WebTest/"]
#RUN dotnet restore "WebTest/WebTest.csproj"
#COPY . .
#WORKDIR "/src/WebTest"
#RUN dotnet build "WebTest.csproj" -c Release -o /app/build
#
#FROM build AS publish
#RUN dotnet publish "WebTest.csproj" -c Release -o /app/publish
#
#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "WebTest.dll"]

#

FROM microsoft/aspnetcore:2.2
ARG source
WORKDIR /app
EXPOSE 80
COPY ${source:-obj/Docker/publish} .
ENTRYPOINT ["dotnet", "WebTest.dll"]