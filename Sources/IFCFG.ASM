IFCFG.ASM        )��J	 
 REM WIFI IP ADDRESS COMMAND  REM (C) ROLAND LEURS  REM V1.0 FEBRUARI 2020 (  2 PASS 2;GOSUB a < PASS 1;GOSUB a F END P  ZaASM-BEGIN d  n .OPTION #40 x .CODE #E00 � .TABLE #6000,#7000 �  �:ZP = #80�:WIFIDRIVER� .BYTE #4C:WIFI_ADDR .BYTE #00,#00 �:START � JSR SEARCH_WIFI_DRIVER� BEQ LOAD_DRIVER� JMP DO_YOUR_THING :LOAD_DRIVER LDY @0$:LOOP1. LDA LDCOMMAND,Y8 STA #100,YB CMP @13L BEQ OSCLIV INY` BNE LOOP1j:OSCLIt JSR #FFF7~ JSR SEARCH_WIFI_DRIVER� BNE INIT_MODULE� JSR #F7D1� .ASCII "DRIVER NOT LOADED",#EA� BRK� �:LDCOMMAND� .ASCII "LOAD WIFIDRV.BIN",#0D� �:INIT_MODULE� JSR SET_BUFFER  JSR WIFIDRIVER
  \ INITIALIZE DRIVER AND MODULE LDA @0( JSR WIFIDRIVER- JMP DO_YOUR_THING2 F:SET_BUFFERP LDX @#70Z LDY @#7Fd LDA @11n JMP WIFIDRIVERw x :SEARCH_WIFI_DRIVER� LDY @0� STY ZP� STY ZP+1�:SEARCH1� LDA (ZP),Y� CMP @#4C� BEQ SEARCH3�:SEARCH2� INC ZP+1� BNE SEARCH1� \ DRIVER NOT FOUND� LDA @0� RTS�:SEARCH3� \ TEST FOR "WIFI" SIGNATURE� LDY @3 LDA (ZP),Y CMP @CH"W" BNE SEARCH4" INY, LDA (ZP),Y6 CMP @CH"I"@ BNE SEARCH4J INYT LDA (ZP),Y^ CMP @CH"F"h BNE SEARCH4r INY| LDA (ZP),Y� CMP @CH"I"� BNE SEARCH4� LDA ZP� STA WIFI_ADDR� LDA ZP+1� STA WIFI_ADDR+1� RTS� �:SEARCH4� LDY @0� BEQ SEARCH2� � \ DO YOUR THING FROM HERE....�:DO_YOUR_THING� \ LIST ACCESS POINTS� JSR SET_BUFFER� LDA @18� JSR WIFIDRIVER� LDA @#70 STA ZP+1 LDA @#00 STA ZP:LAP1  JSR SEARCH0A* JSR TEST_OK4 BEQ READY> JSR TEST_ERRORH BEQ READYR JSR PRINT_STRINGW JSR #FFED\ JMP LAP1f p:READYz RTS� �:TEST_OK� LDY @0� LDA (ZP),Y� CMP @CH"O"� BNE TEST1� INY� LDA (ZP),Y� CMP @CH"K"�:TEST1� RTS� �:TEST_ERROR	 LDY @0	 LDA (ZP),Y	 CMP @CH"E"	$ BNE TEST1	. INY	3 LDA (ZP),Y	8 CMP @CH"R"	B BNE TEST1	L INY	Q LDA (ZP),Y 	V CMP @CH"R"	` BNE TEST1	j RTS	t 	�:PRINT_STRING	� LDY @0	�:PS1	� LDA (ZP),Y	� JSR #FFF4	� CMP @#0D
  BEQ PS2

 JSR INC_POINTER
2 JMP PS1
<:PS2 RTS
F 
�:SEARCH0A
� LDY @0
�:SEARCH0A1
� LDA (ZP),Y
� CMP @#0A
� BEQ SEARCH0A2
� JSR INC_POINTER
� BPL SEARCH0A1
�:SEARCH0A2
� JSR INC_POINTER
� RTS T:INC_POINTER^ INC ZPh BNE IP1r INC ZP+1|:IP1� RTS� &� &� .END' RETURN�