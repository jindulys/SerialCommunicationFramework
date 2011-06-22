/*
 * SerialCommunication.framework for iOS
 * iOS_ADK
 *
 * Copyright (c) Yusuke Sekikawa, 11/06/02
 * All rights reserved.
 * 
 * BSD License
 *
 * Redistribution and use in source and binary forms, with or without modification, are 
 * permitted provided that the following conditions are met:
 * - Redistributions of source code must retain the above copyright notice, this list of
 *  conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, this list
 *  of conditions and the following disclaimer in the documentation and/or other materia
 * ls provided with the distribution.
 * - Neither the name of the "Yuichi Yoshida" nor the names of its contributors may be u
 * sed to endorse or promote products derived from this software without specific prior 
 * written permission.
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY E
 * XPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES O
 * F MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SH
 * ALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENT
 * AL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROC
 * UREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS I
 * NTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRI
 * CT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF T
 * HE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
//http://nekosan0.bake-neko.net/structure_digital_port.html


/*
 *How this sample works
 *
 *When inputPin is connected to GND send inputPin number in 32bit
 *When recieved data from serial is equal to outputPin turn LED attatched to pin outputPin on.
 *
 */

int outputPin   = 3;
int inputPin    = 9;
int prvData=0;
void setup() {              // 初期設定
  pinMode(outputPin,OUTPUT);
  Serial.begin(9600);       // 通信速度は9600bps
}
void loop(){
  /* INPUT from Digital Pin */
  int curData = digitalRead(inputPin);
  if(curData!=prvData){
    Serial.write((byte*)&inputPin,sizeof(int));
    prvData=curData;
  }
  
  /*OUTPUT to Digital Pin*/
  byte readData;
  readData=Serial.read();
  if(readData==outputPin){
     digitalWrite(outputPin,1);
  }else{
    digitalWrite(outputPin,0);
  }
}