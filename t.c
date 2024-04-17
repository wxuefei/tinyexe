#if 0
#include <stdio.h>
int main(){
	printf("helo\n");
	return 0;
}

#else
#include<windows.h>

const char *msg = "Hello \n";
HANDLE hIn = 0;
HANDLE hOut = 0;
char buf[128] = { 0 };
DWORD dwRead = 0;

int main()
{
    hIn  = GetStdHandle(STD_INPUT_HANDLE);
    hOut = GetStdHandle(STD_OUTPUT_HANDLE);

//    ReadConsoleA(hIn, buf, 100, &dwRead, NULL);

    //WriteConsoleA(hOut, buf, dwRead, NULL, NULL);
    WriteConsoleA(hOut, msg, 7, NULL, NULL);
    return 2;
}
#endif