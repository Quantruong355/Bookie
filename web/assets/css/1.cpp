#include<LiquidCrystal.h>
LiquidCrystal lcd(12,11,5,4,3,2);
float val;
int buzz=7;
int tmp = A1;
void setup(){
  lcd.begin(16,2);
	pinMode(tmp,INPUT);
}

void loop(){
	val = (double)analogRead(tmp)/1024;
  	val = val*5;
  	val = (val - 0.5);
    val = val*100;
  	
  
  if(val <= 30){
    lcd.setCursor(0,0);
  	lcd.print("Good!           ");
   	lcd.setCursor(0,1);
   	lcd.print("Temp: ");
   	lcd.print(val + 0.11);
   	lcd.print("*C   ");
    delay(100);
    digitalWrite(10, HIGH);
    noTone(buzz);
  }
  else{
    digitalWrite(10, LOW);
  }
  
  if(val > 30 && val <= 35){
    lcd.setCursor(0,0);
  	lcd.print("Warning Alarm!        ");
   	lcd.setCursor(0,1);
   	lcd.print("Temp: ");
   	lcd.print(val + 0.11);
   	lcd.print("*C   ");
    delay(100);
    tone(buzz, 2000);
	delay(100);
	noTone(buzz);
    delay(500);
    digitalWrite(9, HIGH);
  }
  else{
    digitalWrite(9, LOW);
  }
  
  
	 if(val > 35){
    lcd.setCursor(0,0);
  	lcd.print("Critical Alarm!        ");
   	lcd.setCursor(0,1);
   	lcd.print("Temp: ");
   	lcd.print(val + 0.11);
   	lcd.print("*C   ");
    delay(100);
    tone(buzz, 2000);
	delay(100);
	noTone(buzz);
    delay(10);
    digitalWrite(8, HIGH);
  }
  else{
    digitalWrite(8, LOW);
  }
}
