#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/configm7.dat                                                                           #
#     LDPC-code file: iRISC_dv4_K651_N1296                                                                           #
#       NETLIST file: linear/linear_ni648_IRISC_dv4_K651_N1296                                                       #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    648    |    32298     |     651      |    32044     |     645      |    20 :     1362     |   20 :     1352     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#  QC[exp=54]   |  0.50  |    1296     |     648     |  4.00   |  8.00   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-03   1.07e-01   1.08e-01   1.712e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-04   5.78e-02   5.93e-02   6.999e-02   7.246e-01      100   138            100          0        0     18.0  # final               
  2.00e-04   2.39e-02   2.39e-02   1.029e-03   1.649e-02      100   6064           100          0        1      4.4  # final               
  1.00e-04   1.20e-02   1.21e-02   1.306e-05   2.552e-04      100   391792         100          0        4      2.0  # final               
  5.00e-05   6.06e-03   6.09e-03   2.765e-07   7.000e-06        7   1000000          7          0        0      1.4  # final               
