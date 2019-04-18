CC=g++
CFLAGS = -std=c++11

DEPS = src/*.h

SRCS = $(shell find -name *.cpp)
OBJS := $(addsuffix .o,$(basename $(SRCS)))

all: run

src/%.o: src/%.cpp $(DEPS)
	$(CC) -std=c++11 -c -o $@ $< $(CFLAGS)

run: $(OBJS)
	$(CC) -std=c++11 -o $@ $^ 

clean: 
	rm -rf src/*.o
	rm -rf src/*/*.o
