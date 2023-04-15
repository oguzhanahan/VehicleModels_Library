

mot1=15632; %ana gövde kütlesi kg
mot2=1250;mot3=700;mot4=1250;mot5=1250;mot6=700;mot7=1250; %süspansiyon kütleleri kg
Lot1=3.812;Lot2=5.042;Lot3=0.84;Lot4=1.2;Lot5=1.2; %araç uzunluklarý
Jot1=4531;Jot2=600; %kafa vurma ve yalpa kütle atalet momentleri
kot1=72000;kot2=921607;cot1=6500; %sol arka süspansiyon parametreleri
kot3=190000;kot4=921607;cot2=6500; %sol ön süspansiyon parametreleri
kot5=190000;kot6=921607;cot3=6500; %sol orta süspansiyon parametreleri
kot7=72000;kot8=921607;cot4=6500; %sað arka süspansiyon parametreleri
kot9=190000;kot10=921607;cot5=6500; %sað ön süspansiyon parametreleri
kot11=190000;kot12=921607;cot6=6500; %sað orta süspansiyon parametreleri


Vot=60/3.6; %otobüs hýzý m/s
dyot=0.007;
wot=Vot/dyot;



Mot=[mot1 0 0 0 0 0 0 0 0;
0 mot2 0 0 0 0 0 0 0;
0 0 mot3 0 0 0 0 0 0;
0 0 0 mot4 0 0 0 0 0;
0 0 0 0 mot5 0 0 0 0;
0 0 0 0 0 mot6 0 0 0;
0 0 0 0 0 0 mot7 0 0;
0 0 0 0 0 0 0 Jot1 0;
0 0 0 0 0 0 0 0 Jot2 ];


Cot=[cot1+cot2+cot3+cot4+cot5+cot6 -cot1 -cot2 -cot3 -cot4 -cot5 -cot6 cot1*Lot1-cot2*Lot2+cot3*Lot3+cot4*Lot1-cot5*Lot2+cot6*Lot3 cot1*Lot4+cot2*Lot4+cot3*Lot4-cot4*Lot5-cot5*Lot5-cot6*Lot5;
-cot1 cot1 0 0 0 0 0 -cot1*Lot1 -cot1*Lot4;
-cot2 0 cot2 0 0 0 0 cot2*Lot2 -cot2*Lot4;
-cot3 0 0 cot3 0 0 0 -cot3*Lot3 -cot3*Lot4;
-cot4 0 0 0 cot4 0 0 -cot4*Lot1 cot4*Lot5;
-cot5 0 0 0 0 cot5 0 cot5*Lot2 cot5*Lot5;
-cot6 0 0 0 0 0 cot6 -cot6*Lot3 cot6*Lot5;
cot1*Lot1-cot2*Lot2+cot3*Lot3+cot4*Lot1-cot5*Lot2+cot6*Lot3 -cot1*Lot1 cot2*Lot2 -cot3*Lot3 -cot4*Lot1 cot5*Lot2 -cot6*Lot3 cot1*Lot1^2+cot2*Lot2^2+cot3*Lot3^2+cot4*Lot1^2+cot5*Lot2^2+cot6*Lot3^2 cot1*Lot1*Lot4-cot2*Lot2*Lot4+cot3*Lot3*Lot4-cot4*Lot1*Lot5+cot5*Lot2*Lot5-cot6*Lot3*Lot5;
cot1*Lot4+cot2*Lot4+cot3*Lot4-cot4*Lot5-cot5*Lot5-cot6*Lot5 -cot1*Lot4 -cot2*Lot4 -cot3*Lot4 cot4*Lot5 cot5*Lot5 cot6*Lot5 cot1*Lot1*Lot4-cot2*Lot2*Lot4+cot3*Lot3*Lot4-cot4*Lot1*Lot5+cot5*Lot2*Lot5-cot6*Lot3*Lot5 cot1*Lot4^2+cot2*Lot4^2+cot3*Lot4^2+cot4*Lot5^2+cot5*Lot5^2+cot6*Lot5^2 ]; 


Kot=[kot1+kot3+kot5+kot7+kot9+kot11 -kot1 -kot3 -kot5 -kot7 -kot9 -kot11 kot1*Lot1-kot3*Lot2+kot5*Lot3+kot7*Lot1-kot9*Lot2+kot11*Lot3 kot1*Lot4+kot3*Lot4+kot5*Lot4-kot7*Lot5-kot9*Lot5-kot11*Lot5;
    -kot1 kot1+kot2 0 0 0 0 0 -kot1*Lot1 -kot1*Lot4;
    -kot3 0 kot3+kot4 0 0 0 0 kot3*Lot2 -kot3*Lot4;
    -kot5 0 0 kot5+kot6 0 0 0 -kot5*Lot3 -kot5*Lot4;
    -kot7 0 0 0 kot7+kot8 0 0 -kot7*Lot1 kot7*Lot5;
    -kot9 0 0 0 0 kot9+kot10 0 kot9*Lot2 kot9*Lot5;
    -kot11 0 0 0 0 0 kot11+kot12 -kot11*Lot3 kot11*Lot5;
    kot1*Lot1-kot3*Lot2+kot5*Lot3+kot7*Lot1-kot9*Lot2+kot11*Lot3 -kot1*Lot1 kot3*Lot2 -kot5*Lot3 -kot7*Lot1 kot9*Lot2 -kot11*Lot3 kot1*Lot1^2+kot3*Lot2^2+kot5*Lot3^2+kot7*Lot1^2+kot9*Lot2^2+kot11*Lot3^2 kot1*Lot1*Lot4-kot3*Lot2*Lot4+kot5*Lot3*Lot4-kot7*Lot1*Lot5+kot9*Lot2*Lot5-kot11*Lot3*Lot5;
    kot1*Lot4+kot3*Lot4+kot5*Lot4-kot7*Lot5-kot9*Lot5-kot11*Lot5 -kot1*Lot4 -kot3*Lot4 -kot5*Lot4 kot7*Lot5 kot9*Lot5 kot11*Lot5 kot1*Lot1*Lot4-kot3*Lot2*Lot4+kot5*Lot3*Lot4-kot7*Lot1*Lot5+kot9*Lot2*Lot5-kot11*Lot3*Lot5 kot1*Lot4^2+kot3*Lot4^2+kot5*Lot4^2+kot7*Lot5^2+kot9*Lot5^2+kot11*Lot5^2 ];


Aot=[zeros(9) eye(9);
       -Mot^-1*Kot     -Mot^-1*Cot];
   
   
Bot=zeros(18,6);
Bot(11,1)=kot2/mot2;
Bot(12,2)=kot4/mot3;
Bot(13,3)=kot6/mot4;
Bot(14,4)=kot8/mot5;
Bot(15,5)=kot10/mot6;
Bot(16,6)=kot12/mot7;


CCot=zeros(1,18);
CCot(1,1)=1;

% CCot=[eye(9) zeros(9)];
Dot=zeros(1,6);