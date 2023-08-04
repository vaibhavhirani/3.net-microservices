FROM mcr.microsoft.com/dotnet/sdk:7.0 as build
WORKDIR /app
COPY ./app/ .
RUN dotnet build frontend 

FROM mcr.microsoft.com/dotnet/sdk:7.0 as run
COPY --from=build /app/frontend/bin/Debug/net7.0/ .
CMD [ "dotnet", "frontend.dll" ]