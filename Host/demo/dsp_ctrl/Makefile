#=============================================================================
# Generic  demo dsp_ctrl
# https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html
# http://gcc.gnu.org/onlinedocs/
# http://www.gnu.org/software/make/manual/make.html
# https://blog.csdn.net/pengfei240/article/details/55228228
#==============================================================================

CXX=g++
#AR=ar
 
 
HOST_ROOT := ../..
CXXFLAGS+=-I$(HOST_ROOT)/api/mid_level/include \
  -I$(HOST_ROOT)/api/top_level/include \

LDFLAGS+=-L$(HOST_ROOT)/api/mid_level/lib \
  -L$(HOST_ROOT)/api/top_level/lib 

LIBS=-lmid -ltop
#LIBS=-linterface_a  -linterface_b  -llow 

#CXXFLAGS+=-ffunction-sections -fdata-sections

LDFLAGS+=-Wl,--gc-sections

$(info AR is $(AR))
$(info ARFLAGS is $(ARFLAGS)) 
$(info CXX is $(CXX)) 
$(info CXXFLAGS is $(CXXFLAGS)) 
$(info CC is $(CC)) 
$(info CPPFLAGS is $(CPPFLAGS))
$(info LDFLAGS is $(LDFLAGS))  
  
  
TEST_SRCS=\
	main.cpp

TEST_OBJS=$(TEST_SRCS:.cpp=.o)

TEST_TARGETS=$(TEST_SRCS:.cpp=.test)

TEST_LIBS=$(TEST_SRCS:.cpp=.a)

.PHONY: all clean 

all: $(TEST_TARGETS) $(TEST_LIBS)

%.test : %.cpp
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) $(LIBS)  -o $@
	
%.o: %.cpp 
	$(CXX) $(CXXFLAGS) -c $<
	
%.a : %.o
	$(AR) $(ARFLAGS) $@  $<

clean:
	rm -f $(TEST_TARGETS) $(TEST_OBJS) $(TEST_LIBS)
