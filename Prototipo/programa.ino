#include <ESP8266WiFi.h>
#include <ESP8266WebServer.h>
#include <ArduinoJson.h>
//---DISPLAY---
#include <Adafruit_SSD1306.h>
#define OLED_RESET LED_BUILTIN
Adafruit_SSD1306 display(OLED_RESET);


ESP8266WebServer server;

uint8_t pin_led = LED_BUILTIN;

char* ssid = "ssd";
char* psswd = "senha";
void configura_display();
void configura_server();
void configura_wifi();
void abre_cancela();
void fecha_cancela();

void setup()
{
    pinMode(D3, 1);
    digitalWrite(D3,0);
    Serial.begin(115200);
    configura_display();
    configura_wifi();
    configura_server();

    
}

void loop(){
    server.handleClient();
}


