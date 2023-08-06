
# First stage 'build' to set workdir, setting port.
FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /source
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000
# copy csproj and restore as distinct layers
COPY /app/aspnetapp/*.csproj .
RUN dotnet restore --use-current-runtime  

# copy everything else and build app
COPY /app/aspnetapp/. .
RUN dotnet publish  --use-current-runtime --self-contained false --no-restore -o /final


# Final stage to push only the artifact or executables in the docker image. Keeps the size of the image lesser.
FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /final
EXPOSE 5000
ENV ASPNETCORE_URLS=http://+:5000
COPY --from=build /final .
ENTRYPOINT ["dotnet", "aspnetapp.dll"]
