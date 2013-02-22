function [] = experiment(M, N, rayleigh, doppler, arr, decoding, csi, interleaving, exp_type)
    % Main experiment function which call search or plot functions
    %   @M: number of memory elements
    %   @N: number of output bits (rate is 1/N)
    %   @rayleigh: 'yes' or 'no'
    %   @doppler: 'high' or 'low'
    %   @arr: generator polynomials
    %   @decoding: 'HDD' or 'SDD'
    %   @csi: 'yes' or 'no'
    %   @interleaving: 'yes' or 'no'
    %   @exp_type: 'search' or plot'
    doppler = get_doppler_value(doppler);
    if strcmp(exp_type, 'search')
        experiment_search(M, N, rayleigh, doppler, decoding, csi, interleaving)
    elseif strcmp(exp_type, 'plot')
        experiment_ber(M, N, rayleigh, doppler, arr, decoding, csi, interleaving)
    else
        % not a valid experiment type
        fprintf( 'not a valid experiment type')
    end    
end

function [] = experiment_search(M, N, rayleigh, doppler, decoding, csi, interleaving)

    % Search for the generator polynomials of the best convolutional codes.
    % Simulate the performance of all possible codes and select the ones that
    % have the best BER in the range around 10^(-3). Sample size is K

    K = 100;
    fprintf( '============================\n' )
    fprintf( 'Generator polynomials search experiment started. M: %d N: %d\n', M, N)
    fprintf( 'For each trellis, sample size: %d\n', K)
    
    % Properties
    constraint_length = M + 1;
    max = 2^constraint_length - 1;
    arr = ones(1, N) * floor(max/2);
    target = ones(1, N) * max;

    while 1
        arr = update_trellis_array(arr, max);
        [is_valid, trellis] = is_valid_trellis(arr, constraint_length);
        if (is_valid == 0) % if trellis structure is not valid
            continue    
        end
        fprintf( '------------------------\n' )
        arr
        
        SNR = 0.0:2.5:100.0;
        SNR_length = length(SNR);
        BER_global = zeros(1, SNR_length);
        % for each sample
        for k=1:K
            [original_bits, modulator, demodulator] = setup();
            % for each SNR value
            for n=1:SNR_length
                BER = montecarlo(original_bits, modulator, demodulator, rayleigh, doppler, trellis, SNR(n), decoding, csi, interleaving);
                BER_global(n) = BER_global(n) + BER(1);
            end
        end
        answer = sum(BER_global)/(SNR_length*K);
        if answer <= 0.009
            fprintf( 'BER is acceptable %d\n', answer)
            my_str = strcat('Convolutional codes: ', mat2str(arr), ' is acceptable');
            msgbox(my_str)
        else
            fprintf( 'BER is NOT acceptable %d\n', answer)
        end
        % if all possible trellis codes were tried exit the loop
        if arr == target 
            break 
        end
    end
end % end of function experiment_search

function [] = experiment_ber(M, N, rayleigh, doppler, arr, decoding, csi, interleaving)
    % generate a complete BER plot for a given set of parameters.
    % SNR is from 0dB until a target BER = 10^-5dB
    % INPUT:
    %   @arr: generator polynomials for trellis structure.

    K = 1000;
    
    % Properties
    constraint_length = M + 1;
    trellis = poly2trellis(constraint_length, arr);
    max_SNR = find_max_SNR(M, N, rayleigh, doppler, 0, trellis, decoding, csi, interleaving);
    % set SNR increment level
    if strcmp(rayleigh, 'yes')
        K = 500;
        increment = 1.0;
    else
        increment = 0.5;
    end
    SNR = 0.0:increment:max_SNR;
    SNR_len = length(SNR);
    BER_global = zeros(1, SNR_len);

    fprintf( '============================\n' )
    fprintf( 'BER plot experiment started, sample size: %d\n', K)
    
    % sample space
    for k=1:K
        if mod(k,10) == 0
            fprintf( 'sample number K: %d out of %d\n', k, K)
        end
        [original_bits, modulator, demodulator] = setup();
        % for each SNR
        for n=1:SNR_len
            local_BER = montecarlo(original_bits, modulator, demodulator, rayleigh, doppler, trellis, SNR(n), decoding, csi, interleaving);
            BER_global(n) = BER_global(n) + local_BER(1);
        end
    end
    BER_global = BER_global / K;

    % 11
    % Plot BER results.
    figure;
    %BERtheory = berfading(SNR,'dpsk',2,1);
    semilogy(SNR,BER_global,'b-');
    legend('BER','Location','Southwest');
    xlabel('SNR (dB)'); ylabel('BER');
    if strcmp(rayleigh, 'yes')
        str = sprintf('Binary BPSK over Rayleigh Fading Channel with N = %d M = %d', N, M);
        title(str)
    else
        str = sprintf('Binary BPSK with N = %d M = %d', N, M);
        title(str)
    end
end % end of function experiment_ber

function [max_SNR] = find_max_SNR(M, N, rayleigh, doppler, arr, trellis, decoding, csi, interleaving)

    % finds the max SNR value which has less than 10^-5 BER for given input
    % parameters. sample space is K.
    % INPUT:
    %   @arr: generator polynomials for trellis structure.
    %   @trellis: if @arr is 0, this input will be used as a trellis structure
    % OUTPUT:
    %   @max_SNR
    K = 40;

    % if arr is not 0, create a trellis structure from arr and M
    % otherwise, use trellis
    if arr ~= 0
        constraint_length = M + 1;
        trellis = poly2trellis(constraint_length, arr);
    end
    max_SNR = 0;
    SNR = 0:2:100;

    fprintf( 'Searching for max SNR, sample size: %d\n', K)
    % sample space
    for k=1:K
        [original_bits, modulator, demodulator] = setup();
        % for each SNR value
        for n=1:length(SNR)
            [BER] = montecarlo(original_bits, modulator, demodulator, rayleigh, doppler, trellis, SNR(n), decoding, csi, interleaving);
            %fprintf('BER: %d SNR: %d\n', BER(2), SNR(n));
            if (BER(1) < 0.00001)
                if SNR(n) > max_SNR
                    max_SNR = SNR(n);
                end
                break
            end
        end
    end
    max_SNR = max_SNR+2 % +2 for safety reasons
end % end of function find_max_SNR

function [is_valid, trellis] = is_valid_trellis(arr, constraint_length)

    % Checks whether given arr, constraint_length pair is a valid trellis or not
    % If they are valid, return is_valid = 1 and the corresponding trellis structure
    % Returns is_valid = 0 otherwise
    % INPUTS:
    %   @arr: generator polynomials
    %   @constraint_length
    % OUTPUTS:
    %   @is_valid: 1 or 0
    %   @trellis: trellis structure if (is_valid)
    is_valid = 0;
    trellis = 0;
    if arr(length(arr)) < arr(1)    % check symmetry of trellis
        return
    end
    try
        trellis = poly2trellis(constraint_length, arr); 
    catch err
        is_valid = 0;
        return
    end
    if (istrellis(trellis) == 0)
        is_valid = 0;
        return
    end
    is_valid = 1;
end

function [arr] = update_trellis_array(arr, size)

    % Adds 1 to the given array.
    % If arr has reached to size, then do not change arr
    % INPUTS:
    %   @arr: generator polynomials array
    %   @size: maximum number that arr[i] for any i can have
    % OUTPUT:
    %   @arr: updated generator polynomials array
    % Example input-->output: ([5,6,5], 6) -->[5,6,6]
    % Example input-->output: ([5,6,6], 6) -->[6,1,1]
    
    ptr = length(arr);
    % find the point where arr(ptr) is not size
    while ptr >= 1 && arr(ptr) == size
        arr(ptr) = 1;
        ptr = ptr - 1;
    end
    
    % if arr has not reached to size
    if ptr ~= 0
        arr(ptr) = arr(ptr) + 1;
    else
        arr = ones(1, length(arr)) * size;
    end
end

function [doppler] = get_doppler_value(doppler)
    % Get doppler high or doppler low value.
    % INPUT:  
    %   @doppler: 'high' or 'low'
    % OUTPUT:
    %   @doppler: high mobility or low mobility value
    if (strcmp(doppler, 'high'))
        %doppler = speed2dop(33.3, physconst('LightSpeed')/900e6);
        doppler = 99.9692;
    elseif (strcmp(doppler, 'low'))
        %doppler = speed2dop(0.83, physconst('LightSpeed')/900e6);
        doppler = 2.4917;
    else
        doppler = 0;
    end
end