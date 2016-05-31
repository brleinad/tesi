#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/confign7.dat                                                                           #
#     LDPC-code file: iRISC_dv4_K651_N1296                                                                           #
#       NETLIST file: linear/linear_ni648_IRISC_dv4_K651_N1296                                                       #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    648    |    32298     |     651      |    32044     |     645      |    10 :     2402     |   10 :     2401     #
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
  1.00e-03   8.90e-02   9.07e-02   1.432e-01   9.804e-01      100   102            100          0        0     19.9  # final               
  5.00e-04   4.68e-02   4.72e-02   2.595e-02   3.333e-01      100   300            100          0        0     14.2  # final               
  2.00e-04   1.94e-02   1.94e-02   1.725e-05   3.945e-04      100   253465         100          0        3      3.0  # final               
  1.00e-04   9.79e-03   9.81e-03   0.000e+00   0.000e+00        0   1000000          0          0        0      1.7  # final               
