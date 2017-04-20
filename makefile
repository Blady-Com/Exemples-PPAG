all: hello 

hello:
	cd src && gprbuild -p -Phello.gpr

clean:
	cd src && gprclean -Phello.gpr
