#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/confign12.dat                                                                          #
#     LDPC-code file: iRISC_dv4_K975_N1296                                                                           #
#       NETLIST file: linear/linear_ni65_IRISC_dv4_K975_N1296                                                        #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    65     |     4036     |     975      |     1558     |     321      |    10 :     308      |   10 :     135      #
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
  1.00e-03   8.53e-03   1.04e-02   9.955e-04   3.264e-02      100   3064           100          0        1      5.6  # final               
  5.00e-04   4.40e-03   5.18e-03   4.872e-05   1.954e-03      100   51181          100          0        1      2.4  # final               
  2.00e-04   1.76e-03   2.07e-03   1.531e-06   5.800e-05       58   1000000         58          0        1      1.3  # final               
  1.00e-04   8.83e-04   1.04e-03   1.467e-07   9.000e-06        9   1000000          9          0        0      1.1  # final               
