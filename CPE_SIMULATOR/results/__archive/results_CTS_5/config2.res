#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/config2.dat                                                                            #
#     LDPC-code file: iRISC_dv3_K974_N1296                                                                           #
#       NETLIST file: linear/linear_ni1296_IRISC_dv3_K974_N1296                                                      #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#   1296    |    91838     |     974      |    33945     |     322      |     5 :    12310     |    5 :     5270     #
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
  1.00e-03   1.26e-01   1.41e-01   3.601e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-04   6.55e-02   7.77e-02   3.389e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-04   2.94e-02   2.89e-02   2.642e-01   9.434e-01      100   106            100          0        0     19.7  # final               
  1.00e-04   1.47e-02   1.69e-02   9.953e-02   4.098e-01      100   244            100          0        0     15.1  # final               
  5.00e-05   7.22e-03   8.58e-03   1.813e-02   5.807e-02      100   1722           100          0        0      6.9  # final               
  2.00e-05   2.91e-03   3.34e-03   5.190e-04   1.769e-03      100   56520          100          0        0      2.3  # final               
  1.00e-05   1.46e-03   1.68e-03   5.327e-05   1.781e-04      100   561581         100          0        0      1.5  # final               
