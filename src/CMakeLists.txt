cmake_minimum_required(VERSION 3.6)
project(profiler)

find_package(DynamoRIO)
if (NOT DynamoRIO_FOUND)
  message(FATAL_ERROR "DynamoRIO package required to build")
endif(NOT DynamoRIO_FOUND)


add_library(profiler SHARED main.c)
configure_DynamoRIO_client(profiler)

use_DynamoRIO_extension(profiler drmgr)
use_DynamoRIO_extension(profiler drreg)
use_DynamoRIO_extension(profiler drx)
use_DynamoRIO_extension(profiler drutil)
use_DynamoRIO_extension(profiler drwrap)
use_DynamoRIO_extension(profiler drsyms)
use_DynamoRIO_extension(profiler droption)