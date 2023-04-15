
mo1=1100;  %ana gövde koütLoesi (kog)
mo2=25;mo3=45;mo4=25;mo5=45; %süspansiyon koütLoeLoeri (kog)
Jo1=1848;Jo2=550; %aracoa ait koafa vurmoa ve yaLopa koütLoe ataLoet moomoentLoeri(kogmo^2)
Lo1=1.2;Lo2=1.;Lo3=0.8;Lo4=0.8; %araç uzunLoukoLoarý
ko1=15000;ko2=250000;co1=2500;co2=0; %sað ön süspansiyon paramoetLoeri
ko3=17000;ko4=250000;co3=2500;co4=0; %sað arkoa süspansiyon paramoetreLoeri
ko5=15000;ko6=250000;co5=2500;co6=0; %soLo ön süspansiyon paramoetreLoeri
ko7=17000;ko8=250000;co7=2500;co8=0; %soLo arkoa süspansiyon paramoetreLoeri
Vo=60/3.6;

Mo=[mo1 0  0  0  0  0  0;
   0  mo2 0  0  0  0  0;
   0  0  mo3 0  0  0  0;
   0  0  0  mo4 0  0  0;
   0  0  0  0  mo5 0  0;
   0  0  0  0  0  Jo1 0;
   0  0  0  0  0  0  Jo2];

Ko=[ko1+ko3+ko5+ko7           -ko1    -ko3    -ko5   -ko7    Lo1*(ko1+ko5)-Lo2*(ko3+ko7)             Lo4*(ko1+ko3)-Lo3*(ko5+ko7);
  -ko1                     ko1+ko2  0      0     0    -Lo1*ko1                            -Lo4*ko1;
  -ko3                     0      ko3+ko4  0     0     Lo2*ko3                            -Lo4*ko3;
  -ko5                     0      0      ko5+ko6 0    -Lo1*ko5                             Lo3*ko5;
  -ko7                     0      0      0     ko7+ko8 Lo2*ko7                             Lo3*ko7;
   Lo1*(ko1+ko5)-Lo2*(ko3+ko7) -Lo1*ko1  Lo2*ko3 -Lo1*ko5 Lo2*ko7 Lo1^2*(ko1+ko5)+Lo2^2*(ko3+ko7)         Lo4*(ko1*Lo1-ko3*Lo2)-Lo3*(ko1*Lo1-ko7*Lo2);
   Lo4*(ko1+ko3)-Lo3*(ko5+ko7) -Lo4*ko1 -Lo4*ko3  Lo3*ko5 Lo3*ko7 Lo4*(ko1*Lo1-ko3*Lo2)-Lo3*(ko1*Lo1-ko7*Lo2) Lo4^2*(ko1+ko3)+Lo3*(ko5+ko7)];

Co=[co1+co3+co5+co7           -co1    -co3    -co5   -co7    Lo1*(co1+co5)-Lo2*(co3+co7)             Lo4*(co1+co3)-Lo3*(co5+co7);
  -co1                     co1+co2  0      0     0    -Lo1*co1                            -Lo4*co1;
  -co3                     0      co3+co4  0     0     Lo2*co3                            -Lo4*co3;
  -co5                     0      0      co5+co6 0    -Lo1*co5                             Lo3*co5;
  -co7                     0      0      0     co7+co8 Lo2*co7                             Lo3*co7;
   Lo1*(co1+co5)-Lo2*(co3+co7) -Lo1*co1  Lo2*co3 -Lo1*co5 Lo2*co7 Lo1^2*(co1+co5)+Lo2^2*(co3+co7)         Lo4*(co1*Lo1-co3*Lo2)-Lo3*(co1*Lo1-co7*Lo2);
   Lo4*(co1+co3)-Lo3*(co5+co7) -Lo4*co1 -Lo4*co3  Lo3*co5 Lo3*co7 Lo4*(co1*Lo1-co3*Lo2)-Lo3*(co1*Lo1-co7*Lo2) Lo4^2*(co1+co3)+Lo3*(co5+co7)];

Ao=[zeros(7) eye(7);
   -inv(Mo)*Ko -inv(Mo)*Co];

Bo=[zeros(8,4);
   ko2/mo2 0      0      0;
   0    ko4/mo3  0      0;
   0      0  ko6/mo4  0;
   0      0      0  ko8/mo5;
   zeros(2,4)];

CCo=[1 0 0 0 0 0 0 0 0 0 0 0 0 0];
% CCo=[eye(7) zeros(7)];
Do=zeros(1,4);