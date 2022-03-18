OS := $(shell uname)
ifeq ($(OS), Darwin)
	OS := mac
else ifeq ($(OS), Linux)
	OS := linux
else
	OS := linux
endif

CXX = gcc
OUTPUT = ./build/clox
LIBS =
ifeq ($(OS), linux)
	LIBS = -lm
endif

all: clean build

build-folder:
	mkdir ./build

build: build-folder
	$(info Building for $(OS))
	$(CXX) ./*.c $(LIBS) -o $(OUTPUT)

clean:
	rm -rf ./build

run: clean build
	./build/clox

.PHONY: test
test:
	sh ./test/run.sh

