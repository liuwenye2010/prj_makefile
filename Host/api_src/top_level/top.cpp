#include <stdio.h> 
#include "top.h" 

int top_add(int a, int b) 
{
	return a + b;
	printf("%s: %d\n", __FUNCTION__, __LINE__);	
}

int top_sub(int a, int b) 
{
	printf("%s: %d\n", __FUNCTION__, __LINE__);
    return a-b;
	
}