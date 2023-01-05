# HeapProfiling

Tested OS: Ubuntu 22.02

## Build And Run Example

After you type `make`, it should build the libprofiler.so and the example binrary file. The output looks like that:

```
<wrapped malloc @0x00007f04c77bc590>
malloc(40)= 0x00007f04c3d082a0
malloc(1024)= 0x00007f04c3d082d0
a = 0x7f04c3d082a0
<Stopping application /home/xiaofan/Workspace/HeapProfiling/build/example (566310)>
Instrumentation results:
  saw 45574 memory references
```

## Log file

The memory trace will be at the path `build/profiler/memtrace.example.*.log`

