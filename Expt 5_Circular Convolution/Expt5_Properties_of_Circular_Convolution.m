%Matlab program to verify 
%the properties of circular convolution

clc
clear all
close all

x1=input('Enter the first sequence')
x2=input('Enter the second sequence')
x3=input('Enter the third sequence')
N=input('Enter the length of Circular Convolution')

%Commutative Property
%x1 cconv x2=x2 cconv x1

lhs1=cconv(x1,x2,N)
rhs1=cconv(x2,x1,N)

if(lhs1==rhs1)
    disp('Commutative Property Is Satisfied')
else
    disp('Commutative Property Is Not Satisfied')
end

%Associative Property
%(x1 cconv x2) cconv x3 = x1 cconv (x2 cconv x3)
lhs2=cconv(cconv(x1,x2,N),x3,N)
rhs2=cconv(x1,cconv(x2,x3,N),N)

if(lhs2==rhs2)
    disp('Associative Property Is Satisfied')
else
    disp('Associative Property Is Not Satisfied')
end

%Distributive Property
%x1 cconv (x2+x3) = (x1 cconv x2) + (x1 cconv x3)
lhs3=cconv(x1,x2+x3,N)
rhs3=cconv(x1,x2,N)+cconv(x1,x3,N)

if(lhs3==rhs3)
    disp('Distributive Property Is Satisfied')
else
    disp('Distributive Property Is Not Satisfied')
end




