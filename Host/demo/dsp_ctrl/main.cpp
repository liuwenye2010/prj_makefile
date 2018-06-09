#include <stdio.h> 
#include "top.h" 
#include "mid.h" 


int main(void)
{
	printf("hello world begin\n"); 
	int a =1; 
	int b =2; 
	int c =0; 
	int d =0; 
	c=mid_add(a,b); 
	d=top_add(a,b); 
	printf("mid_add(%d,%d)== %d\n",a,b,c); 
	printf("top_add(%d,%d)== %d\n",a,b,d); 
	printf("hello world end\n"); 
}