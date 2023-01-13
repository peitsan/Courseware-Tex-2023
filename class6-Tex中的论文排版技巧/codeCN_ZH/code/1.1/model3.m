function q=model3(p,a1,a2,r,d)
x=p(1);
l=p(2);
q=[r/sind(a2)-l/sind(d+a2-x);
r/sind(a1)-l/sind(a1-x)];