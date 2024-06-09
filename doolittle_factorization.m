n = 6; 
A=rand(n,n)+n*eye(n);
L=zeros(n,n); U=L;

for k=1:n
    L(k,k)=1;
    for j=k:n
        U(k,j)=A(k,j);
        for s=1:k-1
            U(k,j) = U(k,j)- L(k,s)*U(s,j);
        end
    end
    for i=k+1:n
        L(i,k)=A(i,k);
        for s=1:k-1
            L(i,k) = L(i,k)-L(i,s)*U(s,k);
        end
        L(i,k)=L(i,k)/U(k,k);
    end
end

disp(A);
disp(L);
disp(U);
