asm_file=asm
c_file=main
app_file=runme

run:
	@nasm -f elf $(asm_file).asm 
	@gcc -m32 $(c_file).c $(asm_file).o -o $(app_file)
	@./$(app_file)

clean:
	-@rm *.o $(app_file) 2>/dev/null || true