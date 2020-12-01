FROM mcr.microsoft.com/dotnet/sdk:3.1-alpine as base

COPY . .

RUN dotnet build

################## 
# Testing stage
FROM base as test

RUN dotnet test

################## 
# Production stage
FROM base as production

WORKDIR /DotnetTemplate.Web

# Setup the entry point
ENTRYPOINT ["dotnet", "run" ]