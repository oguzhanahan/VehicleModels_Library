
mk1=10194; %ana gövde kütlesi kg
mk2=375;mk3=400;mk4=730;mk5=375;mk6=400;mk7=730; %süspansiyon kütleleri kg
Lk1=3.812;Lk2=5.042;Lk3=0.84;Lk4=1.2;Lk5=1.2; %araç uzunluklarý
Jk1=4531;Jk2=600; %kafa vurma ve yalpa kütle atalet momentleri
kk1=108000;kk2=944046;ck1=10385; %sol arka süspansiyon parametreleri
kk3=230000;kk4=1057170;ck2=10385; %sol ön süspansiyon parametreleri
kk5=155500;kk6=2057694;ck3=14432; %sol orta süspansiyon parametreleri
kk7=108000;kk8=944046;ck4=10385; %sað arka süspansiyon parametreleri
kk9=230000;kk10=1057170;ck5=10385; %sað ön süspansiyon parametreleri
kk11=155500;kk12=2057694;ck6=14432; %sað orta süspansiyon parametreleri

Vk=60/3.6; %araç hýzý (m/s)
dyk=0.007;
wk=Vk/dyk;

Mk=[mk1 0 0 0 0 0 0 0 0;
0 mk2 0 0 0 0 0 0 0;
0 0 mk3 0 0 0 0 0 0;
0 0 0 mk4 0 0 0 0 0;
0 0 0 0 mk5 0 0 0 0;
0 0 0 0 0 mk6 0 0 0;
0 0 0 0 0 0 mk7 0 0;
0 0 0 0 0 0 0 Jk1 0;
0 0 0 0 0 0 0 0 Jk2 ];

Ck=[ck1+ck2+ck3+ck4+ck5+ck6 -ck1 -ck2 -ck3 -ck4 -ck5 -ck6 ck1*Lk1-ck2*Lk2+ck3*Lk3+ck4*Lk1-ck5*Lk2+ck6*Lk3 ck1*Lk4+ck2*Lk4+ck3*Lk4-ck4*Lk5-ck5*Lk5-ck6*Lk5;
-ck1 ck1 0 0 0 0 0 -ck1*Lk1 -ck1*Lk4;
-ck2 0 ck2 0 0 0 0 ck2*Lk2 -ck2*Lk4;
-ck3 0 0 ck3 0 0 0 -ck3*Lk3 -ck3*Lk4;
-ck4 0 0 0 ck4 0 0 -ck4*Lk1 ck4*Lk5;
-ck5 0 0 0 0 ck5 0 ck5*Lk2 ck5*Lk5;
-ck6 0 0 0 0 0 ck6 -ck6*Lk3 ck6*Lk5;
ck1*Lk1-ck2*Lk2+ck3*Lk3+ck4*Lk1-ck5*Lk2+ck6*Lk3 -ck1*Lk1 ck2*Lk2 -ck3*Lk3 -ck4*Lk1 ck5*Lk2 -ck6*Lk3 ck1*Lk1^2+ck2*Lk2^2+ck3*Lk3^2+ck4*Lk1^2+ck5*Lk2^2+ck6*Lk3^2 ck1*Lk1*Lk4-ck2*Lk2*Lk4+ck3*Lk3*Lk4-ck4*Lk1*Lk5+ck5*Lk2*Lk5-ck6*Lk3*Lk5;
ck1*Lk4+ck2*Lk4+ck3*Lk4-ck4*Lk5-ck5*Lk5-ck6*Lk5 -ck1*Lk4 -ck2*Lk4 -ck3*Lk4 ck4*Lk5 ck5*Lk5 ck6*Lk5 ck1*Lk1*Lk4-ck2*Lk2*Lk4+ck3*Lk3*Lk4-ck4*Lk1*Lk5+ck5*Lk2*Lk5-ck6*Lk3*Lk5 ck1*Lk4^2+ck2*Lk4^2+ck3*Lk4^2+ck4*Lk5^2+ck5*Lk5^2+ck6*Lk5^2 ]; 


Kk=[kk1+kk3+kk5+kk7+kk9+kk11 -kk1 -kk3 -kk5 -kk7 -kk9 -kk11 kk1*Lk1-kk3*Lk2+kk5*Lk3+kk7*Lk1-kk9*Lk2+kk11*Lk3 kk1*Lk4+kk3*Lk4+kk5*Lk4-kk7*Lk5-kk9*Lk5-kk11*Lk5;
    -kk1 kk1+kk2 0 0 0 0 0 -kk1*Lk1 -kk1*Lk4;
    -kk3 0 kk3+kk4 0 0 0 0 kk3*Lk2 -kk3*Lk4;
    -kk5 0 0 kk5+kk6 0 0 0 -kk5*Lk3 -kk5*Lk4;
    -kk7 0 0 0 kk7+kk8 0 0 -kk7*Lk1 kk7*Lk5;
    -kk9 0 0 0 0 kk9+kk10 0 kk9*Lk2 kk9*Lk5;
    -kk11 0 0 0 0 0 kk11+kk12 -kk11*Lk3 kk11*Lk5;
    kk1*Lk1-kk3*Lk2+kk5*Lk3+kk7*Lk1-kk9*Lk2+kk11*Lk3 -kk1*Lk1 kk3*Lk2 -kk5*Lk3 -kk7*Lk1 kk9*Lk2 -kk11*Lk3 kk1*Lk1^2+kk3*Lk2^2+kk5*Lk3^2+kk7*Lk1^2+kk9*Lk2^2+kk11*Lk3^2 kk1*Lk1*Lk4-kk3*Lk2*Lk4+kk5*Lk3*Lk4-kk7*Lk1*Lk5+kk9*Lk2*Lk5-kk11*Lk3*Lk5;
    kk1*Lk4+kk3*Lk4+kk5*Lk4-kk7*Lk5-kk9*Lk5-kk11*Lk5 -kk1*Lk4 -kk3*Lk4 -kk5*Lk4 kk7*Lk5 kk9*Lk5 kk11*Lk5 kk1*Lk1*Lk4-kk3*Lk2*Lk4+kk5*Lk3*Lk4-kk7*Lk1*Lk5+kk9*Lk2*Lk5-kk11*Lk3*Lk5 kk1*Lk4^2+kk3*Lk4^2+kk5*Lk4^2+kk7*Lk5^2+kk9*Lk5^2+kk11*Lk5^2 ];


Ak=[zeros(9) eye(9);
       -Mk^-1*Kk     -Mk^-1*Ck];
   
Bk=zeros(18,6);
Bk(11,1)=kk2/mk2;
Bk(12,2)=kk4/mk3;
Bk(13,3)=kk6/mk4;
Bk(14,4)=kk8/mk5;
Bk(15,5)=kk10/mk6;
Bk(16,6)=kk12/mk7;


CCk=zeros(1,18);
CCk(1,1)=1;

% CCk=[eye(9) zeros(9)];
Dk=zeros(1,6);