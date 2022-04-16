#include <stdio.h>
#include <stdlib.h>

void printInt(int c)
{
  printf("%d\n", c);
}


int* allocIntArray(int c)
{
  return malloc(c*sizeof(int)); 
}

int* malloca(int c, int size)
{
  return malloc(c*size); 
}

int* allocBoolArray(int c)
{
  return malloc(c*sizeof(int)); 
}


void freeInt(int* ptr)
{
  free(ptr); 
}

void freeBool(int* ptr)
{
  free(ptr); 
}

