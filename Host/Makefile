#=============================================================================
# Generic  Host 
# https://www3.ntu.edu.sg/home/ehchua/programming/cpp/gcc_make.html
# http://gcc.gnu.org/onlinedocs/
# http://www.gnu.org/software/make/manual/make.html
#==============================================================================

CXX=g++
#AR=ar
 
 
HOST_ROOT := .

$(info AR is $(AR))
$(info ARFLAGS is $(ARFLAGS)) 
$(info CXX is $(CXX)) 
$(info CXXFLAGS is $(CXXFLAGS)) 
$(info CC is $(CC)) 
$(info CPPFLAGS is $(CPPFLAGS))
$(info LDFLAGS is $(LDFLAGS))  
  
  
TEST_SRCS=$(wildcard *.cpp)

TEST_OBJS=$(TEST_SRCS:.cpp=.o)

TEST_TARGETS=$(TEST_SRCS:.cpp=.test)

TEST_LIBS=$(TEST_SRCS:.cpp=.a)

.PHONY: all clean 

all:
	@echo -e ----------Degin------------------- 
	$(MAKE) -C $(HOST_ROOT)/api_src/mid_level/ clean all 
	$(MAKE) -C $(HOST_ROOT)/api_src/top_level/ clean all 
	$(MAKE) -C $(HOST_ROOT)/demo/dsp_ctrl/ clean all 
	@echo -e  ----------End------------------

%.test : %.cpp
	$(CXX) $(CXXFLAGS) $< $(LDFLAGS) $(LIBS)  -o $@
	
%.o: %.cpp 
	$(CXX) $(CXXFLAGS) -c $<
	
%.a : %.o
	$(AR) $(ARFLAGS) $@  $<

clean:
	rm -f $(TEST_TARGETS) $(TEST_OBJS) $(TEST_LIBS)
