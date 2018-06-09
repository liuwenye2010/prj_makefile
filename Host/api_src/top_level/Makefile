#=============================================================================
# Generic top level 
# https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html
# http://gcc.gnu.org/onlinedocs/
# http://www.gnu.org/software/make/manual/make.html
#==============================================================================

CXX=g++
#AR=ar
$(info AR is $(AR))
$(info ARFLAGS is $(ARFLAGS)) 
$(info CXX is $(CXX)) 
$(info CXXFLAGS is $(CXXFLAGS)) 
$(info CC is $(CC)) 
$(info CPPFLAGS is $(CPPFLAGS)) 
 
HOST_ROOT := ../..
CXXFLAGS=-I$(HOST_ROOT)/api/top_level/include 
TARGET_PATH=$(HOST_ROOT)/api/top_level/lib
 


TEST_SRCS=\
	top.cpp

TEST_OBJS=$(TEST_SRCS:.cpp=.o)

TEST_TARGETS=$(TEST_SRCS:.cpp=.test)

#TEST_LIBS=$(TEST_SRCS:.cpp=.a)
TEST_LIBS=$(TARGET_PATH)/libtop.a

.PHONY: all clean 

all: $(TEST_LIBS)


#%.test : %.cpp
#	$(CXX) $(CXXFLAGS) $< -o $@
	
%.o: %.cpp 
	$(CXX) $(CXXFLAGS) -c $<
	
$(TEST_LIBS):*.o
	$(AR) $(ARFLAGS) $@  $<

clean:
	rm -f $(TEST_TARGETS) $(TEST_OBJS) $(TEST_LIBS)
