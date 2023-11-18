# Go example

This repository contains an example Golang application, used in the pxl docker labs.

## In this repository

You'll find the Go source code for the application in the `cmd` directory.

- **cmd/client/main.go**: The main entry point for the client application. It includes functions for pinging the server and starting the user interface.
- **cmd/client/request.go**: Contains functions related to HTTP requests, including `ping()` to check server connectivity and `getTranslation(msg string)` to fetch translations from the server.
- **cmd/client/ui.go**: Manages the user interface for the client application. It uses the `bubbletea` library for building the UI and handles user inputs and display.
- **cmd/server/main.go**: The main entry point for the server application. It sets up HTTP routes using the `chi` router and includes a route for handling translation requests.
- **cmd/server/translate.go**: Contains the `translate(msg string)` function, which performs the actual translation of the input message.
- **go.mod** and **go.sum**: These files manage the module dependencies for the project. Dependencies include `bubbletea`, `bubbles`, `lipgloss`, and `chi`.

The client part of the application interacts with the user, take input, and communicate with the server to get translations. The server part listens for requests and responds with translations.

## Translation

The `translate` function in the `cmd/server/translate.go` file of the server application performs a unique form of string manipulation as a means of "translation".

This translation method conducts a small 'Runic' alteration of the text, particularly for consonants, where each consonant is repeated with an 'o' in between. For example, the word "hello" would be translated to something like "heholollolo".

Here's how it works:
1. **Convert to Lowercase**: The input message `msg` is first converted to lowercase using `strings.ToLower(msg)`.
2. **String Building**: A new string builder `b` is initialized to construct the translated message.
3. **Character Processing**: The function iterates over each character in the input message:
   - If the character is a letter (`unicode.IsLetter(char)`), it undergoes further checks:
     - Vowels (`'a', 'e', 'i', 'o', 'u', 'y'`): These characters are directly appended to the builder.
     - Consonants: For consonant characters, the function appends the character, followed by an `'o'`, and then the character again to the builder.
   - If the character is a space (`unicode.IsSpace(char)`), a space is appended to the builder.
4. **Return Translated String**: The builder's string is returned as the final translated message.