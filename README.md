# Python Parser Project
![alt text](https://github.com/osama-y-elsaid/Python_Parser/blob/d700d232f326c4801113e64ad4555e09a71c6cf6/Results/Deliverable1screenshot.png)
## Project Description
This project aims to implement a parser for the Python language using ANTLR and Context-Free Grammar (CFG). The parser is designed to handle specific features of Python 3.x, including arithmetic and assignment operators, if/elif/else blocks, conditional statements, while and for loops, nested structures, and comments.

## Team Members
- Osama Elsaid

## Requirements
To run the parser, you will need:
- Java Runtime Environment (JRE) version 8 or above
- ANTLR v4
- Python 3.x

## Setup
1. Install Java Runtime Environment (JRE) version 8 or above.
2. Install ANTLR v4 following the instructions on the official ANTLR [website](https://github.com/antlr/antlr4/blob/master/doc/getting-started.md).
3. [Optional] Ensure Python 3.x is installed on your system to run the "run_parser.py" script.

## How to Use/Run the Parser
1. Navigate to the directory containing the `.g4` grammar file.
2. Run the ANTLR tool on the `.g4` file to generate the parser and lexer Python files. For Linux and macOS, use the command `java -jar /path/to/antlr-4.x-complete.jar -Dlanguage=Python3 YourGrammar.g4`. For Windows, use the command `java -jar C:\path\to\antlr-4.x-complete.jar -Dlanguage=Python3 Python.g4`. Replace `/path/to/antlr-4.x-complete.jar` or `C:\path\to\antlr-4.x-complete.jar` with the path to your ANTLR jar file.
3. Run the compiled Java program on a Python file to parse it:
- `javac *.java`.
- `java PythonTest /path/to/your/python/file.py`. Replace /path/to/your/python/file.py with the actual path to the Python file you want to parse.


