#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/confign1.dat                                                                           #
#     LDPC-code file: iRISC_dv3_K650_N1296                                                                           #
#       NETLIST file: linear/linear_ni1296_IRISC_dv3_K650_N1296                                                      #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#   1296    |    63852     |     650      |    63577     |     646      |    10 :     4924     |   10 :     4947     #
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
  1.00e-03   1.63e-01   1.65e-01   2.260e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-04   8.92e-02   9.15e-02   1.094e-01   9.709e-01      100   103            100          0        0     19.9  # final               
  2.00e-04   3.87e-02   3.83e-02   5.840e-04   2.546e-02      100   3928           100          0        9      9.4  # final               
  1.00e-04   1.96e-02   1.96e-02   1.062e-07   1.500e-05       15   1000000         15          0        7      3.4  # final               
  5.00e-05   9.90e-03   9.91e-03   0.000e+00   0.000e+00        0   1000000          0          0        0      2.2  # final               
