FROM mcr.microsoft.com/azure-cli:latest

ARG ADO_ORG
ARG ADO_PROJECT
ARG ADO_AREA

RUN az extension add --name azure-devops
RUN az devops configure --defaults \
	organization=https://dev.azure.com/${ADO_ORG} \
	project=${ADO_PROJECT}

WORKDIR /workspace

ENTRYPOINT ["az"]
