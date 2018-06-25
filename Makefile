
build:
	jbuilder build @install -j 3

clean:
	jbuilder clean

FILES=$(shell find src \( -name '*.ml' -or -name '*.mli' \))

reindent:
	ocp-indent -i $(FILES)
