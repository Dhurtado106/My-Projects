#include <iostream>
#include <vector>
#include <map>
#include <sstream>

int main() {
    std::vector<std::string> program;
    std::map<std::string, int> variables;
    
    std::cout << "✨ FRESH BASIC INTERPRETER\n";
    std::cout << "Type BASIC code line by line\n";
    std::cout << "Commands: PRINT, LET, INPUT, GOTO, IF, END\n";
    std::cout << "Type 'RUN' to execute, 'EXIT' to quit\n\n";
    
    while (true) {
        std::cout << "> ";
        std::string line;
        std::getline(std::cin, line);
        
        if (line == "EXIT") break;
        if (line == "RUN") {
            // Simple execution
            for (const auto& code : program) {
                if (code.find("PRINT") == 0) {
                    // PRINT "Hello" or PRINT X
                    size_t start = code.find('"');
                    if (start != std::string::npos) {
                        size_t end = code.find('"', start + 1);
                        std::cout << code.substr(start + 1, end - start - 1) << "\n";
                    } else {
                        // PRINT variable
                        std::string var = code.substr(6);
                        if (variables.count(var)) {
                            std::cout << variables[var] << "\n";
                        }
                    }
                }
                else if (code.find("LET") == 0) {
                    // LET X = 10
                    size_t eq = code.find('=');
                    std::string var = code.substr(4, eq - 5);
                    std::string value = code.substr(eq + 2);
                    variables[var] = std::stoi(value);
                }
                else if (code.find("INPUT") == 0) {
                    // INPUT X
                    std::string var = code.substr(6);
                    std::cout << "? ";
                    std::string input;
                    std::getline(std::cin, input);
                    variables[var] = std::stoi(input);
                }
                else if (code.find("PRINT") == 0) {
                    // Already handled above
                }
            }
            std::cout << "READY\n";
        }
        else {
            // Add to program
            program.push_back(line);
        }
    }
    
    return 0;
}
EOF

