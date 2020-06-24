 
#include <Wire.h> // Library for I2C communication
#include <LiquidCrystal_I2C.h> // Library for LCD


LiquidCrystal_I2C lcd = LiquidCrystal_I2C(0x27, 16, 2); // Change to (0x27,16,2) for 16x2 LCD.

void setup() {
  lcd.init();
  lcd.backlight();
  Serial.begin(4800);
  pinMode(2,INPUT);     //bin value read
  pinMode(3,INPUT);
  pinMode(4,INPUT);
  pinMode(5,INPUT);
  pinMode(6,INPUT);    
  pinMode(7,INPUT);
  pinMode(8,INPUT);
  pinMode(9,INPUT);
  pinMode(10,INPUT);    //state read
  pinMode(11,INPUT);
  pinMode(12,INPUT);
  
}

void loop() {
  
 int Answer = 0;
 int a = 0 ;
 int b = 0;
 int c = 0;
 int d = 0;
 int e = 0;
 int f = 0;
 int g = 0;
 int h = 0;
 static int op1 = 0;

  if(digitalRead(2)==HIGH){
    a = 1;
   // Serial.println(a);
   }
  if(digitalRead(3)==HIGH){
    b = 1;
   }
  if(digitalRead(4)==HIGH){
    c = 1;
   }
  if(digitalRead(5)==HIGH){
    d = 1;
   }
    if(digitalRead(6)==HIGH){
    e = 1;
   // Serial.println(a);
   }
  if(digitalRead(7)==HIGH){
    f = 1;
   }
  if(digitalRead(8)==HIGH){
    g = 1;
   }
  if(digitalRead(9)==HIGH){
    h = 1;
   }
   
   Answer = a+(b*2)+(c*4)+(d*8)+(e*16)+(f*32)+(g*64)+(h*128);

    if((digitalRead(10)==LOW) && (digitalRead(11)==LOW) && (digitalRead(12)==LOW)){                    // Reset
          delay(25);
          lcd.clear();

          lcd.setCursor(0, 0); // Set the cursor on the first column and first row.
          lcd.print("** Calculator **");//total = 16
          op1 = 0;
          //lcd.setCursor(1, 1); //Set the cursor on the third column and the second row (counting starts at 0!).
          //lcd.print(Answer); // Print the string "Hello World!"

    }
    else if((digitalRead(12)==LOW) && (digitalRead(11)==LOW) && (digitalRead(10)==HIGH)){               // Inp1
        delay(25);
        //lcd.clear();

        lcd.setCursor(0, 0);
        lcd.print("** 1st Input ***");

        lcd.setCursor(1, 1);
        lcd.print(Answer);
    }
    else if((digitalRead(12)==LOW) && (digitalRead(11)==HIGH) && (digitalRead(10)==LOW)){              // Operator
       delay(25);
       //lcd.clear();

       lcd.setCursor(0, 0);
       lcd.print("*** Operator ***");

       lcd.setCursor(4, 1);
       //lcd.print(Answer);
       switch (Answer) {
         case 0:
           lcd.print("+");//2 operands
           break;
         case 1:
            lcd.print("-");//2 operands
            break;
         case 2:
            lcd.print("*");//2 operands
            break;
         case 3:
             lcd.print("/");//2 operands
             break;
         case 4:
            lcd.print("%");//2 operands
           break;
         case 5:
            lcd.print("^2");//1 operands
            op1 = 1;
            break;
         case 6:
            lcd.print("!");//1 operands
            op1 = 1;
            break;
         case 7:
             //lcd.print("pnr");//2 operands
             break;
         default:
           lcd.print(" ");
            break;
           break;
       }


    }
    else if((digitalRead(12)==LOW) && (digitalRead(11)==HIGH) && (digitalRead(10)==HIGH)){               // Inp2
         delay(25);
         //lcd.clear();
         lcd.setCursor(0, 0);
         lcd.print("** 2nd Input ***");

        if (op1 == 1){
         lcd.setCursor(7, 1);
         lcd.print("_");
        }
        else{
         lcd.setCursor(7, 1);
         lcd.print(Answer);
        }

    }
    else if((digitalRead(12)==HIGH) && (digitalRead(11)==LOW) && (digitalRead(10)==LOW)){              // Result
           delay(25);
           //lcd.clear();

           lcd.setCursor(0, 0);
           lcd.print("**** Result ****");

           lcd.setCursor(10, 1);
           lcd.print("=");

           lcd.setCursor(13, 1);
           lcd.print(Answer);
    }
    else{
    // Reset
    }




}
