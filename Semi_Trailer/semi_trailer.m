clc
clear all
Lt11=4.8;Lt12=1.2;Lt13=3.6;Lt14=1.2;Lt15=1.2;Lt16=4.134; %çekici uzunluklar
Lt21=4;Lt22=0.685;Lt23=0.7;Lt24=1.2;Lt25=1.2;Lt26=6.973; %römork uzunluklarý
kt1=155800;ct1=200000; %baðlama noktasý parametreleri
kt2=155800;kt3=2000000;ct2=44506;c3=0; %römork sol arka
kt4=155800;kt5=2000000;ct4=44506;c5=0; %römork sað arka
kt6=155800;kt7=2000000;ct6=44506;c7=0; %römork sol ön
kt8=155800;kt9=2000000;ct8=44506;c9=0; %römork sað ön
kt10=967430;kt11=2000000;ct10=27627;ct11=0; %çekici sol arka
kt12=967430;kt13=2000000;ct12=27627;ct13=0; %çekici sað arka
kt14=967430;kt15=2000000;ct14=27627;ct15=0; %çekici sol orta
kt16=967430;kt17=2000000;ct16=27627;ct17=0; %çekici sað orta
kt18=300000;kt19=847000;ct18=10000;ct19=0; %çekici sol ön
kt20=300000;kt21=847000;ct20=10000;ct21=0; %çekici sað ön
mt1=9785;mt2=26000; %çekici ve römork kütleleri
mt3=270;mt4=270;mt5=270;mt6=270; %römork süspansiyon kütleleri
mt7=520;mt8=520;mt9=520;mt10=520;mt11=270;mt12=270; %çekici süspansiyon kütleleri
Jt11=18311; %çekici kafa vurma kütle atalet momenti
Jt12=((Jt11-mt11*(Lt12-(Lt11+Lt12)/2)^2)/((Lt11+Lt12)/2)^2)*Lt14^2; %çekici yalpa kütle atalet momenti
Jt21=251900; %römork kafa vurma kütle atalet momenti
Jt22=((Jt21-mt2*(Lt22-(Lt21+Lt22)/2)^2)/((Lt21+Lt22)/2)^2)*Lt24^2; %römork yalpa kütle atalet momenti
Jt3=3300; %römork sol teker çifti atalet momenti
Jt4=3300; %römork sað teker çifti atalet momenti
Vt=20; %araç hýzý 72 km/h
dyt=0.007;
wt=20/dyt; %yoldan gelen frekans

