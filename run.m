function [] = run()

	% This is the main run file for user.
	% @SHOW_GUI:	0 if you want to give inputs from here
	%				1 if you want to give inputs through GUI
	%
	% @EXPERIMENT_TYPE:	1 for search, 2 for plot
	% other inputs regarding experiment are below
	clc;
	clear;
	profile on
    
	%%%%%%%%%%%%%%%%%%%%%%%%%
	%%%%%	USER INPUTS	%%%%%
	%%%%%%%%%%%%%%%%%%%%%%%%%
	SHOW_GUI = 1;			% 1 or 0
	EXPERIMENT_TYPE = 1;	% 1 for search, 2 for plot
	%%%%%%%%%%%%%%%%%%%%%%%%%

	if SHOW_GUI == 1
		GUI
	else
		%%%%%%%%%%%%%%%%%%%%%%%%%
		%%%%%	USER INPUTS	%%%%%
		%%%%%%%%%%%%%%%%%%%%%%%%%
		M = 2;					% number of memory elements
        N = 2;					% number of output bits (rate is 1/N)
        rayleigh = 'no';		% 'yes' or 'no'
        doppler = 'low';		% 'high' or 'low'
        arr = [13 14];			% generator polynomials
        decoding = 'HDD';		% 'HDD' or 'SDD'
        csi = 'no';				% 'yes' or 'no'
        interleaving = 'yes';	% 'yes' or 'no'
		%%%%%%%%%%%%%%%%%%%%%%%%%
        
        if EXPERIMENT_TYPE == 1
            experiment(M, N, rayleigh, doppler, 0, decoding, csi, interleaving, 'search')
        else
            experiment(M, N, rayleigh, doppler, arr, decoding, csi, interleaving, 'plot')
        end
    end
end

