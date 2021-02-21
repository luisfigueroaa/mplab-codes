; Programming a PIC16F628 microcontroller using MPLABX and PICkit3 - 
; A Hello World Program demonstrating the basic principles of writing a piece 
; of ASM code. The LEDs on the PORTB are lighting up according to some pressed 
; buttons on the PORTA used as an input here.

; Hello world basic 16F628 ASM program
    
RESET CODE 0x00
 #INCLUDE P16F628A.inc ; put angle brackets here
 __CONFIG _HS_OSC & _CP_OFF & _LVP_OFF & _BODEN_OFF & _MCLRE_ON & _PWRTE_OFF & _WDT_OFF 
 
 ; THIS PROGRAM WAS DESIGNED FOR 20 MHZ OSC
 ;------------------------------------
 ;_XT_OSC             : EXTERNAL 4MHZ
 ;_HS_OSC             : EXTERNAL 20MHZ
 ;_INTRC_OSC_NOCLKOUT : INTERNAL 4MHZ
 ;------------------------------------
 
 CBLOCK 0X20 ; THIS IS HOW YOU DECLARE A BLOCK OF VARIABLES
    NVAR1, NVAR2
 ENDC
 
 CLRF PORTA ;SET THESE PINS BEFORE YOU ACTUALLY CONFIGURE THEM
 CLRF PORTB
 
 MOVLW 0X07    ; DISABLE THE COMPARATORS AND ENABLING THE PINS FOR
 MOVWF CMCON   ; FUNCTIONING AS I-O

 
 
 
 
 
 BCF STATUS, RP1 ;SETS BANK1
 BSF STATUS, RP0 ;
 
 MOVLW B'00111111' ;SET PINS 0 - 4 AS INPUTS ; TRIS 5 AS 1 ALWAYS  
 MOVWF TRISA 
 
 MOVLW 0X00 ;SET PINS 0 - 7 AS OUTPUTS
 MOVWF TRISB 
 
 BCF STATUS, RP1 ;SETS BANK1
 BCF STATUS, RP0 ;
 
 
;MAIN LOOP----------------

REPEAT
 
 MOVFW PORTA
 MOVWF NVAR1
 
 MOVFW NVAR1
 MOVWF PORTB
 
 GOTO REPEAT ; END OF MAIN LOOP 
 
 END

