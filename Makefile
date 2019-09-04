CPPFLAGS :=
CPP = g++
CUCC = nvcc
LIBS :=
LDFLAGS = -g 
PROGRAM = demux

CUDA_HOME = /usr/local/cuda
INCLUDE_USR_LOCAL_DIR = /usr/local/include/opencv4
INCLUDE_CUDA_HOME=$(CUDA_HOME)/include

INCLUDE_TOOLS_COMMON=.

INCLUDE_DIR = -I"$(INCLUDE_USR_LOCAL_DIR)" \
			  -I"$(INCLUDE_CUDA_HOME)" \
			  -I ./
			  
LIBS_PATH = -L /usr/local/lib -L /usr/lib/x86_64-linux-gnu -L"$(CUDA_HOME)/lib64"
LIBS += $(LIBS_PATH) -lpthread -lavutil -lavcodec -lswscale -lavformat \
			  		 -lopencv_core  -lopencv_highgui -lopencv_videoio -lopencv_imgproc -lopencv_imgcodecs -lopencv_cudaimgproc -lopencv_cudawarping \
  					 -lcuda -lnvcuvid -lcudart


SRC_DECODE=./

SRCS := ./*.cpp \

SRCSU := ./*.o
OBJS := $(SRCS:.cpp = .o)
OBJSCU := $(SRCSU:.cu=.o)

CPPFLAGS += -std=c++11

CUFLAGS += -m64 -ccbin g++


all: build

build: $(PROGRAM)

ColorSpace.o: ColorSpace.cu
	nvcc -std=c++11 -o $@ -c $<

NvDecoder.o: NvDecoder.cpp NvDecoder.h
	$(CPP) $(CPPFLAGS) $(INCLUDE_DIR) -o $@ -c $<
RtspProcess.o: RtspProcess.cpp RtspProcess.h NvDecoder.h ColorSpace.h FFmpegDemuxer.h
	$(CPP) $(CPPFLAGS) $(INCLUDE_DIR) -o $@ -c $<

$(PROGRAM):NvDecoder.o RtspProcess.o ColorSpace.o
	$(CPP) $(CPPFLAGS) -o $@ $^ $(LIBS)


.PHONY:clean

clean:
	rm -rf NvDecoder.o RtspProcess.o ColorSpace.o $(PROGRAM)
