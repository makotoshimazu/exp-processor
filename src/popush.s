	.include "ia-32z.s"
	.text
init:   
	zLIL	1,  cx
        zLIL    10, bx
        zLIL    1,  sp
        zSLL    8,  sp
push:
        zPUSH   cx
        zADD    cx, cx
        zSUBI   1,  bx
        zBcc    nz, push

        zLIL    10, bx
pop:
        zPOP    ax
        zSUBI   1,  bx
        zBcc    nz, pop
EXIT:
        zHLT
