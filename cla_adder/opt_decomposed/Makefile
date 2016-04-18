BIT=7

add:
	perl decomposed_adder_generator.pl $(BIT) > gen_cla_decomposed.v

sim: *.v
	iverilog gen_linear_part.v gen_nonlinear_part.v gen_cla_decomposed.v tb_gen_cla_decomposed.v -o sim
	./sim > res



