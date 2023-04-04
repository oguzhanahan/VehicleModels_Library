wnox1=10^(-0.0009);
wnox2=10^(1.0447);
wnox3=10^(1.0595);
wnox4=10^(0.9970);
wnox5=10^(0.0583);
wnot1=10^(0.0052);
wnot2=10^(0.0052);
ckro1=2*mo1*(wnox1*2*pi);
ksio1=(co1)/ckro1;
ksio2=(co3)/ckro1;
ksio3=(co5)/ckro1;
ksio4=(co7)/ckro1;
ro1=wo/wnox1;
ro2=wo/wnox2;
ro3=wo/wnox3;
ro4=wo/wnox4;
ro5=wo/wnox5;
Go11=ro1^2*sqrt((1+(2*ksio1*ro1)^2)/((1-ro1^2)^2+(2*ksio1*ro1)^2));
Go12=sqrt((1/((1-ro2^2)^2)));
Go21=ro1^2*sqrt((1+(2*ksio2*ro1)^2)/((1-ro1^2)^2+(2*ksio1*ro1)^2));
Go22=sqrt((1/((1-ro3^2)^2)));
Go31=ro1^2*sqrt((1+(2*ksio3*ro1)^2)/((1-ro1^2)^2+(2*ksio1*ro1)^2));
Go32=sqrt((1/((1-ro4^2)^2)));
Go41=ro1^2*sqrt((1+(2*ksio4*ro1)^2)/((1-ro1^2)^2+(2*ksio1*ro1)^2));
Go42=sqrt((1/((1-ro5^2)^2)));
fo1=dy*Go12*(ko1*Go11+ko2*ro2^2);
fo2=dy*Go22*(ko3*Go21+ko4*ro3^2);
fo3=dy*Go32*(ko5*Go31+ko6*ro4^2);
fo4=dy*Go42*(ko7*Go41+ko8*ro5^2);
fo=fo1+fo2+fo3+fo4;
aa1=a1+lo1*alfa1+lo3*alfa2;
aa2=a1-lo2*alfa1+lo3*alfa2;
aa3=a1+lo1*alfa1-lo4*alfa2;
aa4=a1-lo2*alfa1-lo4*alfa2;
A=aa1+aa2+aa3+aa4;
C=fo/max(A);
FO=A*C;





