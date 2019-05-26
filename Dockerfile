# Build Stage
FROM mcr.microsoft.com/dotnet/core/sdk:2.2 AS build-env

#Restore
WORKDIR \\generator

COPY api\\api.csproj .\\api\\api.csproj
RUN dotnet restore api\api.csproj

COPY tests\\tests.csproj .\\tests\\tests.csproj
RUN dotnet restore tests\tests.csproj

# Copy source code
COPY . .

#test
RUN dotnet test tests\tests.csproj

#publish
RUN dotnet publish api\api.csproj -o \publish

#runtime
FROM mcr.microsoft.com/dotnet/core/runtime:2.2
WORKDIR \\publish
COPY --from=build-env \publish .
ENTRYPOINT ["dotnet","api.dll"]


