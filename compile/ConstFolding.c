/*FINAL ARTHKUMAR DESAI
 *********************************************
 *  314 Principles of Programming Languages  *
 *  Fall 2017                                *
 *  Author: Uli                              *
 *  Student Version                          *
 *********************************************
 */

#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include "InstrUtils.h"
#include "Utils.h"

int main()
{
	
	Instruction *head;

	head = ReadInstructionList(stdin);
	if (!head) {
		WARNING("No instructions\n");
		exit(EXIT_FAILURE);
	}
	Instruction* ptr=head;
	Instruction* nextInstr =NULL;
	Instruction* prevInstr=NULL;

	/* YOUR CODE GOES HERE */
	while(ptr!=NULL)
	{
		if(ptr->opcode == LOADI)
		{
			if(ptr->next != NULL)
			{
				if(ptr->next->opcode == LOADI)
				{
					
					nextInstr=ptr->next;
					prevInstr=ptr->next->next;
					
					if(ptr->field2 == prevInstr->field1 && nextInstr->field2 == prevInstr->field2){
					if(prevInstr->opcode == ADD || prevInstr->opcode == SUB || prevInstr->opcode == MUL){	
					
					if(prevInstr->opcode == ADD)
					{
						
					ptr->field1 = ptr->field1 + nextInstr->field1;
					ptr->field2 = prevInstr->field3;
					ptr->next= prevInstr -> next;						
					prevInstr->next->prev = ptr;						
						
					}					
					else if(prevInstr->opcode == SUB)
					{
						ptr->field1 = ptr->field1 - nextInstr->field1;
						ptr->field2 = prevInstr->field3; 
					   ptr->next= prevInstr -> next;						
						prevInstr->next->prev = ptr;		
						
					}
					else if(prevInstr->opcode == MUL)
					{
						
						ptr->field1 = ptr->field1 * nextInstr->field1;
						ptr->field2 = prevInstr->field3; 
						ptr->next= prevInstr -> next;						
						prevInstr->next->prev = ptr;
						
					}					
					free(nextInstr);
					free(prevInstr);					
				}
			}	
		}
			
	}
  }
			nextInstr=NULL;
			prevInstr=NULL;				
			ptr=ptr->next;
			
}//while
	
    

	if (head) 
		PrintInstructionList(stdout, head);
	
	return EXIT_SUCCESS;
}
