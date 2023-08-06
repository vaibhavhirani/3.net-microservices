# 3.net-microservices
Continuous Integration and Continuous Deployment (CI/CD) pipeline on Azure DevOps for a 3-tier application consisting of a front-end web app, an application server, and a database. The web app is built using .NET Core.


## App.
Simple ASPNet Webapplication returns system information of client.


## Dockerfile
### Brief
    - Dockerfile consists of 2-stages, which divides the building of the application and actual run of the application. Helps reducing the size.
    - First Stage uses mcr.microsoft.com/dotnet/sdk:7.0 for building layer
    - Second Stage uses mcr.microsoft.com/dotnet/aspnet:7.0 for running the dll.

### How to run
    - You can use the following commands to build and run
        1. `docker build -t aspnetapp:1.0.0 .`
        2. `docker run -it -p 5000:5000 aspnetapp:1.0.0`
 
## Docker-Compose
### Brief
    - Docker-Compose adds two more application to the existing `Dockerfile`
        - 1. Custom Nginx
        - 2. MYSQL
    - Nginx acts as revers proxy for our aspnetapp and mysql as database
### How to run
    - Please provide the mysql specification in the docker-compose.yml beforehand such as db, username, password and admin user info.
    - You can use the following commands to build and run
        - 1. `docker-compose up --build`

***Note : Please make sure your provision the infrstructure using the https://github.com/vaibhavhirani/3.net-microservices-iac before running this pipeline in Azure DevOps.***

***Note : Make Sure You have Docker Registry Service Connection with the ACR registry created in IaC pipeline***

## Azure-Pipeline.yml
### Brief
    - Used by Azure DevOps Pipelines for creating CI/CD pipeline.
    - It contains following steps
        - Docker image creation of custom nginx dockerfile
        - Docker compose up and push to acr for our compose file
        - Azure Web App deployment to staging slot
        - Azure Deployment slot swapping to production from staging.
