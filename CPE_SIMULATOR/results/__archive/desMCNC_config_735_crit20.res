#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/desMCNC_config_735_crit20.dat                                                          #
#     LDPC-code file: ldpc_dv3_k245_n735                                                                             #
#       NETLIST file: desMCNC_ni256_ldpc_dv3_k245_n735                                                               #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    256    |     2204     |     245      |    10302     |     490      |    20 :      41      |   20 :     2918     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#    Binary     |  0.33  |     735     |     490     |  3.00   |  4.50   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-01   3.05e-01   5.01e-01   3.671e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-02   2.08e-01   4.95e-01   2.922e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-02   1.10e-01   4.19e-01   2.042e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  1.00e-02   6.59e-02   3.07e-01   1.658e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-03   3.65e-02   1.83e-01   9.050e-02   9.091e-01      100   110            100          0        0     19.6  # final               
  2.00e-03   1.57e-02   8.48e-02   2.917e-03   6.398e-02      100   1563           100          0       27      8.0  # final               
  1.00e-03   8.14e-03   4.42e-02   2.771e-05   9.837e-04      100   101653         100          0       24      3.5  # final               
  5.00e-04   4.10e-03   2.26e-02   3.714e-07   2.000e-05       20   1000000         20          0        8      2.3  # final               
  2.00e-04   1.65e-03   9.16e-03   0.000e+00   0.000e+00        0   1000000          0          0        0      1.6  # final               
