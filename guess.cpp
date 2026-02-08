#include <iostream>
#include <cstdlib>
#include <ctime>

int main() {
    std::srand(std::time(0));
    int secret = std::rand() % 100 + 1;
    int attempts = 0;
    bool won = false;
    
    std::cout << "Guess the number (1-100):\n";
    
    while (attempts < 10 && !won) {
        attempts++;
        std::cout << "Attempt " << attempts << "/10: ";
        
        int guess;
        std::cin >> guess;
        
        if (std::cin.fail()) {
            std::cin.clear();
            std::cin.ignore(1000, '\n');
            std::cout << "Enter a number!\n";
            attempts--;
            continue;
        }
        
        if (guess < 1 || guess > 100) {
            std::cout << "Enter 1-100!\n";
            attempts--;
            continue;
        }
        
        if (guess == secret) {
            won = true;
            std::cout << "Correct in " << attempts << " attempts!\n";
        } else if (guess < secret) {
            std::cout << "Too low\n";
        } else {
            std::cout << "Too high\n";
        }
    }
    
    if (!won) std::cout << "Game over! It was " << secret << "\n";
    return 0;
}
