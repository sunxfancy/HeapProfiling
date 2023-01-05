BUILD_TYPE = RelWithDebInfo
INSTALL_PATH = $(shell pwd)/install
DRRUN = $(INSTALL_PATH)/DynamoRIO/bin64/drrun
PROFILER = build/profiler/libprofiler.so
EXAMPLE = build/example
CC = gcc
FLAG = -O0 -g 
#  -Xlinker -wrap=malloc -Xlinker -wrap=realloc -Xlinker -wrap=free 

run: $(EXAMPLE) $(PROFILER)
	$(DRRUN) -debug -loglevel 1 -c $(PROFILER) -- $(EXAMPLE)

$(EXAMPLE): example/example.c
	mkdir -p build
	$(CC) $(FLAG) example/example.c -o $(EXAMPLE)

$(PROFILER): install/DynamoRIO src/*
	mkdir -p build/profiler
	cmake -DDynamoRIO_DIR=$(INSTALL_PATH)/DynamoRIO/cmake -DCMAKE_BUILD_TYPE=$(BUILD_TYPE) -B build/profiler -S ./src
	cmake --build build/profiler -j $(shell nproc)

install/DynamoRIO:
	cd install && wget https://github.com/DynamoRIO/dynamorio/releases/download/cronbuild-9.0.19328/DynamoRIO-Linux-9.0.19328.tar.gz
	cd install && tar -xzf DynamoRIO-Linux-9.0.19328.tar.gz && mv DynamoRIO-Linux-9.0.19328 DynamoRIO && rm DynamoRIO-Linux-9.0.19328.tar.gz

help:
	$(DRRUN) --help