
MODULES = geometry misc shop shop_t hello

ERL = erl -noshell

all: compile
	$(ERL) -s hello start -s init stop

compile: ${MODULES:%=%.beam}

%.beam : %.erl
	erlc -W $<	

clean: 
	rm -rf *.beam erl_crash.dump