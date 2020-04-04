clc;clear;close all;
%a=imread('cameraman.tif');
a=[0 0 0 0; 0 0 7 8 ;9 10 0 1; 0 2 0 0];
b=dct2(a);
[row,col]=size(b);
y=round(b);
[row,col]=size(y);
% y=[1 2 6 7; 3 5 8 13 ;4 9 12 14; 10 11 15 16];
% [row,col]=size(y);
final=zeros(row*col);
t=1;
final(1)=y(1,1);
t=t+1;
ii=1;
jj=2;
p=2;
q=1;
%%zig zag path 
while t~=row*col+1
    final(t)=y(ii,jj);
        
        if(jj~=1&& ii~=row)
            jj=jj-1;
            ii=ii+1;
        elseif(jj==1 && ii<row)
            y=y';
            ii=1;
            p=p+1;
            jj=p;
            
            
        elseif(ii==row)
            y=y';
            q=q+1;
            ii=q;
            jj=col;
        else
            ii=row;
            jj=col;
            
        end    
    t=t+1;
end
final=final(:,1);
s=1;
t=1;
p=[];
%%
for ii=2:16
    if(final(t)==final(ii))
        s=s+1;
    else
    
        p=[p s];
      
        p=[p final(t)];
        
        t=ii;
    end
end
if(final(ii-1)~=final(ii))
   
    p=[p 1];
    
    p=[p final(ii)];

end 


