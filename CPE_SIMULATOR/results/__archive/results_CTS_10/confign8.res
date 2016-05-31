#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/confign8.dat                                                                           #
#     LDPC-code file: iRISC_dv4_K975_N1296                                                                           #
#       NETLIST file: linear/linear_ni648_IRISC_dv4_K975_N1296                                                       #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    648    |    46244     |     975      |    17289     |     321      |    10 :     3330     |   10 :     1401     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#  QC[exp=27]   |  0.75  |    1296     |     324     |  4.00   |  16.00  |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-03   8.32e-02   9.94e-02   9.457e-02   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-04   4.43e-02   4.92e-02   7.524e-02   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-04   1.83e-02   2.07e-02   1.765e-02   4.132e-01      100   242            100          0        0     14.3  # final               
  1.00e-04   9.19e-03   1.09e-02   1.505e-03   4.598e-02      100   2175           100          0        0      6.3  # final               
  5.00e-05   4.61e-03   5.48e-03   8.424e-05   3.190e-03      100   31352          100          0        1      2.6  # final               
  2.00e-05   1.84e-03   2.22e-03   2.065e-06   9.100e-05       91   1000000         91          0        1      1.3  # final               
  1.00e-05   9.20e-04   1.11e-03   1.497e-07   1.000e-05       10   1000000         10          0        0      1.1  # final               