#===========================================NETLIST-LDPC SIMULATOR CHAIN=============================================#
# Configuration file: ../data/C5315MCNC_config.dat                                                                   #
#     LDPC-code file: ldpc_dv3_k123_n246                                                                             #
#       NETLIST file: C5315MCNC_ni178_ldpc_dv3_k123_n246                                                             #
#--------------------------------------------------------------------------------------------------------------------#
# Nb Inputs | Nb Interns-F | Nb Outputs-F | Nb Interns-P | Nb Outputs-P |  CT-F :   Nb Nodes   | CT-P :   Nb Nodes   #
#    178    |     936      |     123      |     2307     |     123      |     5 :     324      |    5 :     1251     #
#--------------------------------------------------------------------------------------------------------------------#
#   LDPC-type   |  Rate  |  Var-Nodes  |  Chk-Nodes  | Var-Deg | Chk-Deg |   LDPC-Decoding   |  Scheduling | MaxIter #
#    Binary     |  0.50  |     246     |     123     |  3.00   |  6.00   |      Min-Sum      |  flooding   |   20    #
#--------------------------------------------------------------------------------------------------------------------#
# fixed-point quantization: input and extrinsic LLRs = 3 bits, output LLRs = 5 bits                                  #
#       input scale factor: 2                                                                                        #
#--------------------------------------------------------------------------------------------------------------------#
#                                             Simulation results                                                     #
#--------------------------------------------------------------------------------------------------------------------#
#        Error Probability       |  Estimated F-output   |  Number of Frames  |    LDPC Error Detection    | Average #
#   gate   |  out-F   |  out-P   |    BER    |    FER    |  Error / Simulated |  Detect | Undetect | False | Iter Nb #
#----------|----------|----------|-----------|-----------|--------------------|---------|----------|-------|---------#
  1.00e-01   2.46e-01   4.86e-01   3.169e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  5.00e-02   1.44e-01   4.19e-01   2.360e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  2.00e-02   6.80e-02   2.50e-01   1.731e-01   1.000e+00      100   100            100          0        0     20.0  # final               
  1.00e-02   3.58e-02   1.48e-01   1.157e-01   9.901e-01      100   101             98          2        0     19.8  # final               
  5.00e-03   1.77e-02   8.57e-02   7.817e-02   9.615e-01      100   104             75         25        0     18.2  # final               
  2.00e-03   6.43e-03   3.44e-02   6.009e-02   9.524e-01      100   105             28         72        0     11.8  # final               
  1.00e-03   3.22e-03   1.78e-02   6.035e-02   9.009e-01      100   111             15         85        0      8.2  # final               
  5.00e-04   1.70e-03   9.60e-03   5.900e-02   9.524e-01      100   105             10         90        0      7.8  # final               
  2.00e-04   4.39e-04   3.88e-03   5.874e-02   9.009e-01      100   111              5         95        0      6.2  # final               
  1.00e-04   6.14e-04   1.84e-03   5.883e-02   9.434e-01      100   106              3         97        0      6.2  # final               
  5.00e-05   0.00e+00   8.13e-04   5.706e-02   9.091e-01      100   110              6         94        0      5.9  # final               
  2.00e-05   7.46e-05   5.22e-04   5.579e-02   9.174e-01      100   109              4         96        0      5.4  # final               
  1.00e-05   7.82e-05   2.35e-04   6.270e-02   9.615e-01      100   104              8         92        0      6.6  # final               