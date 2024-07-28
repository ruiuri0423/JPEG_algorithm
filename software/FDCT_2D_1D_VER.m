function dct_out = FDCT_2D_1D_VER(input)
    
    size = 8;
    basis = DCT_1D_BASIS(size);
    dct_out = zeros(size);
    
    even_1 = [(( 1) * input(1, 1) + ( 1) * input(1, 8)), (( 1) * input(2, 2) + ( 1) * input(2, 7)), (( 1) * input(3, 3) + ( 1) * input(3, 6)), (( 1) * input(4, 4) + ( 1) * input(4, 5)), (( 1) * input(5, 5) + ( 1) * input(5, 4)), (( 1) * input(6, 6) + ( 1) * input(6, 3)), (( 1) * input(7, 7) + ( 1) * input(7, 2)), (( 1) * input(8, 8) + ( 1) * input(8, 1))];
    even_3 = [(( 1) * input(1, 2) + ( 1) * input(1, 7)), (( 1) * input(2, 5) + ( 1) * input(2, 4)), (( 1) * input(3, 8) + ( 1) * input(3, 1)), (( 1) * input(4, 3) + ( 1) * input(4, 6)), (( 1) * input(5, 6) + ( 1) * input(5, 3)), (( 1) * input(6, 1) + ( 1) * input(6, 8)), (( 1) * input(7, 4) + ( 1) * input(7, 5)), (( 1) * input(8, 7) + ( 1) * input(8, 2))];
    even_5 = [(( 1) * input(1, 3) + ( 1) * input(1, 6)), (( 1) * input(2, 8) + ( 1) * input(2, 1)), (( 1) * input(3, 5) + ( 1) * input(3, 4)), (( 1) * input(4, 2) + ( 1) * input(4, 7)), (( 1) * input(5, 7) + ( 1) * input(5, 2)), (( 1) * input(6, 4) + ( 1) * input(6, 5)), (( 1) * input(7, 1) + ( 1) * input(7, 8)), (( 1) * input(8, 6) + ( 1) * input(8, 3))];
    even_7 = [(( 1) * input(1, 4) + ( 1) * input(1, 5)), (( 1) * input(2, 3) + ( 1) * input(2, 6)), (( 1) * input(3, 2) + ( 1) * input(3, 7)), (( 1) * input(4, 1) + ( 1) * input(4, 8)), (( 1) * input(5, 8) + ( 1) * input(5, 1)), (( 1) * input(6, 7) + ( 1) * input(6, 2)), (( 1) * input(7, 6) + ( 1) * input(7, 3)), (( 1) * input(8, 5) + ( 1) * input(8, 4))];
    odd_1  = [(( 1) * input(1, 1) + (-1) * input(1, 8)), (( 1) * input(2, 2) + (-1) * input(2, 7)), (( 1) * input(3, 3) + (-1) * input(3, 6)), (( 1) * input(4, 4) + (-1) * input(4, 5)), (( 1) * input(5, 5) + (-1) * input(5, 4)), (( 1) * input(6, 6) + (-1) * input(6, 3)), (( 1) * input(7, 7) + (-1) * input(7, 2)), (( 1) * input(8, 8) + (-1) * input(8, 1))];
    odd_3  = [(( 1) * input(1, 2) + (-1) * input(1, 7)), (( 1) * input(2, 5) + (-1) * input(2, 4)), (( 1) * input(3, 8) + (-1) * input(3, 1)), ((-1) * input(4, 3) + ( 1) * input(4, 6)), ((-1) * input(5, 6) + ( 1) * input(5, 3)), (( 1) * input(6, 1) + (-1) * input(6, 8)), (( 1) * input(7, 4) + (-1) * input(7, 5)), (( 1) * input(8, 7) + (-1) * input(8, 2))];
    odd_5  = [(( 1) * input(1, 3) + (-1) * input(1, 6)), (( 1) * input(2, 8) + (-1) * input(2, 1)), ((-1) * input(3, 5) + ( 1) * input(3, 4)), (( 1) * input(4, 2) + (-1) * input(4, 7)), (( 1) * input(5, 7) + (-1) * input(5, 2)), ((-1) * input(6, 4) + ( 1) * input(6, 5)), (( 1) * input(7, 1) + (-1) * input(7, 8)), (( 1) * input(8, 6) + (-1) * input(8, 3))];
    odd_7  = [(( 1) * input(1, 4) + (-1) * input(1, 5)), ((-1) * input(2, 3) + ( 1) * input(2, 6)), (( 1) * input(3, 2) + (-1) * input(3, 7)), ((-1) * input(4, 1) + ( 1) * input(4, 8)), ((-1) * input(5, 8) + ( 1) * input(5, 1)), (( 1) * input(6, 7) + (-1) * input(6, 2)), ((-1) * input(7, 6) + ( 1) * input(7, 3)), (( 1) * input(8, 5) + (-1) * input(8, 4))];

    even_1 = basis * even_1';
    even_3 = basis * even_3';
    even_5 = basis * even_5';
    even_7 = basis * even_7';
    odd_1  = basis * odd_1';
    odd_3  = basis * odd_3';
    odd_5  = basis * odd_5';
    odd_7  = basis * odd_7';
    
    dct_out(1, 1) = ( 1) * even_1(1) + ( 1) * even_1(1) + ( 1) * even_3(1) + ( 1) * even_3(1) + ( 1) * even_5(1) + ( 1) * even_5(1) + ( 1) * even_7(1) + ( 1) * even_7(1);
    dct_out(1, 2) = ( 1) *  odd_1(2) + ( 1) *  odd_1(2) + ( 1) *  odd_3(4) + ( 1) *  odd_3(4) + ( 1) *  odd_5(6) + ( 1) *  odd_5(6) + ( 1) *  odd_7(8) + ( 1) *  odd_7(8);
    dct_out(1, 3) = ( 1) * even_1(3) + ( 1) * even_1(3) + ( 1) * even_3(7) + ( 1) * even_3(7) + (-1) * even_5(7) + (-1) * even_5(7) + (-1) * even_7(3) + (-1) * even_7(3);
    dct_out(1, 4) = ( 1) *  odd_1(4) + ( 1) *  odd_1(4) + (-1) *  odd_3(8) + (-1) *  odd_3(8) + (-1) *  odd_5(2) + (-1) *  odd_5(2) + (-1) *  odd_7(6) + (-1) *  odd_7(6);
    dct_out(1, 5) = ( 1) * even_1(5) + ( 1) * even_1(5) + (-1) * even_3(5) + (-1) * even_3(5) + (-1) * even_5(5) + (-1) * even_5(5) + ( 1) * even_7(5) + ( 1) * even_7(5);
    dct_out(1, 6) = ( 1) *  odd_1(6) + ( 1) *  odd_1(6) + (-1) *  odd_3(2) + (-1) *  odd_3(2) + ( 1) *  odd_5(8) + ( 1) *  odd_5(8) + ( 1) *  odd_7(4) + ( 1) *  odd_7(4);
    dct_out(1, 7) = ( 1) * even_1(7) + ( 1) * even_1(7) + (-1) * even_3(3) + (-1) * even_3(3) + ( 1) * even_5(3) + ( 1) * even_5(3) + (-1) * even_7(7) + (-1) * even_7(7);
    dct_out(1, 8) = ( 1) *  odd_1(8) + ( 1) *  odd_1(8) + (-1) *  odd_3(6) + (-1) *  odd_3(6) + ( 1) *  odd_5(4) + ( 1) *  odd_5(4) + (-1) *  odd_7(2) + (-1) *  odd_7(2);
    dct_out(2, 1) = ( 1) * even_1(2) + ( 1) * even_1(2) + ( 1) * even_3(2) + ( 1) * even_3(2) + ( 1) * even_5(2) + ( 1) * even_5(2) + ( 1) * even_7(2) + ( 1) * even_7(2);
    dct_out(2, 2) = ( 1) *  odd_1(3) + ( 1) *  odd_1(1) + ( 1) *  odd_3(5) + ( 1) *  odd_3(3) + ( 1) *  odd_5(7) + ( 1) *  odd_5(5) + (-1) *         0 + ( 1) *  odd_7(7);
    dct_out(2, 3) = ( 1) * even_1(4) + ( 1) * even_1(2) + ( 1) * even_3(8) + ( 1) * even_3(6) + (-1) * even_5(6) + (-1) * even_5(8) + (-1) * even_7(2) + (-1) * even_7(4);
    dct_out(2, 4) = ( 1) *  odd_1(5) + ( 1) *  odd_1(3) + (-1) *  odd_3(7) + (-1) *         0 + (-1) *  odd_5(1) + (-1) *  odd_5(3) + (-1) *  odd_7(7) + (-1) *  odd_7(5);
    dct_out(2, 5) = ( 1) * even_1(6) + ( 1) * even_1(4) + (-1) * even_3(4) + (-1) * even_3(6) + (-1) * even_5(6) + (-1) * even_5(4) + ( 1) * even_7(4) + ( 1) * even_7(6);
    dct_out(2, 6) = ( 1) *  odd_1(7) + ( 1) *  odd_1(5) + (-1) *  odd_3(1) + (-1) *  odd_3(3) + ( 1) *  odd_5(7) + ( 1) *         0 + ( 1) *  odd_7(5) + ( 1) *  odd_7(3);
    dct_out(2, 7) = ( 1) * even_1(8) + ( 1) * even_1(6) + (-1) * even_3(4) + (-1) * even_3(2) + ( 1) * even_5(2) + ( 1) * even_5(4) + (-1) * even_7(6) + (-1) * even_7(8);
    dct_out(2, 8) = (-1) *         0 + ( 1) *  odd_1(7) + (-1) *  odd_3(7) + (-1) *  odd_3(5) + ( 1) *  odd_5(5) + ( 1) *  odd_5(3) + (-1) *  odd_7(3) + (-1) *  odd_7(1);
    dct_out(3, 1) = ( 1) * even_1(3) + ( 1) * even_1(3) + ( 1) * even_3(3) + ( 1) * even_3(3) + ( 1) * even_5(3) + ( 1) * even_5(3) + ( 1) * even_7(3) + ( 1) * even_7(3);
    dct_out(3, 2) = ( 1) *  odd_1(4) + ( 1) *  odd_1(2) + ( 1) *  odd_3(6) + ( 1) *  odd_3(2) + ( 1) *  odd_5(8) + ( 1) *  odd_5(4) + (-1) *  odd_7(8) + ( 1) *  odd_7(6);
    dct_out(3, 3) = ( 1) * even_1(5) + ( 1) * even_1(1) + (-1) *         0 + ( 1) * even_3(5) + (-1) * even_5(5) + (-1) *         0 + (-1) * even_7(1) + (-1) * even_7(5);
    dct_out(3, 4) = ( 1) *  odd_1(6) + ( 1) *  odd_1(2) + (-1) *  odd_3(6) + ( 1) *  odd_3(8) + (-1) *  odd_5(2) + (-1) *  odd_5(4) + (-1) *  odd_7(8) + (-1) *  odd_7(4);
    dct_out(3, 5) = ( 1) * even_1(7) + ( 1) * even_1(3) + (-1) * even_3(3) + (-1) * even_3(7) + (-1) * even_5(7) + (-1) * even_5(3) + ( 1) * even_7(3) + ( 1) * even_7(7);
    dct_out(3, 6) = ( 1) *  odd_1(8) + ( 1) *  odd_1(4) + (-1) *  odd_3(2) + (-1) *  odd_3(4) + ( 1) *  odd_5(6) + (-1) *  odd_5(8) + ( 1) *  odd_7(6) + ( 1) *  odd_7(2);
    dct_out(3, 7) = (-1) *         0 + ( 1) * even_1(5) + (-1) * even_3(5) + (-1) * even_3(1) + ( 1) * even_5(1) + ( 1) * even_5(5) + (-1) * even_7(5) + (-1) *         0;
    dct_out(3, 8) = (-1) *  odd_1(8) + ( 1) *  odd_1(6) + (-1) *  odd_3(8) + (-1) *  odd_3(4) + ( 1) *  odd_5(6) + ( 1) *  odd_5(2) + (-1) *  odd_7(4) + (-1) *  odd_7(2);
    dct_out(4, 1) = ( 1) * even_1(4) + ( 1) * even_1(4) + ( 1) * even_3(4) + ( 1) * even_3(4) + ( 1) * even_5(4) + ( 1) * even_5(4) + ( 1) * even_7(4) + ( 1) * even_7(4);
    dct_out(4, 2) = ( 1) *  odd_1(5) + ( 1) *  odd_1(3) + ( 1) *  odd_3(7) + ( 1) *  odd_3(1) + (-1) *         0 + ( 1) *  odd_5(3) + (-1) *  odd_7(7) + ( 1) *  odd_7(5);
    dct_out(4, 3) = ( 1) * even_1(6) + ( 1) * even_1(2) + (-1) * even_3(8) + ( 1) * even_3(4) + (-1) * even_5(4) + ( 1) * even_5(8) + (-1) * even_7(2) + (-1) * even_7(6);
    dct_out(4, 4) = ( 1) *  odd_1(7) + ( 1) *  odd_1(1) + (-1) *  odd_3(5) + ( 1) *  odd_3(7) + (-1) *  odd_5(3) + (-1) *  odd_5(5) + ( 1) *         0 + (-1) *  odd_7(3);
    dct_out(4, 5) = ( 1) * even_1(8) + ( 1) * even_1(2) + (-1) * even_3(2) + (-1) * even_3(8) + (-1) * even_5(8) + (-1) * even_5(2) + ( 1) * even_7(2) + ( 1) * even_7(8);
    dct_out(4, 6) = (-1) *         0 + ( 1) *  odd_1(3) + (-1) *  odd_3(3) + (-1) *  odd_3(5) + ( 1) *  odd_5(5) + (-1) *  odd_5(7) + ( 1) *  odd_7(7) + ( 1) *  odd_7(1);
    dct_out(4, 7) = (-1) * even_1(8) + ( 1) * even_1(4) + (-1) * even_3(6) + (-1) * even_3(2) + ( 1) * even_5(2) + ( 1) * even_5(6) + (-1) * even_7(4) + ( 1) * even_7(8);
    dct_out(4, 8) = (-1) *  odd_1(7) + ( 1) *  odd_1(5) + ( 1) *         0 + (-1) *  odd_3(3) + ( 1) *  odd_5(7) + ( 1) *  odd_5(1) + (-1) *  odd_7(5) + (-1) *  odd_7(3);
    dct_out(5, 1) = ( 1) * even_1(5) + ( 1) * even_1(5) + ( 1) * even_3(5) + ( 1) * even_3(5) + ( 1) * even_5(5) + ( 1) * even_5(5) + ( 1) * even_7(5) + ( 1) * even_7(5);
    dct_out(5, 2) = ( 1) *  odd_1(6) + ( 1) *  odd_1(4) + ( 1) *  odd_3(8) + ( 1) *  odd_3(2) + (-1) *  odd_5(8) + ( 1) *  odd_5(2) + (-1) *  odd_7(6) + ( 1) *  odd_7(4);
    dct_out(5, 3) = ( 1) * even_1(7) + ( 1) * even_1(3) + (-1) * even_3(7) + ( 1) * even_3(3) + (-1) * even_5(3) + ( 1) * even_5(7) + (-1) * even_7(3) + (-1) * even_7(7);
    dct_out(5, 4) = ( 1) *  odd_1(8) + ( 1) *  odd_1(2) + (-1) *  odd_3(4) + ( 1) *  odd_3(6) + (-1) *  odd_5(4) + (-1) *  odd_5(6) + ( 1) *  odd_7(8) + (-1) *  odd_7(2);
    dct_out(5, 5) = (-1) *         0 + ( 1) * even_1(1) + (-1) * even_3(1) + (-1) *         0 + ( 1) *         0 + (-1) * even_5(1) + ( 1) * even_7(1) + ( 1) *         0;
    dct_out(5, 6) = (-1) *  odd_1(8) + ( 1) *  odd_1(2) + (-1) *  odd_3(4) + (-1) *  odd_3(6) + ( 1) *  odd_5(4) + (-1) *  odd_5(6) + ( 1) *  odd_7(8) + ( 1) *  odd_7(2);
    dct_out(5, 7) = (-1) * even_1(7) + ( 1) * even_1(3) + (-1) * even_3(7) + (-1) * even_3(3) + ( 1) * even_5(3) + ( 1) * even_5(7) + (-1) * even_7(3) + ( 1) * even_7(7);
    dct_out(5, 8) = (-1) *  odd_1(6) + ( 1) *  odd_1(4) + ( 1) *  odd_3(8) + (-1) *  odd_3(2) + ( 1) *  odd_5(8) + ( 1) *  odd_5(2) + (-1) *  odd_7(6) + (-1) *  odd_7(4);
    dct_out(6, 1) = ( 1) * even_1(6) + ( 1) * even_1(6) + ( 1) * even_3(6) + ( 1) * even_3(6) + ( 1) * even_5(6) + ( 1) * even_5(6) + ( 1) * even_7(6) + ( 1) * even_7(6);
    dct_out(6, 2) = ( 1) *  odd_1(7) + ( 1) *  odd_1(5) + (-1) *         0 + ( 1) *  odd_3(3) + (-1) *  odd_5(7) + ( 1) *  odd_5(1) + (-1) *  odd_7(5) + ( 1) *  odd_7(3);
    dct_out(6, 3) = ( 1) * even_1(8) + ( 1) * even_1(4) + (-1) * even_3(6) + ( 1) * even_3(2) + (-1) * even_5(2) + ( 1) * even_5(6) + (-1) * even_7(4) + (-1) * even_7(8);
    dct_out(6, 4) = (-1) *         0 + ( 1) *  odd_1(3) + (-1) *  odd_3(3) + ( 1) *  odd_3(5) + (-1) *  odd_5(5) + (-1) *  odd_5(7) + ( 1) *  odd_7(7) + (-1) *  odd_7(1);
    dct_out(6, 5) = (-1) * even_1(8) + ( 1) * even_1(2) + (-1) * even_3(2) + ( 1) * even_3(8) + ( 1) * even_5(8) + (-1) * even_5(2) + ( 1) * even_7(2) + (-1) * even_7(8);
    dct_out(6, 6) = (-1) *  odd_1(7) + ( 1) *  odd_1(1) + (-1) *  odd_3(5) + (-1) *  odd_3(7) + ( 1) *  odd_5(3) + (-1) *  odd_5(5) + (-1) *         0 + ( 1) *  odd_7(3);
    dct_out(6, 7) = (-1) * even_1(6) + ( 1) * even_1(2) + (-1) * even_3(8) + (-1) * even_3(4) + ( 1) * even_5(4) + ( 1) * even_5(8) + (-1) * even_7(2) + ( 1) * even_7(6);
    dct_out(6, 8) = (-1) *  odd_1(5) + ( 1) *  odd_1(3) + ( 1) *  odd_3(7) + (-1) *  odd_3(1) + (-1) *         0 + ( 1) *  odd_5(3) + (-1) *  odd_7(7) + (-1) *  odd_7(5);
    dct_out(7, 1) = ( 1) * even_1(7) + ( 1) * even_1(7) + ( 1) * even_3(7) + ( 1) * even_3(7) + ( 1) * even_5(7) + ( 1) * even_5(7) + ( 1) * even_7(7) + ( 1) * even_7(7);
    dct_out(7, 2) = ( 1) *  odd_1(8) + ( 1) *  odd_1(6) + (-1) *  odd_3(8) + ( 1) *  odd_3(4) + (-1) *  odd_5(6) + ( 1) *  odd_5(2) + (-1) *  odd_7(4) + ( 1) *  odd_7(2);
    dct_out(7, 3) = (-1) *         0 + ( 1) * even_1(5) + (-1) * even_3(5) + ( 1) * even_3(1) + (-1) * even_5(1) + ( 1) * even_5(5) + (-1) * even_7(5) + (-1) *         0;
    dct_out(7, 4) = (-1) *  odd_1(8) + ( 1) *  odd_1(4) + (-1) *  odd_3(2) + ( 1) *  odd_3(4) + (-1) *  odd_5(6) + (-1) *  odd_5(8) + ( 1) *  odd_7(6) + (-1) *  odd_7(2);
    dct_out(7, 5) = (-1) * even_1(7) + ( 1) * even_1(3) + (-1) * even_3(3) + ( 1) * even_3(7) + ( 1) * even_5(7) + (-1) * even_5(3) + ( 1) * even_7(3) + (-1) * even_7(7);
    dct_out(7, 6) = (-1) *  odd_1(6) + ( 1) *  odd_1(2) + (-1) *  odd_3(6) + (-1) *  odd_3(8) + ( 1) *  odd_5(2) + (-1) *  odd_5(4) + (-1) *  odd_7(8) + ( 1) *  odd_7(4);
    dct_out(7, 7) = (-1) * even_1(5) + ( 1) * even_1(1) + ( 1) *         0 + (-1) * even_3(5) + ( 1) * even_5(5) + ( 1) *         0 + (-1) * even_7(1) + ( 1) * even_7(5);
    dct_out(7, 8) = (-1) *  odd_1(4) + ( 1) *  odd_1(2) + ( 1) *  odd_3(6) + (-1) *  odd_3(2) + (-1) *  odd_5(8) + ( 1) *  odd_5(4) + (-1) *  odd_7(8) + (-1) *  odd_7(6);
    dct_out(8, 1) = ( 1) * even_1(8) + ( 1) * even_1(8) + ( 1) * even_3(8) + ( 1) * even_3(8) + ( 1) * even_5(8) + ( 1) * even_5(8) + ( 1) * even_7(8) + ( 1) * even_7(8);
    dct_out(8, 2) = (-1) *         0 + ( 1) *  odd_1(7) + (-1) *  odd_3(7) + ( 1) *  odd_3(5) + (-1) *  odd_5(5) + ( 1) *  odd_5(3) + (-1) *  odd_7(3) + ( 1) *  odd_7(1);
    dct_out(8, 3) = (-1) * even_1(8) + ( 1) * even_1(6) + (-1) * even_3(4) + ( 1) * even_3(2) + (-1) * even_5(2) + ( 1) * even_5(4) + (-1) * even_7(6) + ( 1) * even_7(8);
    dct_out(8, 4) = (-1) *  odd_1(7) + ( 1) *  odd_1(5) + (-1) *  odd_3(1) + ( 1) *  odd_3(3) + (-1) *  odd_5(7) + (-1) *         0 + ( 1) *  odd_7(5) + (-1) *  odd_7(3);
    dct_out(8, 5) = (-1) * even_1(6) + ( 1) * even_1(4) + (-1) * even_3(4) + ( 1) * even_3(6) + ( 1) * even_5(6) + (-1) * even_5(4) + ( 1) * even_7(4) + (-1) * even_7(6);
    dct_out(8, 6) = (-1) *  odd_1(5) + ( 1) *  odd_1(3) + (-1) *  odd_3(7) + (-1) *         0 + ( 1) *  odd_5(1) + (-1) *  odd_5(3) + (-1) *  odd_7(7) + ( 1) *  odd_7(5);
    dct_out(8, 7) = (-1) * even_1(4) + ( 1) * even_1(2) + ( 1) * even_3(8) + (-1) * even_3(6) + ( 1) * even_5(6) + (-1) * even_5(8) + (-1) * even_7(2) + ( 1) * even_7(4);
    dct_out(8, 8) = (-1) *  odd_1(3) + ( 1) *  odd_1(1) + ( 1) *  odd_3(5) + (-1) *  odd_3(3) + (-1) *  odd_5(7) + ( 1) *  odd_5(5) + ( 1) *         0 + (-1) *  odd_7(7);

    dct_out(1, 1) = dct_out(1, 1) * sqrt(1 / size) * sqrt(1 / size) / 2;
    dct_out(1, 2:size) = dct_out(1, 2:size) * sqrt(1 / size) * sqrt(2 / size) / 2;
    dct_out(2:size, 1) = dct_out(2:size, 1) * sqrt(1 / size) * sqrt(2 / size) / 2;
    dct_out(2:size, 2:size) = dct_out(2:size, 2:size) * sqrt(2 / size) * sqrt(2 / size) / 2;
    
end

function output = DCT_1D_BASIS(size) 

    % 1D cosine basis function
    output = zeros([size, size]); % coefficient matrix

    for l = 1:size
        for i = 1:size
            i_minus_one = i - 1; % zst: zero start
            l_minus_one = l - 1;
            
            output(l, i) = cos(pi * (2 * i_minus_one + 1) * l_minus_one / 2 / size);
        end
    end
end