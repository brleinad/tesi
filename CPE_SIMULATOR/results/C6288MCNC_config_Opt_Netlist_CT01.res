#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/C6288MCNC_config.dat                                                                   #
#     LDPC-code file: ldpc_dv3_k32_n64                                                                               #
#       NETLIST file: C6288MCNC_ni32_ldpc_dv3_k32_n64                                                                #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    32     |     5741     |      32      |     6822     |      32      |     1 :     5316     |    1 :     5617     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#    Binary     |  0.50  |     64      |     32      |  3.00   |  6.00   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-01   3.98e-01   4.94e-01   4.350e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-02   2.95e-01   4.42e-01   3.937e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-02   1.39e-01   2.90e-01   2.728e-01   1.000e+00      100   100             99          1        0     20.0  # final               
  1.00e-02   7.43e-02   1.82e-01   2.070e-01   9.434e-01      100   106            100          0        1     19.8  # final               
  5.00e-03   4.59e-02   1.07e-01   1.266e-01   5.714e-01      100   175            100          0        6     15.2  # final               
  2.00e-03   1.53e-02   4.38e-02   2.155e-02   8.865e-02      100   1128           100          0        4      4.6  # final               
  1.00e-03   8.42e-03   2.26e-02   3.764e-03   1.643e-02      100   6085            99          1        7      2.0  # final               
  5.00e-04   4.24e-03   1.15e-02   5.150e-04   1.964e-03      100   50914           99          1        7      1.2  # final               
  2.00e-04   1.69e-03   4.62e-03   3.153e-05   1.217e-04      100   821681         100          0        4      1.0  # final               
  1.00e-04   8.39e-04   2.34e-03   3.656e-06   1.800e-05       18   1000000         17          1        0      1.0  # final               
  5.00e-05   4.21e-04   1.17e-03   1.031e-06   3.000e-06        3   1000000          3          0        0      1.0  # final               