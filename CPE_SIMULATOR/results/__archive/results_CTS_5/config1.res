#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/config1.dat                                                                            #
#     LDPC-code file: iRISC_dv3_K650_N1296                                                                           #
#       NETLIST file: linear/linear_ni1296_IRISC_dv3_K650_N1296                                                      #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#   1296    |    63852     |     650      |    63577     |     646      |     5 :     9012     |    5 :     8964     #
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
  1.00e-03   1.31e-01   1.33e-01   1.854e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-04   7.04e-02   7.06e-02   5.017e-02   7.812e-01      100   128            100          0        0     19.3  # final               
  2.00e-04   2.97e-02   2.98e-02   2.227e-06   2.369e-04      100   422098         100          0       20      5.7  # final               
  1.00e-04   1.51e-02   1.51e-02   4.615e-09   1.000e-06        1   1000000          1          0        0      2.7  # final               
