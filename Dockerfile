################## 
# Base stage
FROM mcr.microsoft.com/dotnet/sdk:3.1-alpine as base

COPY . .

WORKDIR /DotnetTemplate.Web

RUN apk add --update npm 

RUN dotnet publish -c Release -o app

################## 
# Production stage
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-alpine as production

COPY --from=base /DotnetTemplate.Web/app /DotnetTemplate.Web

WORKDIR /DotnetTemplate.Web

# Setup the entry point
ENTRYPOINT ["dotnet", "DotnetTemplate.Web.dll" ]