
all: callfun xa_elements target1 

V=@
define myfun
	$(V)echo "hello $(1)"
	$(V)echo "world $(2)"
endef 

callfun:
	$(V)echo "hello callfun"
	$(call myfun , AA, BB)
	$(V)xa=("ass" "bss");\
	for element in "$${xa[@]}"; do  \
	  echo "$$element"; \
	done; 
	$(V)echo "VAL==$${xa[1]}"
	$(V)echo "END"

xa_elements:
	$(V)xa=("apple" "banana" "cherry" "date"); \
	for element in "$${xa[@]}"; do \
	    echo "$$element"; \
	done
	$(V)echo "DONE"
	
	
target1:
	@local_variable = This is a local variable;\
	export local_variable;\
	echo "In target1: $$local_variable";

target2:
	@echo "In target2: $$local_variable""

	