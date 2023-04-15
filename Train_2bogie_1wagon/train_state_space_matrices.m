

run tren_katsayi.m

Mtr=[mtr1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 mtr2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 mtr3 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 mtr4 0 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 mtr5 0 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 mtr6 0 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 mtr7 0 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 Jtr11 0 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 Jtr21 0 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 Jtr31 0 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 Jtr12 0 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 Jtr22 0 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 Jtr32 0 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 Jtr4 0 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 Jtr5 0 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 Jtr6 0;
     0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 Jtr7];

Ktr=[ktr1+ktr2+ktr3+ktr4 -ktr1-ktr2 -ktr3-ktr4 0 0 0 0 ktr1*Ltr1y1+ktr2*Ltr1y1-ktr3*Ltr1y2-ktr4*Ltr1y2 0 0 -ktr1*Ltr1x1+ktr2*Ltr1x2-ktr3*Ltr1x1+ktr4*Ltr1x2 ktr1*Ltr2x1-ktr2*Ltr2x2 ktr3*Ltr3x1-ktr4*Ltr3x2 0 0 0 0;
    -ktr1-ktr2 ktr1+ktr2+ktr5+ktr6+ktr7+ktr8 0 -ktr5-ktr6 -ktr7-ktr8 0 0 -ktr1*Ltr1y1-ktr2*Ltr1y1 ktr5*Ltr2y1+ktr6*Ltr2y1-ktr7*Ltr2y2-ktr8*Ltr2y2 0 ktr1*Ltr1x1-ktr2*Ltr1x2 -ktr1*Ltr2x1+ktr2*Ltr2x2-ktr5*Ltr2x1+ktr6*Ltr2x2-ktr7*Ltr2x1+ktr8*Ltr2x2 0 ktr5*Ltr4x1-ktr6*Ltr4x2 ktr7*Ltr5x1-ktr8*Ltr5x2 0 0;
    -ktr3-ktr4 0 ktr3+ktr4+ktr9+ktr10+ktr11+ktr12 0 0 -ktr9-ktr10 -ktr11-ktr12 ktr3*Ltr1y2+ktr4*Ltr1y2 0 ktr9*Ltr3y1+ktr10*Ltr3y1-ktr11*Ltr3y2-ktr12*Ltr3y2 ktr3*Ltr1x1-ktr4*Ltr1x2 0 -ktr3*Ltr3x1+ktr4*Ltr3x2-ktr9*Ltr3x1+ktr10*Ltr3x2-ktr11*Ltr3x1+ktr12*Ltr3x2 0 0 ktr9*Ltr6x1-ktr10*Ltr6x2 ktr11*Ltr7x1-ktr12*Ltr7x2;
     0 -ktr5-ktr6 0 ktr5+ktr6+ktr13+ktr14 0 0 0 0 -ktr5*Ltr2y1-ktr6*Ltr2y1 0 0 ktr5*Ltr2x1-ktr6*Ltr2x2 0 -ktr5*Ltr4x1+ktr6*Ltr4x2-ktr13*Ltr4x1+ktr14*Ltr4x2 0 0 0;
     0 -ktr7-ktr8 0 0 ktr7+ktr8+ktr15+ktr16 0 0 0 ktr7*Ltr2y2+ktr8*Ltr2y2 0 0 ktr7*Ltr2x1-ktr8*Ltr2x2 0 0 -ktr7*Ltr5x1+ktr8*Ltr5x2-ktr15*Ltr5x1+ktr16*Ltr5x2 0 0;
     0 0 -ktr9-ktr10 0 0 ktr9+ktr10+ktr17+ktr18 0 0 0 -ktr9*Ltr3y1-ktr10*Ltr3y1 0 0 ktr9*Ltr3x1-ktr10*Ltr3x2 0 0 -ktr9*Ltr6x1+ktr10*Ltr6x2-ktr17*Ltr6x1+ktr18*Ltr6x2 0;
     0 0 -ktr11-ktr12 0 0 0 ktr11+ktr12+ktr19+ktr20 0 0 ktr11*Ltr3y2+ktr12*Ltr3y2 0 0 ktr11*Ltr3x1-ktr12*Ltr3x2 0 0 0 -ktr11*Ltr7x1+ktr12*Ltr7x2-ktr19*Ltr7x1+ktr20*Ltr7x2;
     ktr1*Ltr1y1+ktr2*Ltr1y1-ktr3*Ltr1y2-ktr4*Ltr1y2 -ktr1*Ltr1y1-ktr2*Ltr1y1 ktr3*Ltr1y2+ktr4*Ltr1y2 0 0 0 0 ktr1*Ltr1y1^2+ktr2*Ltr1y1^2+ktr3*Ltr1y2^2+ktr4*Ltr1y2^2 0 0 -ktr1*Ltr1y1*Ltr1x1+ktr2*Ltr1y1*Ltr1x2+ktr3*Ltr1y2*Ltr1x1-ktr4*Ltr1y2*Ltr1x2 ktr1*Ltr1y1*Ltr2x1-ktr2*Ltr1y1*Ltr2x2 -ktr3*Ltr1y2*Ltr3x1+ktr4*Ltr1y2*Ltr3x2 0 0 0 0;
     0 ktr5*Ltr2y1+ktr6*Ltr2y1-ktr7*Ltr2y2-ktr8*Ltr2y2 0 -ktr5*Ltr2y1-ktr6*Ltr2y1 ktr7*Ltr2y2+ktr8*Ltr2y2 0 0 0 ktr5*Ltr2y1^2+ktr6*Ltr2y1^2+ktr7*Ltr2y2^2+ktr8*Ltr2y2^2 0 0 -ktr5*Ltr2y1*Ltr2x1+ktr6*Ltr2y1*Ltr2x2+ktr7*Ltr2y2*Ltr2x1-ktr8*Ltr2y2*Ltr2x2 0 ktr5*Ltr2y1*Ltr4x1-ktr6*Ltr2y1*Ltr4x2 -ktr7*Ltr2y2*Ltr5x1+ktr8*Ltr2y2*Ltr5x2 0 0;
     0 0 ktr9*Ltr3y1+ktr10*Ltr3y1-ktr11*Ltr3y2-ktr12*Ltr3y2 0 0 -ktr9*Ltr3y1-ktr10*Ltr3y1 ktr11*Ltr3y2+ktr12*Ltr3y2 0 0 ktr9*Ltr3y1^2+ktr10*Ltr3y1^2+ktr11*Ltr3y2^2+ktr12*Ltr3y2^2 0 0 -ktr9*Ltr3y1*Ltr3x1+ktr10*Ltr3y1*Ltr3x2+ktr11*Ltr3y2*Ltr3x1-ktr12*Ltr3y2*Ltr3x2 0 0 ktr9*Ltr3y1*Ltr6x1-ktr10*Ltr3y1*Ltr6x2 -ktr11*Ltr3y2*Ltr7x1+ktr12*Ltr3y2*Ltr7x2;
    -ktr1*Ltr1x1+ktr2*Ltr1x2-ktr3*Ltr1x1+ktr4*Ltr1x2 ktr1*Ltr1x1-ktr2*Ltr1x2 ktr3*Ltr1x1-ktr4*Ltr1x2 0 0 0 0 -ktr1*Ltr1x1*Ltr1y1+ktr2*Ltr1x2*Ltr1y1+ktr3*Ltr1x1*Ltr1y2-ktr4*Ltr1x2*Ltr1y2 0 0 ktr1*Ltr1x1^2+ktr2*Ltr1x2^2+ktr3*Ltr1x1^2+ktr4*Ltr1x2^2 -ktr1*Ltr1x1*Ltr2x1-ktr2*Ltr1x2*Ltr2x2 -ktr3*Ltr1x1*Ltr3x1-ktr4*Ltr1x2*Ltr3x2 0 0 0 0;
     ktr1*Ltr2x1-ktr2*Ltr2x2 -ktr1*Ltr2x1+ktr2*Ltr2x2-ktr5*Ltr2x1+ktr6*Ltr2x2-ktr7*Ltr2x1+ktr8*Ltr2x2 0 ktr5*Ltr2x1-ktr6*Ltr2x2 ktr7*Ltr2x1-ktr8*Ltr2x2 0 0 ktr1*Ltr2x1*Ltr1y1-ktr2*Ltr2x2*Ltr1y1 -ktr5*Ltr2x1*Ltr2y1+ktr6*Ltr2x2*Ltr2y1+ktr7*Ltr2x1*Ltr2y2-ktr8*Ltr2x2*Ltr2y2 0 -ktr1*Ltr2x1*Ltr1x1-ktr2*Ltr2x2*Ltr1x2 ktr1*Ltr2x1^2+ktr2*Ltr2x2^2+ktr5*Ltr2x1^2+ktr6*Ltr2x2^2+ktr7*Ltr2x1^2+ktr8*Ltr2x2^2 0 -ktr5*Ltr2x1*Ltr4x1-ktr6*Ltr2x2*Ltr4x2 -ktr7*Ltr2x1*Ltr5x1-ktr8*Ltr2x2*Ltr5x2 0 0;
     ktr3*Ltr3x1-ktr4*Ltr3x2 0 -ktr3*Ltr3x1+ktr4*Ltr3x2-ktr9*Ltr3x1+ktr10*Ltr3x2-ktr11*Ltr3x1+ktr12*Ltr3x2 0 0 ktr9*Ltr3x1-ktr10*Ltr3x2 ktr11*Ltr3x1-ktr12*Ltr3x2 -ktr3*Ltr3x1*Ltr1y2+ktr4*Ltr3x2*Ltr1y2 0 -ktr9*Ltr3x1*Ltr3y1+ktr10*Ltr3x2*Ltr3y1+ktr11*Ltr3x1*Ltr3y2-ktr12*Ltr3x2*Ltr3y2 -ktr3*Ltr3x1*Ltr1x1-ktr4*Ltr3x2*Ltr1x2 0 ktr3*Ltr3x1^2+ktr4*Ltr3x2^2+ktr9*Ltr3x1^2+ktr10*Ltr3x2^2+ktr11*Ltr3x1^2+ktr12*Ltr3x2^2 0 0 -ktr9*Ltr3x1*Ltr6x1-ktr10*Ltr3x2*Ltr6x2 -ktr11*Ltr3x1*Ltr7x1-ktr12*Ltr3x2*Ltr7x2;
     0 ktr5*Ltr4x1-ktr6*Ltr4x2 0 -ktr5*Ltr4x1+ktr6*Ltr4x2-ktr13*Ltr4x1+ktr14*Ltr4x2 0 0 0 0 ktr5*Ltr4x1*Ltr2y1-ktr6*Ltr4x2*Ltr2y1 0 0 -ktr5*Ltr4x1*Ltr2x1-ktr6*Ltr4x2*Ltr2x2 0 ktr5*Ltr4x1^2+ktr6*Ltr4x2^2+ktr13*Ltr4x1^2+ktr14*Ltr4x2^2 0 0 0;
     0 ktr7*Ltr5x1-ktr8*Ltr5x2 0 0 -ktr7*Ltr5x1+ktr8*Ltr5x2-ktr15*Ltr5x1+ktr16*Ltr5x2 0 0 0 -ktr7*Ltr5x1*Ltr2y2+ktr8*Ltr5x2*Ltr2y2 0 0 -ktr7*Ltr5x1*Ltr2x1-ktr8*Ltr5x2*Ltr2x2 0 0 ktr7*Ltr5x1^2+ktr8*Ltr5x2^2+ktr15*Ltr5x1^2+ktr16*Ltr5x2^2 0 0;
     0 0 ktr9*Ltr6x1-ktr10*Ltr6x2 0 0 -ktr9*Ltr6x1+ktr10*Ltr6x2-ktr17*Ltr6x1+ktr18*Ltr6x2 0 0 0 ktr9*Ltr6x1*Ltr3y1-ktr10*Ltr6x2*Ltr3y1 0 0 -ktr9*Ltr6x1*Ltr3x1-ktr10*Ltr6x2*Ltr3x2 0 0 ktr9*Ltr6x1^2+ktr10*Ltr6x2^2+ktr17*Ltr6x1^2+ktr18*Ltr6x2^2 0;
     0 0 ktr11*Ltr7x1-ktr12*Ltr7x2 0 0 0 -ktr11*Ltr7x1+ktr12*Ltr7x2-ktr19*Ltr7x1+ktr20*Ltr7x2 0 0 -ktr11*Ltr7x1*Ltr3y2+ktr12*Ltr7x2*Ltr3y2 0 0 -ktr11*Ltr7x1*Ltr3x1-ktr12*Ltr7x2*Ltr3x2 0 0 0 ktr11*Ltr7x1^2+ktr12*Ltr7x2^2+ktr19*Ltr7x1^2+ktr20*Ltr7x2^2];
 
Ctr=[ctr1+ctr2+ctr3+ctr4 -ctr1-ctr2 -ctr3-ctr4 0 0 0 0 ctr1*Ltr1y1+ctr2*Ltr1y1-ctr3*Ltr1y2-ctr4*Ltr1y2 0 0 -ctr1*Ltr1x1+ctr2*Ltr1x2-ctr3*Ltr1x1+ctr4*Ltr1x2 ctr1*Ltr2x1-ctr2*Ltr2x2 ctr3*Ltr3x1-ctr4*Ltr3x2 0 0 0 0;
    -ctr1-ctr2 ctr1+ctr2+ctr5+ctr6+ctr7+ctr8 0 -ctr5-ctr6 -ctr7-ctr8 0 0 -ctr1*Ltr1y1-ctr2*Ltr1y1 ctr5*Ltr2y1+ctr6*Ltr2y1-ctr7*Ltr2y2-ctr8*Ltr2y2 0 ctr1*Ltr1x1-ctr2*Ltr1x2 -ctr1*Ltr2x1+ctr2*Ltr2x2-ctr5*Ltr2x1+ctr6*Ltr2x2-ctr7*Ltr2x1+ctr8*Ltr2x2 0 ctr5*Ltr4x1-ctr6*Ltr4x2 ctr7*Ltr5x1-ctr8*Ltr5x2 0 0;
    -ctr3-ctr4 0 ctr3+ctr4+ctr9+ctr10+ctr11+ctr12 0 0 -ctr9-ctr10 -ctr11-ctr12 ctr3*Ltr1y2+ctr4*Ltr1y2 0 ctr9*Ltr3y1+ctr10*Ltr3y1-ctr11*Ltr3y2-ctr12*Ltr3y2 ctr3*Ltr1x1-ctr4*Ltr1x2 0 -ctr3*Ltr3x1+ctr4*Ltr3x2-ctr9*Ltr3x1+ctr10*Ltr3x2-ctr11*Ltr3x1+ctr12*Ltr3x2 0 0 ctr9*Ltr6x1-ctr10*Ltr6x2 ctr11*Ltr7x1-ctr12*Ltr7x2;
     0 -ctr5-ctr6 0 ctr5+ctr6+ctr13+ctr14 0 0 0 0 -ctr5*Ltr2y1-ctr6*Ltr2y1 0 0 ctr5*Ltr2x1-ctr6*Ltr2x2 0 -ctr5*Ltr4x1+ctr6*Ltr4x2-ctr13*Ltr4x1+ctr14*Ltr4x2 0 0 0;
     0 -ctr7-ctr8 0 0 ctr7+ctr8+ctr15+ctr16 0 0 0 ctr7*Ltr2y2+ctr8*Ltr2y2 0 0 ctr7*Ltr2x1-ctr8*Ltr2x2 0 0 -ctr7*Ltr5x1+ctr8*Ltr5x2-ctr15*Ltr5x1+ctr16*Ltr5x2 0 0;
     0 0 -ctr9-ctr10 0 0 ctr9+ctr10+ctr17+ctr18 0 0 0 -ctr9*Ltr3y1-ctr10*Ltr3y1 0 0 ctr9*Ltr3x1-ctr10*Ltr3x2 0 0 -ctr9*Ltr6x1+ctr10*Ltr6x2-ctr17*Ltr6x1+ctr18*Ltr6x2 0;
     0 0 -ctr11-ctr12 0 0 0 ctr11+ctr12+ctr19+ctr20 0 0 ctr11*Ltr3y2+ctr12*Ltr3y2 0 0 ctr11*Ltr3x1-ctr12*Ltr3x2 0 0 0 -ctr11*Ltr7x1+ctr12*Ltr7x2-ctr19*Ltr7x1+ctr20*Ltr7x2;
     ctr1*Ltr1y1+ctr2*Ltr1y1-ctr3*Ltr1y2-ctr4*Ltr1y2 -ctr1*Ltr1y1-ctr2*Ltr1y1 ctr3*Ltr1y2+ctr4*Ltr1y2 0 0 0 0 ctr1*Ltr1y1^2+ctr2*Ltr1y1^2+ctr3*Ltr1y2^2+ctr4*Ltr1y2^2 0 0 -ctr1*Ltr1y1*Ltr1x1+ctr2*Ltr1y1*Ltr1x2+ctr3*Ltr1y2*Ltr1x1-ctr4*Ltr1y2*Ltr1x2 ctr1*Ltr1y1*Ltr2x1-ctr2*Ltr1y1*Ltr2x2 -ctr3*Ltr1y2*Ltr3x1+ctr4*Ltr1y2*Ltr3x2 0 0 0 0;
     0 ctr5*Ltr2y1+ctr6*Ltr2y1-ctr7*Ltr2y2-ctr8*Ltr2y2 0 -ctr5*Ltr2y1-ctr6*Ltr2y1 ctr7*Ltr2y2+ctr8*Ltr2y2 0 0 0 ctr5*Ltr2y1^2+ctr6*Ltr2y1^2+ctr7*Ltr2y2^2+ctr8*Ltr2y2^2 0 0 -ctr5*Ltr2y1*Ltr2x1+ctr6*Ltr2y1*Ltr2x2+ctr7*Ltr2y2*Ltr2x1-ctr8*Ltr2y2*Ltr2x2 0 ctr5*Ltr2y1*Ltr4x1-ctr6*Ltr2y1*Ltr4x2 -ctr7*Ltr2y2*Ltr5x1+ctr8*Ltr2y2*Ltr5x2 0 0;
     0 0 ctr9*Ltr3y1+ctr10*Ltr3y1-ctr11*Ltr3y2-ctr12*Ltr3y2 0 0 -ctr9*Ltr3y1-ctr10*Ltr3y1 ctr11*Ltr3y2+ctr12*Ltr3y2 0 0 ctr9*Ltr3y1^2+ctr10*Ltr3y1^2+ctr11*Ltr3y2^2+ctr12*Ltr3y2^2 0 0 -ctr9*Ltr3y1*Ltr3x1+ctr10*Ltr3y1*Ltr3x2+ctr11*Ltr3y2*Ltr3x1-ctr12*Ltr3y2*Ltr3x2 0 0 ctr9*Ltr3y1*Ltr6x1-ctr10*Ltr3y1*Ltr6x2 -ctr11*Ltr3y2*Ltr7x1+ctr12*Ltr3y2*Ltr7x2;
    -ctr1*Ltr1x1+ctr2*Ltr1x2-ctr3*Ltr1x1+ctr4*Ltr1x2 ctr1*Ltr1x1-ctr2*Ltr1x2 ctr3*Ltr1x1-ctr4*Ltr1x2 0 0 0 0 -ctr1*Ltr1x1*Ltr1y1+ctr2*Ltr1x2*Ltr1y1+ctr3*Ltr1x1*Ltr1y2-ctr4*Ltr1x2*Ltr1y2 0 0 ctr1*Ltr1x1^2+ctr2*Ltr1x2^2+ctr3*Ltr1x1^2+ctr4*Ltr1x2^2 -ctr1*Ltr1x1*Ltr2x1-ctr2*Ltr1x2*Ltr2x2 -ctr3*Ltr1x1*Ltr3x1-ctr4*Ltr1x2*Ltr3x2 0 0 0 0;
     ctr1*Ltr2x1-ctr2*Ltr2x2 -ctr1*Ltr2x1+ctr2*Ltr2x2-ctr5*Ltr2x1+ctr6*Ltr2x2-ctr7*Ltr2x1+ctr8*Ltr2x2 0 ctr5*Ltr2x1-ctr6*Ltr2x2 ctr7*Ltr2x1-ctr8*Ltr2x2 0 0 ctr1*Ltr2x1*Ltr1y1-ctr2*Ltr2x2*Ltr1y1 -ctr5*Ltr2x1*Ltr2y1+ctr6*Ltr2x2*Ltr2y1+ctr7*Ltr2x1*Ltr2y2-ctr8*Ltr2x2*Ltr2y2 0 -ctr1*Ltr2x1*Ltr1x1-ctr2*Ltr2x2*Ltr1x2 ctr1*Ltr2x1^2+ctr2*Ltr2x2^2+ctr5*Ltr2x1^2+ctr6*Ltr2x2^2+ctr7*Ltr2x1^2+ctr8*Ltr2x2^2 0 -ctr5*Ltr2x1*Ltr4x1-ctr6*Ltr2x2*Ltr4x2 -ctr7*Ltr2x1*Ltr5x1-ctr8*Ltr2x2*Ltr5x2 0 0;
     ctr3*Ltr3x1-ctr4*Ltr3x2 0 -ctr3*Ltr3x1+ctr4*Ltr3x2-ctr9*Ltr3x1+ctr10*Ltr3x2-ctr11*Ltr3x1+ctr12*Ltr3x2 0 0 ctr9*Ltr3x1-ctr10*Ltr3x2 ctr11*Ltr3x1-ctr12*Ltr3x2 -ctr3*Ltr3x1*Ltr1y2+ctr4*Ltr3x2*Ltr1y2 0 -ctr9*Ltr3x1*Ltr3y1+ctr10*Ltr3x2*Ltr3y1+ctr11*Ltr3x1*Ltr3y2-ctr12*Ltr3x2*Ltr3y2 -ctr3*Ltr3x1*Ltr1x1-ctr4*Ltr3x2*Ltr1x2 0 ctr3*Ltr3x1^2+ctr4*Ltr3x2^2+ctr9*Ltr3x1^2+ctr10*Ltr3x2^2+ctr11*Ltr3x1^2+ctr12*Ltr3x2^2 0 0 -ctr9*Ltr3x1*Ltr6x1-ctr10*Ltr3x2*Ltr6x2 -ctr11*Ltr3x1*Ltr7x1-ctr12*Ltr3x2*Ltr7x2;
     0 ctr5*Ltr4x1-ctr6*Ltr4x2 0 -ctr5*Ltr4x1+ctr6*Ltr4x2-ctr13*Ltr4x1+ctr14*Ltr4x2 0 0 0 0 ctr5*Ltr4x1*Ltr2y1-ctr6*Ltr4x2*Ltr2y1 0 0 -ctr5*Ltr4x1*Ltr2x1-ctr6*Ltr4x2*Ltr2x2 0 ctr5*Ltr4x1^2+ctr6*Ltr4x2^2+ctr13*Ltr4x1^2+ctr14*Ltr4x2^2 0 0 0;
     0 ctr7*Ltr5x1-ctr8*Ltr5x2 0 0 -ctr7*Ltr5x1+ctr8*Ltr5x2-ctr15*Ltr5x1+ctr16*Ltr5x2 0 0 0 -ctr7*Ltr5x1*Ltr2y2+ctr8*Ltr5x2*Ltr2y2 0 0 -ctr7*Ltr5x1*Ltr2x1-ctr8*Ltr5x2*Ltr2x2 0 0 ctr7*Ltr5x1^2+ctr8*Ltr5x2^2+ctr15*Ltr5x1^2+ctr16*Ltr5x2^2 0 0;
     0 0 ctr9*Ltr6x1-ctr10*Ltr6x2 0 0 -ctr9*Ltr6x1+ctr10*Ltr6x2-ctr17*Ltr6x1+ctr18*Ltr6x2 0 0 0 ctr9*Ltr6x1*Ltr3y1-ctr10*Ltr6x2*Ltr3y1 0 0 -ctr9*Ltr6x1*Ltr3x1-ctr10*Ltr6x2*Ltr3x2 0 0 ctr9*Ltr6x1^2+ctr10*Ltr6x2^2+ctr17*Ltr6x1^2+ctr18*Ltr6x2^2 0;
     0 0 ctr11*Ltr7x1-ctr12*Ltr7x2 0 0 0 -ctr11*Ltr7x1+ctr12*Ltr7x2-ctr19*Ltr7x1+ctr20*Ltr7x2 0 0 -ctr11*Ltr7x1*Ltr3y2+ctr12*Ltr7x2*Ltr3y2 0 0 -ctr11*Ltr7x1*Ltr3x1-ctr12*Ltr7x2*Ltr3x2 0 0 0 ctr11*Ltr7x1^2+ctr12*Ltr7x2^2+ctr19*Ltr7x1^2+ctr20*Ltr7x2^2];
 
AAtr=[zeros(17) eye(17);
    -inv(Mtr)*Ktr -inv(Mtr)*Ctr];

BBtr=[zeros(20,8);
     ktr13/mtr4 ktr14/mtr4 0 0 0 0 0 0;
     0 0 ktr15/mtr5 ktr16/mtr5 0 0 0 0;
     0 0 0 0 ktr17/mtr6 ktr18/mtr6 0 0;
     0 0 0 0 0 0 ktr19/mtr7 ktr20/mtr7;
     zeros(6,8);
     -ktr13*Ltr4x1/Jtr4 ktr14*Ltr4x2/Jtr4 0 0 0 0 0 0;
     0 0 -ktr15*Ltr5x1/Jtr5 ktr16*Ltr5x2/Jtr5 0 0 0 0;
     0 0 0 0 -ktr17*Ltr6x1/Jtr6 ktr18*Ltr6x2/Jtr6 0 0;
     0 0 0 0 0 0 -ktr19*Ltr7x1/Jtr7 ktr20*Ltr7x2/Jtr7];
 
 CCtr=zeros(1,34);
 CCtr(1,1)=1;
 
% CCtr=[eye(17) zeros(17)];
 DDtr=[zeros(1,8)];
   
