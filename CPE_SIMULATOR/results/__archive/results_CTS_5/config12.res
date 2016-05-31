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
  1.00e-03   6.97e-03   8.12e-03   8.675e-05   3.949e-03      100   25324          100          0        1      4.0  # final               
  5.00e-04   3.49e-03   4.08e-03   1.063e-06   5.700e-05       57   1000000         57          0        1      1.7  # final               
  2.00e-04   1.40e-03   1.64e-03   0.000e+00   0.000e+00        0   1000000          0          0        0      1.1  # final               
