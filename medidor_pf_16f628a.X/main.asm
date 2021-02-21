  LIST  P=16F628A
  #include "p16f628a.inc"

; CONFIG
; __config 0x3F01
 __CONFIG _FOSC_XT & _WDTE_OFF & _PWRTE_ON & _MCLRE_OFF & _BOREN_OFF & _LVP_OFF & _CPD_OFF & _CP_OFF
  
  ORG	0X00
  
  START
  BCF	    STATUS, RP0
  BSF	    STATUS, RP1	; BANCO 1
  CLRF	    TRISA	; Puerto A como entrada
  MOVLW	    0XFF
  MOVWF	    TRISB	; Configurar puerto B como salida
  
  BCF	    STATUS, RP1	; BANCO 0
  ANDLW	    B'00001111'
  MOVF	    PORTA, W
  CALL	    DISPLAY
  MOVWF	    PORTB
  
  
  GOTO	  START
  
    DISPLAY
    ADDWF   PCL, F	    ; DE ACUERDO AL VALOR DE W SALTA A LA LINEA Q CONTIENE
			    ; EL VALOR QUE CONTIENE EN EL LED DE 7 SEG. AL NUMERO
    RETLW   3FH		    ; 0
    RETLW   06H		    ; 1
    RETLW   5BH		    ; 2
    RETLW   4FH		    ; 3
    RETLW   66H		    ; 4
    RETLW   6DH		    ; 5
    RETLW   7DH		    ; 6
    RETLW   07H		    ; 7
    RETLW   7FH		    ; 8
    RETLW   67H		    ; 9
    RETLW   77H		    ; A
    RETLW   7CH		    ; B
    RETLW   39H		    ; C
    RETLW   5EH		    ; D
    RETLW   79H		    ; E
    RETLW   71H		    ; F   
  
END

