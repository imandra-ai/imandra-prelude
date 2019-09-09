
build:
	@dune build @install -j 3

clean:
	@dune clean

FILES=$(shell find src \( -name '*.ml' -or -name '*.mli' \))

reindent:
	ocp-indent -i $(FILES)

test:
	@dune runtest --force --no-buffer
