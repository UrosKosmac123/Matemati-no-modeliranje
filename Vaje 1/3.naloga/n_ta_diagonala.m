function rez = n_ta_diagonala(n, a, d)

mat_iz_a = a * ones(n);
rez = triu(mat_iz_a, d) - triu(mat_iz_a, d + 1)

