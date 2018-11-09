void abre_cancela(){
  Serial.println("C. Abre");
  digitalWrite(D3,1);
  display.clearDisplay();
  display.setTextSize(2);
  display.setCursor(20,20);
  display.print("C. Abre");
  display.display();
  server.send(204,"");
}

void fecha_cancela(){
  Serial.println("C. Fecha");
  digitalWrite(D3,0);
  display.clearDisplay();
  display.setTextSize(2);
  display.setCursor(20,20);
  display.print("C. Fecha");
  display.display();
  server.send(204,"");
}



