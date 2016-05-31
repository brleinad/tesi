#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/C6288MCNC_config.dat                                                                   #
#     LDPC-code file: ldpc_dv3_k32_n64                                                                               #
#       NETLIST file: C6288MCNC_ni32_ldpc_dv3_k32_n64                                                                #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    32     |     5741     |      32      |     6822     |      32      |     3 :     5269     |    3 :     5396     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#    Binary     |  0.50  |     64      |     32      |  3.00   |  6.00   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-01   4.08e-01   4.98e-01   4.606e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-04   4.71e-03   1.63e-02   2.720e-03   1.173e-02      100   8524           100          0        5      1.6  # final               
  1.00e-05   9.65e-05   3.17e-04   1.906e-06   4.100e-05       41   1000000         41          0        0      1.0  # final               
