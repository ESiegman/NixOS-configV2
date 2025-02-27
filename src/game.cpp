/**
 * @file game.cpp
 * @brief Implementation of the game functions
 */

#include "game.hpp"
#include "board.hpp"
#include <iostream>
#include <string>
#include <vector>
#include <cstdlib>


/**
 * @brief Executes the main game loop, handling setup, player turns, and determining the winner.
 */
void Game::run() {
    setupInitialPos(&white, &black);
    
    if (firstPlayer()) {
        playerTurn(white, black, 'W');
    } 

    while (hasValidMoves(white, black, 'W') || hasValidMoves(white, black, 'B')) {
        playerTurn(white, black, 'B');
    }

    std::pair<int, int> score = getScore(white, black);
    std::cout << "Game over" << std::endl;
    std::cout << "White: " << score.first << " Black: " << score.second << std::endl;
    if (score.first > score.second) {
        std::cout << "White wins" << std::endl;
    } else if (score.first < score.second) {
        std::cout << "Black wins" << std::endl;
    } else {
        std::cout << "It's a tie" << std::endl;
    }
}


/**
 * @brief Determines which player starts the game.
 *
 * @return True if White starts, false if Black starts.
 */
bool Game::firstPlayer() {
    srand(time(0));
    return rand() % 2 == 0;
}


/**
 * @brief Executes a player's turn, processing valid moves and board updates.
 *
 * @param white The 64-bit integer representing the white pieces.
 * @param black The 64-bit integer representing the black pieces.
 * @param player The character representing the current player ('W' for White, 'B' for Black).
 */
void Game::playerTurn(uint64_t &white, uint64_t &black, char player) {
    printBoard(white, black);

    if (!hasValidMoves(white, black, player)) {
        std::cout << player << " has no valid moves" << std::endl;
        return;
    }

    printf("%c's turn: ", player);

    std::pair<int, int> boardPosition = readMove(player);
    applyMove(white, black, boardPosition, player);
}


/**
 * @brief Reads a move input from the player.
 *
 * @return A string representing the move in board notation (e.g., "d3").
 */
std::pair<int,int> Game::readMove(char player) {
    std::string position;
    std::cin >> position;

    std::pair<int, int> boardPosition = stringToBoardPosition(position);

    if (!checkValidMove(white, black, boardPosition, player)) {
        std::cout << "Invalid move" << std::endl;
        return readMove(player);
    }

    return boardPosition;
}


/**
 * @brief Checks if the current player has valid moves available.
 *
 * @param white The 64-bit integer representing the white pieces.
 * @param black The 64-bit integer representing the black pieces.
 * @param player The character representing the current player ('W' for White, 'B' for Black).
 * @return True if there are valid moves available, false otherwise.
 */
bool Game::checkValidMove(uint64_t white, uint64_t black, std::pair<int, int> boardPosition, char player) {
    int directions[8][2] = {
        {-1, -1}, {-1, 0}, {-1, 1},
        { 0, -1},          { 0, 1},
        { 1, -1}, { 1, 0}, { 1, 1}
    };

    uint64_t playerBoard = (player == 'W') ? white : black;
    uint64_t opponentBoard = (player == 'W') ? black : white;

    int row = boardPosition.first;
    int column = boardPosition.second;
    int index = row * 8 + column;
    uint64_t mask = 1ULL << index;

    if ((playerBoard & mask) || (opponentBoard & mask)) {
        return false; // The position is already occupied
    }

    for (auto& direction : directions) {
        int dRow = direction[0];
        int dCol = direction[1];
        int r = row + dRow;
        int c = column + dCol;
        bool hasOpponentBetween = false;

        while (r >= 0 && r < 8 && c >= 0 && c < 8) {
            int currentIndex = r * 8 + c;
            uint64_t currentMask = 1ULL << currentIndex;

            if (opponentBoard & currentMask) {
                hasOpponentBetween = true;
            } else if (playerBoard & currentMask) {
                if (hasOpponentBetween) {
                    return true; // Valid move found
                }
                break;
            } else {
                break;
            }

            r += dRow;
            c += dCol;
        }
    }

    return false; // No valid move found
}


/**
 * @brief Applies a move to the board and flips opponent pieces accordingly.
 *
 * @param white Reference to the 64-bit integer representing the white pieces.
 * @param black Reference to the 64-bit integer representing the black pieces.
 * @param boardPosition The move position as a row-column pair.
 * @param player The character representing the current player ('W' for White, 'B' for Black).
 */
void Game::applyMove(uint64_t &white, uint64_t &black, std::pair<int, int> boardPosition, char player) {
    int directions[8][2] = {
        {-1, -1}, {-1, 0}, {-1, 1},
        { 0, -1},          { 0, 1},
        { 1, -1}, { 1, 0}, { 1, 1}
    };

    uint64_t playerBoard = (player == 'W') ? white : black;
    uint64_t opponentBoard = (player == 'W') ? black : white;

    int row = boardPosition.first;
    int column = boardPosition.second;
    int index = row * 8 + column;
    uint64_t mask = 1ULL << index;

    // Place the player's piece on the board
    playerBoard |= mask;

    for (auto& direction : directions) {
        int dRow = direction[0];
        int dCol = direction[1];
        int r = row + dRow;
        int c = column + dCol;
        bool hasOpponentBetween = false;
        std::vector<int> toFlip;

        while (r >= 0 && r < 8 && c >= 0 && c < 8) {
            int currentIndex = r * 8 + c;
            uint64_t currentMask = 1ULL << currentIndex;

            if (opponentBoard & currentMask) {
                hasOpponentBetween = true;
                toFlip.push_back(currentIndex);
            } else if (playerBoard & currentMask) {
                if (hasOpponentBetween) {
                    // Flip the opponent's pieces
                    for (int flipIndex : toFlip) {
                        uint64_t flipMask = 1ULL << flipIndex;
                        opponentBoard &= ~flipMask;
                        playerBoard |= flipMask;
                    }
                }
                break;
            } else {
                break;
            }

            r += dRow;
            c += dCol;
        }
    }

    // Update the boards
    if (player == 'W') {
        white = playerBoard;
        black = opponentBoard;
    } else {
        black = playerBoard;
        white = opponentBoard;
    }
}


/**
 * @brief Checks if the current player has valid moves available.
 *
 * @param white The 64-bit integer representing the white pieces.
 * @param black The 64-bit integer representing the black pieces.
 * @param player The character representing the current player ('W' for White, 'B' for Black).
 * @return True if there are valid moves available, false otherwise.
 */
bool Game::hasValidMoves(uint64_t white, uint64_t black, char player) {
    for (int row = 0; row < 8; ++row) {
        for (int col = 0; col < 8; ++col) {
            std::pair<int, int> boardPosition = {row, col};
            if (checkValidMove(white, black, boardPosition, player)) {
                return true;
            }
        }
    }
    return false;
}


/**
 * @brief Calculates the current score of the game.
 *
 * @param white The 64-bit integer representing the white pieces.
 * @param black The 64-bit integer representing the black pieces.
 * @return A pair of integers representing the scores of White and Black.
 */
std::pair<int, int> Game::getScore(uint64_t white, uint64_t black) {
    int whiteCount = __builtin_popcountll(white);
    int blackCount = __builtin_popcountll(black);
    return {whiteCount, blackCount};
}

