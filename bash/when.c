#include <jlib.h>
#include <termios.h>

struct termios oldt, newt;

void signal_handler(int signum) {
    printf("\e[?25h\n");
    fflush(stdout);
    tcsetattr(STDIN_FILENO, TCSANOW, &oldt);
    exit(1);
}

int main() {
    newt = oldt;
    newt.c_lflag &= ~(ECHO); 
    tcgetattr(STDIN_FILENO, &oldt);
    newt = oldt;
    newt.c_lflag &= ~(ECHO);  
    tcsetattr(STDIN_FILENO, TCSANOW, &newt);

    signal(SIGINT, signal_handler);
    printf("\e[?25l"); fflush(stdout);
    time_t current_time = time(NULL);
    struct tm *time_info = localtime(&current_time);
    string time_string = (string)calloc(0x40, sizeof(char));
    strftime(time_string, 0x40, "%a %b %e %H:%M:%S %Z %Y", time_info);
    while(1){
        time_t current_time = time(NULL);
        time_info = localtime(&current_time);
        string time_string = (string)calloc(0x40, sizeof(char));
        strftime(time_string, 0x40, "%a %b %e %H:%M:%S %Z %Y", time_info);
        printf("\r%s", time_string);
        fflush(stdout);
    }
    return 0;
}
