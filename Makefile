MODULES = geometry misc shop shop_t hello area_server

BIN = bin
VPATH = src:src/headers
ERL = erl -noshell

all: compile

compile: ${MODULES:%=%.beam}

%.beam : %.erl
	erlc -o $(BIN) -W $<

clean:
	rm -rf $(BIN)/*.beam erl_crash.dump