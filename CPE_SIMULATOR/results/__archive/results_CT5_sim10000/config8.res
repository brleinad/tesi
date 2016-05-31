#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/config8.dat                                                                            #
#     LDPC-code file: iRISC_dv4_K975_N1296                                                                           #
#       NETLIST file: linear/linear_ni648_IRISC_dv4_K975_N1296                                                       #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    648    |    46244     |     975      |    17289     |     321      |     5 :     5996     |    5 :     2557     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#  QC[exp=27]   |  0.75  |    1296     |     324     |  4.00   |  16.00  |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-03   6.56e-02   7.64e-02   8.463e-02   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-04   3.59e-02   4.05e-02   6.638e-02   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-04   1.40e-02   1.59e-02   5.815e-03   1.786e-01      100   560            100          0        1     11.2  # final               
  1.00e-04   7.08e-03   8.45e-03   1.295e-04   5.000e-03       50   10000           50          0        1      4.1  # final               
  5.00e-05   3.61e-03   4.08e-03   1.333e-06   1.000e-04        1   10000            1          0        0      1.8  # final               
