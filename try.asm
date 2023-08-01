
_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;try.c,4 :: 		void interrupt(){
;try.c,6 :: 		if(intf_bit==1){
	BTFSS      INTF_bit+0, BitPos(INTF_bit+0)
	GOTO       L_interrupt0
;try.c,8 :: 		if(count>1)
	MOVF       _count+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt63
	MOVF       _count+0, 0
	SUBLW      1
L__interrupt63:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt1
;try.c,9 :: 		count=0;
	CLRF       _count+0
	CLRF       _count+1
L_interrupt1:
;try.c,10 :: 		count++;
	INCF       _count+0, 1
	BTFSC      STATUS+0, 2
	INCF       _count+1, 1
;try.c,11 :: 		if(count==1) {
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt64
	MOVLW      1
	XORWF      _count+0, 0
L__interrupt64:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt2
;try.c,12 :: 		portd=0b00100001;
	MOVLW      33
	MOVWF      PORTD+0
;try.c,13 :: 		for(j=3;j>0;j--){
	MOVLW      3
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
L_interrupt3:
	MOVF       _j+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt65
	MOVF       _j+0, 0
	SUBLW      0
L__interrupt65:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt4
;try.c,14 :: 		portb.b6=0;
	BCF        PORTB+0, 6
;try.c,15 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;try.c,16 :: 		portc=j;
	MOVF       _j+0, 0
	MOVWF      PORTC+0
;try.c,17 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt6:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt6
	DECFSZ     R12+0, 1
	GOTO       L_interrupt6
	DECFSZ     R11+0, 1
	GOTO       L_interrupt6
	NOP
	NOP
;try.c,13 :: 		for(j=3;j>0;j--){
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;try.c,18 :: 		}
	GOTO       L_interrupt3
L_interrupt4:
;try.c,19 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;try.c,20 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;try.c,21 :: 		portd=0b00001010;
	MOVLW      10
	MOVWF      PORTD+0
;try.c,22 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_interrupt7:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt7
	DECFSZ     R12+0, 1
	GOTO       L_interrupt7
	DECFSZ     R11+0, 1
	GOTO       L_interrupt7
	NOP
	NOP
;try.c,24 :: 		}
L_interrupt2:
;try.c,25 :: 		if(count==2) {
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt66
	MOVLW      2
	XORWF      _count+0, 0
L__interrupt66:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt8
;try.c,26 :: 		portd=0b0001100;
	MOVLW      12
	MOVWF      PORTD+0
;try.c,27 :: 		for(j=3;j>0;j--){
	MOVLW      3
	MOVWF      _j+0
	MOVLW      0
	MOVWF      _j+1
L_interrupt9:
	MOVF       _j+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt67
	MOVF       _j+0, 0
	SUBLW      0
L__interrupt67:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt10
;try.c,30 :: 		portb.b6=0;
	BCF        PORTB+0, 6
;try.c,31 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;try.c,32 :: 		portc=j;
	MOVF       _j+0, 0
	MOVWF      PORTC+0
;try.c,33 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_interrupt12:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt12
	DECFSZ     R12+0, 1
	GOTO       L_interrupt12
	DECFSZ     R11+0, 1
	GOTO       L_interrupt12
	NOP
	NOP
;try.c,27 :: 		for(j=3;j>0;j--){
	MOVLW      1
	SUBWF      _j+0, 1
	BTFSS      STATUS+0, 0
	DECF       _j+1, 1
;try.c,34 :: 		}
	GOTO       L_interrupt9
L_interrupt10:
;try.c,36 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;try.c,37 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;try.c,38 :: 		portd=0b00010001;
	MOVLW      17
	MOVWF      PORTD+0
;try.c,39 :: 		delay_ms(1500);
	MOVLW      16
	MOVWF      R11+0
	MOVLW      57
	MOVWF      R12+0
	MOVLW      13
	MOVWF      R13+0
L_interrupt13:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt13
	DECFSZ     R12+0, 1
	GOTO       L_interrupt13
	DECFSZ     R11+0, 1
	GOTO       L_interrupt13
	NOP
	NOP
;try.c,40 :: 		}
L_interrupt8:
;try.c,41 :: 		}
L_interrupt0:
;try.c,42 :: 		}//__________________________________________________________________________________________________________
L_end_interrupt:
L__interrupt62:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;try.c,43 :: 		void main() {
;try.c,45 :: 		trisc=0;  //7seg
	CLRF       TRISC+0
;try.c,46 :: 		portc=0;
	CLRF       PORTC+0
;try.c,47 :: 		trisd=0; //led
	CLRF       TRISD+0
;try.c,48 :: 		portd=0;
	CLRF       PORTD+0
;try.c,49 :: 		trisb.b6=0; //trans1
	BCF        TRISB+0, 6
;try.c,50 :: 		portb.B6=1;
	BSF        PORTB+0, 6
;try.c,51 :: 		trisb.b7=0;   //trans2
	BCF        TRISB+0, 7
;try.c,52 :: 		portb.B7=1;
	BSF        PORTB+0, 7
;try.c,53 :: 		trisb.b0=1;           //switch2 change manual
	BSF        TRISB+0, 0
;try.c,54 :: 		trisb.b1=1;  //switch1 auto to manual
	BSF        TRISB+0, 1
;try.c,55 :: 		gie_bit=1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;try.c,56 :: 		inte_bit=1;
	BSF        INTE_bit+0, BitPos(INTE_bit+0)
;try.c,57 :: 		intedg_bit=0;
	BCF        INTEDG_bit+0, BitPos(INTEDG_bit+0)
;try.c,59 :: 		for( ; ; ) {
L_main14:
;try.c,60 :: 		if(portb.b1==1&&portb.b1==1) {
	BTFSS      PORTB+0, 1
	GOTO       L_main19
	BTFSS      PORTB+0, 1
	GOTO       L_main19
L__main60:
;try.c,61 :: 		for(counter=23;counter>0;counter--){
	MOVLW      23
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main20:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVF       _counter+0, 0
	SUBLW      0
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L_main21
;try.c,62 :: 		if(portb.b1 == 0&&portb.B0==1 ) {
	BTFSC      PORTB+0, 1
	GOTO       L_main25
	BTFSS      PORTB+0, 0
	GOTO       L_main25
L__main59:
;try.c,63 :: 		portb.b6 = portb.b7 = 1 ;
	BSF        PORTB+0, 7
	BTFSC      PORTB+0, 7
	GOTO       L__main70
	BCF        PORTB+0, 6
	GOTO       L__main71
L__main70:
	BSF        PORTB+0, 6
L__main71:
;try.c,65 :: 		}         else{
	GOTO       L_main26
L_main25:
;try.c,66 :: 		if(counter>3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main72
	MOVF       _counter+0, 0
	SUBLW      3
L__main72:
	BTFSC      STATUS+0, 0
	GOTO       L_main27
;try.c,67 :: 		portd=0b00010001;
	MOVLW      17
	MOVWF      PORTD+0
	GOTO       L_main28
L_main27:
;try.c,69 :: 		portd=0b00100001;
	MOVLW      33
	MOVWF      PORTD+0
L_main28:
;try.c,70 :: 		left=counter/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _left+0
	MOVF       R0+1, 0
	MOVWF      _left+1
;try.c,71 :: 		right=counter%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _right+0
	MOVF       R0+1, 0
	MOVWF      _right+1
;try.c,72 :: 		for(i= 0;i<60;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main29:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main73
	MOVLW      60
	SUBWF      _i+0, 0
L__main73:
	BTFSC      STATUS+0, 0
	GOTO       L_main30
;try.c,73 :: 		if(portb.b1 == 0&&portb.B0==1 ) {
	BTFSC      PORTB+0, 1
	GOTO       L_main34
	BTFSS      PORTB+0, 0
	GOTO       L_main34
L__main58:
;try.c,74 :: 		portb.b6 = portb.b7 = 1 ;
	BSF        PORTB+0, 7
	BTFSC      PORTB+0, 7
	GOTO       L__main74
	BCF        PORTB+0, 6
	GOTO       L__main75
L__main74:
	BSF        PORTB+0, 6
L__main75:
;try.c,76 :: 		}         else{
	GOTO       L_main35
L_main34:
;try.c,77 :: 		portb.b6=0;
	BCF        PORTB+0, 6
;try.c,78 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;try.c,79 :: 		portc=right;
	MOVF       _right+0, 0
	MOVWF      PORTC+0
;try.c,80 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	NOP
;try.c,81 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;try.c,82 :: 		portb.b7=0;
	BCF        PORTB+0, 7
;try.c,83 :: 		portc=left;
	MOVF       _left+0, 0
	MOVWF      PORTC+0
;try.c,84 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	NOP
;try.c,85 :: 		} //for(30
L_main35:
;try.c,72 :: 		for(i= 0;i<60;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;try.c,86 :: 		}
	GOTO       L_main29
L_main30:
;try.c,87 :: 		}
L_main26:
;try.c,61 :: 		for(counter=23;counter>0;counter--){
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;try.c,88 :: 		}     //for(23
	GOTO       L_main20
L_main21:
;try.c,90 :: 		for(counter=15;counter>0;counter--){
	MOVLW      15
	MOVWF      _counter+0
	MOVLW      0
	MOVWF      _counter+1
L_main38:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVF       _counter+0, 0
	SUBLW      0
L__main76:
	BTFSC      STATUS+0, 0
	GOTO       L_main39
;try.c,91 :: 		if(portb.b1 == 0&&portb.B0==1 ) {
	BTFSC      PORTB+0, 1
	GOTO       L_main43
	BTFSS      PORTB+0, 0
	GOTO       L_main43
L__main57:
;try.c,92 :: 		portb.b6 = portb.b7 = 1 ;
	BSF        PORTB+0, 7
	BTFSC      PORTB+0, 7
	GOTO       L__main77
	BCF        PORTB+0, 6
	GOTO       L__main78
L__main77:
	BSF        PORTB+0, 6
L__main78:
;try.c,94 :: 		}         else{
	GOTO       L_main44
L_main43:
;try.c,95 :: 		if(counter>3)
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _counter+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main79
	MOVF       _counter+0, 0
	SUBLW      3
L__main79:
	BTFSC      STATUS+0, 0
	GOTO       L_main45
;try.c,96 :: 		portd=0b00001010;
	MOVLW      10
	MOVWF      PORTD+0
	GOTO       L_main46
L_main45:
;try.c,98 :: 		portd=0b00001100;
	MOVLW      12
	MOVWF      PORTD+0
L_main46:
;try.c,99 :: 		left=counter/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R0+0, 0
	MOVWF      _left+0
	MOVF       R0+1, 0
	MOVWF      _left+1
;try.c,100 :: 		right=counter%10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _counter+0, 0
	MOVWF      R0+0
	MOVF       _counter+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _right+0
	MOVF       R0+1, 0
	MOVWF      _right+1
;try.c,101 :: 		for(i=0 ;i<60;i++){
	CLRF       _i+0
	CLRF       _i+1
L_main47:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main80
	MOVLW      60
	SUBWF      _i+0, 0
L__main80:
	BTFSC      STATUS+0, 0
	GOTO       L_main48
;try.c,102 :: 		if(portb.b1 == 0&&portb.B0==1 ) {
	BTFSC      PORTB+0, 1
	GOTO       L_main52
	BTFSS      PORTB+0, 0
	GOTO       L_main52
L__main56:
;try.c,103 :: 		portb.b6 = portb.b7 = 1 ;
	BSF        PORTB+0, 7
	BTFSC      PORTB+0, 7
	GOTO       L__main81
	BCF        PORTB+0, 6
	GOTO       L__main82
L__main81:
	BSF        PORTB+0, 6
L__main82:
;try.c,105 :: 		}         else{
	GOTO       L_main53
L_main52:
;try.c,106 :: 		portb.b6=0;
	BCF        PORTB+0, 6
;try.c,107 :: 		portb.b7=1;
	BSF        PORTB+0, 7
;try.c,108 :: 		portc=right;
	MOVF       _right+0, 0
	MOVWF      PORTC+0
;try.c,109 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main54:
	DECFSZ     R13+0, 1
	GOTO       L_main54
	DECFSZ     R12+0, 1
	GOTO       L_main54
	NOP
;try.c,110 :: 		portb.b6=1;
	BSF        PORTB+0, 6
;try.c,111 :: 		portb.b7=0;
	BCF        PORTB+0, 7
;try.c,112 :: 		portc=left;
	MOVF       _left+0, 0
	MOVWF      PORTC+0
;try.c,113 :: 		delay_ms(10);
	MOVLW      26
	MOVWF      R12+0
	MOVLW      248
	MOVWF      R13+0
L_main55:
	DECFSZ     R13+0, 1
	GOTO       L_main55
	DECFSZ     R12+0, 1
	GOTO       L_main55
	NOP
;try.c,114 :: 		}
L_main53:
;try.c,101 :: 		for(i=0 ;i<60;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;try.c,115 :: 		}
	GOTO       L_main47
L_main48:
;try.c,116 :: 		}//for(30
L_main44:
;try.c,90 :: 		for(counter=15;counter>0;counter--){
	MOVLW      1
	SUBWF      _counter+0, 1
	BTFSS      STATUS+0, 0
	DECF       _counter+1, 1
;try.c,117 :: 		}     //  for(15)
	GOTO       L_main38
L_main39:
;try.c,118 :: 		}  //  while(portb.b1==1)
L_main19:
;try.c,119 :: 		}   //for(;;)
	GOTO       L_main14
;try.c,121 :: 		}   //main
L_end_main:
	GOTO       $+0
; end of _main
