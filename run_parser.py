import sys
import os

def main(argv):
    command_1 = f'antlr4 -o . -lib . "Python.g4"'
    command_2 = f'javac *.java'
    command_3 = f'grun "Python" "file" -gui -tokens "project_deliverable_3_testcase.py"'
    os.system(command_1)
    os.system(command_2)
    os.system(command_3)
if __name__ == '__main__':
    main(sys.argv)
    