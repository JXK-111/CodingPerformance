function [BER] = montecarlo( original_bits, modulator, demodulator, rayleigh,... 
                    doppler, trellis, SNR_value, decoding, csi, interleaving )
    % Performs a one instance of simulator with given inputs
    % INPUTS:
    %   @original_bits: original bit frame
    %   @modulator: modulator object
    %   @demodulator: demodulator object
    %   @rayleigh: 'yes' or 'no'
    %   @doppler: doppler value
    %   @trellis: trellis structure
    %   @SNR_value = signal to noise ratio
    %   @decoding: 'HDD' or 'SDD'
    %   @csi: 'yes' or 'no'
    %   @interleaving: 'yes' or 'no'
    % OUTPUT:
    %   @BER: bit error rate array where BER(1) is percentage,
    %           BER(2) is total error #, BER(3) total bit #

    % Bit error rate
    BER = [];

    % 2
    % Convolutional encoder with with trellis which has rate Rc = 1/N;
    % generator polynomials gi(1 < i < N); number of memory elements M
    txBits = convenc(original_bits,trellis);

    % 3
    % Interleaver which uses Matlab's 'intrlv(data,elements)' function
    if strcmp(interleaving, 'yes')
        random_interleaver = randperm(length(txBits));  % random interleaver elements
        txBits = intrlv(txBits,random_interleaver);
    end
    % 4
    pxBits = modulate(modulator, txBits);
    
    % 5
    % Wireless channel with the following parameters:
    % flat Rayleigh fading with unity average power and Jakes 
    % power spectral density
    if strcmp(rayleigh, 'yes')
        pxBits = fading(pxBits, doppler);
    end
    
    % AWGN with variance Eb/N0;
    rxBits = awgn(pxBits, SNR_value);
    rxBits = demodulate(demodulator, rxBits);

    % 7
    % Deinterleaver which uses Matlab's 'deintrlv(data,elements)' function
    if strcmp(interleaving, 'yes')
        rxBits = deintrlv(rxBits,random_interleaver);
    end

    % 8
    % Viterbi decoder for convolution codes using Matlab object
    % comm.ViterbiDecoder and its functions
    rxBits =  viterbi_decoder(rxBits,trellis, decoding, csi);

    % 9
    % Calculate Bit Error Rate using Matlab object comm.ErrorRate and its
    % functions
    berObj = comm.ErrorRate;
    BER = step(berObj, rxBits, original_bits);
end

function [pxBits] = fading(pxBits, doppler)
    
    % Rayleigh fading
    % INPUT:
    %   @pxBits: input frame
    %   @doppler: doppler value for rayleighchan
    % OUTPUS:
    %   @pxBits: output frame
    
    %channel = rayleighchan(1/9e8,doppler);
    %channel = rayleighchan(1/(doppler * 50),doppler);
    channel = rayleighchan(1/7500,doppler);
    pxBits = filter(channel, pxBits);
end

function rxBits = viterbi_decoder(rxBits, trellis, decoding_type, CSI_info)

    % Viterbi decoder for convolution codes
    % INPUTS:
    %   @rxBits: input frame
    %   @trellis: trellis structure for decoding
    %   @decoding_type: either 'HDD' or 'SDD'
    %   @CSI_info: either 'yes' or 'no'
    % OUTPUS:
    %   @rxBits: decoded frame
    
    info = '';
    type = '';
    if strcmp(decoding_type, 'HDD')
        type = 'hard';
    elseif strcmp(decoding_type, 'SDD')
        type = 'hard';
    else
        type = 'hard';
        fprintf('error in viterbi_decoder, decoding_type input')
    end
    
    if strcmp(CSI_info, 'yes')
        info = 'hard';
    elseif strcmp(CSI_info, 'no')
        info = 'soft';
    else
        fprintf('error in viterbi_decoder, CSI_info input')
    end
    
    rxBits = vitdec(rxBits,trellis,2,'trunc',type);
end