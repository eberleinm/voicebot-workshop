#!/bin/bash

# Ustawienia początkowe
RESOURCE_GROUP="voicebot-workshop-rg"
LOCATION="westeurope"
BOT_NAME="voicebotworkshopbot$RANDOM"
SPEECH_NAME="voicebotSpeech$RANDOM"
ACS_NAME="voicebotACS$RANDOM"
APPINSIGHTS_NAME="voicebotInsights$RANDOM"
LUIS_NAME="voicebotLUIS$RANDOM"
OPENAI_NAME="voicebotOpenAI$RANDOM"

# Tworzenie grupy zasobów
echo "Tworzenie grupy zasobów: $RESOURCE_GROUP"
az group create --name $RESOURCE_GROUP --location $LOCATION

# Tworzenie Azure Bot Service (Web App Bot)
echo "Tworzenie Azure Bot Service: $BOT_NAME"
az bot create --resource-group $RESOURCE_GROUP --name $BOT_NAME --kind webapp --location $LOCATION --sku F0 --display-name "VoiceBotWorkshop" --language Csharp

# Tworzenie Azure Speech Services
echo "Tworzenie Azure Speech Services: $SPEECH_NAME"
az cognitiveservices account create --name $SPEECH_NAME --resource-group $RESOURCE_GROUP --kind SpeechServices --sku F0 --location $LOCATION --yes

# Tworzenie Azure Communication Services
echo "Tworzenie Azure Communication Services: $ACS_NAME"
az communication create --name $ACS_NAME --resource-group $RESOURCE_GROUP --location $LOCATION --data-location "Europe"

# Tworzenie Application Insights
echo "Tworzenie Application Insights: $APPINSIGHTS_NAME"
az monitor app-insights component create --app $APPINSIGHTS_NAME --location $LOCATION --resource-group $RESOURCE_GROUP --application-type web

# (Opcjonalnie) Tworzenie LUIS (jeśli dostępne)
echo "Tworzenie LUIS (opcjonalnie): $LUIS_NAME"
az cognitiveservices account create --name $LUIS_NAME --resource-group $RESOURCE_GROUP --kind LUIS --sku F0 --location $LOCATION --yes

# (Opcjonalnie) Tworzenie Azure OpenAI (jeśli dostępne w subskrypcji)
echo "Tworzenie Azure OpenAI (opcjonalnie): $OPENAI_NAME"
az cognitiveservices account create --name $OPENAI_NAME --resource-group $RESOURCE_GROUP --kind OpenAI --sku S0 --location $LOCATION --yes

# Wyświetlenie danych wyjściowych
echo "Zasoby zostały utworzone:"
echo "Resource Group: $RESOURCE_GROUP"
echo "Bot Name: $BOT_NAME"
echo "Speech Service: $SPEECH_NAME"
echo "Communication Service: $ACS_NAME"
echo "Application Insights: $APPINSIGHTS_NAME"
echo "LUIS (opcjonalnie): $LUIS_NAME"
echo "Azure OpenAI (opcjonalnie): $OPENAI_NAME"
