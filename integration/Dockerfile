# Build Stage
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env

#Restore
WORKDIR \\integration

COPY integration.csproj .
RUN dotnet restore 

# Copy source code
COPY . .

ENTRYPOINT ["dotnet","test"]