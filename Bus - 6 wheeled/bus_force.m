wnxot1=10^0.1123;
wnott1=10^0.6627;
wnott2=10^0.6360;
wnxot2=10^0.6460;
wnxot3=10^0.7515;
wnxot4=10^0.6730;
wnxot5=10^0.6460;
wnxot6=10^0.7515;
wnxot7=10^0.6360;
ckrot1=2*mot1*wnxot1;
ksiot1=(cot1)/ckrot1;
ksiot2=(cot2)/ckrot1;
ksiot3=(cot3)/ckrot1;
ksiot4=(cot4)/ckrot1;
ksiot5=(cot5)/ckrot1;
ksiot6=(cot6)/ckrot1;
rot1=wot/wnxot1;
rot2=wot/wnxot2;
rot3=wot/wnxot3;
rot4=wot/wnxot4;
rot5=wot/wnxot5;
rot6=wot/wnxot6;
rot7=wot/wnxot7;
Got11=rot1^2*sqrt((1+(2*ksiot1*rot1)^2)/((1-rot1^2)^2+(2*ksiot1*rot1)^2));
Got12=sqrt((1/((1-rot2^2)^2)));
Got21=rot1^2*sqrt((1+(2*ksiot2*rot1)^2)/((1-rot1^2)^2+(2*ksiot2*rot1)^2));
Got22=sqrt((1/((1-rot3^2)^2)));
Got31=rot1^2*sqrt((1+(2*ksiot3*rot1)^2)/((1-rot1^2)^2+(2*ksiot3*rot1)^2));
Got32=sqrt((1/((1-rot4^2)^2)));
Got41=rot1^2*sqrt((1+(2*ksiot4*rot1)^2)/((1-rot1^2)^2+(2*ksiot4*rot1)^2));
Got42=sqrt((1/((1-rot5^2)^2)));
Got51=rot1^2*sqrt((1+(2*ksiot5*rot1)^2)/((1-rot1^2)^2+(2*ksiot5*rot1)^2));
Got52=sqrt((1/((1-rot6^2)^2)));
Got61=rot1^2*sqrt((1+(2*ksiot6*rot1)^2)/((1-rot1^2)^2+(2*ksiot6*rot1)^2));
Got62=sqrt((1/((1-rot7^2)^2)));
fot1=dyot*Got12*(kot1*Got11+kot2*rot2^2);
fot2=dyot*Got22*(kot3*Got21+kot4*rot3^2);
fot3=dyot*Got32*(kot5*Got31+kot6*rot4^2);
fot4=dyot*Got42*(kot7*Got41+kot8*rot5^2);
fot5=dyot*Got52*(kot9*Got51+kot10*rot6^2);
fot6=dyot*Got62*(kot11*Got61+kot12*rot7^2);
fot=fot1+fot2+fot3+fot4+fot5+fot6;
aa1=aot1+Lot1*alfaot1+Lot3*alfaot2;
aa2=aot1-Lot2*alfaot1+Lot3*alfaot2;
aa3=aot1+Lot3*alfaot1+Lot3*alfaot2;
aa4=aot1+Lot1*alfaot1-Lot4*alfaot2;
aa5=aot1-Lot2*alfaot1-Lot4*alfaot2;
aa6=aot1+Lot3*alfaot1-Lot4*alfaot2;
AOT=aa1+aa2+aa3+aa4+aa5+aa6;
COT=fot/max(AOT);
FOT=AOT*COT;









