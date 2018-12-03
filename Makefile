CC=gcc
CFLAGS=-lWarn -pedantic

tempread: tempread.o
	cc tempread.o -o tempread

tempread.o:	tempread.c
	$(CC) $(CFLAGS) -c -ansi $<

clean:
	rm tempread *.o
