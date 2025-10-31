#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_usage(const char *program_name) {
    fprintf(stderr, "Usage: %s <command> [arguments]\n", program_name);
    fprintf(stderr, "Commands:\n");
    fprintf(stderr, "  get              Get current brightness\n");
    fprintf(stderr, "  set <value>      Set brightness to value (integer or percentage)\n");
    fprintf(stderr, "  list             List available displays\n");
}

int parse_arguments(int argc, char *argv[]) {
    if (argc < 2) {
        print_usage(argv[0]);
        return 1;
    }

    const char *command = argv[1];

    if (strcmp(command, "get") == 0) {
        printf("Command: get\n");
        // TODO: Implement get brightness functionality
        return 0;
    } else if (strcmp(command, "set") == 0) {
        if (argc < 3) {
            fprintf(stderr, "Error: 'set' command requires a value argument\n");
            print_usage(argv[0]);
            return 1;
        }
        
        const char *value_str = argv[2];
        char *endptr;
        long value = strtol(value_str, &endptr, 10);
        
        // Check if conversion was successful
        if (endptr == value_str || *endptr != '\0') {
            fprintf(stderr, "Error: Invalid value '%s'. Must be an integer or percentage.\n", value_str);
            return 1;
        }
        
        printf("Command: set %ld\n", value);
        // TODO: Implement set brightness functionality
        return 0;
    } else if (strcmp(command, "list") == 0) {
        printf("Command: list\n");
        // TODO: Implement list displays functionality
        return 0;
    } else {
        fprintf(stderr, "Error: Unknown command '%s'\n", command);
        print_usage(argv[0]);
        return 1;
    }
}

int main(int argc, char *argv[]) {
    return parse_arguments(argc, argv);
}
