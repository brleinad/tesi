#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/desMCNC_config_490_crit10.dat                                                          #
#     LDPC-code file: ldpc_dv3_k245_n490                                                                             #
#       NETLIST file: desMCNC_ni256_ldpc_dv3_k245_n490                                                               #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    256    |     2204     |     245      |     7292     |     245      |     5 :     675      |    5 :     3219     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#    Binary     |  0.50  |     490     |     245     |  3.00   |  6.00   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-01   3.00e-01   4.97e-01   3.490e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-02   1.97e-01   4.80e-01   2.740e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-02   9.44e-02   3.65e-01   1.907e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  1.00e-02   5.06e-02   2.35e-01   1.387e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-03   2.71e-02   1.25e-01   5.466e-02   7.407e-01      100   135            100          0        2     19.0  # final               
  2.00e-03   1.07e-02   5.92e-02   7.474e-04   2.575e-02      100   3883           100          0       10      7.4  # final               
  1.00e-03   5.39e-03   3.04e-02   4.491e-06   2.331e-04      100   428950         100          0       33      2.8  # final               
  5.00e-04   2.70e-03   1.54e-02   6.939e-08   7.000e-06        7   1000000          7          0        2      1.8  # final               