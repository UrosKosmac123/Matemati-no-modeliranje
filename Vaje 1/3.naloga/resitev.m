n = 7

T = diag_iz_a(n, -4) + n_ta_diagonala(n, 1, 1) + n_ta_diagonala(n, 1, -1)

resitev = blkdiag(T, T) + n_ta_diagonala(2*n, 1, n) + n_ta_diagonala(2*n, -1, n)

a = 1:7

b = a(1:6)