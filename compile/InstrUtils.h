/*
 *********************************************
 *  314 Principles of Programming Languages  *
 *  Fallg 2017                               *
 *  Author: Ulrich Kremer                    *
 *  Student Version                          *
 *********************************************
 */

#include "Instr.h"
#include <stdio.h>

#ifndef INSTR_UTILS_H
#define INSTR_UTILS_H

void PrintInstruction(FILE * outfile, Instruction * instr);
void PrintInstructionList(FILE * outfile, Instruction * instr);
Instruction *ReadInstruction(FILE * infile);
Instruction *ReadInstructionList(FILE * infile);
Instruction *LastInstruction(Instruction * instr);


//ADDED THIS METHOD BECAUSE I WAS GETTING IMPLICIT DECLERATION ERROR 
void DestroyInstructionList(Instruction * instrr);

#endif
