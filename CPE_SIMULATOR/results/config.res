#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/config.dat                                                                             #
#     LDPC-code file: iRISC_dv3_K974_N1296                                                                           #
#       NETLIST file: linear/linear_ni65_IRISC_dv3_K974_N1296                                                        #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    65     |     4007     |     974      |     1578     |     322      |    10 :     306      |   10 :     132      #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#  QC[exp=27]   |  0.75  |    1296     |     324     |  3.00   |  12.00  |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-01   4.26e-01   4.45e-01   4.710e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-02   2.99e-01   3.31e-01   4.237e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-02   1.50e-01   1.69e-01   3.681e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  1.00e-02   8.09e-02   9.80e-02   3.401e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-03   4.32e-02   5.16e-02   3.288e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-03   1.73e-02   2.04e-02   1.605e-01   5.780e-01      100   173            100          0        1     16.7  # final               
  1.00e-03   8.66e-03   1.00e-02   3.498e-02   1.181e-01      100   847            100          0        0      8.5  # final               
  5.00e-04   4.36e-03   5.13e-03   6.647e-03   2.228e-02      100   4488           100          0        0      3.8  # final               
  2.00e-04   1.72e-03   2.23e-03   0.000e+00   0.000e+00        0   1000             0          0        0      1.7  # intermediate        