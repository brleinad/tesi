#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/desMCNC_config_1470_crit100.dat                                                        #
#     LDPC-code file: ldpc_dv3_k245_n1470                                                                            #
#       NETLIST file: desMCNC_ni256_ldpc_dv3_k245_n1470                                                              #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    256    |     2204     |     245      |    20016     |     1225     |   100 :      6       |  100 :     2957     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#    Binary     |  0.17  |    1470     |    1225     |  3.00   |  3.60   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-01   3.51e-01   4.92e-01   3.829e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-02   2.55e-01   4.87e-01   3.100e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-02   1.45e-01   4.55e-01   2.173e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  1.00e-02   8.75e-02   3.59e-01   1.628e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-03   5.66e-02   2.44e-01   1.140e-01   9.804e-01      100   102            100          0        1     20.0  # final               
  2.00e-03   2.18e-02   1.12e-01   4.811e-03   9.461e-02      100   1057           100          0       30      9.5  # final               
  1.00e-03   1.07e-02   6.04e-02   2.816e-04   7.112e-03      100   14061          100          0       25      4.7  # final               
  5.00e-04   5.32e-03   3.10e-02   1.282e-05   3.813e-04      100   262280         100          0       44      3.0  # final               
  2.00e-04   2.16e-03   1.27e-02   1.837e-07   7.000e-06        7   1000000          7          0        9      2.0  # final               