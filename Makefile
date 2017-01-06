VPATH = src:src/headers
MODULES = geometry misc shop shop_t hello
ERL = erl -noshell
BIN = bin

all: compile

compile: ${MODULES:%=%.beam}

%.beam : %.erl
	erlc -o $(BIN) -W $<

clean: 
	rm -rf $(BIN)/*.beam erl_crash.dump