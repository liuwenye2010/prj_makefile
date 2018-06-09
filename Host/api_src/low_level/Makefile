#=============================================================================
# Generic mid level 
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
CXXFLAGS=-I$(HOST_ROOT)/api/low_level/include 
TARGET_PATH=$(HOST_ROOT)/api/low_level/lib
   


TEST_SRCS=\
	low.cpp

TEST_OBJS=$(TEST_SRCS:.cpp=.o)

TEST_TARGETS=$(TEST_SRCS:.cpp=.test)

#TEST_LIBS=$(TEST_SRCS:.cpp=.a)
TEST_LIBS=$(TARGET_PATH)/liblow.a
TEST_TEMP_LIBS=$(TARGET_PATH)/liblow_temp.a
TEST_INTERFACE_A_LIBS=$(TARGET_PATH)/../interface_a/lib/libinterface_a.a
TEST_INTERFACE_B_LIBS=$(TARGET_PATH)/../interface_b/lib/libinterface_b.a

.PHONY: all clean 

all: clean $(TEST_TEMP_LIBS) $(TEST_INTERFACE_A_LIBS)  $(TEST_INTERFACE_B_LIBS)
	cp $(TEST_INTERFACE_A_LIBS)  ./ &&  cp $(TEST_INTERFACE_B_LIBS)  ./ && cp $(TEST_TEMP_LIBS)  ./  && \
	rm -f *.o && \
	$(AR) -x $(TEST_INTERFACE_A_LIBS)  &&  $(AR) -x $(TEST_INTERFACE_B_LIBS)  &&  $(AR) -x $(TEST_TEMP_LIBS)  && \
	$(AR) $(ARFLAGS) $(TEST_LIBS)  *.o   && \
	rm -f $(TEST_TEMP_LIBS)

#%.test : %.cpp
#	$(CXX) $(CXXFLAGS) $< -o $@
	
%.o: %.cpp 
	$(CXX) $(CXXFLAGS) -c $<
	
$(TEST_TEMP_LIBS): $(TEST_OBJS)
	$(AR) $(ARFLAGS) $@  $<

$(TEST_INTERFACE_A_LIBS): 
	$(MAKE) -C  $(HOST_ROOT)/api_src/low_level/interface_a/  all 

$(TEST_INTERFACE_B_LIBS): 
	$(MAKE) -C  $(HOST_ROOT)/api_src/low_level/interface_b/  all 


clean:
	rm -f $(TEST_TARGETS) $(TEST_OBJS) $(TEST_LIBS) $(TEST_INTERFACE_A_LIBS) $(TEST_INTERFACE_B_LIBS)
	rm -f *.o  *.a
