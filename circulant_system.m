C = [5 2 1 1 2 1; 
     1 5 2 1 1 2;
     2 1 5 2 1 1; 
     1 2 1 5 2 1;
     1 1 2 1 5 2;
     2 1 1 2 1 5]; % circulant matrix 
b = [3 6 3 6 3 6]';

% solve Cx=b; 
% e=vector contains All eigenvlaues;
% [5 1 2 1 1 2]' = first column of C;

fb = fft(b);
e = fft([5 1 2 1 1 2]'); 
x = fb./e;
x = ifft(x);

disp(x); % solution