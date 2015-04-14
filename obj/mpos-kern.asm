
obj/mpos-kern:     file format elf32-i386


Disassembly of section .text:

00100000 <multiboot>:
  100000:	02 b0 ad 1b 00 00    	add    0x1bad(%eax),%dh
  100006:	00 00                	add    %al,(%eax)
  100008:	fe 4f 52             	decb   0x52(%edi)
  10000b:	e4 bc                	in     $0xbc,%al

0010000c <multiboot_start>:
# The multiboot_start routine sets the stack pointer to the top of the
# MiniprocOS's kernel stack, then jumps to the 'start' routine in mpos-kern.c.

.globl multiboot_start
multiboot_start:
	movl $0x200000, %esp
  10000c:	bc 00 00 20 00       	mov    $0x200000,%esp
	pushl $0
  100011:	6a 00                	push   $0x0
	popfl
  100013:	9d                   	popf   
	call start
  100014:	e8 b4 01 00 00       	call   1001cd <start>
  100019:	90                   	nop

0010001a <sys_int48_handler>:

# Interrupt handlers
.align 2

sys_int48_handler:
	pushl $0
  10001a:	6a 00                	push   $0x0
	pushl $48
  10001c:	6a 30                	push   $0x30
	jmp _generic_int_handler
  10001e:	eb 3a                	jmp    10005a <_generic_int_handler>

00100020 <sys_int49_handler>:

sys_int49_handler:
	pushl $0
  100020:	6a 00                	push   $0x0
	pushl $49
  100022:	6a 31                	push   $0x31
	jmp _generic_int_handler
  100024:	eb 34                	jmp    10005a <_generic_int_handler>

00100026 <sys_int50_handler>:

sys_int50_handler:
	pushl $0
  100026:	6a 00                	push   $0x0
	pushl $50
  100028:	6a 32                	push   $0x32
	jmp _generic_int_handler
  10002a:	eb 2e                	jmp    10005a <_generic_int_handler>

0010002c <sys_int51_handler>:

sys_int51_handler:
	pushl $0
  10002c:	6a 00                	push   $0x0
	pushl $51
  10002e:	6a 33                	push   $0x33
	jmp _generic_int_handler
  100030:	eb 28                	jmp    10005a <_generic_int_handler>

00100032 <sys_int52_handler>:

sys_int52_handler:
	pushl $0
  100032:	6a 00                	push   $0x0
	pushl $52
  100034:	6a 34                	push   $0x34
	jmp _generic_int_handler
  100036:	eb 22                	jmp    10005a <_generic_int_handler>

00100038 <sys_int53_handler>:

sys_int53_handler:
	pushl $0
  100038:	6a 00                	push   $0x0
	pushl $53
  10003a:	6a 35                	push   $0x35
	jmp _generic_int_handler
  10003c:	eb 1c                	jmp    10005a <_generic_int_handler>

0010003e <sys_int54_handler>:

sys_int54_handler:
	pushl $0
  10003e:	6a 00                	push   $0x0
	pushl $54
  100040:	6a 36                	push   $0x36
	jmp _generic_int_handler
  100042:	eb 16                	jmp    10005a <_generic_int_handler>

00100044 <sys_int55_handler>:

sys_int55_handler:
	pushl $0
  100044:	6a 00                	push   $0x0
	pushl $55
  100046:	6a 37                	push   $0x37
	jmp _generic_int_handler
  100048:	eb 10                	jmp    10005a <_generic_int_handler>

0010004a <sys_int56_handler>:

sys_int56_handler:
	pushl $0
  10004a:	6a 00                	push   $0x0
	pushl $56
  10004c:	6a 38                	push   $0x38
	jmp _generic_int_handler
  10004e:	eb 0a                	jmp    10005a <_generic_int_handler>

00100050 <sys_int57_handler>:

sys_int57_handler:
	pushl $0
  100050:	6a 00                	push   $0x0
	pushl $57
  100052:	6a 39                	push   $0x39
	jmp _generic_int_handler
  100054:	eb 04                	jmp    10005a <_generic_int_handler>

00100056 <default_int_handler>:

	.globl default_int_handler
default_int_handler:
	pushl $0
  100056:	6a 00                	push   $0x0
	jmp _generic_int_handler
  100058:	eb 00                	jmp    10005a <_generic_int_handler>

0010005a <_generic_int_handler>:
	# When we get here, the processor's interrupt mechanism has
	# pushed the old task status and stack registers onto the kernel stack.
	# Then one of the specific handlers pushed the interrupt number.
	# Now, we complete the 'registers_t' structure by pushing the extra
	# segment definitions and the general CPU registers.
	pushl %ds
  10005a:	1e                   	push   %ds
	pushl %es
  10005b:	06                   	push   %es
	pushal
  10005c:	60                   	pusha  

	# Call the kernel's 'interrupt' function.
	pushl %esp
  10005d:	54                   	push   %esp
	call interrupt
  10005e:	e8 58 00 00 00       	call   1000bb <interrupt>

00100063 <sys_int_handlers>:
  100063:	1a 00                	sbb    (%eax),%al
  100065:	10 00                	adc    %al,(%eax)
  100067:	20 00                	and    %al,(%eax)
  100069:	10 00                	adc    %al,(%eax)
  10006b:	26 00 10             	add    %dl,%es:(%eax)
  10006e:	00 2c 00             	add    %ch,(%eax,%eax,1)
  100071:	10 00                	adc    %al,(%eax)
  100073:	32 00                	xor    (%eax),%al
  100075:	10 00                	adc    %al,(%eax)
  100077:	38 00                	cmp    %al,(%eax)
  100079:	10 00                	adc    %al,(%eax)
  10007b:	3e 00 10             	add    %dl,%ds:(%eax)
  10007e:	00 44 00 10          	add    %al,0x10(%eax,%eax,1)
  100082:	00 4a 00             	add    %cl,0x0(%edx)
  100085:	10 00                	adc    %al,(%eax)
  100087:	50                   	push   %eax
  100088:	00 10                	add    %dl,(%eax)
  10008a:	00 90 83 ec 0c a1    	add    %dl,-0x5ef3137d(%eax)

0010008c <schedule>:
 *
 *****************************************************************************/

void
schedule(void)
{
  10008c:	83 ec 0c             	sub    $0xc,%esp
	pid_t pid = current->p_pid;
  10008f:	a1 80 9e 10 00       	mov    0x109e80,%eax
	while (1) {
		pid = (pid + 1) % NPROCS;
  100094:	b9 10 00 00 00       	mov    $0x10,%ecx
 *****************************************************************************/

void
schedule(void)
{
	pid_t pid = current->p_pid;
  100099:	8b 10                	mov    (%eax),%edx
	while (1) {
		pid = (pid + 1) % NPROCS;
  10009b:	8d 42 01             	lea    0x1(%edx),%eax
  10009e:	99                   	cltd   
  10009f:	f7 f9                	idiv   %ecx
		if (proc_array[pid].p_state == P_RUNNABLE)
  1000a1:	6b c2 50             	imul   $0x50,%edx,%eax
  1000a4:	83 b8 60 91 10 00 01 	cmpl   $0x1,0x109160(%eax)
  1000ab:	75 ee                	jne    10009b <schedule+0xf>
			run(&proc_array[pid]);
  1000ad:	83 ec 0c             	sub    $0xc,%esp
  1000b0:	05 18 91 10 00       	add    $0x109118,%eax
  1000b5:	50                   	push   %eax
  1000b6:	e8 2d 03 00 00       	call   1003e8 <run>

001000bb <interrupt>:

static pid_t do_fork(process_t *parent);

void
interrupt(registers_t *reg)
{
  1000bb:	55                   	push   %ebp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000bc:	b9 11 00 00 00       	mov    $0x11,%ecx

static pid_t do_fork(process_t *parent);

void
interrupt(registers_t *reg)
{
  1000c1:	57                   	push   %edi
  1000c2:	56                   	push   %esi
  1000c3:	53                   	push   %ebx
  1000c4:	83 ec 0c             	sub    $0xc,%esp
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000c7:	8b 1d 80 9e 10 00    	mov    0x109e80,%ebx

static pid_t do_fork(process_t *parent);

void
interrupt(registers_t *reg)
{
  1000cd:	8b 44 24 20          	mov    0x20(%esp),%eax
	// the application's state on the kernel's stack, then jumping to
	// kernel assembly code (in mpos-int.S, for your information).
	// That code saves more registers on the kernel's stack, then calls
	// interrupt().  The first thing we must do, then, is copy the saved
	// registers into the 'current' process descriptor.
	current->p_registers = *reg;
  1000d1:	8d 7b 04             	lea    0x4(%ebx),%edi
  1000d4:	89 c6                	mov    %eax,%esi
  1000d6:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)

	switch (reg->reg_intno) {
  1000d8:	8b 40 28             	mov    0x28(%eax),%eax
  1000db:	83 e8 30             	sub    $0x30,%eax
  1000de:	83 f8 04             	cmp    $0x4,%eax
  1000e1:	0f 87 e4 00 00 00    	ja     1001cb <interrupt+0x110>
  1000e7:	ff 24 85 a0 09 10 00 	jmp    *0x1009a0(,%eax,4)
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000ee:	8b 03                	mov    (%ebx),%eax
		run(current);
  1000f0:	83 ec 0c             	sub    $0xc,%esp
		// The 'sys_getpid' system call returns the current
		// process's process ID.  System calls return results to user
		// code by putting those results in a register.  Like Linux,
		// we use %eax for system call return values.  The code is
		// surprisingly simple:
		current->p_registers.reg_eax = current->p_pid;
  1000f3:	89 43 20             	mov    %eax,0x20(%ebx)
		run(current);
  1000f6:	53                   	push   %ebx
  1000f7:	eb 6b                	jmp    100164 <interrupt+0xa9>
  1000f9:	bd 68 91 10 00       	mov    $0x109168,%ebp
	int offset = 1;
	while (1) {
		if (offset == NPROCS)
			return -1;
		avail = &proc_array[offset];
		if (avail->p_state == P_EMPTY)
  1000fe:	83 7d 48 00          	cmpl   $0x0,0x48(%ebp)
  100102:	74 10                	je     100114 <interrupt+0x59>
  100104:	83 c5 50             	add    $0x50,%ebp
	// Finally, return the child's process ID to the parent.

	process_t *avail;
	int offset = 1;
	while (1) {
		if (offset == NPROCS)
  100107:	81 fd 18 96 10 00    	cmp    $0x109618,%ebp
  10010d:	75 ef                	jne    1000fe <interrupt+0x43>
  10010f:	83 c8 ff             	or     $0xffffffff,%eax
  100112:	eb 44                	jmp    100158 <interrupt+0x9d>
		if (avail->p_state == P_EMPTY)
			break;
		++offset;
	}

	avail->p_registers = parent->p_registers;
  100114:	8d 7d 04             	lea    0x4(%ebp),%edi
  100117:	b9 11 00 00 00       	mov    $0x11,%ecx
	// and then how to actually copy the stack.  (Hint: use memcpy.)
	// We have done one for you.

	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (PROC_STACK_SIZE * src->p_pid);
  10011c:	8b 03                	mov    (%ebx),%eax
		if (avail->p_state == P_EMPTY)
			break;
		++offset;
	}

	avail->p_registers = parent->p_registers;
  10011e:	8d 73 04             	lea    0x4(%ebx),%esi
  100121:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (PROC_STACK_SIZE * src->p_pid);
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (PROC_STACK_SIZE * dest->p_pid);
	dest_stack_bottom = src_stack_bottom + (PROC_STACK_SIZE * (dest->p_pid - src->p_pid));
  100123:	8b 75 00             	mov    0x0(%ebp),%esi
	// We have done one for you.

	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (PROC_STACK_SIZE * src->p_pid);
	src_stack_bottom = src->p_registers.reg_esp;
  100126:	8b 53 40             	mov    0x40(%ebx),%edx
	dest_stack_top = PROC1_STACK_ADDR + (PROC_STACK_SIZE * dest->p_pid);
	dest_stack_bottom = src_stack_bottom + (PROC_STACK_SIZE * (dest->p_pid - src->p_pid));
  100129:	29 c6                	sub    %eax,%esi
	
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, src_stack_top - src_stack_bottom);
  10012b:	83 c0 0a             	add    $0xa,%eax
  10012e:	c1 e0 12             	shl    $0x12,%eax
  100131:	51                   	push   %ecx
  100132:	29 d0                	sub    %edx,%eax
  100134:	50                   	push   %eax
	// YOUR CODE HERE!

	src_stack_top = PROC1_STACK_ADDR + (PROC_STACK_SIZE * src->p_pid);
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (PROC_STACK_SIZE * dest->p_pid);
	dest_stack_bottom = src_stack_bottom + (PROC_STACK_SIZE * (dest->p_pid - src->p_pid));
  100135:	c1 e6 12             	shl    $0x12,%esi
  100138:	01 d6                	add    %edx,%esi
	
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, src_stack_top - src_stack_bottom);
  10013a:	52                   	push   %edx
  10013b:	56                   	push   %esi
  10013c:	e8 7f 03 00 00       	call   1004c0 <memcpy>
	avail->p_registers = parent->p_registers;
	copy_stack(avail, parent);
	avail->p_state = P_RUNNABLE;
	avail->p_registers.reg_eax = 0; // Child process
	
	return avail->p_pid;
  100141:	8b 45 00             	mov    0x0(%ebp),%eax
  100144:	83 c4 10             	add    $0x10,%esp
	src_stack_bottom = src->p_registers.reg_esp;
	dest_stack_top = PROC1_STACK_ADDR + (PROC_STACK_SIZE * dest->p_pid);
	dest_stack_bottom = src_stack_bottom + (PROC_STACK_SIZE * (dest->p_pid - src->p_pid));
	
	memcpy((void *)dest_stack_bottom, (void *)src_stack_bottom, src_stack_top - src_stack_bottom);
	dest->p_registers.reg_esp = dest_stack_bottom;
  100147:	89 75 40             	mov    %esi,0x40(%ebp)
		++offset;
	}

	avail->p_registers = parent->p_registers;
	copy_stack(avail, parent);
	avail->p_state = P_RUNNABLE;
  10014a:	c7 45 48 01 00 00 00 	movl   $0x1,0x48(%ebp)
	avail->p_registers.reg_eax = 0; // Child process
  100151:	c7 45 20 00 00 00 00 	movl   $0x0,0x20(%ebp)
		run(current);

	case INT_SYS_FORK:
		// The 'sys_fork' system call should create a new process.
		// You will have to complete the do_fork() function!
		current->p_registers.reg_eax = do_fork(current);
  100158:	89 43 20             	mov    %eax,0x20(%ebx)
		run(current);
  10015b:	83 ec 0c             	sub    $0xc,%esp
  10015e:	ff 35 80 9e 10 00    	pushl  0x109e80
  100164:	e8 7f 02 00 00       	call   1003e8 <run>
	case INT_SYS_YIELD:
		// The 'sys_yield' system call asks the kernel to schedule a
		// different process.  (MiniprocOS is cooperatively
		// scheduled, so we need a special system call to do this.)
		// The schedule() function picks another process and runs it.
		schedule();
  100169:	e8 1e ff ff ff       	call   10008c <schedule>
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  10016e:	a1 80 9e 10 00       	mov    0x109e80,%eax
		current->p_exit_status = current->p_registers.reg_eax;
  100173:	8b 50 20             	mov    0x20(%eax),%edx
		// non-runnable.
		// The process stored its exit status in the %eax register
		// before calling the system call.  The %eax REGISTER has
		// changed by now, but we can read the APPLICATION's setting
		// for this register out of 'current->p_registers'.
		current->p_state = P_ZOMBIE;
  100176:	c7 40 48 03 00 00 00 	movl   $0x3,0x48(%eax)
		current->p_exit_status = current->p_registers.reg_eax;
  10017d:	89 50 4c             	mov    %edx,0x4c(%eax)
		schedule();
  100180:	e8 07 ff ff ff       	call   10008c <schedule>
		// * A process that doesn't exist (p_state == P_EMPTY).
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
  100185:	a1 80 9e 10 00       	mov    0x109e80,%eax
  10018a:	8b 50 20             	mov    0x20(%eax),%edx
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  10018d:	8d 4a ff             	lea    -0x1(%edx),%ecx
  100190:	83 f9 0e             	cmp    $0xe,%ecx
  100193:	77 11                	ja     1001a6 <interrupt+0xeb>
  100195:	3b 10                	cmp    (%eax),%edx
  100197:	74 0d                	je     1001a6 <interrupt+0xeb>
		    || proc_array[p].p_state == P_EMPTY)
  100199:	6b d2 50             	imul   $0x50,%edx,%edx
  10019c:	8b 8a 60 91 10 00    	mov    0x109160(%edx),%ecx
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001a2:	85 c9                	test   %ecx,%ecx
  1001a4:	75 09                	jne    1001af <interrupt+0xf4>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
  1001a6:	c7 40 20 ff ff ff ff 	movl   $0xffffffff,0x20(%eax)
		// (In the Unix operating system, only process P's parent
		// can call sys_wait(P).  In MiniprocOS, we allow ANY
		// process to call sys_wait(P).)

		pid_t p = current->p_registers.reg_eax;
		if (p <= 0 || p >= NPROCS || p == current->p_pid
  1001ad:	eb 17                	jmp    1001c6 <interrupt+0x10b>
		    || proc_array[p].p_state == P_EMPTY)
			current->p_registers.reg_eax = -1;
		else if (proc_array[p].p_state == P_ZOMBIE)
  1001af:	83 f9 03             	cmp    $0x3,%ecx
  1001b2:	75 0b                	jne    1001bf <interrupt+0x104>
			current->p_registers.reg_eax = proc_array[p].p_exit_status;
  1001b4:	8b 92 64 91 10 00    	mov    0x109164(%edx),%edx
  1001ba:	89 50 20             	mov    %edx,0x20(%eax)
  1001bd:	eb 07                	jmp    1001c6 <interrupt+0x10b>
		else
			current->p_registers.reg_eax = WAIT_TRYAGAIN;
  1001bf:	c7 40 20 fe ff ff ff 	movl   $0xfffffffe,0x20(%eax)
		schedule();
  1001c6:	e8 c1 fe ff ff       	call   10008c <schedule>
  1001cb:	eb fe                	jmp    1001cb <interrupt+0x110>

001001cd <start>:
 *
 *****************************************************************************/

void
start(void)
{
  1001cd:	53                   	push   %ebx
  1001ce:	83 ec 0c             	sub    $0xc,%esp
	const char *s;
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
  1001d1:	68 00 05 00 00       	push   $0x500
  1001d6:	6a 00                	push   $0x0
  1001d8:	68 18 91 10 00       	push   $0x109118
  1001dd:	e8 42 03 00 00       	call   100524 <memset>
  1001e2:	ba 18 91 10 00       	mov    $0x109118,%edx
  1001e7:	31 c0                	xor    %eax,%eax
  1001e9:	83 c4 10             	add    $0x10,%esp
	for (i = 0; i < NPROCS; i++) {
		proc_array[i].p_pid = i;
  1001ec:	89 02                	mov    %eax,(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  1001ee:	40                   	inc    %eax
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
  1001ef:	c7 42 48 00 00 00 00 	movl   $0x0,0x48(%edx)
	int whichprocess;
	pid_t i;

	// Initialize process descriptors as empty
	memset(proc_array, 0, sizeof(proc_array));
	for (i = 0; i < NPROCS; i++) {
  1001f6:	83 c2 50             	add    $0x50,%edx
  1001f9:	83 f8 10             	cmp    $0x10,%eax
  1001fc:	75 ee                	jne    1001ec <start+0x1f>
		proc_array[i].p_pid = i;
		proc_array[i].p_state = P_EMPTY;
	}

	// The first process has process ID 1.
	current = &proc_array[1];
  1001fe:	c7 05 80 9e 10 00 68 	movl   $0x109168,0x109e80
  100205:	91 10 00 

	// Set up x86 hardware, and initialize the first process's
	// special registers.  This only needs to be done once, at boot time.
	// All other processes' special registers can be copied from the
	// first process.
	segments_init();
  100208:	e8 73 00 00 00       	call   100280 <segments_init>
	special_registers_init(current);
  10020d:	83 ec 0c             	sub    $0xc,%esp
  100210:	ff 35 80 9e 10 00    	pushl  0x109e80
  100216:	e8 e4 01 00 00       	call   1003ff <special_registers_init>

	// Erase the console, and initialize the cursor-position shared
	// variable to point to its upper left.
	console_clear();
  10021b:	e8 2f 01 00 00       	call   10034f <console_clear>

	// Figure out which program to run.
	cursorpos = console_printf(cursorpos, 0x0700, "Type '1' to run mpos-app, or '2' to run mpos-app2.");
  100220:	83 c4 0c             	add    $0xc,%esp
  100223:	68 b4 09 10 00       	push   $0x1009b4
  100228:	68 00 07 00 00       	push   $0x700
  10022d:	ff 35 00 00 06 00    	pushl  0x60000
  100233:	e8 4e 07 00 00       	call   100986 <console_printf>
  100238:	83 c4 10             	add    $0x10,%esp
  10023b:	a3 00 00 06 00       	mov    %eax,0x60000
	do {
		whichprocess = console_read_digit();
  100240:	e8 4d 01 00 00       	call   100392 <console_read_digit>
	} while (whichprocess != 1 && whichprocess != 2);
  100245:	8d 58 ff             	lea    -0x1(%eax),%ebx
  100248:	83 fb 01             	cmp    $0x1,%ebx
  10024b:	77 f3                	ja     100240 <start+0x73>
	console_clear();
  10024d:	e8 fd 00 00 00       	call   10034f <console_clear>

	// Load the process application code and data into memory.
	// Store its entry point into the first process's EIP
	// (instruction pointer).
	program_loader(whichprocess - 1, &current->p_registers.reg_eip);
  100252:	50                   	push   %eax
  100253:	50                   	push   %eax
  100254:	a1 80 9e 10 00       	mov    0x109e80,%eax
  100259:	83 c0 34             	add    $0x34,%eax
  10025c:	50                   	push   %eax
  10025d:	53                   	push   %ebx
  10025e:	e8 d1 01 00 00       	call   100434 <program_loader>

	// Set the main process's stack pointer, ESP.
	current->p_registers.reg_esp = PROC1_STACK_ADDR + PROC_STACK_SIZE;
  100263:	a1 80 9e 10 00       	mov    0x109e80,%eax
  100268:	c7 40 40 00 00 2c 00 	movl   $0x2c0000,0x40(%eax)

	// Mark the process as runnable!
	current->p_state = P_RUNNABLE;
  10026f:	c7 40 48 01 00 00 00 	movl   $0x1,0x48(%eax)

	// Switch to the main process using run().
	run(current);
  100276:	89 04 24             	mov    %eax,(%esp)
  100279:	e8 6a 01 00 00       	call   1003e8 <run>
  10027e:	90                   	nop
  10027f:	90                   	nop

00100280 <segments_init>:
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100280:	b8 18 96 10 00       	mov    $0x109618,%eax
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100285:	b9 56 00 10 00       	mov    $0x100056,%ecx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  10028a:	89 c2                	mov    %eax,%edx
  10028c:	c1 ea 10             	shr    $0x10,%edx
extern void default_int_handler(void);


void
segments_init(void)
{
  10028f:	53                   	push   %ebx
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  100290:	bb 56 00 10 00       	mov    $0x100056,%ebx
  100295:	c1 eb 10             	shr    $0x10,%ebx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  100298:	66 a3 52 1a 10 00    	mov    %ax,0x101a52
  10029e:	c1 e8 18             	shr    $0x18,%eax
  1002a1:	88 15 54 1a 10 00    	mov    %dl,0x101a54
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002a7:	ba 80 96 10 00       	mov    $0x109680,%edx
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002ac:	a2 57 1a 10 00       	mov    %al,0x101a57
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002b1:	31 c0                	xor    %eax,%eax
segments_init(void)
{
	int i;

	// Set task state segment
	segments[SEGSEL_TASKSTATE >> 3]
  1002b3:	66 c7 05 50 1a 10 00 	movw   $0x68,0x101a50
  1002ba:	68 00 
  1002bc:	c6 05 56 1a 10 00 40 	movb   $0x40,0x101a56
		= SEG16(STS_T32A, (uint32_t) &kernel_task_descriptor,
			sizeof(taskstate_t), 0);
	segments[SEGSEL_TASKSTATE >> 3].sd_s = 0;
  1002c3:	c6 05 55 1a 10 00 89 	movb   $0x89,0x101a55

	// Set up kernel task descriptor, so we can receive interrupts
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
  1002ca:	c7 05 1c 96 10 00 00 	movl   $0x80000,0x10961c
  1002d1:	00 08 00 
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;
  1002d4:	66 c7 05 20 96 10 00 	movw   $0x10,0x109620
  1002db:	10 00 

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
		SETGATE(interrupt_descriptors[i], 0,
  1002dd:	66 89 0c c5 80 96 10 	mov    %cx,0x109680(,%eax,8)
  1002e4:	00 
  1002e5:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  1002ec:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  1002f1:	c6 44 c2 05 8e       	movb   $0x8e,0x5(%edx,%eax,8)
  1002f6:	66 89 5c c2 06       	mov    %bx,0x6(%edx,%eax,8)
	kernel_task_descriptor.ts_esp0 = KERNEL_STACK_TOP;
	kernel_task_descriptor.ts_ss0 = SEGSEL_KERN_DATA;

	// Set up interrupt descriptor table.
	// Most interrupts are effectively ignored
	for (i = 0; i < sizeof(interrupt_descriptors) / sizeof(gatedescriptor_t); i++)
  1002fb:	40                   	inc    %eax
  1002fc:	3d 00 01 00 00       	cmp    $0x100,%eax
  100301:	75 da                	jne    1002dd <segments_init+0x5d>
  100303:	66 b8 30 00          	mov    $0x30,%ax

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
		SETGATE(interrupt_descriptors[i], 0,
  100307:	ba 80 96 10 00       	mov    $0x109680,%edx
  10030c:	8b 0c 85 a3 ff 0f 00 	mov    0xfffa3(,%eax,4),%ecx
  100313:	66 c7 44 c2 02 08 00 	movw   $0x8,0x2(%edx,%eax,8)
  10031a:	66 89 0c c5 80 96 10 	mov    %cx,0x109680(,%eax,8)
  100321:	00 
  100322:	c1 e9 10             	shr    $0x10,%ecx
  100325:	c6 44 c2 04 00       	movb   $0x0,0x4(%edx,%eax,8)
  10032a:	c6 44 c2 05 ee       	movb   $0xee,0x5(%edx,%eax,8)
  10032f:	66 89 4c c2 06       	mov    %cx,0x6(%edx,%eax,8)
			SEGSEL_KERN_CODE, default_int_handler, 0);

	// System calls get special handling.
	// Note that the last argument is '3'.  This means that unprivileged
	// (level-3) applications may generate these interrupts.
	for (i = INT_SYS_GETPID; i < INT_SYS_GETPID + 10; i++)
  100334:	40                   	inc    %eax
  100335:	83 f8 3a             	cmp    $0x3a,%eax
  100338:	75 d2                	jne    10030c <segments_init+0x8c>
		SETGATE(interrupt_descriptors[i], 0,
			SEGSEL_KERN_CODE, sys_int_handlers[i - INT_SYS_GETPID], 3);

	// Reload segment pointers
	asm volatile("lgdt global_descriptor_table\n\t"
  10033a:	b0 28                	mov    $0x28,%al
  10033c:	0f 01 15 18 1a 10 00 	lgdtl  0x101a18
  100343:	0f 00 d8             	ltr    %ax
  100346:	0f 01 1d 20 1a 10 00 	lidtl  0x101a20
		     "lidt interrupt_descriptor_table"
		     : : "r" ((uint16_t) SEGSEL_TASKSTATE));

	// Convince compiler that all symbols were used
	(void) global_descriptor_table, (void) interrupt_descriptor_table;
}
  10034d:	5b                   	pop    %ebx
  10034e:	c3                   	ret    

0010034f <console_clear>:
 *
 *****************************************************************************/

void
console_clear(void)
{
  10034f:	56                   	push   %esi
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  100350:	31 c0                	xor    %eax,%eax
 *
 *****************************************************************************/

void
console_clear(void)
{
  100352:	53                   	push   %ebx
	int i;
	cursorpos = (uint16_t *) 0xB8000;
  100353:	c7 05 00 00 06 00 00 	movl   $0xb8000,0x60000
  10035a:	80 0b 00 

	for (i = 0; i < 80 * 25; i++)
		cursorpos[i] = ' ' | 0x0700;
  10035d:	66 c7 84 00 00 80 0b 	movw   $0x720,0xb8000(%eax,%eax,1)
  100364:	00 20 07 
console_clear(void)
{
	int i;
	cursorpos = (uint16_t *) 0xB8000;

	for (i = 0; i < 80 * 25; i++)
  100367:	40                   	inc    %eax
  100368:	3d d0 07 00 00       	cmp    $0x7d0,%eax
  10036d:	75 ee                	jne    10035d <console_clear+0xe>
}

static inline void
outb(int port, uint8_t data)
{
	asm volatile("outb %0,%w1" : : "a" (data), "d" (port));
  10036f:	be d4 03 00 00       	mov    $0x3d4,%esi
  100374:	b0 0e                	mov    $0xe,%al
  100376:	89 f2                	mov    %esi,%edx
  100378:	ee                   	out    %al,(%dx)
  100379:	31 c9                	xor    %ecx,%ecx
  10037b:	bb d5 03 00 00       	mov    $0x3d5,%ebx
  100380:	88 c8                	mov    %cl,%al
  100382:	89 da                	mov    %ebx,%edx
  100384:	ee                   	out    %al,(%dx)
  100385:	b0 0f                	mov    $0xf,%al
  100387:	89 f2                	mov    %esi,%edx
  100389:	ee                   	out    %al,(%dx)
  10038a:	88 c8                	mov    %cl,%al
  10038c:	89 da                	mov    %ebx,%edx
  10038e:	ee                   	out    %al,(%dx)
		cursorpos[i] = ' ' | 0x0700;
	outb(0x3D4, 14);
	outb(0x3D5, 0 / 256);
	outb(0x3D4, 15);
	outb(0x3D5, 0 % 256);
}
  10038f:	5b                   	pop    %ebx
  100390:	5e                   	pop    %esi
  100391:	c3                   	ret    

00100392 <console_read_digit>:

static inline uint8_t
inb(int port)
{
	uint8_t data;
	asm volatile("inb %w1,%0" : "=a" (data) : "d" (port));
  100392:	ba 64 00 00 00       	mov    $0x64,%edx
  100397:	ec                   	in     (%dx),%al
int
console_read_digit(void)
{
	uint8_t data;

	if ((inb(KBSTATP) & KBS_DIB) == 0)
  100398:	a8 01                	test   $0x1,%al
  10039a:	74 45                	je     1003e1 <console_read_digit+0x4f>
  10039c:	b2 60                	mov    $0x60,%dl
  10039e:	ec                   	in     (%dx),%al
		return -1;

	data = inb(KBDATAP);
	if (data >= 0x02 && data <= 0x0A)
  10039f:	8d 50 fe             	lea    -0x2(%eax),%edx
  1003a2:	80 fa 08             	cmp    $0x8,%dl
  1003a5:	77 05                	ja     1003ac <console_read_digit+0x1a>
		return data - 0x02 + 1;
  1003a7:	0f b6 c0             	movzbl %al,%eax
  1003aa:	48                   	dec    %eax
  1003ab:	c3                   	ret    
	else if (data == 0x0B)
  1003ac:	3c 0b                	cmp    $0xb,%al
  1003ae:	74 35                	je     1003e5 <console_read_digit+0x53>
		return 0;
	else if (data >= 0x47 && data <= 0x49)
  1003b0:	8d 50 b9             	lea    -0x47(%eax),%edx
  1003b3:	80 fa 02             	cmp    $0x2,%dl
  1003b6:	77 07                	ja     1003bf <console_read_digit+0x2d>
		return data - 0x47 + 7;
  1003b8:	0f b6 c0             	movzbl %al,%eax
  1003bb:	83 e8 40             	sub    $0x40,%eax
  1003be:	c3                   	ret    
	else if (data >= 0x4B && data <= 0x4D)
  1003bf:	8d 50 b5             	lea    -0x4b(%eax),%edx
  1003c2:	80 fa 02             	cmp    $0x2,%dl
  1003c5:	77 07                	ja     1003ce <console_read_digit+0x3c>
		return data - 0x4B + 4;
  1003c7:	0f b6 c0             	movzbl %al,%eax
  1003ca:	83 e8 47             	sub    $0x47,%eax
  1003cd:	c3                   	ret    
	else if (data >= 0x4F && data <= 0x51)
  1003ce:	8d 50 b1             	lea    -0x4f(%eax),%edx
  1003d1:	80 fa 02             	cmp    $0x2,%dl
  1003d4:	77 07                	ja     1003dd <console_read_digit+0x4b>
		return data - 0x4F + 1;
  1003d6:	0f b6 c0             	movzbl %al,%eax
  1003d9:	83 e8 4e             	sub    $0x4e,%eax
  1003dc:	c3                   	ret    
	else if (data == 0x53)
  1003dd:	3c 53                	cmp    $0x53,%al
  1003df:	74 04                	je     1003e5 <console_read_digit+0x53>
  1003e1:	83 c8 ff             	or     $0xffffffff,%eax
  1003e4:	c3                   	ret    
  1003e5:	31 c0                	xor    %eax,%eax
		return 0;
	else
		return -1;
}
  1003e7:	c3                   	ret    

001003e8 <run>:
 *
 *****************************************************************************/

void
run(process_t *proc)
{
  1003e8:	8b 44 24 04          	mov    0x4(%esp),%eax
	current = proc;
  1003ec:	a3 80 9e 10 00       	mov    %eax,0x109e80

	asm volatile("movl %0,%%esp\n\t"
  1003f1:	83 c0 04             	add    $0x4,%eax
  1003f4:	89 c4                	mov    %eax,%esp
  1003f6:	61                   	popa   
  1003f7:	07                   	pop    %es
  1003f8:	1f                   	pop    %ds
  1003f9:	83 c4 08             	add    $0x8,%esp
  1003fc:	cf                   	iret   
  1003fd:	eb fe                	jmp    1003fd <run+0x15>

001003ff <special_registers_init>:
 *
 *****************************************************************************/

void
special_registers_init(process_t *proc)
{
  1003ff:	53                   	push   %ebx
  100400:	83 ec 0c             	sub    $0xc,%esp
  100403:	8b 5c 24 14          	mov    0x14(%esp),%ebx
	memset(&proc->p_registers, 0, sizeof(registers_t));
  100407:	6a 44                	push   $0x44
  100409:	6a 00                	push   $0x0
  10040b:	8d 43 04             	lea    0x4(%ebx),%eax
  10040e:	50                   	push   %eax
  10040f:	e8 10 01 00 00       	call   100524 <memset>
	proc->p_registers.reg_cs = SEGSEL_APP_CODE | 3;
  100414:	66 c7 43 38 1b 00    	movw   $0x1b,0x38(%ebx)
	proc->p_registers.reg_ds = SEGSEL_APP_DATA | 3;
  10041a:	66 c7 43 28 23 00    	movw   $0x23,0x28(%ebx)
	proc->p_registers.reg_es = SEGSEL_APP_DATA | 3;
  100420:	66 c7 43 24 23 00    	movw   $0x23,0x24(%ebx)
	proc->p_registers.reg_ss = SEGSEL_APP_DATA | 3;
  100426:	66 c7 43 44 23 00    	movw   $0x23,0x44(%ebx)
}
  10042c:	83 c4 18             	add    $0x18,%esp
  10042f:	5b                   	pop    %ebx
  100430:	c3                   	ret    
  100431:	90                   	nop
  100432:	90                   	nop
  100433:	90                   	nop

00100434 <program_loader>:
		    uint32_t filesz, uint32_t memsz);
static void loader_panic(void);

void
program_loader(int program_id, uint32_t *entry_point)
{
  100434:	55                   	push   %ebp
  100435:	57                   	push   %edi
  100436:	56                   	push   %esi
  100437:	53                   	push   %ebx
  100438:	83 ec 1c             	sub    $0x1c,%esp
  10043b:	8b 44 24 30          	mov    0x30(%esp),%eax
	struct Proghdr *ph, *eph;
	struct Elf *elf_header;
	int nprograms = sizeof(ramimages) / sizeof(ramimages[0]);

	if (program_id < 0 || program_id >= nprograms)
  10043f:	83 f8 01             	cmp    $0x1,%eax
  100442:	7f 04                	jg     100448 <program_loader+0x14>
  100444:	85 c0                	test   %eax,%eax
  100446:	79 02                	jns    10044a <program_loader+0x16>
  100448:	eb fe                	jmp    100448 <program_loader+0x14>
		loader_panic();

	// is this a valid ELF?
	elf_header = (struct Elf *) ramimages[program_id].begin;
  10044a:	8b 34 c5 58 1a 10 00 	mov    0x101a58(,%eax,8),%esi
	if (elf_header->e_magic != ELF_MAGIC)
  100451:	81 3e 7f 45 4c 46    	cmpl   $0x464c457f,(%esi)
  100457:	74 02                	je     10045b <program_loader+0x27>
  100459:	eb fe                	jmp    100459 <program_loader+0x25>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  10045b:	8b 5e 1c             	mov    0x1c(%esi),%ebx
	eph = ph + elf_header->e_phnum;
  10045e:	0f b7 6e 2c          	movzwl 0x2c(%esi),%ebp
	elf_header = (struct Elf *) ramimages[program_id].begin;
	if (elf_header->e_magic != ELF_MAGIC)
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
  100462:	01 f3                	add    %esi,%ebx
	eph = ph + elf_header->e_phnum;
  100464:	c1 e5 05             	shl    $0x5,%ebp
  100467:	8d 2c 2b             	lea    (%ebx,%ebp,1),%ebp
	for (; ph < eph; ph++)
  10046a:	eb 3f                	jmp    1004ab <program_loader+0x77>
		if (ph->p_type == ELF_PROG_LOAD)
  10046c:	83 3b 01             	cmpl   $0x1,(%ebx)
  10046f:	75 37                	jne    1004a8 <program_loader+0x74>
			copyseg((void *) ph->p_va,
  100471:	8b 43 08             	mov    0x8(%ebx),%eax
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  100474:	8b 7b 10             	mov    0x10(%ebx),%edi
	memsz += va;
  100477:	8b 53 14             	mov    0x14(%ebx),%edx
// then clear the memory from 'va+filesz' up to 'va+memsz' (set it to 0).
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
  10047a:	01 c7                	add    %eax,%edi
	memsz += va;
  10047c:	01 c2                	add    %eax,%edx
	va &= ~(PAGESIZE - 1);		// round to page boundary
  10047e:	25 00 f0 ff ff       	and    $0xfffff000,%eax
static void
copyseg(void *dst, const uint8_t *src, uint32_t filesz, uint32_t memsz)
{
	uint32_t va = (uint32_t) dst;
	uint32_t end_va = va + filesz;
	memsz += va;
  100483:	89 54 24 0c          	mov    %edx,0xc(%esp)
	va &= ~(PAGESIZE - 1);		// round to page boundary

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);
  100487:	52                   	push   %edx
  100488:	89 fa                	mov    %edi,%edx
  10048a:	29 c2                	sub    %eax,%edx
  10048c:	52                   	push   %edx
  10048d:	8b 53 04             	mov    0x4(%ebx),%edx
  100490:	01 f2                	add    %esi,%edx
  100492:	52                   	push   %edx
  100493:	50                   	push   %eax
  100494:	e8 27 00 00 00       	call   1004c0 <memcpy>
  100499:	83 c4 10             	add    $0x10,%esp
  10049c:	eb 04                	jmp    1004a2 <program_loader+0x6e>

	// clear bss segment
	while (end_va < memsz)
		*((uint8_t *) end_va++) = 0;
  10049e:	c6 07 00             	movb   $0x0,(%edi)
  1004a1:	47                   	inc    %edi

	// copy data
	memcpy((uint8_t *) va, src, end_va - va);

	// clear bss segment
	while (end_va < memsz)
  1004a2:	3b 7c 24 0c          	cmp    0xc(%esp),%edi
  1004a6:	72 f6                	jb     10049e <program_loader+0x6a>
		loader_panic();

	// load each program segment (ignores ph flags)
	ph = (struct Proghdr*) ((const uint8_t *) elf_header + elf_header->e_phoff);
	eph = ph + elf_header->e_phnum;
	for (; ph < eph; ph++)
  1004a8:	83 c3 20             	add    $0x20,%ebx
  1004ab:	39 eb                	cmp    %ebp,%ebx
  1004ad:	72 bd                	jb     10046c <program_loader+0x38>
			copyseg((void *) ph->p_va,
				(const uint8_t *) elf_header + ph->p_offset,
				ph->p_filesz, ph->p_memsz);

	// store the entry point from the ELF header
	*entry_point = elf_header->e_entry;
  1004af:	8b 56 18             	mov    0x18(%esi),%edx
  1004b2:	8b 44 24 34          	mov    0x34(%esp),%eax
  1004b6:	89 10                	mov    %edx,(%eax)
}
  1004b8:	83 c4 1c             	add    $0x1c,%esp
  1004bb:	5b                   	pop    %ebx
  1004bc:	5e                   	pop    %esi
  1004bd:	5f                   	pop    %edi
  1004be:	5d                   	pop    %ebp
  1004bf:	c3                   	ret    

001004c0 <memcpy>:
 *
 *   We must provide our own implementations of these basic functions. */

void *
memcpy(void *dst, const void *src, size_t n)
{
  1004c0:	56                   	push   %esi
  1004c1:	31 d2                	xor    %edx,%edx
  1004c3:	53                   	push   %ebx
  1004c4:	8b 44 24 0c          	mov    0xc(%esp),%eax
  1004c8:	8b 5c 24 10          	mov    0x10(%esp),%ebx
  1004cc:	8b 74 24 14          	mov    0x14(%esp),%esi
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  1004d0:	eb 08                	jmp    1004da <memcpy+0x1a>
		*d++ = *s++;
  1004d2:	8a 0c 13             	mov    (%ebx,%edx,1),%cl
  1004d5:	4e                   	dec    %esi
  1004d6:	88 0c 10             	mov    %cl,(%eax,%edx,1)
  1004d9:	42                   	inc    %edx
void *
memcpy(void *dst, const void *src, size_t n)
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	while (n-- > 0)
  1004da:	85 f6                	test   %esi,%esi
  1004dc:	75 f4                	jne    1004d2 <memcpy+0x12>
		*d++ = *s++;
	return dst;
}
  1004de:	5b                   	pop    %ebx
  1004df:	5e                   	pop    %esi
  1004e0:	c3                   	ret    

001004e1 <memmove>:

void *
memmove(void *dst, const void *src, size_t n)
{
  1004e1:	57                   	push   %edi
  1004e2:	56                   	push   %esi
  1004e3:	53                   	push   %ebx
  1004e4:	8b 44 24 10          	mov    0x10(%esp),%eax
  1004e8:	8b 7c 24 14          	mov    0x14(%esp),%edi
  1004ec:	8b 54 24 18          	mov    0x18(%esp),%edx
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
  1004f0:	39 c7                	cmp    %eax,%edi
  1004f2:	73 26                	jae    10051a <memmove+0x39>
  1004f4:	8d 34 17             	lea    (%edi,%edx,1),%esi
  1004f7:	39 c6                	cmp    %eax,%esi
  1004f9:	76 1f                	jbe    10051a <memmove+0x39>
		s += n, d += n;
  1004fb:	8d 3c 10             	lea    (%eax,%edx,1),%edi
  1004fe:	31 c9                	xor    %ecx,%ecx
		while (n-- > 0)
  100500:	eb 07                	jmp    100509 <memmove+0x28>
			*--d = *--s;
  100502:	8a 1c 0e             	mov    (%esi,%ecx,1),%bl
  100505:	4a                   	dec    %edx
  100506:	88 1c 0f             	mov    %bl,(%edi,%ecx,1)
  100509:	49                   	dec    %ecx
{
	const char *s = (const char *) src;
	char *d = (char *) dst;
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
  10050a:	85 d2                	test   %edx,%edx
  10050c:	75 f4                	jne    100502 <memmove+0x21>
  10050e:	eb 10                	jmp    100520 <memmove+0x3f>
			*--d = *--s;
	} else
		while (n-- > 0)
			*d++ = *s++;
  100510:	8a 1c 0f             	mov    (%edi,%ecx,1),%bl
  100513:	4a                   	dec    %edx
  100514:	88 1c 08             	mov    %bl,(%eax,%ecx,1)
  100517:	41                   	inc    %ecx
  100518:	eb 02                	jmp    10051c <memmove+0x3b>
  10051a:	31 c9                	xor    %ecx,%ecx
	if (s < d && s + n > d) {
		s += n, d += n;
		while (n-- > 0)
			*--d = *--s;
	} else
		while (n-- > 0)
  10051c:	85 d2                	test   %edx,%edx
  10051e:	75 f0                	jne    100510 <memmove+0x2f>
			*d++ = *s++;
	return dst;
}
  100520:	5b                   	pop    %ebx
  100521:	5e                   	pop    %esi
  100522:	5f                   	pop    %edi
  100523:	c3                   	ret    

00100524 <memset>:

void *
memset(void *v, int c, size_t n)
{
  100524:	53                   	push   %ebx
  100525:	8b 44 24 08          	mov    0x8(%esp),%eax
  100529:	8b 5c 24 0c          	mov    0xc(%esp),%ebx
  10052d:	8b 4c 24 10          	mov    0x10(%esp),%ecx
	char *p = (char *) v;
  100531:	89 c2                	mov    %eax,%edx
	while (n-- > 0)
  100533:	eb 04                	jmp    100539 <memset+0x15>
		*p++ = c;
  100535:	88 1a                	mov    %bl,(%edx)
  100537:	49                   	dec    %ecx
  100538:	42                   	inc    %edx

void *
memset(void *v, int c, size_t n)
{
	char *p = (char *) v;
	while (n-- > 0)
  100539:	85 c9                	test   %ecx,%ecx
  10053b:	75 f8                	jne    100535 <memset+0x11>
		*p++ = c;
	return v;
}
  10053d:	5b                   	pop    %ebx
  10053e:	c3                   	ret    

0010053f <strlen>:

size_t
strlen(const char *s)
{
  10053f:	8b 54 24 04          	mov    0x4(%esp),%edx
  100543:	31 c0                	xor    %eax,%eax
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100545:	eb 01                	jmp    100548 <strlen+0x9>
		++n;
  100547:	40                   	inc    %eax

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100548:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
  10054c:	75 f9                	jne    100547 <strlen+0x8>
		++n;
	return n;
}
  10054e:	c3                   	ret    

0010054f <strnlen>:

size_t
strnlen(const char *s, size_t maxlen)
{
  10054f:	8b 4c 24 04          	mov    0x4(%esp),%ecx
  100553:	31 c0                	xor    %eax,%eax
  100555:	8b 54 24 08          	mov    0x8(%esp),%edx
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  100559:	eb 01                	jmp    10055c <strnlen+0xd>
		++n;
  10055b:	40                   	inc    %eax

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  10055c:	39 d0                	cmp    %edx,%eax
  10055e:	74 06                	je     100566 <strnlen+0x17>
  100560:	80 3c 01 00          	cmpb   $0x0,(%ecx,%eax,1)
  100564:	75 f5                	jne    10055b <strnlen+0xc>
		++n;
	return n;
}
  100566:	c3                   	ret    

00100567 <console_putc>:
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  100567:	56                   	push   %esi
	if (cursor >= CONSOLE_END)
  100568:	3d 9f 8f 0b 00       	cmp    $0xb8f9f,%eax
 *
 *   Print a message onto the console, starting at the given cursor position. */

static uint16_t *
console_putc(uint16_t *cursor, unsigned char c, int color)
{
  10056d:	53                   	push   %ebx
  10056e:	89 c3                	mov    %eax,%ebx
	if (cursor >= CONSOLE_END)
  100570:	76 05                	jbe    100577 <console_putc+0x10>
  100572:	bb 00 80 0b 00       	mov    $0xb8000,%ebx
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
  100577:	80 fa 0a             	cmp    $0xa,%dl
  10057a:	75 2c                	jne    1005a8 <console_putc+0x41>
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  10057c:	8d 83 00 80 f4 ff    	lea    -0xb8000(%ebx),%eax
  100582:	be 50 00 00 00       	mov    $0x50,%esi
  100587:	d1 f8                	sar    %eax
		for (; pos != 80; pos++)
			*cursor++ = ' ' | color;
  100589:	83 c9 20             	or     $0x20,%ecx
console_putc(uint16_t *cursor, unsigned char c, int color)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
  10058c:	99                   	cltd   
  10058d:	f7 fe                	idiv   %esi
  10058f:	89 de                	mov    %ebx,%esi
  100591:	89 d0                	mov    %edx,%eax
		for (; pos != 80; pos++)
  100593:	eb 07                	jmp    10059c <console_putc+0x35>
			*cursor++ = ' ' | color;
  100595:	66 89 0e             	mov    %cx,(%esi)
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  100598:	40                   	inc    %eax
			*cursor++ = ' ' | color;
  100599:	83 c6 02             	add    $0x2,%esi
{
	if (cursor >= CONSOLE_END)
		cursor = CONSOLE_BEGIN;
	if (c == '\n') {
		int pos = (cursor - CONSOLE_BEGIN) % 80;
		for (; pos != 80; pos++)
  10059c:	83 f8 50             	cmp    $0x50,%eax
  10059f:	75 f4                	jne    100595 <console_putc+0x2e>
  1005a1:	29 d0                	sub    %edx,%eax
  1005a3:	8d 04 43             	lea    (%ebx,%eax,2),%eax
  1005a6:	eb 0b                	jmp    1005b3 <console_putc+0x4c>
			*cursor++ = ' ' | color;
	} else
		*cursor++ = c | color;
  1005a8:	0f b6 d2             	movzbl %dl,%edx
  1005ab:	09 ca                	or     %ecx,%edx
  1005ad:	66 89 13             	mov    %dx,(%ebx)
  1005b0:	8d 43 02             	lea    0x2(%ebx),%eax
	return cursor;
}
  1005b3:	5b                   	pop    %ebx
  1005b4:	5e                   	pop    %esi
  1005b5:	c3                   	ret    

001005b6 <fill_numbuf>:
static const char lower_digits[] = "0123456789abcdef";

static char *
fill_numbuf(char *numbuf_end, uint32_t val, int base, const char *digits,
	    int precision)
{
  1005b6:	56                   	push   %esi
  1005b7:	53                   	push   %ebx
  1005b8:	8b 74 24 0c          	mov    0xc(%esp),%esi
	*--numbuf_end = '\0';
  1005bc:	8d 58 ff             	lea    -0x1(%eax),%ebx
  1005bf:	c6 40 ff 00          	movb   $0x0,-0x1(%eax)
	if (precision != 0 || val != 0)
  1005c3:	83 7c 24 10 00       	cmpl   $0x0,0x10(%esp)
  1005c8:	75 04                	jne    1005ce <fill_numbuf+0x18>
  1005ca:	85 d2                	test   %edx,%edx
  1005cc:	74 10                	je     1005de <fill_numbuf+0x28>
		do {
			*--numbuf_end = digits[val % base];
  1005ce:	89 d0                	mov    %edx,%eax
  1005d0:	31 d2                	xor    %edx,%edx
  1005d2:	f7 f1                	div    %ecx
  1005d4:	4b                   	dec    %ebx
  1005d5:	8a 14 16             	mov    (%esi,%edx,1),%dl
  1005d8:	88 13                	mov    %dl,(%ebx)
			val /= base;
  1005da:	89 c2                	mov    %eax,%edx
  1005dc:	eb ec                	jmp    1005ca <fill_numbuf+0x14>
		} while (val != 0);
	return numbuf_end;
}
  1005de:	89 d8                	mov    %ebx,%eax
  1005e0:	5b                   	pop    %ebx
  1005e1:	5e                   	pop    %esi
  1005e2:	c3                   	ret    

001005e3 <console_vprintf>:
#define FLAG_PLUSPOSITIVE	(1<<4)
static const char flag_chars[] = "#0- +";

uint16_t *
console_vprintf(uint16_t *cursor, int color, const char *format, va_list val)
{
  1005e3:	55                   	push   %ebp
  1005e4:	57                   	push   %edi
  1005e5:	56                   	push   %esi
  1005e6:	53                   	push   %ebx
  1005e7:	83 ec 38             	sub    $0x38,%esp
  1005ea:	8b 74 24 4c          	mov    0x4c(%esp),%esi
  1005ee:	8b 7c 24 54          	mov    0x54(%esp),%edi
  1005f2:	8b 5c 24 58          	mov    0x58(%esp),%ebx
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  1005f6:	e9 60 03 00 00       	jmp    10095b <console_vprintf+0x378>
		if (*format != '%') {
  1005fb:	80 fa 25             	cmp    $0x25,%dl
  1005fe:	74 13                	je     100613 <console_vprintf+0x30>
			cursor = console_putc(cursor, *format, color);
  100600:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100604:	0f b6 d2             	movzbl %dl,%edx
  100607:	89 f0                	mov    %esi,%eax
  100609:	e8 59 ff ff ff       	call   100567 <console_putc>
  10060e:	e9 45 03 00 00       	jmp    100958 <console_vprintf+0x375>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100613:	47                   	inc    %edi
  100614:	c7 44 24 14 00 00 00 	movl   $0x0,0x14(%esp)
  10061b:	00 
  10061c:	eb 12                	jmp    100630 <console_vprintf+0x4d>
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
  10061e:	41                   	inc    %ecx

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
  10061f:	8a 11                	mov    (%ecx),%dl
  100621:	84 d2                	test   %dl,%dl
  100623:	74 1a                	je     10063f <console_vprintf+0x5c>
  100625:	89 e8                	mov    %ebp,%eax
  100627:	38 c2                	cmp    %al,%dl
  100629:	75 f3                	jne    10061e <console_vprintf+0x3b>
  10062b:	e9 3f 03 00 00       	jmp    10096f <console_vprintf+0x38c>
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  100630:	8a 17                	mov    (%edi),%dl
  100632:	84 d2                	test   %dl,%dl
  100634:	74 0b                	je     100641 <console_vprintf+0x5e>
  100636:	b9 e8 09 10 00       	mov    $0x1009e8,%ecx
  10063b:	89 d5                	mov    %edx,%ebp
  10063d:	eb e0                	jmp    10061f <console_vprintf+0x3c>
  10063f:	89 ea                	mov    %ebp,%edx
			flags |= (1 << (flagc - flag_chars));
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
  100641:	8d 42 cf             	lea    -0x31(%edx),%eax
  100644:	3c 08                	cmp    $0x8,%al
  100646:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
  10064d:	00 
  10064e:	76 13                	jbe    100663 <console_vprintf+0x80>
  100650:	eb 1d                	jmp    10066f <console_vprintf+0x8c>
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
  100652:	6b 54 24 0c 0a       	imul   $0xa,0xc(%esp),%edx
  100657:	0f be c0             	movsbl %al,%eax
  10065a:	47                   	inc    %edi
  10065b:	8d 44 02 d0          	lea    -0x30(%edx,%eax,1),%eax
  10065f:	89 44 24 0c          	mov    %eax,0xc(%esp)
		}

		// process width
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
  100663:	8a 07                	mov    (%edi),%al
  100665:	8d 50 d0             	lea    -0x30(%eax),%edx
  100668:	80 fa 09             	cmp    $0x9,%dl
  10066b:	76 e5                	jbe    100652 <console_vprintf+0x6f>
  10066d:	eb 18                	jmp    100687 <console_vprintf+0xa4>
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
  10066f:	80 fa 2a             	cmp    $0x2a,%dl
  100672:	c7 44 24 0c ff ff ff 	movl   $0xffffffff,0xc(%esp)
  100679:	ff 
  10067a:	75 0b                	jne    100687 <console_vprintf+0xa4>
			width = va_arg(val, int);
  10067c:	83 c3 04             	add    $0x4,%ebx
			++format;
  10067f:	47                   	inc    %edi
		width = -1;
		if (*format >= '1' && *format <= '9') {
			for (width = 0; *format >= '0' && *format <= '9'; )
				width = 10 * width + *format++ - '0';
		} else if (*format == '*') {
			width = va_arg(val, int);
  100680:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100683:	89 54 24 0c          	mov    %edx,0xc(%esp)
			++format;
		}

		// process precision
		precision = -1;
		if (*format == '.') {
  100687:	83 cd ff             	or     $0xffffffff,%ebp
  10068a:	80 3f 2e             	cmpb   $0x2e,(%edi)
  10068d:	75 37                	jne    1006c6 <console_vprintf+0xe3>
			++format;
  10068f:	47                   	inc    %edi
			if (*format >= '0' && *format <= '9') {
  100690:	31 ed                	xor    %ebp,%ebp
  100692:	8a 07                	mov    (%edi),%al
  100694:	8d 50 d0             	lea    -0x30(%eax),%edx
  100697:	80 fa 09             	cmp    $0x9,%dl
  10069a:	76 0d                	jbe    1006a9 <console_vprintf+0xc6>
  10069c:	eb 17                	jmp    1006b5 <console_vprintf+0xd2>
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
  10069e:	6b ed 0a             	imul   $0xa,%ebp,%ebp
  1006a1:	0f be c0             	movsbl %al,%eax
  1006a4:	47                   	inc    %edi
  1006a5:	8d 6c 05 d0          	lea    -0x30(%ebp,%eax,1),%ebp
		// process precision
		precision = -1;
		if (*format == '.') {
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
  1006a9:	8a 07                	mov    (%edi),%al
  1006ab:	8d 50 d0             	lea    -0x30(%eax),%edx
  1006ae:	80 fa 09             	cmp    $0x9,%dl
  1006b1:	76 eb                	jbe    10069e <console_vprintf+0xbb>
  1006b3:	eb 11                	jmp    1006c6 <console_vprintf+0xe3>
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
  1006b5:	3c 2a                	cmp    $0x2a,%al
  1006b7:	75 0b                	jne    1006c4 <console_vprintf+0xe1>
				precision = va_arg(val, int);
  1006b9:	83 c3 04             	add    $0x4,%ebx
				++format;
  1006bc:	47                   	inc    %edi
			++format;
			if (*format >= '0' && *format <= '9') {
				for (precision = 0; *format >= '0' && *format <= '9'; )
					precision = 10 * precision + *format++ - '0';
			} else if (*format == '*') {
				precision = va_arg(val, int);
  1006bd:	8b 6b fc             	mov    -0x4(%ebx),%ebp
				++format;
			}
			if (precision < 0)
  1006c0:	85 ed                	test   %ebp,%ebp
  1006c2:	79 02                	jns    1006c6 <console_vprintf+0xe3>
  1006c4:	31 ed                	xor    %ebp,%ebp
		}

		// process main conversion character
		negative = 0;
		numeric = 0;
		switch (*format) {
  1006c6:	8a 07                	mov    (%edi),%al
  1006c8:	3c 64                	cmp    $0x64,%al
  1006ca:	74 34                	je     100700 <console_vprintf+0x11d>
  1006cc:	7f 1d                	jg     1006eb <console_vprintf+0x108>
  1006ce:	3c 58                	cmp    $0x58,%al
  1006d0:	0f 84 a2 00 00 00    	je     100778 <console_vprintf+0x195>
  1006d6:	3c 63                	cmp    $0x63,%al
  1006d8:	0f 84 bf 00 00 00    	je     10079d <console_vprintf+0x1ba>
  1006de:	3c 43                	cmp    $0x43,%al
  1006e0:	0f 85 d0 00 00 00    	jne    1007b6 <console_vprintf+0x1d3>
  1006e6:	e9 a3 00 00 00       	jmp    10078e <console_vprintf+0x1ab>
  1006eb:	3c 75                	cmp    $0x75,%al
  1006ed:	74 4d                	je     10073c <console_vprintf+0x159>
  1006ef:	3c 78                	cmp    $0x78,%al
  1006f1:	74 5c                	je     10074f <console_vprintf+0x16c>
  1006f3:	3c 73                	cmp    $0x73,%al
  1006f5:	0f 85 bb 00 00 00    	jne    1007b6 <console_vprintf+0x1d3>
  1006fb:	e9 86 00 00 00       	jmp    100786 <console_vprintf+0x1a3>
		case 'd': {
			int x = va_arg(val, int);
  100700:	83 c3 04             	add    $0x4,%ebx
  100703:	8b 53 fc             	mov    -0x4(%ebx),%edx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x > 0 ? x : -x, 10, upper_digits, precision);
  100706:	89 d1                	mov    %edx,%ecx
  100708:	c1 f9 1f             	sar    $0x1f,%ecx
  10070b:	89 0c 24             	mov    %ecx,(%esp)
  10070e:	31 ca                	xor    %ecx,%edx
  100710:	55                   	push   %ebp
  100711:	29 ca                	sub    %ecx,%edx
  100713:	68 f0 09 10 00       	push   $0x1009f0
  100718:	b9 0a 00 00 00       	mov    $0xa,%ecx
  10071d:	8d 44 24 40          	lea    0x40(%esp),%eax
  100721:	e8 90 fe ff ff       	call   1005b6 <fill_numbuf>
  100726:	89 44 24 0c          	mov    %eax,0xc(%esp)
			if (x < 0)
  10072a:	58                   	pop    %eax
  10072b:	5a                   	pop    %edx
  10072c:	ba 01 00 00 00       	mov    $0x1,%edx
  100731:	8b 04 24             	mov    (%esp),%eax
  100734:	83 e0 01             	and    $0x1,%eax
  100737:	e9 a5 00 00 00       	jmp    1007e1 <console_vprintf+0x1fe>
				negative = 1;
			numeric = 1;
			break;
		}
		case 'u': {
			unsigned x = va_arg(val, unsigned);
  10073c:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 10, upper_digits, precision);
  10073f:	b9 0a 00 00 00       	mov    $0xa,%ecx
  100744:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100747:	55                   	push   %ebp
  100748:	68 f0 09 10 00       	push   $0x1009f0
  10074d:	eb 11                	jmp    100760 <console_vprintf+0x17d>
			numeric = 1;
			break;
		}
		case 'x': {
			unsigned x = va_arg(val, unsigned);
  10074f:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, lower_digits, precision);
  100752:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100755:	55                   	push   %ebp
  100756:	68 04 0a 10 00       	push   $0x100a04
  10075b:	b9 10 00 00 00       	mov    $0x10,%ecx
  100760:	8d 44 24 40          	lea    0x40(%esp),%eax
  100764:	e8 4d fe ff ff       	call   1005b6 <fill_numbuf>
  100769:	ba 01 00 00 00       	mov    $0x1,%edx
  10076e:	89 44 24 0c          	mov    %eax,0xc(%esp)
  100772:	31 c0                	xor    %eax,%eax
			numeric = 1;
			break;
  100774:	59                   	pop    %ecx
  100775:	59                   	pop    %ecx
  100776:	eb 69                	jmp    1007e1 <console_vprintf+0x1fe>
		}
		case 'X': {
			unsigned x = va_arg(val, unsigned);
  100778:	83 c3 04             	add    $0x4,%ebx
			data = fill_numbuf(numbuf + NUMBUFSIZ, x, 16, upper_digits, precision);
  10077b:	8b 53 fc             	mov    -0x4(%ebx),%edx
  10077e:	55                   	push   %ebp
  10077f:	68 f0 09 10 00       	push   $0x1009f0
  100784:	eb d5                	jmp    10075b <console_vprintf+0x178>
			numeric = 1;
			break;
		}
		case 's':
			data = va_arg(val, char *);
  100786:	83 c3 04             	add    $0x4,%ebx
  100789:	8b 43 fc             	mov    -0x4(%ebx),%eax
  10078c:	eb 40                	jmp    1007ce <console_vprintf+0x1eb>
			break;
		case 'C':
			color = va_arg(val, int);
  10078e:	83 c3 04             	add    $0x4,%ebx
  100791:	8b 53 fc             	mov    -0x4(%ebx),%edx
  100794:	89 54 24 50          	mov    %edx,0x50(%esp)
			goto done;
  100798:	e9 bd 01 00 00       	jmp    10095a <console_vprintf+0x377>
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  10079d:	83 c3 04             	add    $0x4,%ebx
  1007a0:	8b 43 fc             	mov    -0x4(%ebx),%eax
			numbuf[1] = '\0';
  1007a3:	8d 4c 24 24          	lea    0x24(%esp),%ecx
  1007a7:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
  1007ac:	89 4c 24 04          	mov    %ecx,0x4(%esp)
		case 'C':
			color = va_arg(val, int);
			goto done;
		case 'c':
			data = numbuf;
			numbuf[0] = va_arg(val, int);
  1007b0:	88 44 24 24          	mov    %al,0x24(%esp)
  1007b4:	eb 27                	jmp    1007dd <console_vprintf+0x1fa>
			numbuf[1] = '\0';
			break;
		normal:
		default:
			data = numbuf;
			numbuf[0] = (*format ? *format : '%');
  1007b6:	84 c0                	test   %al,%al
  1007b8:	75 02                	jne    1007bc <console_vprintf+0x1d9>
  1007ba:	b0 25                	mov    $0x25,%al
  1007bc:	88 44 24 24          	mov    %al,0x24(%esp)
			numbuf[1] = '\0';
  1007c0:	c6 44 24 25 00       	movb   $0x0,0x25(%esp)
			if (!*format)
  1007c5:	80 3f 00             	cmpb   $0x0,(%edi)
  1007c8:	74 0a                	je     1007d4 <console_vprintf+0x1f1>
  1007ca:	8d 44 24 24          	lea    0x24(%esp),%eax
  1007ce:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007d2:	eb 09                	jmp    1007dd <console_vprintf+0x1fa>
				format--;
  1007d4:	8d 54 24 24          	lea    0x24(%esp),%edx
  1007d8:	4f                   	dec    %edi
  1007d9:	89 54 24 04          	mov    %edx,0x4(%esp)
  1007dd:	31 d2                	xor    %edx,%edx
  1007df:	31 c0                	xor    %eax,%eax
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  1007e1:	31 c9                	xor    %ecx,%ecx
			if (!*format)
				format--;
			break;
		}

		if (precision >= 0)
  1007e3:	83 fd ff             	cmp    $0xffffffff,%ebp
  1007e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  1007ed:	74 1f                	je     10080e <console_vprintf+0x22b>
  1007ef:	89 04 24             	mov    %eax,(%esp)
  1007f2:	eb 01                	jmp    1007f5 <console_vprintf+0x212>
size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
		++n;
  1007f4:	41                   	inc    %ecx

size_t
strnlen(const char *s, size_t maxlen)
{
	size_t n;
	for (n = 0; n != maxlen && *s != '\0'; ++s)
  1007f5:	39 e9                	cmp    %ebp,%ecx
  1007f7:	74 0a                	je     100803 <console_vprintf+0x220>
  1007f9:	8b 44 24 04          	mov    0x4(%esp),%eax
  1007fd:	80 3c 08 00          	cmpb   $0x0,(%eax,%ecx,1)
  100801:	75 f1                	jne    1007f4 <console_vprintf+0x211>
  100803:	8b 04 24             	mov    (%esp),%eax
				format--;
			break;
		}

		if (precision >= 0)
			len = strnlen(data, precision);
  100806:	89 0c 24             	mov    %ecx,(%esp)
  100809:	eb 1f                	jmp    10082a <console_vprintf+0x247>
size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
		++n;
  10080b:	42                   	inc    %edx
  10080c:	eb 09                	jmp    100817 <console_vprintf+0x234>
  10080e:	89 d1                	mov    %edx,%ecx
  100810:	8b 14 24             	mov    (%esp),%edx
  100813:	89 44 24 08          	mov    %eax,0x8(%esp)

size_t
strlen(const char *s)
{
	size_t n;
	for (n = 0; *s != '\0'; ++s)
  100817:	8b 44 24 04          	mov    0x4(%esp),%eax
  10081b:	80 3c 10 00          	cmpb   $0x0,(%eax,%edx,1)
  10081f:	75 ea                	jne    10080b <console_vprintf+0x228>
  100821:	8b 44 24 08          	mov    0x8(%esp),%eax
  100825:	89 14 24             	mov    %edx,(%esp)
  100828:	89 ca                	mov    %ecx,%edx

		if (precision >= 0)
			len = strnlen(data, precision);
		else
			len = strlen(data);
		if (numeric && negative)
  10082a:	85 c0                	test   %eax,%eax
  10082c:	74 0c                	je     10083a <console_vprintf+0x257>
  10082e:	84 d2                	test   %dl,%dl
  100830:	c7 44 24 08 2d 00 00 	movl   $0x2d,0x8(%esp)
  100837:	00 
  100838:	75 24                	jne    10085e <console_vprintf+0x27b>
			negative = '-';
		else if (flags & FLAG_PLUSPOSITIVE)
  10083a:	f6 44 24 14 10       	testb  $0x10,0x14(%esp)
  10083f:	c7 44 24 08 2b 00 00 	movl   $0x2b,0x8(%esp)
  100846:	00 
  100847:	75 15                	jne    10085e <console_vprintf+0x27b>
			negative = '+';
		else if (flags & FLAG_SPACEPOSITIVE)
  100849:	8b 44 24 14          	mov    0x14(%esp),%eax
  10084d:	83 e0 08             	and    $0x8,%eax
  100850:	83 f8 01             	cmp    $0x1,%eax
  100853:	19 c9                	sbb    %ecx,%ecx
  100855:	f7 d1                	not    %ecx
  100857:	83 e1 20             	and    $0x20,%ecx
  10085a:	89 4c 24 08          	mov    %ecx,0x8(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
  10085e:	3b 2c 24             	cmp    (%esp),%ebp
  100861:	7e 0d                	jle    100870 <console_vprintf+0x28d>
  100863:	84 d2                	test   %dl,%dl
  100865:	74 40                	je     1008a7 <console_vprintf+0x2c4>
			zeros = precision - len;
  100867:	2b 2c 24             	sub    (%esp),%ebp
  10086a:	89 6c 24 10          	mov    %ebp,0x10(%esp)
  10086e:	eb 3f                	jmp    1008af <console_vprintf+0x2cc>
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100870:	84 d2                	test   %dl,%dl
  100872:	74 33                	je     1008a7 <console_vprintf+0x2c4>
  100874:	8b 44 24 14          	mov    0x14(%esp),%eax
  100878:	83 e0 06             	and    $0x6,%eax
  10087b:	83 f8 02             	cmp    $0x2,%eax
  10087e:	75 27                	jne    1008a7 <console_vprintf+0x2c4>
  100880:	45                   	inc    %ebp
  100881:	75 24                	jne    1008a7 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
  100883:	31 c0                	xor    %eax,%eax
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100885:	8b 0c 24             	mov    (%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
  100888:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  10088d:	0f 95 c0             	setne  %al
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  100890:	8d 14 08             	lea    (%eax,%ecx,1),%edx
  100893:	3b 54 24 0c          	cmp    0xc(%esp),%edx
  100897:	7d 0e                	jge    1008a7 <console_vprintf+0x2c4>
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
  100899:	8b 54 24 0c          	mov    0xc(%esp),%edx
  10089d:	29 ca                	sub    %ecx,%edx
  10089f:	29 c2                	sub    %eax,%edx
  1008a1:	89 54 24 10          	mov    %edx,0x10(%esp)
			negative = ' ';
		else
			negative = 0;
		if (numeric && precision > len)
			zeros = precision - len;
		else if ((flags & (FLAG_ZERO | FLAG_LEFTJUSTIFY)) == FLAG_ZERO
  1008a5:	eb 08                	jmp    1008af <console_vprintf+0x2cc>
  1008a7:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
  1008ae:	00 
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008af:	8b 6c 24 0c          	mov    0xc(%esp),%ebp
  1008b3:	31 c0                	xor    %eax,%eax
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008b5:	8b 4c 24 14          	mov    0x14(%esp),%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008b9:	2b 2c 24             	sub    (%esp),%ebp
  1008bc:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1008c1:	0f 95 c0             	setne  %al
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008c4:	83 e1 04             	and    $0x4,%ecx
			 && numeric && precision < 0
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
  1008c7:	29 c5                	sub    %eax,%ebp
  1008c9:	89 f0                	mov    %esi,%eax
  1008cb:	2b 6c 24 10          	sub    0x10(%esp),%ebp
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008cf:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1008d3:	eb 0f                	jmp    1008e4 <console_vprintf+0x301>
			cursor = console_putc(cursor, ' ', color);
  1008d5:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  1008d9:	ba 20 00 00 00       	mov    $0x20,%edx
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008de:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  1008df:	e8 83 fc ff ff       	call   100567 <console_putc>
			 && len + !!negative < width)
			zeros = width - len - !!negative;
		else
			zeros = 0;
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
  1008e4:	85 ed                	test   %ebp,%ebp
  1008e6:	7e 07                	jle    1008ef <console_vprintf+0x30c>
  1008e8:	83 7c 24 0c 00       	cmpl   $0x0,0xc(%esp)
  1008ed:	74 e6                	je     1008d5 <console_vprintf+0x2f2>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
  1008ef:	83 7c 24 08 00       	cmpl   $0x0,0x8(%esp)
  1008f4:	89 c6                	mov    %eax,%esi
  1008f6:	74 23                	je     10091b <console_vprintf+0x338>
			cursor = console_putc(cursor, negative, color);
  1008f8:	0f b6 54 24 08       	movzbl 0x8(%esp),%edx
  1008fd:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100901:	e8 61 fc ff ff       	call   100567 <console_putc>
  100906:	89 c6                	mov    %eax,%esi
  100908:	eb 11                	jmp    10091b <console_vprintf+0x338>
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
  10090a:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  10090e:	ba 30 00 00 00       	mov    $0x30,%edx
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100913:	4e                   	dec    %esi
			cursor = console_putc(cursor, '0', color);
  100914:	e8 4e fc ff ff       	call   100567 <console_putc>
  100919:	eb 06                	jmp    100921 <console_vprintf+0x33e>
  10091b:	89 f0                	mov    %esi,%eax
  10091d:	8b 74 24 10          	mov    0x10(%esp),%esi
		width -= len + zeros + !!negative;
		for (; !(flags & FLAG_LEFTJUSTIFY) && width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
  100921:	85 f6                	test   %esi,%esi
  100923:	7f e5                	jg     10090a <console_vprintf+0x327>
  100925:	8b 34 24             	mov    (%esp),%esi
  100928:	eb 15                	jmp    10093f <console_vprintf+0x35c>
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
  10092a:	8b 4c 24 04          	mov    0x4(%esp),%ecx
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  10092e:	4e                   	dec    %esi
			cursor = console_putc(cursor, *data, color);
  10092f:	0f b6 11             	movzbl (%ecx),%edx
  100932:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100936:	e8 2c fc ff ff       	call   100567 <console_putc>
			cursor = console_putc(cursor, ' ', color);
		if (negative)
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
  10093b:	ff 44 24 04          	incl   0x4(%esp)
  10093f:	85 f6                	test   %esi,%esi
  100941:	7f e7                	jg     10092a <console_vprintf+0x347>
  100943:	eb 0f                	jmp    100954 <console_vprintf+0x371>
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
			cursor = console_putc(cursor, ' ', color);
  100945:	8b 4c 24 50          	mov    0x50(%esp),%ecx
  100949:	ba 20 00 00 00       	mov    $0x20,%edx
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  10094e:	4d                   	dec    %ebp
			cursor = console_putc(cursor, ' ', color);
  10094f:	e8 13 fc ff ff       	call   100567 <console_putc>
			cursor = console_putc(cursor, negative, color);
		for (; zeros > 0; --zeros)
			cursor = console_putc(cursor, '0', color);
		for (; len > 0; ++data, --len)
			cursor = console_putc(cursor, *data, color);
		for (; width > 0; --width)
  100954:	85 ed                	test   %ebp,%ebp
  100956:	7f ed                	jg     100945 <console_vprintf+0x362>
  100958:	89 c6                	mov    %eax,%esi
	int flags, width, zeros, precision, negative, numeric, len;
#define NUMBUFSIZ 20
	char numbuf[NUMBUFSIZ];
	char *data;

	for (; *format; ++format) {
  10095a:	47                   	inc    %edi
  10095b:	8a 17                	mov    (%edi),%dl
  10095d:	84 d2                	test   %dl,%dl
  10095f:	0f 85 96 fc ff ff    	jne    1005fb <console_vprintf+0x18>
			cursor = console_putc(cursor, ' ', color);
	done: ;
	}

	return cursor;
}
  100965:	83 c4 38             	add    $0x38,%esp
  100968:	89 f0                	mov    %esi,%eax
  10096a:	5b                   	pop    %ebx
  10096b:	5e                   	pop    %esi
  10096c:	5f                   	pop    %edi
  10096d:	5d                   	pop    %ebp
  10096e:	c3                   	ret    
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  10096f:	81 e9 e8 09 10 00    	sub    $0x1009e8,%ecx
  100975:	b8 01 00 00 00       	mov    $0x1,%eax
  10097a:	d3 e0                	shl    %cl,%eax
			continue;
		}

		// process flags
		flags = 0;
		for (++format; *format; ++format) {
  10097c:	47                   	inc    %edi
			const char *flagc = flag_chars;
			while (*flagc != '\0' && *flagc != *format)
				++flagc;
			if (*flagc == '\0')
				break;
			flags |= (1 << (flagc - flag_chars));
  10097d:	09 44 24 14          	or     %eax,0x14(%esp)
  100981:	e9 aa fc ff ff       	jmp    100630 <console_vprintf+0x4d>

00100986 <console_printf>:
uint16_t *
console_printf(uint16_t *cursor, int color, const char *format, ...)
{
	va_list val;
	va_start(val, format);
	cursor = console_vprintf(cursor, color, format, val);
  100986:	8d 44 24 10          	lea    0x10(%esp),%eax
  10098a:	50                   	push   %eax
  10098b:	ff 74 24 10          	pushl  0x10(%esp)
  10098f:	ff 74 24 10          	pushl  0x10(%esp)
  100993:	ff 74 24 10          	pushl  0x10(%esp)
  100997:	e8 47 fc ff ff       	call   1005e3 <console_vprintf>
  10099c:	83 c4 10             	add    $0x10,%esp
	va_end(val);
	return cursor;
}
  10099f:	c3                   	ret    
