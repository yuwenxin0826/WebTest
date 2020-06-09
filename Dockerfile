FROM microsoft/dotnet:2.2-aspnetcore-runtime AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM microsoft/dotnet:2.2-sdk AS build
WORKDIR /src
COPY ["WebTest/WebTest.csproj", "WebTest/"]
RUN dotnet restore "WebTest/WebTest.csproj"
COPY . .
WORKDIR "/src/WebTest"
RUN dotnet build "WebTest.csproj" -c Release -o /app

FROM build AS publish
RUN dotnet publish "WebTest.csproj" -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "WebTest.dll"]