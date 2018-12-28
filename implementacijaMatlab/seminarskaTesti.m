% ukazi za izpis in izris potrebnega za pripravo seminarske naloge
% na temo ravninskih krivulj s pitagorejskim hodogramom

% izris ravninske krivulje s pitagorejskim hodogramom za enaki funkciji
u1 = [-1 7 -2 -1]; v1 = [3 1 0 -4];
u2 = power2bernstein([0, bernstein2power(u1)]);
v2 = power2bernstein([0, bernstein2power(v1)]);
x0 = 0; y0 = 0;
t = 0:0.01:1;
B1 = ravninskaKrivuljaPH(u1, v1, x0, y0);
B2 = ravninskaKrivuljaPH(u2, v2, x0, y0);
% plotbezier(B1, t, true); hold on;
% plotbezier(B2, t, true);

% parametricna hitrost (v t)
t1 = 0.2;
parSpeedPH(u1,v1,t1);
parSpeedPH(u2,v1,t1); % obe krivulji sta enako parametrizirani

% dolzina loka (od a do b)
a = 0; b = 1;
dolzinaPH(u1,v1,a,b);

% izris s pikcami, kjer je konstanten korak po t ali po s
N = 100;
% konstantnen \Delta t
b = bezier(B1,0:1/N:1);
plot(b(1,:),b(2,:),'.'); hold on;
% konstanten \Delta s
b = bezier(B1,naravnaParametrizacijaPH(N,u1,v1,30));
plot(b(1,:),b(2,:),'.')

% tangenta, normala in ukrivljenost v t
t1 = 0.2; t2 = 0.7;
p1 = bezier(B1,t1);
p2 = bezier(B1,t2);
% tangenti v dveh tockah
tan1 = tangentaPH(u1,v1,t1)*parSpeedPH(u1,v1,t1)/5;
plot([p1(1) (p1(1)+tan1(1))],[p1(2) (p1(2)+tan1(2))])
tan2 = tangentaPH(u1,v1,t2)*parSpeedPH(u1,v1,t2)/5;
plot([p2(1) (p2(1)+tan2(1))],[p2(2) (p2(2)+tan2(2))])
% normala v dveh tockah
norm1 = normalaPH(u1,v1,t1);
plot([p1(1) (p1(1)+norm1(1))],[p1(2) (p1(2)+norm1(2))])
norm2 = normalaPH(u1,v1,t2);
plot([p2(1) (p2(1)+norm2(1))],[p2(2) (p2(2)+norm2(2))])
% ukrivljenost v dveh tockah
ukrivljenostPH(u1,v1,t1);
ukrivljenostPH(u1,v1,t2);

% izris razlicnih odmikov od iste krivulje
plotrodmikPH(u1,v1,x0,y0,t,-0.2:0.1:0.1)
