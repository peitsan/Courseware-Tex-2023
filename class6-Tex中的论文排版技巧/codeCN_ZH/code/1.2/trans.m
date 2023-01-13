%输出角度
function out=trans(x,flag,item)
if flag==0
    out=(item(1)-1)*40+x;
else 
    out=(item(2)-1)*40+x;
end
if out>=360
    out=out-360;
elseif out<0
    out=out+360;
end
if abs(out-360)<1e-4||abs(out)<1e-4 %浮点输出限制
    out=0;
end