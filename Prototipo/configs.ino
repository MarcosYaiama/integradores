void configura_display(){
  display.begin(SSD1306_SWITCHCAPVCC, 0x3C);
  display.setTextColor(WHITE);
  display.clearDisplay();
  delay(500);
}

void configura_server(){
    server.on("/",[](){server.send(200,"text/plain", "<h1>Hello World</h1>");});

    server.on("/abre_cancela", abre_cancela);
    server.on("/fecha_cancela", fecha_cancela);
    server.begin();
}

void configura_wifi(){
    WiFi.begin(ssid,psswd);
    while(WiFi.status() != WL_CONNECTED){
        delay(500);
        Serial.print(".");
    }
    Serial.println("");
    Serial.print("IP Address:");
    Serial.print(WiFi.localIP());
    display.clearDisplay();
    display.setTextSize(2);
    display.setCursor(0,0);
    display.print(WiFi.localIP());
    display.display();

}

