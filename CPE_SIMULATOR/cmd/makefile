CC=g++

# ######################################################################
# User variables that CAN BE MODIFIED to fit with the current file names
# ######################################################################

# =====
# LIB_SRC_NAMES: list of source file names used to build the library WITHOUT their extension
# =====

LIB_SRC_NAMES := Tools      Tools_Str     Config      DispConfig      Fixp
LIB_SRC_NAMES += BIN_SRC    NETLIST_ENC   DECODING    DEC_FIXP_LDPC_BIN         
LIB_SRC_NAMES += BER_FER    CPE_SIMULATOR      

# ###################################
# Variables that MUST NOT BE MODIFIED
# ###################################

LIB_OBJ_NAMES := $(foreach NAME, $(LIB_SRC_NAMES), ../obj/$(NAME).o)
LIB_OBJ_NAMES32 := $(foreach NAME, $(LIB_SRC_NAMES), ../obj/$(NAME).32o)
LIB_OBJ_NAMES64 := $(foreach NAME, $(LIB_SRC_NAMES), ../obj/$(NAME).64o)

cpe_sim : $(LIB_OBJ_NAMES)
	$(CC) -O3  $^ -o ../bin/cpe_sim.x

cpe_sim32 : $(LIB_OBJ_NAMES32)
	$(CC) -m32 -O3  $^ -o ../bin/cpe_sim32.x

cpe_sim64 : $(LIB_OBJ_NAMES64)
	$(CC) -m64 -O3  $^ -o ../bin/cpe_sim64.x
	

../obj/%.o : ../src/%.cpp ../include/%.h
	$(CC) -O3  -D  MAKE_TERM_RESIZE  -c $< -o $@
	
../obj/%.32o : ../src/%.cpp ../include/%.h
	$(CC) -m32  -O3  -D  MAKE_TERM_RESIZE  -c $< -o $@

../obj/%.64o : ../src/%.cpp ../include/%.h
	$(CC) -m64 -O3  -D  MAKE_TERM_RESIZE  -c $< -o $@

clean : 
	rm -f *~ *# ../obj/* ../src/*~ ../src/*# ../include/*~ ../include/*# 

	
