clear
%% Build instrumented mex
size = 8;
buildInstrumentedMex FDCT_2D_1D_VER -args {zeros(size)} -histogram

%% Test inputs
size = 8;
for i = 1:10
    input = randi([0, 255], size, size);

    % Algorithm
    % ---------
    dct_mat = dct2(input);
    dct_alg = FDCT_2D(size, input);
    %dct_alg_8 = FDCT_2D_1D_VER(input);
    %dct_alg_8_mex = FDCT_2D_1D_VER_mex(input);
    
    % IDCT
    idct_mat = idct2(dct_mat);
    idct_alg = FIDCT_2D(size, dct_alg);

    % metrics
    % -------
    mse_mat_alg_forward = mse(dct_mat, dct_alg);
    mse_mat_alg_inverse = mse(idct_mat, idct_alg);
    %mse_mat_alg_8 = mse(dct_mat, dct_alg_8);
    %mse_mat_alg_8 = mse(dct_mat, dct_alg_8_mex);
    %mse_alg_alg_8 = mse(dct_alg, dct_alg_8);
end
%% Verify results
showInstrumentationResults FDCT_2D_1D_VER_mex ...
  -defaultDT 'int16' -proposeFL