#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

void printInt(int c)
{
  printf("%d\n", c);
}

void printBool(bool c)
{
  printf("%s\n", c ? "true" : "false");
}

int* allocIntArray(int c)
{
  return malloc(c*sizeof(int)); 
}

void* malloca(int c, int size)
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

void freePtr(void* ptr)
{
  free(ptr); 
}