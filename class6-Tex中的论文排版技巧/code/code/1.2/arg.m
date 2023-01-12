%已知发射机和接收机的编号得出 a1,a2,a3角度
%item(i) i=1 2 3分别指FY_i,FY_j,FY_k(接收机)
function [a1,a2,a3]=arg(item)
F_i=min(item(1:2));
F_j=max(item(1:2));
F_k=item(3);
d_a1=(max(F_k,F_i)-min(F_k,F_i))*40;
if d_a1>180
    d_a1=360-d_a1;
end
a1=(180-d_a1)/2;
d_a2=(max(F_k,F_j)-min(F_k,F_j))*40;
if d_a2>180
    d_a2=360-d_a2;
end
a2=(180-d_a2)/2;
d_a3=(F_j-F_i)*40;
if F_k<F_j &&F_k>F_i&&d_a3<180
    a3=180-d_a3/2;
elseif F_k<F_j &&F_k>F_i&&d_a3>180
    d_a3=360-d_a3;
    a3=d_a3/2;
elseif (F_k>F_j||F_k<F_i)&&d_a3<180
    a3=d_a3/2;
else
    d_a3=360-d_a3;
    a3=180-d_a3/2;
end
end
