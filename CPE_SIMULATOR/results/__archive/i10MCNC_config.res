#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/i10MCNC_config.dat                                                                     #
#     LDPC-code file: ldpc_dv3_k224_n448                                                                             #
#       NETLIST file: i10MCNC_ni257_ldpc_dv3_k224_n448                                                               #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    257    |     1190     |     224      |     1190     |     224      |    10 :     245      |   10 :     245      #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#    Binary     |  0.50  |     448     |     224     |  3.00   |  6.00   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  0.00e+00   0.00e+00   0.00e+00   1.241e-01   1.000e+00      100   100            100          0        0     20.0  # final               
