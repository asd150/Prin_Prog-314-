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
#include <math.h>
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

	/* YOUR CODE GOES HERE */
	Instruction* ptr=head;
	Instruction* ptr2=NULL;
	
	while(ptr!=NULL)
	{
		if(ptr->opcode == LOADI)
		{
			if(ptr->next!=NULL)
			{
				if(ptr->next->opcode == MUL || ptr->next->opcode == DIV)
				{	
					ptr2=ptr->next;
					if(ptr->field2 == ptr2->field2)
					{
						if(ptr2->opcode == MUL)
						{
							int base=2; 
							int counter=1; 
							while(base<ptr->field1)
							{	base=base*2;
								counter++;								
							}
							if(base!=ptr->field1)
							{
								ptr=ptr->next;
								continue;
							}
							ptr->opcode = LSHIFTI;
							ptr->field1 = ptr2->field1;
							ptr->field2 = counter;
							ptr->field3 = ptr2->field3;
							ptr->next=ptr2->next;
							ptr2->next->prev=ptr;
							free(ptr2);									
						}
						else if(ptr2->opcode == DIV)
						{
							int base=2;
							int counter=1;
							while(base<ptr->field1)
							{	base=base*2;
								counter++;								
							}
							if(base!=ptr->field1)
							{
								ptr=ptr->next;
								continue;
							}
							ptr->opcode = RSHIFTI;
							ptr->field1 = ptr2->field1;
							ptr->field2 = counter;
							ptr->field3 = ptr2->field3;
							ptr->next=ptr2->next;
							ptr2->next->prev=ptr;
							free(ptr2);	
							
						}
					}				
				
				}
			}
		}
		ptr2=NULL;
	ptr=ptr->next;
	}
	if (head) 
		PrintInstructionList(stdout, head);
	
	return EXIT_SUCCESS;
}

