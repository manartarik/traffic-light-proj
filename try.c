                                          //TRAFIC LIGHT
 signed counter=0;
unsigned left=0,right=0,i,j,count=0;
 void interrupt(){

 if(intf_bit==1){
                intf_bit==0;
                if(count>1)
                count=0;
                      count++;
                       if(count==1) {
 portd=0b00100001;
           for(j=3;j>0;j--){
                    portb.b6=0;
            portb.b7=1;
            portc=j;
            delay_ms(1000);
 }
  portb.b6=1;
            portb.b7=1;
             portd=0b00001010;
             delay_ms(1500);

 }
         if(count==2) {
                              portd=0b0001100;
                              for(j=3;j>0;j--){


             portb.b6=0;
            portb.b7=1;
              portc=j;
              delay_ms(1000);
 }

  portb.b6=1;
  portb.b7=1;
  portd=0b00010001;
  delay_ms(1500);
                      }
 }
}//__________________________________________________________________________________________________________
void main() {

          trisc=0;  //7seg
          portc=0;
          trisd=0; //led
          portd=0;
          trisb.b6=0; //trans1
          portb.B6=1;
          trisb.b7=0;   //trans2
          portb.B7=1;
          trisb.b0=1;           //switch2 change manual
          trisb.b1=1;  //switch1 auto to manual
          gie_bit=1;
          inte_bit=1;
          intedg_bit=0;

for( ; ; ) {
     while(portb.b1==1&&portb.b1==1) {
for(counter=23;counter>0;counter--){
if(portb.b1 == 0&&portb.B0==1 ) {
portb.b6 = portb.b7 = 1 ;
  portd==0b00010001;
}         else{
          if(counter>3)
          portd=0b00010001;
          else
          portd=0b00100001;
                left=counter/10;
                right=counter%10;
                for(i= 0;i<60;i++){
                if(portb.b1 == 0&&portb.B0==1 ) {
  portb.b6 = portb.b7 = 1 ;
  portd==0b00010001;
}         else{
                portb.b6=0;
                portb.b7=1;
                portc=right;
                delay_ms(10);
                portb.b6=1;
                portb.b7=0;
                portc=left;
                delay_ms(10);
                } //for(30
                } 
                }
                }     //for(23
                //_____________________________________
          for(counter=15;counter>0;counter--){
          if(portb.b1 == 0&&portb.B0==1 ) {
  portb.b6 = portb.b7 = 1 ;
  portd==0b00010001;
}         else{
          if(counter>3)
          portd=0b00001010;
          else
          portd=0b00001100;
          left=counter/10;
          right=counter%10;
          for(i=0 ;i<60;i++){
                  if(portb.b1 == 0&&portb.B0==1 ) {
  portb.b6 = portb.b7 = 1 ;
  portd==0b00010001;
}         else{
          portb.b6=0;
          portb.b7=1;
          portc=right;
          delay_ms(10);
          portb.b6=1;
          portb.b7=0;
          portc=left;
          delay_ms(10);
          } 
          }
          }//else
}     //  for(15)
 }  //  while(portb.b1==1)
}   //for(;;)

 }   //main