#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/desMCNC_config_980_crit10.dat                                                          #
#     LDPC-code file: ldpc_dv3_k245_n980                                                                             #
#       NETLIST file: desMCNC_ni256_ldpc_dv3_k245_n980                                                               #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    256    |     2204     |     245      |    13462     |     735      |    10 :      41      |   10 :     3587     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#    Binary     |  0.25  |     980     |     735     |  3.00   |  4.00   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-01   3.05e-01   4.90e-01   3.683e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-02   2.08e-01   4.74e-01   2.941e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-02   1.10e-01   3.62e-01   1.997e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  1.00e-02   6.59e-02   2.40e-01   1.433e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-03   3.68e-02   1.41e-01   1.763e-02   3.559e-01      100   281            100          0       11     15.8  # final               
  2.00e-03   1.59e-02   6.16e-02   1.020e-07   1.200e-05       12   1000000         12          0       11      4.2  # final               
  1.00e-03   8.11e-03   3.18e-02   0.000e+00   0.000e+00        0   1000000          0          0        0      2.7  # final               