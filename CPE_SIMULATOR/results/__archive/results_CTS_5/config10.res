#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/config10.dat                                                                           #
#     LDPC-code file: iRISC_dv3_K974_N1296                                                                           #
#       NETLIST file: linear/linear_ni65_IRISC_dv3_K974_N1296                                                        #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    65     |     4007     |     974      |     1578     |     322      |     5 :     530      |    5 :     225      #
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
  1.00e-03   6.91e-03   8.20e-03   1.263e-02   4.153e-02      100   2408           100          0        0      6.6  # final               
  5.00e-04   3.51e-03   4.14e-03   1.206e-03   3.959e-03      100   25259          100          0        0      2.7  # final               
  2.00e-04   1.40e-03   1.65e-03   3.150e-05   1.022e-04      100   978875         100          0        1      1.4  # final               
  1.00e-04   7.00e-04   8.28e-04   2.614e-06   8.000e-06        8   1000000          8          0        0      1.2  # final               
