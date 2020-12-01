################## 
# Base stage
FROM mcr.microsoft.com/dotnet/sdk:3.1-alpine as base

COPY . .

RUN dotnet build

WORKDIR /DotnetTemplate.Web

RUN apk add --update npm && \
	npm install && \
    npm run build

################## 
# Testing stage
FROM base as test

RUN dotnet test

################## 
# Production stage
FROM base as production

# Setup the entry point
ENTRYPOINT ["dotnet", "run" ]