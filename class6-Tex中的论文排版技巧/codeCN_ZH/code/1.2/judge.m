%调整解集至合理位置
function output=judge(out)
if out(2)<0
    output(1)=180+out(1);
    output(2)=-out(2);
else 
    output=out;
end