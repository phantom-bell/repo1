
Sets g generators /G1*G2/
     n buses      /N1*N3/
     d demands    /D1*D2/

alias (n,m)

sets
MapN(n,n) Network Toplology/
N1.N2
N1.N3
N2.N3
N2.N1
N3.N1
N3.N2/

MapG(g,n) Location of Generators/
G1.N1
G2.N2
/

MapD(d,n) Location of Demands/
D1.N2
D2.N3
/;


Parameter PGmax (g) Capacity of Generators[MW]/
G1 100
G2 80
/;

Parameter C(g) Offer Price of Generators[Rs per MWh]/
G1 12
G2 20
/;

Parameter L(d) Maximum load of Demand[MW]/
D1 100
D2 50
/;

Parameter U(d)  Price of Utility [Rs per MWh]/
D1 40
D2 35
/;

Table Fmax(n,n) Capacity of Transmission Line in MW
     N1    N2    N3
N1   0     100   100
N2   100   0     100
N3   100   100   0
;

Table b(n,n) SUSCEPTANCE of Transmission Line in MW
     N1    N2    N3
N1   0     500   500
N2   500   0     500
N3   500   500   0
;


free variable
MS     Market Surplus[Rs]
f(n,m) Power Flow from bus n to m[MW]
theta(n) Voltage angle of bus n[rad.];

Positive variable

p_D(d) Consumption level of demand d [MW]
p_G(g) Production level of Generator g[MW]  ;


Equations
obj, cons1,cons2,cons3,cons4,cons5,cons6;

obj..           MS          =e= sum(d,U(d)*p_D(d))-sum(g,C(g)*p_G(g) );
cons1(g)..      p_G(g)      =l=PGmax(g);
cons2(d)..      p_D(d)      =l=L(d);
***Transmission limits of line from bus n to m

cons3(n,m)..    f(n,m)      =e=B(n,m)*(theta(n) -theta(m));
cons4(n,m)..    f(n,m)      =l=Fmax(n,m);
cons5..         theta('N1') =e=0;
******************power flow equation************
**it will give you nodal price
cons6(n)..     -sum(g$MapG(g,n),p_G(g))+sum(d$MapD(d,n),p_D(d))
               +sum(m$MapN(n,m),f(n,m))=e=0;

Model Market_Clearing /all/;
Solve Market_Clearing using lp maximizing MS;
Display MS.l,p_G.l,p_D.l,f.l,cons6.m;




