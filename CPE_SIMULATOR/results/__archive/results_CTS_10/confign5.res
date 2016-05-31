#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/confign5.dat                                                                           #
#     LDPC-code file: iRISC_dv3_K650_N1296                                                                           #
#       NETLIST file: linear/linear_ni648_IRISC_dv3_K650_N1296                                                       #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    648    |    32247     |     650      |    32137     |     646      |    10 :     2407     |   10 :     2412     #
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
  1.00e-03   8.98e-02   8.77e-02   1.081e-01   9.901e-01      100   101            100          0        0     20.0  # final               
  5.00e-04   4.71e-02   4.75e-02   3.591e-03   1.078e-01      100   928            100          0        1     13.3  # final               
  2.00e-04   1.94e-02   1.94e-02   1.662e-07   1.800e-05       18   1000000         18          0        2      3.4  # final               
  1.00e-04   9.78e-03   9.83e-03   0.000e+00   0.000e+00        0   1000000          0          0        0      2.1  # final               
