.PHONY: all info clean

# XXX portability
CC       := pgcc
LDFLAGS  := -L/opt/pgi/linux86-64/2018/mpi/openmpi/lib
CFLAGS   := -I/opt/pgi/linux86-64/2018/mpi/openmpi-2.1.2/include

LDLIBS   := -lm -lmpi -lopen-pal -lopen-rte -lrdmacm
ACCFLAGS := -acc -ta=nvidia
ACCFLAGS := $(ACCFLAGS) $(CFLAGS)



EXEC = ma.x

OBJS = block.o check_sum.o comm_block.o comm.o comm_parent.o comm_refine.o \
       comm_util.o driver.o init.o main.o move.o pack.o plot.o profile.o \
       rcb.o refine.o stencil.o util.o

all: $(EXEC)

info: ACCFLAGS := $(ACCFLAGS) -Minfo=accel
info: all

infoall: ACCFLAGS := $(ACCFLAGS) -Minfo=all
infoall: all

$(EXEC): $(OBJS)
	$(CC) $(LDFLAGS) -o $@ $(OBJS) $(ACCFLAGS) $(LDLIBS)

.c.o:
	$(CC) $(ACCFLAGS) -c $<

clean:
	rm -f *.o ma.x

block.o: block.h proto.h comm.h timer.h

check_sum.o: block.h comm.h proto.h

comm_block.o: block.h comm.h proto.h

comm.o: block.h comm.h proto.h timer.h

comm_parent.o: block.h comm.h proto.h

comm_refine.o: block.h comm.h proto.h

comm_util.o: block.h comm.h proto.h

driver.o: block.h comm.h proto.h timer.h

init.o: block.h proto.h comm.h

main.o: block.h comm.h proto.h param.h

move.o: block.h comm.h proto.h

pack.o: block.h comm.h proto.h

plot.o: block.h comm.h proto.h

profile.o: block.h comm.h proto.h timer.h

rcb.o: block.h comm.h proto.h timer.h

refine.o: block.h comm.h proto.h timer.h

stencil.o: block.h comm.h proto.h

util.o: block.h comm.h proto.h
