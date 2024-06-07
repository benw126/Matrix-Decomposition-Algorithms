n = 3;
A=rand(n,n); 
A=(A+A')/2 + n*eye(n); 
L=zeros(n,n);

for k=1:n
    L(k,k)=A(k,k);
    for s=1:k-1
        L(k,k)=L(k,k)-L(k,s)^2;
    end
    L(k,k)=L(k,k)^0.5;
    for i=k+1:n
        L(i,k)=A(i,k);
        for s=1:k-1
            L(i,k) = L(i,k)-L(i,s)*L(k,s);
        end
        L(i,k)=L(i,k)/L(k,k);
    end    
end

disp(A);
disp(L);