clc
clear
mo1=1100+80*4;  %ana gövde kütlesi (kg)
mo2=25;mo3=25;mo4=45;mo5=45; %süspansiyon kütleleri (kg)
Jo1=1848;Jo2=550; %araca ait kafa vurma ve yalpa kütle atalet momentleri(kgm^2)
lo1=1.2;lo2=1.4;lo3=0.5;lo4=1; %araç uzunluklarý
ko1=15000;ko2=250000;co1=2500;co2=0; %sað ön süspansiyon parametleri
ko3=17000;ko4=250000;co3=2500;co4=0; %sað arka süspansiyon parametreleri
ko5=15000;ko6=250000;co5=2500;co6=0; %sol ön süspansiyon parametreleri
ko7=17000;ko8=250000;co7=2500;co8=0; %sol arka süspansiyon parametreleri
Vo=50;
dy=0.007;
wo=Vo/dy;
