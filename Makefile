CC   = cc
LD   = cc
CPPFLAGS = -I.
CFLAGS = -O3
LDFLAGS =
LDLIBS = -lm

EXEC = ma.x

OBJS = block.o check_sum.o comm_block.o comm.o comm_parent.o comm_refine.o \
       comm_util.o driver.o init.o main.o move.o pack.o plot.o profile.o \
       rcb.o refine.o stencil.o target.o util.o

$(EXEC): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(LDLIBS)

.c.o:
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $<

clean:
	rm *.o ma.x

# need dependencies

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

target.o: block.h comm.h proto.h timer.h

util.o: block.h comm.h proto.h