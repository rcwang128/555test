   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  43                     ; 64 INTERRUPT_HANDLER(NonHandledInterrupt, 25)
  43                     ; 65 {
  44                     	switch	.text
  45  0000               f_NonHandledInterrupt:
  49                     ; 69 }
  52  0000 80            	iret
  74                     ; 77 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  74                     ; 78 {
  75                     	switch	.text
  76  0001               f_TRAP_IRQHandler:
  80                     ; 82 }
  83  0001 80            	iret
 105                     ; 89 INTERRUPT_HANDLER(TLI_IRQHandler, 0)
 105                     ; 90 
 105                     ; 91 {
 106                     	switch	.text
 107  0002               f_TLI_IRQHandler:
 111                     ; 95 }
 114  0002 80            	iret
 136                     ; 102 INTERRUPT_HANDLER(AWU_IRQHandler, 1)
 136                     ; 103 {
 137                     	switch	.text
 138  0003               f_AWU_IRQHandler:
 142                     ; 107 }
 145  0003 80            	iret
 167                     ; 114 INTERRUPT_HANDLER(CLK_IRQHandler, 2)
 167                     ; 115 {
 168                     	switch	.text
 169  0004               f_CLK_IRQHandler:
 173                     ; 119 }
 176  0004 80            	iret
 199                     ; 126 INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
 199                     ; 127 {
 200                     	switch	.text
 201  0005               f_EXTI_PORTA_IRQHandler:
 205                     ; 131 }
 208  0005 80            	iret
 231                     ; 138 INTERRUPT_HANDLER(EXTI_PORTB_IRQHandler, 4)
 231                     ; 139 {
 232                     	switch	.text
 233  0006               f_EXTI_PORTB_IRQHandler:
 237                     ; 143 }
 240  0006 80            	iret
 263                     ; 150 INTERRUPT_HANDLER(EXTI_PORTC_IRQHandler, 5)
 263                     ; 151 {
 264                     	switch	.text
 265  0007               f_EXTI_PORTC_IRQHandler:
 269                     ; 155 }
 272  0007 80            	iret
 295                     ; 162 INTERRUPT_HANDLER(EXTI_PORTD_IRQHandler, 6)
 295                     ; 163 {
 296                     	switch	.text
 297  0008               f_EXTI_PORTD_IRQHandler:
 301                     ; 167 }
 304  0008 80            	iret
 327                     ; 174 INTERRUPT_HANDLER(EXTI_PORTE_IRQHandler, 7)
 327                     ; 175 {
 328                     	switch	.text
 329  0009               f_EXTI_PORTE_IRQHandler:
 333                     ; 179 }
 336  0009 80            	iret
 358                     ; 226 INTERRUPT_HANDLER(SPI_IRQHandler, 10)
 358                     ; 227 {
 359                     	switch	.text
 360  000a               f_SPI_IRQHandler:
 364                     ; 231 }
 367  000a 80            	iret
 390                     ; 238 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_BRK_IRQHandler, 11)
 390                     ; 239 {
 391                     	switch	.text
 392  000b               f_TIM1_UPD_OVF_TRG_BRK_IRQHandler:
 396                     ; 247 }
 399  000b 80            	iret
 425                     ; 254 INTERRUPT_HANDLER(TIM1_CAP_COM_IRQHandler, 12)
 425                     ; 255 {
 426                     	switch	.text
 427  000c               f_TIM1_CAP_COM_IRQHandler:
 429  000c 8a            	push	cc
 430  000d 84            	pop	a
 431  000e a4bf          	and	a,#191
 432  0010 88            	push	a
 433  0011 86            	pop	cc
 434  0012 3b0002        	push	c_x+2
 435  0015 be00          	ldw	x,c_x
 436  0017 89            	pushw	x
 437  0018 3b0002        	push	c_y+2
 438  001b be00          	ldw	x,c_y
 439  001d 89            	pushw	x
 442                     ; 263 	overflow_count_tim1++;
 444  001e be00          	ldw	x,_overflow_count_tim1
 445  0020 1c0001        	addw	x,#1
 446  0023 bf00          	ldw	_overflow_count_tim1,x
 447                     ; 264 	TIM1_ClearITPendingBit(TIM1_IT_CC2);
 449  0025 a604          	ld	a,#4
 450  0027 cd0000        	call	_TIM1_ClearITPendingBit
 452                     ; 265 	TIM1_ClearFlag(TIM1_FLAG_CC2);
 454  002a ae0004        	ldw	x,#4
 455  002d cd0000        	call	_TIM1_ClearFlag
 457                     ; 266 }
 460  0030 85            	popw	x
 461  0031 bf00          	ldw	c_y,x
 462  0033 320002        	pop	c_y+2
 463  0036 85            	popw	x
 464  0037 bf00          	ldw	c_x,x
 465  0039 320002        	pop	c_x+2
 466  003c 80            	iret
 495                     ; 300 INTERRUPT_HANDLER(TIM2_UPD_OVF_BRK_IRQHandler, 13)
 495                     ; 301  {
 496                     	switch	.text
 497  003d               f_TIM2_UPD_OVF_BRK_IRQHandler:
 499  003d 8a            	push	cc
 500  003e 84            	pop	a
 501  003f a4bf          	and	a,#191
 502  0041 88            	push	a
 503  0042 86            	pop	cc
 504       00000004      OFST:	set	4
 505  0043 3b0002        	push	c_x+2
 506  0046 be00          	ldw	x,c_x
 507  0048 89            	pushw	x
 508  0049 3b0002        	push	c_y+2
 509  004c be00          	ldw	x,c_y
 510  004e 89            	pushw	x
 511  004f be02          	ldw	x,c_lreg+2
 512  0051 89            	pushw	x
 513  0052 be00          	ldw	x,c_lreg
 514  0054 89            	pushw	x
 515  0055 5204          	subw	sp,#4
 518                     ; 307 	freq = (overflow_count_tim1 + 1) * SAMP_RES;
 520  0057 be00          	ldw	x,_overflow_count_tim1
 521  0059 5c            	incw	x
 522  005a 90be00        	ldw	y,_SAMP_RES
 523  005d cd0000        	call	c_imul
 525  0060 bf00          	ldw	_freq,x
 526                     ; 308 	overflow_count_tim1 = 0;
 528  0062 5f            	clrw	x
 529  0063 bf00          	ldw	_overflow_count_tim1,x
 530                     ; 309 	cap = 77419 / freq; // freq = 1.44 / ((R + 2R)*cap ) => cap = 1.44*1000000 / (3*6.2*freq) pF 
 532  0065 be00          	ldw	x,_freq
 533  0067 cd0000        	call	c_uitolx
 535  006a 96            	ldw	x,sp
 536  006b 1c0001        	addw	x,#OFST-3
 537  006e cd0000        	call	c_rtol
 540  0071 ae2e6b        	ldw	x,#11883
 541  0074 bf02          	ldw	c_lreg+2,x
 542  0076 ae0001        	ldw	x,#1
 543  0079 bf00          	ldw	c_lreg,x
 544  007b 96            	ldw	x,sp
 545  007c 1c0001        	addw	x,#OFST-3
 546  007f cd0000        	call	c_ldiv
 548  0082 be02          	ldw	x,c_lreg+2
 549  0084 bf00          	ldw	_cap,x
 550                     ; 310 	cap = cap >> 1;
 552  0086 3400          	srl	_cap
 553  0088 3601          	rrc	_cap+1
 554                     ; 311 	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
 556  008a a601          	ld	a,#1
 557  008c cd0000        	call	_TIM2_ClearITPendingBit
 559                     ; 312 	TIM2_ClearFlag(TIM2_FLAG_CC2);
 561  008f ae0004        	ldw	x,#4
 562  0092 cd0000        	call	_TIM2_ClearFlag
 564                     ; 313  }
 567  0095 5b04          	addw	sp,#4
 568  0097 85            	popw	x
 569  0098 bf00          	ldw	c_lreg,x
 570  009a 85            	popw	x
 571  009b bf02          	ldw	c_lreg+2,x
 572  009d 85            	popw	x
 573  009e bf00          	ldw	c_y,x
 574  00a0 320002        	pop	c_y+2
 575  00a3 85            	popw	x
 576  00a4 bf00          	ldw	c_x,x
 577  00a6 320002        	pop	c_x+2
 578  00a9 80            	iret
 601                     ; 320  INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
 601                     ; 321  {
 602                     	switch	.text
 603  00aa               f_TIM2_CAP_COM_IRQHandler:
 607                     ; 325  }
 610  00aa 80            	iret
 636                     ; 335  INTERRUPT_HANDLER(TIM3_UPD_OVF_BRK_IRQHandler, 15)
 636                     ; 336  {
 637                     	switch	.text
 638  00ab               f_TIM3_UPD_OVF_BRK_IRQHandler:
 640  00ab 8a            	push	cc
 641  00ac 84            	pop	a
 642  00ad a4bf          	and	a,#191
 643  00af 88            	push	a
 644  00b0 86            	pop	cc
 645  00b1 3b0002        	push	c_x+2
 646  00b4 be00          	ldw	x,c_x
 647  00b6 89            	pushw	x
 648  00b7 3b0002        	push	c_y+2
 649  00ba be00          	ldw	x,c_y
 650  00bc 89            	pushw	x
 653                     ; 340 	GPIO_WriteReverse(GPIOD, GPIO_PIN_3);
 655  00bd 4b08          	push	#8
 656  00bf ae500f        	ldw	x,#20495
 657  00c2 cd0000        	call	_GPIO_WriteReverse
 659  00c5 84            	pop	a
 660                     ; 341 	TIM3_ClearFlag(TIM3_FLAG_UPDATE);
 662  00c6 ae0001        	ldw	x,#1
 663  00c9 cd0000        	call	_TIM3_ClearFlag
 665                     ; 342 	TIM3_ClearITPendingBit(TIM3_IT_UPDATE);
 667  00cc a601          	ld	a,#1
 668  00ce cd0000        	call	_TIM3_ClearITPendingBit
 670                     ; 343  }
 673  00d1 85            	popw	x
 674  00d2 bf00          	ldw	c_y,x
 675  00d4 320002        	pop	c_y+2
 676  00d7 85            	popw	x
 677  00d8 bf00          	ldw	c_x,x
 678  00da 320002        	pop	c_x+2
 679  00dd 80            	iret
 702                     ; 350  INTERRUPT_HANDLER(TIM3_CAP_COM_IRQHandler, 16)
 702                     ; 351  {
 703                     	switch	.text
 704  00de               f_TIM3_CAP_COM_IRQHandler:
 708                     ; 355  }
 711  00de 80            	iret
 733                     ; 416 INTERRUPT_HANDLER(I2C_IRQHandler, 19)
 733                     ; 417 {
 734                     	switch	.text
 735  00df               f_I2C_IRQHandler:
 739                     ; 421 }
 742  00df 80            	iret
 765                     ; 429  INTERRUPT_HANDLER(UART2_TX_IRQHandler, 20)
 765                     ; 430  {
 766                     	switch	.text
 767  00e0               f_UART2_TX_IRQHandler:
 771                     ; 434  }
 774  00e0 80            	iret
 797                     ; 441  INTERRUPT_HANDLER(UART2_RX_IRQHandler, 21)
 797                     ; 442  {
 798                     	switch	.text
 799  00e1               f_UART2_RX_IRQHandler:
 803                     ; 446  }
 806  00e1 80            	iret
 828                     ; 495  INTERRUPT_HANDLER(ADC1_IRQHandler, 22)
 828                     ; 496  {
 829                     	switch	.text
 830  00e2               f_ADC1_IRQHandler:
 834                     ; 500  }
 837  00e2 80            	iret
 863                     ; 521  INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
 863                     ; 522  {
 864                     	switch	.text
 865  00e3               f_TIM4_UPD_OVF_IRQHandler:
 867  00e3 8a            	push	cc
 868  00e4 84            	pop	a
 869  00e5 a4bf          	and	a,#191
 870  00e7 88            	push	a
 871  00e8 86            	pop	cc
 872  00e9 3b0002        	push	c_x+2
 873  00ec be00          	ldw	x,c_x
 874  00ee 89            	pushw	x
 875  00ef 3b0002        	push	c_y+2
 876  00f2 be00          	ldw	x,c_y
 877  00f4 89            	pushw	x
 880                     ; 527 	overflow_count_tim4++;
 882  00f5 be00          	ldw	x,_overflow_count_tim4
 883  00f7 1c0001        	addw	x,#1
 884  00fa bf00          	ldw	_overflow_count_tim4,x
 885                     ; 531 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
 887  00fc a601          	ld	a,#1
 888  00fe cd0000        	call	_TIM4_ClearFlag
 890                     ; 532 	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
 892  0101 a601          	ld	a,#1
 893  0103 cd0000        	call	_TIM4_ClearITPendingBit
 895                     ; 533  }
 898  0106 85            	popw	x
 899  0107 bf00          	ldw	c_y,x
 900  0109 320002        	pop	c_y+2
 901  010c 85            	popw	x
 902  010d bf00          	ldw	c_x,x
 903  010f 320002        	pop	c_x+2
 904  0112 80            	iret
 927                     ; 541 INTERRUPT_HANDLER(EEPROM_EEC_IRQHandler, 24)
 927                     ; 542 {
 928                     	switch	.text
 929  0113               f_EEPROM_EEC_IRQHandler:
 933                     ; 546 }
 936  0113 80            	iret
 948                     	xref.b	_SAMP_RES
 949                     	xref.b	_cap
 950                     	xref.b	_freq
 951                     	xref.b	_overflow_count_tim4
 952                     	xref.b	_overflow_count_tim1
 953                     	xdef	f_EEPROM_EEC_IRQHandler
 954                     	xdef	f_TIM4_UPD_OVF_IRQHandler
 955                     	xdef	f_ADC1_IRQHandler
 956                     	xdef	f_UART2_TX_IRQHandler
 957                     	xdef	f_UART2_RX_IRQHandler
 958                     	xdef	f_I2C_IRQHandler
 959                     	xdef	f_TIM3_CAP_COM_IRQHandler
 960                     	xdef	f_TIM3_UPD_OVF_BRK_IRQHandler
 961                     	xdef	f_TIM2_CAP_COM_IRQHandler
 962                     	xdef	f_TIM2_UPD_OVF_BRK_IRQHandler
 963                     	xdef	f_TIM1_UPD_OVF_TRG_BRK_IRQHandler
 964                     	xdef	f_TIM1_CAP_COM_IRQHandler
 965                     	xdef	f_SPI_IRQHandler
 966                     	xdef	f_EXTI_PORTE_IRQHandler
 967                     	xdef	f_EXTI_PORTD_IRQHandler
 968                     	xdef	f_EXTI_PORTC_IRQHandler
 969                     	xdef	f_EXTI_PORTB_IRQHandler
 970                     	xdef	f_EXTI_PORTA_IRQHandler
 971                     	xdef	f_CLK_IRQHandler
 972                     	xdef	f_AWU_IRQHandler
 973                     	xdef	f_TLI_IRQHandler
 974                     	xdef	f_TRAP_IRQHandler
 975                     	xdef	f_NonHandledInterrupt
 976                     	xref	_TIM3_ClearITPendingBit
 977                     	xref	_TIM3_ClearFlag
 978                     	xref	_TIM2_ClearITPendingBit
 979                     	xref	_TIM2_ClearFlag
 980                     	xref	_TIM4_ClearITPendingBit
 981                     	xref	_TIM4_ClearFlag
 982                     	xref	_TIM1_ClearITPendingBit
 983                     	xref	_TIM1_ClearFlag
 984                     	xref	_GPIO_WriteReverse
 985                     	xref.b	c_lreg
 986                     	xref.b	c_x
 987                     	xref.b	c_y
1006                     	xref	c_ldiv
1007                     	xref	c_rtol
1008                     	xref	c_uitolx
1009                     	xref	c_imul
1010                     	end
