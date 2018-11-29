const int LM35 = A0;
const int ATRASO = 500;
const float BASE_CELSIUS = 0.4887585532746823069403714565;
const int ledVermelho = 2;
const int ledAmarelo = 3;
const int rele = 4;
float seno;
int frequencia;
float temp;
void setup() {
 Serial.begin(9600);
 pinMode(ledVermelho,OUTPUT);
 pinMode(ledAmarelo,OUTPUT);
 pinMode(5,OUTPUT);
 pinMode(rele,OUTPUT);
}
void loop() {
 Serial.println(lerTemperatura(), 1);
 
 temp = lerTemperatura();
 delay(ATRASO);
 if (temp>30){
  digitalWrite(ledVermelho,HIGH);
  digitalWrite(ledAmarelo,LOW);
  digitalWrite(rele,LOW);
  sirene();  
  temp = lerTemperatura();
  
  }
  else {
  digitalWrite(ledAmarelo,HIGH);
  digitalWrite(ledVermelho,LOW);
  digitalWrite(rele,HIGH);
  noTone(5);
  temp = lerTemperatura();    
  }
       
                      
}
float lerTemperatura() {
 return (analogRead(LM35) * BASE_CELSIUS);
}
void sirene(){
for(int x=0;x<180;x++){
  //converte graus para radiando e depois obtém o valor do seno
  seno=(sin(x*3.1416/180));
  //gera uma frequência a partir do valor do seno
  frequencia = 2000+(int(seno*1000));
  tone(5,frequencia);
  delay(2);
}}

