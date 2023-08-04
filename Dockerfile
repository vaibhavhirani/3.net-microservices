# 'build' builds the /app/frontend/ application and create dll
FROM mcr.microsoft.com/dotnet/sdk:7.0 as build
WORKDIR /app
COPY ./app/ .
RUN dotnet build frontend 

# 'run' copies the dll from above stage and pushes only executable in docker image
FROM mcr.microsoft.com/dotnet/sdk:7.0 as run
COPY --from=build /app/frontend/bin/Debug/net7.0/ .
CMD [ "dotnet", "frontend.dll" ]