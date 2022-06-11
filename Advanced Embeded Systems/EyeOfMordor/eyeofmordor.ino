#include <WiFiNINA.h>
#include <ArduinoMqttClient.h>

//wifi definition
#define SECRET_SSID "TheMetalPort"
#define SECRET_PASS "FromOneTo8+-"
//broker definitions
#define BROKER "192.168.178.53"
#define PORT 1883
#define TOPIC_O "uss"
#define TOPIC_I "led"
//ultrasonic definitions
#define TRIG_PIN 9
#define ECHO_PIN 10


int Rvalue = 0;
long duration;
long distance;
char msg[50];


WiFiClient wifiClient;
MqttClient mqttClient(wifiClient);

void wifisetup()
{
    delay(100);
    Serial.print("\nConnecting to ");
    Serial.println(SECRET_SSID);

    WiFi.begin(SECRET_SSID, SECRET_PASS);

    while (WiFi.begin(SECRET_SSID, SECRET_PASS) != WL_CONNECTED) {
        // failed, retry
        Serial.print("-");
        delay(100);
    }
    Serial.println();
    Serial.print("\nConnected to ");
    Serial.println(SECRET_SSID);


    Serial.print("Attempting to connect to the MQTT broker: ");
    Serial.println(BROKER);

    while (!mqttClient.connect(BROKER, PORT)) {
        Serial.print("MQTT connection failed! Error code = ");
        Serial.println(mqttClient.connectError());
    }

    Serial.println("You're connected to the MQTT broker!");
    Serial.println();
    
    // set the message receive callback
    mqttClient.onMessage(onMqttMessage);

    Serial.print("Subscribing to topic: ");
    Serial.println(TOPIC_I);
    Serial.println();

    // subscribe to a topic
    mqttClient.subscribe(TOPIC_I);
}

void onMqttMessage(int messageSize) {
  // we received a message, print out the topic and contents
//   Serial.print("Received a message with topic '");
//   Serial.print(mqttClient.messageTopic());
//   Serial.print("', length ");
//   Serial.print(messageSize);
//   Serial.println(" bytes:");

  // use the Stream interface to print the contents
  while (mqttClient.available()) {
    Serial.print((char)mqttClient.read());
  }
  Serial.println();
}

void ultrasonic_pub()
{
    digitalWrite(TRIG_PIN, LOW);
    delayMicroseconds(2);

    digitalWrite(TRIG_PIN, HIGH);
    delayMicroseconds(10);
    digitalWrite(TRIG_PIN, LOW);

    duration = pulseIn(ECHO_PIN, HIGH);
    distance = duration* 0.017;

    mqttClient.beginMessage(TOPIC_O);
    mqttClient.print(distance);
    mqttClient.endMessage();
}

void reconect()
{
    while (!mqttClient.connected())
    {   
        Serial.println("Connection lost... Reconecting... ");
        mqttClient.connect(BROKER, PORT);
        delay(100);
    }
    
}

void setup()
{
    Serial.begin(9600);
    wifisetup();
    pinMode(TRIG_PIN, OUTPUT);
    pinMode(ECHO_PIN, INPUT);    
}

void loop()
{
    mqttClient.poll();
    ultrasonic_pub();
    if(!mqttClient.connected())
    {
        reconect();
    }
}
