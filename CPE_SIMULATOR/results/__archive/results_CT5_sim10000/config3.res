#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/config3.dat                                                                            #
#     LDPC-code file: iRISC_dv4_K651_N1296                                                                           #
#       NETLIST file: linear/linear_ni1296_IRISC_dv4_K651_N1296                                                      #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#   1296    |    63892     |     651      |    63357     |     645      |     5 :     9025     |    5 :     8943     #
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
  1.00e-03   1.29e-01   1.29e-01   1.973e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-04   6.95e-02   7.12e-02   1.090e-01   9.709e-01      100   103            100          0        0     19.9  # final               
  2.00e-04   2.97e-02   2.95e-02   2.657e-04   5.400e-03       54   10000           54          0        1      5.4  # final               
  1.00e-04   1.50e-02   1.51e-02   0.000e+00   0.000e+00        0   10000            0          0        0      2.3  # final               
