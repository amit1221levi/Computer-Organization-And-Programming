#include <asm/desc.h>

// TO_DO: store the address of the IDT at the parameter given
void my_store_idt(struct desc_ptr *idtr) {
// <STUDENT FILL>
asm volatile("sidt %0;"
            :"=m" (*idtr)
	    :
            :
            );

// </STUDENT FILL>
}////

// TO_DO: load the address of the IDT from the parameter given
void my_load_idt(struct desc_ptr *idtr) {
// <STUDENT FILL>
asm volatile("lidt %0;"
            :
	    :"m" (*idtr)
            :
            );

// <STUDENT FILL>
}

// TO_DO: set the address in the right place at the parameter gate
// try to remember - how this information is stored?
void my_set_gate_offset(gate_desc *gate, unsigned long addr) {
// </STUDENT FILL>
unsigned long power = 32;
gate->offset_high = addr >> power;
power = power/2;
gate->offset_middle = addr >> power;
gate->offset_low = addr;
}

// TO_DO: return val is the address stored at the parameter gate_desc gate
// try to remember - how this information is stored?
unsigned long my_get_gate_offset(gate_desc *gate) {

unsigned long power = 16;
unsigned long addr = gate->offset_high;
addr = addr << power;
addr += gate->offset_middle;
addr = addr << power;
return addr + gate->offset_low;

// </STUDENT FILL>
}
