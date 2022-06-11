#include <WiFiNINA.h>
#include <ArduinoMqttClient.h>

//wifi definition
#define SECRET_SSID "TheMetalPort"
#define SECRET_PASS "FromOneTo8+-"
//broker definitions
#define broker "192.168.178.62"
#define port 1883
#define topic "eom/uss"


int Rvalue = 0;

WiFiClient wifiClient;
MqttClient mqttClient(wifiClient);

void wifisetup()
{
    delay(100);
    Serial.print("\nConnecting to ");
    Serial.println(SECRET_SSID);

    WiFi.begin(SECRET_SSID, SECRET_PASS);

    while (WiFi.status() != WL_CONNECTED)
    {
        delay(100);
        Serial.print("-");
        
    }
    Serial.println();

    Serial.print("\nConnected to ");
    Serial.println(SECRET_SSID);


    Serial.print("Attempting to connect to the MQTT broker: ");
    Serial.println(broker);

    if (!mqttClient.connect(broker, port)) {
        Serial.print("MQTT connection failed! Error code = ");
        Serial.println(mqttClient.connectError());

        while (1);
    }

    Serial.println("You're connected to the MQTT broker!");
    Serial.println();
    
}

void setup()
{
    Serial.begin(9600);
    Serial.print("starting wifi");
    wifisetup();
}

void loop()
{
    Serial.print("Sending message to topic: ");
    Serial.println(topic);
    Serial.println(Rvalue);

    mqttClient.beginMessage(topic);
    mqttClient.print(Rvalue);
    mqttClient.endMessage();

    Rvalue++;

    delay(3000);
}