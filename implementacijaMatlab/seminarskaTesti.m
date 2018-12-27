% ukazi za izpis in izris potrebnega za pripravo seminarske naloge
% na temo ravninskih krivulj s pitagorejskim hodogramom

% izris ravninske krivulje s pitagorejskim hodogramom za enaki funkciji
u1 = [1 2 6]; v1 = [1 0 -4];
u2 = power2bernstein([0, bernstein2power(u1)]);
v2 = power2bernstein([0, bernstein2power(v1)]);
x0 = 0; y0 = 0;
t = 0:0.01:1;
B1 = ravninskaKrivuljaPH(u1, v1, x0, y0);
B2 = ravninskaKrivuljaPH(u2, v2, x0, y0);
plotbezier(B1, t, true); hold on;
plotbezier(B2, t, true);

% parametricna hitrost (v t)
t1 = 0.2;
parSpeedPH(u1,v1,t1);
parSpeedPH(u2,v1,t1); % obe krivulji sta enako parametrizirani

% dolzina loka (od a do b)
a = 0; b = 1;
dolzinaPH(u1,v1,a,b)

% izris s krogci, kjer je konstanten korak po t ali po s
% konstantnen \Delta t
b = bezier(B1,0:0.1:1);
plot(b(1,:),b(2,:),'s')
% konstanten \Delta s
b = bezier(B1,naravnaParametrizacijaPH(10,u1,v1,5));
plot(b(1,:),b(2,:),'s')

% izris razlicnih odmikov od iste krivulje
