.PHONY:	all deps compile test clean xref docs rel

all: compile

deps:
	./rebar get-deps

compile: deps
	./rebar compile

docs:
	./rebar skip_deps=true doc

test: ct eunit xref

eunit: compile
	./rebar skip_deps=true eunit

ct: compile
	./rebar skip_deps=true ct

xref: compile
	./rebar skip_deps=true xrefx

rel: compile
	./rebar generate

clean:
	./rebar clean
