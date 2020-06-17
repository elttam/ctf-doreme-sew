#include <unistd.h>
int main() {
  char *newargv[] = { "/bin/cat", "/flag.txt", NULL };
  char *newenviron[] = { NULL };
  execve("/bin/cat", newargv, newenviron);
}
