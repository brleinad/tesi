#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/config7.dat                                                                            #
#     LDPC-code file: iRISC_dv4_K651_N1296                                                                           #
#       NETLIST file: linear/linear_ni648_IRISC_dv4_K651_N1296                                                       #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    648    |    32298     |     651      |    32044     |     645      |     5 :     4370     |    5 :     4367     #
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
  1.00e-03   7.12e-02   7.04e-02   1.123e-01   9.901e-01      100   101            100          0        0     20.0  # final               
  5.00e-04   3.68e-02   3.70e-02   2.951e-03   5.593e-02      100   1788           100          0        5      8.8  # final               
  2.00e-04   1.50e-02   1.50e-02   1.382e-08   2.000e-06        2   1000000          2          0        0      2.3  # final               
