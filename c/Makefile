CC = gcc
CFLAGS = -Wall -O3 -fPIC -I. -I./simde
UNAME_S := $(shell uname -s)

# Platform-specific settings
ifeq ($(UNAME_S),Darwin)
    # macOS
    SHARED_LIB = libsimdish.dylib
    LDFLAGS = -dynamiclib
else
    # Linux and others
    SHARED_LIB = libsimdish.so
    LDFLAGS = -shared
endif

# Source files
SOURCES = simd_add.c simd_sub.c simd_mul.c simd_div.c

# Object files
OBJECTS = $(SOURCES:.c=.o)

# Default target
all: $(SHARED_LIB)

# Create shared library
$(SHARED_LIB): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^

# Create object files
%.o: %.c simdish.h
	$(CC) $(CFLAGS) -c $< -o $@

# Install (optional)
install: $(SHARED_LIB)
	cp $(SHARED_LIB) /usr/local/lib/
	cp simdish.h /usr/local/include/

# Clean up
clean:
	rm -f $(OBJECTS) $(SHARED_LIB)

.PHONY: all install clean
