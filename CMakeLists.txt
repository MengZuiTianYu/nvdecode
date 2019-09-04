cmake_minimum_required(VERSION 3.5)
                           
project(main)         
#MESSAGE(FATAL_ERROR "${CMAKE_BUILD_TYPE}")


if(CMAKE_COMPILER_IS_GNUCC)
    message("COMPILER IS GNUCC")    
    ADD_DEFINITIONS ( -std=c++11 )  
endif(CMAKE_COMPILER_IS_GNUCC)

set(CUDA_DIR "/usr/local/cuda")
find_package(CUDA)

SET(CUDA_NVCC_FLAGS --disable-warnings;-std=c++11;-O3;-gencode arch=compute_75,code=sm_75)
INCLUDE_DIRECTORIES(/usr/local/cuda/include)

#CUDA_ADD_LIBRARY(${PROJECT_NAME} SHARED)

message(${CUDA_NVCC_FLAGS})

#opencv
#set(OpenCV_DIR "/data/wuh/open_source/opencv-3.4.6/build")
#find_package(OpenCV REQUIRED)
#include_directories(${OpenCV_INCLUDE_DIRS})
link_directories("/usr/local/lib")
include_directories("/usr/local/include/opencv4")
link_directories("")

#message(${SOURCE_FILES})

#tensorRT
include_directories(/data/wuh/software/TensorRT-5.1.2.2/include)
link_directories(/data/wuh/software/TensorRT-5.1.2.2/lib)
link_directories(/data/wuh/project/test_algorithm_module/algorithm_module/build/)
LINK_LIBRARIES(algorithm)

MESSAGE(STATUS "CMAK_SOURCE_DIR" ${CMAKE_SOURCE_DIR})
INCLUDE_DIRECTORIES(${CMAKE_SOURCE_DIR}/include/nvdecoder)
MESSAGE(STATUS "CMAK_SOURCE_DIR" ${CMAKE_SOURCE_DIR})

FILE(GLOB_RECURSE SOURCE_FILES ${CMAKE_SOURCE_DIR}/src/*.cu  ${CMAKE_SOURCE_DIR}/src/*.cpp)

LINK_LIBRARIES(opencv_ml opencv_objdetect opencv_imgproc opencv_core opencv_highgui opencv_imgcodecs opencv_shape opencv_videoio opencv_video)
LINK_LIBRARIES(nvcaffe_parser nvinfer nvinfer_plugin nvparsers)
#LINK_LIBRARIES(algorithm)
LINK_LIBRARIES(glog)
#6.source directory，源文件目录
AUX_SOURCE_DIRECTORY(test DIR_SRCS)

#7.set environment variable，设置环境变量，编译用到的源文件全部都要放到这里，否则编译能够通过，
#但是执行的时候会出现各种问题，比如"symbol lookup error xxxxx , undefined symbol"
SET(TEST_MATH ${DIR_SRCS} ${PROTO_SRCS} ${SOURCE_FILES})

#8.add executable file，添加要编译的可执行文件
ADD_EXECUTABLE(${PROJECT_NAME} ${TEST_MATH})

#9.add link library，添加可执行文件所需要的库，比如我们用到了libm.so（命名规则：lib+name+.so），就添加该库的名称
TARGET_LINK_LIBRARIES(${PROJECT_NAME} ${PROTOBUF_LIBRARIES})
target_link_libraries(${PROJECT_NAME} /usr/local/cuda-10.1/lib64/libcudart.so)
target_link_libraries(${PROJECT_NAME} /usr/local/cuda-10.1/lib64/libcudnn.so)
#target_link_libraries(${PROJECT_NAME} /data/wuh/project/test_algorithm_module/algorithm_module/build/libalgorithm.so)
