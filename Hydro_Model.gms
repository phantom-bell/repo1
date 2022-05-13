Set
   t 'hours'         / t1*t96 /
   i 'plant'         /p1/

Table gendata(i,*) 'generator cost characteristics and limits'
           Pmin  Pmax      RU   RD
   p1      0     1325.00   300  300;

Parameter demand(t)/
t1         25.9
t2         25.9
t3         25.9
t4         25.9
t5         25.9
t6         25.9
t7         25.9
t8         25.9
t9         25.9
t10        25.9
t11        25.9
t12        25.9
t13        0
t14        0
t15        0
t16        0
t17        0
t18        0
t19        0
t20        0
t21        0
t22        0
t23        0
t24        0
t25        0
t26        0
t27        261
t28        261
t29        261
t30        261
t31        261
t32        261
t33        0
t34        0
t35        0
t36        0
t37        0
t38        0
t39        0
t40        0
t41        0
t42        0
t43        127
t44        127
t45        127
t46        127
t47        127
t48        127
t49        127
t50        127
t51        127
t52        127
t53        127
t54        127
t55        127
t56        127
t57        127
t58        127
t59        127
t60        127
t61        127
t62        127
t63        388
t64        388
t65        388
t66        388
t67        388
t68        388
t69        388
t70        388
t71        261
t72        261
t73        0
t74        0
t75        0
t76        0
t77        261
t78        261
t79        261
t80        261
t81        261
t82        261
t83        261
t84        261
t85        0
t86        0
t87        0
t88        0
t89        261
t90        261
t91        261
t92        261
t93        0
t94        0
t95        0
t96        0
/
price(t)/
t1         12000
t2         12000
t3         12000
t4         12000
t5         12000
t6         12000
t7         12000
t8         12000
t9         12000
t10        12000
t11        12000
t12        12000
t13        12000
t14        12000
t15        12000
t16        12000
t17        12000
t18        12000
t19        12000
t20        12000
t21        12000
t22        12000
t23        12000
t24        12000
t25        10137
t26        10337
t27        10347
t28        10117
t29        10046
t30        11352.67
t31        10300.72
t32        10299.93
t33        8440.82
t34        8607.39
t35        8440.57
t36        4152
t37        4876
t38        5428
t39        5617
t40        3826
t41        6180
t42        5695
t43        6035
t44        6408
t45        5702
t46        4407
t47        4611
t48        3833
t49        5974
t50        4663
t51        4943
t52        6495
t53        6193
t54        4666
t55        3799
t56        5136
t57        4420
t58        3843
t59        3790
t60        6429
t61        11088.88
t62        11024.31
t63        11100.97
t64        11105
t65        11189.72
t66        11343.62
t67        10121
t68        10228
t69        10300
t70        10189
t71        10338
t72        10030
t73        10203
t74        10455
t75        10498
t76        12000
t77        12000
t78        12000
t79        12000
t80        12000
t81        12000
t82        12000
t83        12000
t84        12000
t85        12000
t86        12000
t87        12000
t88        12000
t89        12000
t90        12000
t91        12000
t92        12000
t93        12000
t94        12000
t95        12000
t96        12000
/

in(t) inflow /
t1         0.070
t2         0.070
t3         0.070
t4         0.070
t5         0.069
t6         0.069
t7         0.069
t8         0.069
t9         0.068
t10        0.068
t11        0.068
t12        0.068
t13        0.067
t14        0.067
t15        0.067
t16        0.067
t17        0.066
t18        0.066
t19        0.066
t20        0.066
t21        0.066
t22        0.066
t23        0.000
t24        0.000
t25        0.000
t26        0.000
t27        0.000
t28        0.000
t29        0.000
t30        0.000
t31        0.066
t32        0.066
t33        0.062
t34        0.062
t35        0.062
t36        0.062
t37        0.064
t38        0.064
t39        0.064
t40        0.064
t41        0.059
t42        0.059
t43        0.059
t44        0.059
t45        0.060
t46        0.060
t47        0.060
t48        0.060
t49        0.057
t50        0.057
t51        0.057
t52        0.057
t53        0.056
t54        0.056
t55        0.056
t56        0.056
t57        0.057
t58        0.057
t59        0.057
t60        0.057
t61        0.057
t62        0.057
t63        0.057
t64        0.057
t65        0.059
t66        0.059
t67        0.059
t68        0.059
t69        0.060
t70        0.060
t71        0.060
t72        0.060
t73        0.062
t74        0.062
t75        0.062
t76        0.062
t77        0.062
t78        0.062
t79        0.062
t80        0.062
t81        0.066
t82        0.066
t83        0.066
t84        0.066
t85        0.065
t86        0.065
t87        0.065
t88        0.065
t89        0.064
t90        0.064
t91        0.064
t92        0.064
t93        0.065
t94        0.065
t95        0.065
t96        0.065

/
;


 Variable
Z         'objective (revenue)'  ;
positive variable
p(i,t)      'power generated by hydro power plant'
Q(t) 'Discharge at time t'
HI(t) 'Initital Head'
HF(t) 'Final Head'
SI(t) 'storage initial'
SF(t) 'Storage final'
out(t) 'outflow'

;


p.up(i,t) = gendata(i,"Pmax");
p.lo(i,t) = gendata(i,"Pmin");
HI.lo(t) = 1530;
HI.up(t) = 1590;
HF.lo(t) =1530;
HF.up(t) =1590;
SI.lo(t) = 0;
SI.up(t) = 6.41;
SF.lo(t) =0;
SF.up(t) =6.41;
Q.lo(t)=0;
**Q.up(t)=100;








Equation obj,cons1,cons2,cons3,cons4,cons5,cons6,cons7,cons8,cons9,cons10,cons11,cons12,cons13,cons14,cons15,balance;
obj..                    Z =e= sum((t,i), (p(i,t)*price(t)));
cons1(i,t)..             p(i,t+1) - p(i,t) =l= gendata(i,'RU');
cons2(i,t)..             p(i,t-1) - p(i,t) =l= gendata(i,'RD');
cons3(i,t)$(ord(t)>1)..  p(i,t)/((0.00734*HI(t)))=e=Q(t);
cons4(t)$(ord(t)>1)..    HI(t)=e=HF(t-1);
cons5(t)$(ord(t)>1)..    SI(t)=e=SI(t-1)+in(t-1)-out(t-1);
cons6(t)..               SF(t)=e=SI(t)+in(t-1)-out(t);
cons7(t)$(ord(t)>1)..    out(t)=e=((Q(t)*900)/(1000000)) ;
cons8..                  HI("T1")=e=1575.70 ;
cons9(t)$(ord(t)=1)..    SI("T1")=e=3.20;
cons10(i,t)$(ord(t)=1).. p(i,t)=e=26.21 ;
cons11(t)$(ord(t)=1)..   out(t)=e=0.01;
cons12..                 HF('t1')=e=1576.09;
cons13(t)$(ord(t)>1)..   HF(t)=e=0.429*(SF(t)**3)-5.278*(SF(t)**2)+(25.31*SF(t))+1535.80;
cons14(t)$(ord(t)=1)..   Q(t)=e=3.67;
cons15(t)$(ord(t)=1)..   in(t)=e=0.07;


balance(t)$(ord(t)>1)..  sum(i, p(i,t))=g= 1.012*demand(t);



Model Hydro / all /;
Solve Hydro using NLP maximizing Z

*Display  out.l,p.l,HF.l,HI.l,SI.l,SF.l,q.l

**= 19.06ln(x) + 1513.6

