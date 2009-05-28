# source files.
SRC =  	source/glues_error.o source/glues_mipmap.o source/glues_project.o source/glues_quad.o source/glues_registry.o \
	source/libtess/dict.o \
	source/libtess/geom.o \
	source/libtess/memalloc.o \
	source/libtess/mesh.o \
	source/libtess/normal.o \
	source/libtess/priorityq.o \
	source/libtess/render.o \
	source/libtess/sweep.o \
	source/libtess/tess.o \
	source/libtess/tessmono.o 


OBJ = $(SRC:.c=.o)

OUT = libGLUES_CM.a

# include directories
INCLUDES = -Isource -I$(PNDSDK)/usr/include

# C compiler flags (-g -O2 -Wall)
DEBUG_CCFLAGS = -g -Wall

CCFLAGS = -Wall -O2 -march=armv7-a -mcpu=cortex-a8 -mtune=cortex-a8 -mfloat-abi=softfp -mfpu=neon -ftree-vectorize -ffast-math -fomit-frame-pointer -fno-strict-aliasing -fsingle-precision-constant -D__USE_SDL_GLES__=1

# compiler
CC = arm-none-linux-gnueabi-gcc
CXX = arm-none-linux-gnueabi-g++

# library paths
LIBS = -L$(PNDSDK)/usr/lib -lGLES_CM

# compile flags
LDFLAGS = -g

.SUFFIXES: .c

default: $(OUT)

.c.o:
	$(CC) $(INCLUDES) $(CCFLAGS) -c $< -o $@

.cpp.o:
	$(CXX) $(INCLUDES) $(CCFLAGS) -c $< -o $@

$(OUT): $(OBJ)
	arm-none-linux-gnueabi-ar rcs $(OUT) $(OBJ)

clean:
	rm -f $(OBJ) $(OUT) 


