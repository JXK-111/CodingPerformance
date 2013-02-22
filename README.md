WSim
====

Link level Monte-Carlo simulator to study the performance of convolutional codes over wireless channels

run.m is the main file to start simulator. In Matlab, ensure that you are in the project directory and type
> run

User has two options:

1) if SHOW_GUI is 0: User can enter parameters in USER INPUTS part of run.m and then run the program. EXPERIMENT_TYPE 1 means search and 2 means plot operation.

2) if SHOW_GUI is 1: User will enter parameters through GUI, and then click on either 'search' or 'plot' for desired experiment. User should enter integer numbers bigger than 0 to N and M fields. Moreover, each generator polynomials should be separated with a comma (‘,’) so that simulator can parse the input (Example input is: ‘5,7’). GUI does not have any error checking mechanism.

Experiment inputs are:
    @M: number of memory elements
    @N: number of output bits (rate is 1/N)
    @rayleigh: 'yes' or 'no'
    @doppler: 'high' or 'low'
    @arr: generator polynomials (no need for search)
    @decoding: 'HDD' or 'SDD'
    @csi: 'yes' or 'no'
    @interleaving: 'yes' or 'no'
