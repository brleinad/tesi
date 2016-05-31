#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/confign9.dat                                                                           #
#     LDPC-code file: iRISC_dv3_K650_N1296                                                                           #
#       NETLIST file: linear/linear_ni65_IRISC_dv3_K650_N1296                                                        #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    65     |     2846     |     650      |     2848     |     646      |    10 :     232      |   10 :     231      #
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
  1.00e-03   9.10e-03   9.25e-03   0.000e+00   0.000e+00        0   1000000          0          0        0      2.1  # final               
