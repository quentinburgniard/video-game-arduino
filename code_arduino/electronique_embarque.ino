
 //x,y,z,autofire,fire
 
 const int port_x=A0;
 const int port_y=A1;
 const int port_z=A2;
 const int port_bouton=3;
 int smoothx=0;
 int smoothy=0;
 int smoothz=0;
 int nbmoy=3;
 int x;
 int y;
 int z;
 boolean bouton;
 int autofire=0;
 int fire=0;
 boolean event=false;
 
 
void setup() {
  // put your setup code here, to run once:
  //initialisation
  pinMode(port_bouton,OUTPUT);
 
  Serial.begin(9600);
  

}

void loop() {
  // put your main code here, to run repeatedly:
  if(bouton == HIGH){
    autofire=1;
  }
  else{
    autofire=0;
    event=false;
  }

  if(!event && autofire==1 && fire==0){
    fire=1;
    event=true;
  }
  else{
    fire=0;
  }
  
  
  x = analogRead(port_x);
  y = analogRead(port_y);
  z = analogRead(port_z);
  bouton = digitalRead(port_bouton);
  

  smoothx = smoothx+((x-smoothx)/nbmoy);
  smoothy = smoothy+((y-smoothy)/nbmoy);
  smoothz = smoothz+((z-smoothz)/nbmoy);
  
  
  Serial.print(smoothx);
  Serial.print(","); 
  Serial.print(smoothy);
  Serial.print(",");
  Serial.print(smoothz);
  Serial.print(",");
  Serial.print(autofire);
  Serial.print(",");
  Serial.println(fire);
  
  
  
  


  
  
  
  //serial.print("valeur1");//ecrire
  //serial.print(",");
  //serial.println("valeur2");//le ln a la fin pour reveni a la ligne 
  delay(15);

}
