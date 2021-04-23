obj-m += modulo.o
KVERSION = $(shell uname -r)

all:
# gcc  hello.c -o modulo
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) modules

clean:
	make -C /lib/modules/$(KVERSION)/build M=$(PWD) clean