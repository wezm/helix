#NAME=
OBJS=parser.o

# TODO: Add -std flag
CFLAGS += -I. -fPIC
CXXFLAGS += -I. -fPIC -fno-exceptions
LDFLAGS += -shared

.if exists(scanner.c)
OBJS += scanner.o
.elif exists(scanner.cc)
OBJS += scanner.o
LDLIBS += -lstdc++
.endif

${NAME}: ${OBJS}
	$(CC) $(LDFLAGS) ${.ALLSRC} $(LDLIBS) -o ${.TARGET}

clean:
	rm -f ${NAME} ${OBJS}
