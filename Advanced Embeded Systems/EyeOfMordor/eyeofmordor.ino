#include <WiFiNINA.h>
#include <ArduinoMqttClient.h>
#include <time.h>

//wifi definition
#define SECRET_SSID "POCOX3"
#define SECRET_PASS "fromOneTo8"
//broker definitions
#define BROKER "192.168.251.132"
#define PORT 1883
#define TOPIC_O "uss"
#define TOPIC_I "led"
#define TOPIC_S "stop"
//ultrasonic definitions
#define TRIG_PIN 9
#define ECHO_PIN 10
//Leds
#define WHITE_LED 2
#define BLUE_LED 3
#define GREEN_LED 4
#define YELLOW_LED 5
#define RED_LED 6
//buzzer
#define BUZZER 13

enum prox
{
    st00 = 0,
    st01 = 1, 
    st02 = 2
};

int Rvalue = 0;
long duration;
long distance;
char msg[50];
prox prox_st = st00;

long time_pre = 0;
bool white_st = false;

WiFiClient wifiClient;
MqttClient mqttClient(wifiClient);

void wifisetup()
{
    delay(100);
    Serial.print("\nConnecting to ");
    Serial.print(SECRET_SSID);

    WiFi.begin(SECRET_SSID, SECRET_PASS);

    while (WiFi.begin(SECRET_SSID, SECRET_PASS) != WL_CONNECTED) {
        // failed, retry
        Serial.print("-");
        delay(100);
    }
    Serial.println();
    Serial.print("Connected to ");
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
    mqttClient.subscribe(TOPIC_S);
}

void onMqttMessage(int messageSize) {
  // we received a message, print out the topic and contents
//   Serial.print("Received a message with topic '");
//   Serial.print(mqttClient.messageTopic());
//   Serial.print("', length ");
//   Serial.print(messageSize);
//   Serial.println(" bytes:");

  // use the Stream interface to print the contents
    if(mqttClient.messageTopic() == TOPIC_I)
    {
        int in_msg;
        while (mqttClient.available()) {
        //Serial.print((char)mqttClient.read());
            in_msg = (int)mqttClient.read() - 48;
        }
        if(in_msg != prox_st)
        {
            switch (in_msg)
            {
            case 0:
                digitalWrite(GREEN_LED, HIGH);
                digitalWrite(YELLOW_LED, LOW);
                digitalWrite(RED_LED, LOW);
                digitalWrite(BUZZER, LOW);
                prox_st = st00;
                break;
            case 1:
                digitalWrite(GREEN_LED, LOW);
                digitalWrite(YELLOW_LED, HIGH);
                digitalWrite(RED_LED, LOW);
                digitalWrite(BUZZER, LOW);
                prox_st = st01;
                break;
            case 2:
                digitalWrite(GREEN_LED, LOW);
                digitalWrite(YELLOW_LED, LOW);
                digitalWrite(RED_LED, HIGH);
                digitalWrite(BUZZER, HIGH);
                prox_st = st02;
                break;
        
            default:
                break;
            }
        }
    }
    if(mqttClient.messageTopic() == TOPIC_S)
    {
        digitalWrite(BUZZER, LOW);
    }  
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
    digitalWrite(WHITE_LED, HIGH);
    if(!wifiClient.connected())
    {
        digitalWrite(BLUE_LED, HIGH);
        WiFi.begin(SECRET_SSID, SECRET_PASS);

        while (WiFi.begin(SECRET_SSID, SECRET_PASS) != WL_CONNECTED) {
            Serial.print("-");
            delay(100);
        }
        Serial.println();
        Serial.print("Reconnected ");
        digitalWrite(BLUE_LED, LOW);
    }
        
    while (!mqttClient.connected())
    {   
        Serial.println("Connection lost... Reconecting... ");
        mqttClient.connect(BROKER, PORT);
        delay(100);
    }
    digitalWrite(WHITE_LED, LOW);
    digitalWrite(BLUE_LED, LOW);
}

void setup()
{
    Serial.begin(9600);
    pinMode(TRIG_PIN, OUTPUT);
    pinMode(ECHO_PIN, INPUT); 
    pinMode(WHITE_LED, OUTPUT); 
    pinMode(BLUE_LED, OUTPUT);   
    pinMode(GREEN_LED, OUTPUT);   
    pinMode(YELLOW_LED, OUTPUT);  
    pinMode(RED_LED, OUTPUT);
    digitalWrite(WHITE_LED, HIGH);
    digitalWrite(BLUE_LED, HIGH);
    wifisetup();
    digitalWrite(WHITE_LED, LOW);
    digitalWrite(BLUE_LED, LOW);
    digitalWrite(GREEN_LED, HIGH);
    pinMode (BUZZER, OUTPUT);
}

void loop()
{
    mqttClient.poll();
    ultrasonic_pub();
    if(!mqttClient.connected())
    {
        reconect();
    }
    
    long now = millis();
    if(now - time_pre > 500)
    {
        time_pre = now;
        if(white_st)
            digitalWrite(WHITE_LED, LOW);
        else
            digitalWrite(WHITE_LED, HIGH);
        white_st = !white_st;
    }
}
