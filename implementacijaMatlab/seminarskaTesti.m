% ukazi za izpis in izris potrebnega za pripravo seminarske naloge
% na temo ravninskih krivulj s pitagorejskim hodogramom

% izris ravninske krivulje s pitagorejskim hodogramom za enaki funkciji
u1 = [1 2]; v1 = [3 1];
u2 = power2bernstein([0, bernstein2power(u1)]);
v2 = power2bernstein([0, bernstein2power(v1)]);
x0 = 0; y0 = 0;
t = 0:0.01:1;
B1 = ravninskaKrivuljaPH(u1, v1, x0, y0);
B2 = ravninskaKrivuljaPH(u2, v2, x0, y0);
plotbezier(B1, t, true); hold on;
plotbezier(B2, t, true);

% parametricna hitrost (v t)

% dolzina loka (od a do b)

% izris s krogci, kjer je konstanten korak po t ali po s

% izris razlicnih odmikov od iste krivulje
