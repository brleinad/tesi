#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/desMCNC_config_490_crit10.dat                                                          #
#     LDPC-code file: ldpc_dv3_k245_n490                                                                             #
#       NETLIST file: desMCNC_ni256_ldpc_dv3_k245_n490                                                               #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    256    |     2204     |     245      |     7292     |     245      |    10 :      41      |   10 :     2877     #
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
  1.00e-01   3.05e-01   5.06e-01   3.571e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-02   2.08e-01   4.91e-01   2.813e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-02   1.10e-01   4.15e-01   2.027e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  1.00e-02   6.59e-02   2.85e-01   1.603e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-03   3.66e-02   1.63e-01   9.449e-02   9.434e-01      100   106            100          0        0     19.8  # final               
  2.00e-03   1.58e-02   7.84e-02   9.150e-03   1.859e-01      100   538            100          0        4     12.0  # final               
  1.00e-03   8.05e-03   4.00e-02   2.921e-04   9.046e-03      100   11054          100          0       10      4.4  # final               
  5.00e-04   4.11e-03   2.06e-02   9.401e-06   5.235e-04      100   191034         100          0       17      2.2  # final               
  2.00e-04   1.65e-03   8.33e-03   2.163e-07   1.800e-05       18   1000000         18          0        1      1.4  # final               
  1.00e-04   8.27e-04   4.19e-03   3.265e-08   5.000e-06        5   1000000          5          0        1      1.2  # final               
