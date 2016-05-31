#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/configm5.dat                                                                           #
#     LDPC-code file: iRISC_dv3_K650_N1296                                                                           #
#       NETLIST file: linear/linear_ni648_IRISC_dv3_K650_N1296                                                       #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    648    |    32247     |     650      |    32137     |     646      |    20 :     1362     |   20 :     1350     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#  QC[exp=54]   |  0.50  |    1296     |     648     |  3.00   |  6.00   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-03   1.06e-01   1.07e-01   1.429e-01   9.901e-01      100   101            100          0        0     20.0  # final               
  5.00e-04   5.75e-02   5.81e-02   2.149e-02   3.802e-01      100   263            100          0        4     16.1  # final               
  2.00e-04   2.38e-02   2.39e-02   5.029e-05   2.105e-03      100   47510          100          0        7      4.5  # final               
  1.00e-04   1.20e-02   1.21e-02   3.923e-07   2.200e-05       22   1000000         22          0        2      2.5  # final               
  5.00e-05   6.07e-03   6.09e-03   0.000e+00   0.000e+00        0   1000000          0          0        0      1.7  # final               
