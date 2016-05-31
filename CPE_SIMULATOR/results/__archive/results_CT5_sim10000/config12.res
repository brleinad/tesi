#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/config12.dat                                                                           #
#     LDPC-code file: iRISC_dv4_K975_N1296                                                                           #
#       NETLIST file: linear/linear_ni65_IRISC_dv4_K975_N1296                                                        #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    65     |     4036     |     975      |     1558     |     321      |     5 :     545      |    5 :     228      #
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
  1.00e-03   6.94e-03   8.11e-03   5.867e-05   2.700e-03       27   10000           27          0        1      3.9  # final               
  5.00e-04   3.53e-03   4.14e-03   4.103e-06   2.000e-04        2   10000            2          0        0      1.7  # final               
