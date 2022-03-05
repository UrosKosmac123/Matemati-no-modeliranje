function rez = odvod(p)
% p = [a_0, ..., a_(n-1), a_n]

n = length(p);
A = 1:n ;
p_nov = p([1:(n-1)]) ;
rez = A(2:n) .* p_nov