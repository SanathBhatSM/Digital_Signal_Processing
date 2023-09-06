%Matlab program to verify 
%the properties of convolution

clc
clear all
close all

x1=input('Enter the first sequence')
x2=input('Enter the second sequence')
x3=input('Enter the third sequence')

%Commutative Property
%x1 conv x2=x2 conv x1

lhs1=conv(x1,x2)
rhs1=conv(x2,x1)

if(lhs1==rhs1)
    disp('Commutative Property Is Satisfied')
else
    disp('Commutative Property Is Not Satisfied')
end

%Associative Property
%(x1 conv x2) conv x3 = x1 conv (x2 conv x3)
lhs2=conv(conv(x1,x2),x3)
rhs2=conv(x1,conv(x2,x3))

if(lhs2==rhs2)
    disp('Associative Property Is Satisfied')
else
    disp('Associative Property Is Not Satisfied')
end

%Distributive Property
%x1 conv (x2+x3) = (x1 conv x2) + (x1 conv x3)
lhs3=conv(x1,x2+x3)
rhs3=conv(x1,x2)+conv(x1,x3)

if(lhs3==rhs3)
    disp('Distributive Property Is Satisfied')
else
    disp('Distributive Property Is Not Satisfied')
end




