#include <iostream>
#include <string>

// Try this:
//
// Rewrite this program to use lambdas to perform the rotation instead of traditional function calls
 
using transform = char (*)(const char c);

static void usage(const char* name) {
    std::cerr << "Encypt or decrypt a single line of text read from standard input\n"
        << "Usage: " << name << " [-h|l|f]\n";
}

static void help (const char* name) {
    usage(name);
    std::cerr << "Options:\n"
        << "  -h   Show this text\n"
        << "  -l   En(de)crypt using the Latin characters ([A-z,a-z]\n"
        << "         (default)\n"
        << "  -f   En(de)crypt using the Full set of printable ASCII characters\n"
        << "\nRunning with no input from standard in enters 'interactive mode'.\n"
        << "Text can be entered one per line.\n"
        << "The program runs until 'CTRL+C' is entered or EOF is reached.\n\n"
        << "Running on plain text creates cipher text\n"
        << "Running on cipher text creates plain text\n\n";
    exit(0);
}

char rot13(const char c) {
    if (!std::isalpha(c)) return c;

    // in order to rotate upper or lower case
    // need to know where the alphabet 'starts'
    char const start = std::islower(c) ? 'a' : 'A';
    return (c - start + 13) % 26 + start;
}

char rot47(const char c) {
    if (c <= 32) return c;
    return (c - 33 + 47) % 94 + 33;
}

void render_text(std::string message, transform handler) {
    for (const auto& c: message) {
        std::cout << handler(c);
    }
    std::cout << std::endl;
}

int main(int argc, char** argv) {
    // giving us an option to swap in different encryption function
    transform handler = rot13;

    for (int i=1; i < argc; ++i) {
        if (!std::strcmp(argv[i], "-h")) {
            help(*argv);
        } else if (!std::strcmp(argv[i], "-l")) {
            handler = rot13;
        } else if (!std::strcmp(argv[i], "-f")) {
            handler = rot47;
        } else {
            usage(*argv);
            exit(-1);
        }
    }

    std::string message;
    while (getline(std::cin,message)) {
        render_text(message, handler);
    }
}
