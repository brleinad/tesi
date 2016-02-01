
tb_generator_detector: tb_generator_detector.v generator.v detector.v
	iverilog generator.v detector.v tb_generator_detector.v -o tb_generator_detector

clean:
	rm tb_generator_detector

test:
	./tb_generator_detector 

results:
	./tb_generator_detector > results.dat
