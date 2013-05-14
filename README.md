WSim
====

Link level Monte-Carlo simulator to study the performance of convolutional codes over wireless channels

run.m is the main file to start simulator. In Matlab, ensure that you are in the project directory and type
> run

There are two options:

1) if SHOW_GUI == 0: Enter parameters in run.m/(USER INPUTS) and then run.

    EXPERIMENT_TYPE == 1: search
    EXPERIMENT_TYPE == 2: plot

2) if SHOW_GUI == 1: User will enter parameters through GUI, and then click on either 'search' or 'plot'. Note that GUI does not have any error checking mechanism.

Experiment parameters are:

    @M: number of memory elements, integer bigger than 0
    @N: number of output bits (rate is 1/N), integer bigger than 0
    @rayleigh: 'yes' or 'no'
    @doppler: 'high' or 'low'
    @arr: generator polynomials (no need for search). Should be separated with a comma (‘,’) like: ‘5,7’. 
    @decoding: 'HDD' or 'SDD'
    @csi: 'yes' or 'no'
    @interleaving: 'yes' or 'no'
