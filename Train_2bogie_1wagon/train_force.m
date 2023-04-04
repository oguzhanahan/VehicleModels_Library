wntrx1=110;
wntrx2=109;
wntrx4=108;
wtr=2;

rtrx1=wntrx1/wtr;
rtrx2=wntrx2/wtr;
rtrx4=wntrx4/wtr;

ckrtrx1=2*mtr1*wntrx1;
ckrtrx2=2*2*mtr2*wntrx2;

ksitr1=4*ctr1/ckrtrx1;
ksitr2=8*ctr5/ckrtrx2;

Gtr1=(sqrt(1+(2*ksitr1*rtrx1)^2))/(sqrt((1-rtrx1^2)^2+(2*ksitr1*rtrx1)^2));
Gtr2=(sqrt(1+(2*ksitr2*rtrx2)^2))/(sqrt((1-rtrx2^2)^2+(2*ksitr2*rtrx2)^2));
Gtr3=1/sqrt((1-rtrx4^2)^2);

ftrtop1=(min(xytr1)*Gtr3*(4*ktr1*rtrx1^2*Gtr1*Gtr2+8*ktr5*rtrx2^2*Gtr2+8*ktr13*rtrx4^2))/8;
ftrtop2=(min(xytr2)*Gtr3*(4*ktr1*rtrx1^2*Gtr1*Gtr2+8*ktr5*rtrx2^2*Gtr2+8*ktr13*rtrx4^2))/8;
ftrtop3=(min(xytr3)*Gtr3*(4*ktr1*rtrx1^2*Gtr1*Gtr2+8*ktr5*rtrx2^2*Gtr2+8*ktr13*rtrx4^2))/8;
ftrtop4=(min(xytr4)*Gtr3*(4*ktr1*rtrx1^2*Gtr1*Gtr2+8*ktr5*rtrx2^2*Gtr2+8*ktr13*rtrx4^2))/8;
ftrtop5=(min(xytr5)*Gtr3*(4*ktr1*rtrx1^2*Gtr1*Gtr2+8*ktr5*rtrx2^2*Gtr2+8*ktr13*rtrx4^2))/8;
ftrtop6=(min(xytr6)*Gtr3*(4*ktr1*rtrx1^2*Gtr1*Gtr2+8*ktr5*rtrx2^2*Gtr2+8*ktr13*rtrx4^2))/8;
ftrtop7=(min(xytr7)*Gtr3*(4*ktr1*rtrx1^2*Gtr1*Gtr2+8*ktr5*rtrx2^2*Gtr2+8*ktr13*rtrx4^2))/8;
ftrtop8=(min(xytr8)*Gtr3*(4*ktr1*rtrx1^2*Gtr1*Gtr2+8*ktr5*rtrx2^2*Gtr2+8*ktr13*rtrx4^2))/8;

ftrtop=ftrtop1+ftrtop2+ftrtop3+ftrtop4+ftrtop5+ftrtop6+ftrtop7+ftrtop8;

aatr1=atr1+alfatr1*Ltr1y1-alfatr4*Ltr1x1;
aatr2=atr1+alfatr1*Ltr1y1+alfatr4*Ltr1x2;
aatr3=atr1-alfatr1*Ltr1y2-alfatr4*Ltr1x1;
aatr4=atr1-alfatr1*Ltr1y2+alfatr4*Ltr1x2;

Atr=aatr1+aatr2+aatr3+aatr4;

Ctr=ftrtop/max(Atr);

Ftrtop=Atr.*Ctr;

plot(ttr,Ftrtop,'k')
xlabel('Zaman (s)')
ylabel('Kuvvet (N)')
title('Tren Kuvvet')