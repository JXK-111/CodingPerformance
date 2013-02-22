function [ original_bits, modulator, demodulator ] = setup()

    % Setups the experiment environment
    % OUTPUTS:
    %   @original_bits: random [1000x1] frame
    %   @modulator: BPSK modulator
    %   @demodulator: BPSK demodulator

    % number of bits in frame
    FRAME_SIZE = 1000;

    % 1
    % Bernoulli source that generates a sequence of 0's and 1's. 
    % The source data is generated in frames of size F = 1000 bits    
    % create FRAME_SIZEx1 matrix with values [1,2]
    original_bits = randi(2, FRAME_SIZE, 1);
    
    % map [1,2] values to [0,1]
    original_bits = original_bits - 1;

    % 4
    % BPSK modulator with the following mapping of encoded bits to 
    % symbols: 0 mapped to +1 and 1 mapped to -1
    modulator = modem.dpskmod('M', 2);

    % 6
    % BPSK demodulator with the following mapping of encoded bits to 
    % symbols: +1 mapped to 0 and -1 mapped to 1
    demodulator = modem.dpskdemod(modulator); 
end

