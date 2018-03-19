   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  14                     	bsct
  15  0000               _SAMP_RES:
  16  0000 0005          	dc.w	5
  17  0002               _msTime:
  18  0002 0000          	dc.w	0
  19  0004               _overflow_count_tim1:
  20  0004 0000          	dc.w	0
  21  0006               _overflow_count_tim2:
  22  0006 0000          	dc.w	0
  23  0008               _overflow_count_tim4:
  24  0008 0000          	dc.w	0
  25  000a               _freq:
  26  000a 0000          	dc.w	0
  27  000c               _cap:
  28  000c 0000          	dc.w	0
  70                     ; 45 void main(void)
  70                     ; 46 {
  72                     	switch	.text
  73  0000               _main:
  77                     ; 47 	CLK_Config();
  79  0000 ad4d          	call	_CLK_Config
  81                     ; 48 	GPIO_Config();
  83  0002 cd00dc        	call	_GPIO_Config
  85                     ; 49 	UART2_Config();
  87  0005 cd00bc        	call	_UART2_Config
  89                     ; 50 	TIM3_Config(); // Test freq output
  91  0008 cd0126        	call	_TIM3_Config
  93                     ; 51 	TIM4_Config(); // Delay function
  95  000b cd013f        	call	_TIM4_Config
  97                     ; 52 	TIM2_Config(); // Input capture - channel 2
  99  000e cd018e        	call	_TIM2_Config
 101                     ; 53 	TIM1_Config(); // Set sample resolution
 103  0011 cd0161        	call	_TIM1_Config
 105                     ; 54 	printf("Test!\n");
 107  0014 ae003e        	ldw	x,#L12
 108  0017 cd0000        	call	_printf
 110                     ; 55 	printf("This is a Example.\n");
 112  001a ae002a        	ldw	x,#L32
 113  001d cd0000        	call	_printf
 115                     ; 59 	enableInterrupts();
 118  0020 9a            rim
 120                     ; 61 	msDelay(500);
 123  0021 ae01f4        	ldw	x,#500
 124  0024 cd0154        	call	_msDelay
 126  0027               L52:
 127                     ; 68 		printf("Detected Freq = %d Hz\n", freq-3);
 129  0027 be0a          	ldw	x,_freq
 130  0029 1d0003        	subw	x,#3
 131  002c 89            	pushw	x
 132  002d ae0013        	ldw	x,#L13
 133  0030 cd0000        	call	_printf
 135  0033 85            	popw	x
 136                     ; 69 		printf("Cap value = %d pF\n", cap);
 138  0034 be0c          	ldw	x,_cap
 139  0036 89            	pushw	x
 140  0037 ae0000        	ldw	x,#L33
 141  003a cd0000        	call	_printf
 143  003d 85            	popw	x
 144                     ; 70 		GPIO_WriteReverse(GPIOD, GPIO_PIN_0);
 146  003e 4b01          	push	#1
 147  0040 ae500f        	ldw	x,#20495
 148  0043 cd0000        	call	_GPIO_WriteReverse
 150  0046 84            	pop	a
 151                     ; 71 		msDelay(1000);
 153  0047 ae03e8        	ldw	x,#1000
 154  004a cd0154        	call	_msDelay
 157  004d 20d8          	jra	L52
 190                     ; 75 void CLK_Config(void)
 190                     ; 76 {
 191                     	switch	.text
 192  004f               _CLK_Config:
 196                     ; 77 	CLK_DeInit();
 198  004f cd0000        	call	_CLK_DeInit
 200                     ; 79 	CLK_HSECmd(ENABLE);
 202  0052 a601          	ld	a,#1
 203  0054 cd0000        	call	_CLK_HSECmd
 205                     ; 80 	CLK_LSICmd(DISABLE);
 207  0057 4f            	clr	a
 208  0058 cd0000        	call	_CLK_LSICmd
 210                     ; 81 	CLK_HSICmd(DISABLE);
 212  005b 4f            	clr	a
 213  005c cd0000        	call	_CLK_HSICmd
 216  005f               L74:
 217                     ; 82 	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == FALSE);
 219  005f ae0102        	ldw	x,#258
 220  0062 cd0000        	call	_CLK_GetFlagStatus
 222  0065 4d            	tnz	a
 223  0066 27f7          	jreq	L74
 224                     ; 84 	CLK_ClockSwitchCmd(ENABLE);
 226  0068 a601          	ld	a,#1
 227  006a cd0000        	call	_CLK_ClockSwitchCmd
 229                     ; 85 	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
 231  006d 4f            	clr	a
 232  006e cd0000        	call	_CLK_HSIPrescalerConfig
 234                     ; 86 	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); // 16MHz
 236  0071 a680          	ld	a,#128
 237  0073 cd0000        	call	_CLK_SYSCLKConfig
 239                     ; 88 	CLK_ClockSwitchConfig(CLK_SWITCHMODE_AUTO, CLK_SOURCE_HSE, DISABLE, CLK_CURRENTCLOCKSTATE_DISABLE);
 241  0076 4b00          	push	#0
 242  0078 4b00          	push	#0
 243  007a ae01b4        	ldw	x,#436
 244  007d cd0000        	call	_CLK_ClockSwitchConfig
 246  0080 85            	popw	x
 247                     ; 90 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART1, ENABLE); // Has to enable for UART2 to work?
 249  0081 ae0301        	ldw	x,#769
 250  0084 cd0000        	call	_CLK_PeripheralClockConfig
 252                     ; 91 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_UART2, ENABLE);
 254  0087 ae0301        	ldw	x,#769
 255  008a cd0000        	call	_CLK_PeripheralClockConfig
 257                     ; 92 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
 259  008d ae0701        	ldw	x,#1793
 260  0090 cd0000        	call	_CLK_PeripheralClockConfig
 262                     ; 93 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
 264  0093 ae0501        	ldw	x,#1281
 265  0096 cd0000        	call	_CLK_PeripheralClockConfig
 267                     ; 94 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER3, ENABLE);
 269  0099 ae0601        	ldw	x,#1537
 270  009c cd0000        	call	_CLK_PeripheralClockConfig
 272                     ; 95 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER4, ENABLE);
 274  009f ae0401        	ldw	x,#1025
 275  00a2 cd0000        	call	_CLK_PeripheralClockConfig
 277                     ; 97 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_SPI, DISABLE);
 279  00a5 ae0100        	ldw	x,#256
 280  00a8 cd0000        	call	_CLK_PeripheralClockConfig
 282                     ; 98 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_I2C, DISABLE);
 284  00ab 5f            	clrw	x
 285  00ac cd0000        	call	_CLK_PeripheralClockConfig
 287                     ; 99 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_ADC, DISABLE);
 289  00af ae1300        	ldw	x,#4864
 290  00b2 cd0000        	call	_CLK_PeripheralClockConfig
 292                     ; 100 	CLK_PeripheralClockConfig(CLK_PERIPHERAL_AWU, DISABLE);
 294  00b5 ae1200        	ldw	x,#4608
 295  00b8 cd0000        	call	_CLK_PeripheralClockConfig
 297                     ; 104 }
 300  00bb 81            	ret
 326                     ; 106 void UART2_Config(void)
 326                     ; 107 {
 327                     	switch	.text
 328  00bc               _UART2_Config:
 332                     ; 108 	UART2_DeInit();
 334  00bc cd0000        	call	_UART2_DeInit
 336                     ; 109 	UART2_Init((uint32_t)115200, UART2_WORDLENGTH_8D, UART2_STOPBITS_1, UART2_PARITY_NO, UART2_SYNCMODE_CLOCK_DISABLE, UART2_MODE_TXRX_ENABLE);
 338  00bf 4b0c          	push	#12
 339  00c1 4b80          	push	#128
 340  00c3 4b00          	push	#0
 341  00c5 4b00          	push	#0
 342  00c7 4b00          	push	#0
 343  00c9 aec200        	ldw	x,#49664
 344  00cc 89            	pushw	x
 345  00cd ae0001        	ldw	x,#1
 346  00d0 89            	pushw	x
 347  00d1 cd0000        	call	_UART2_Init
 349  00d4 5b09          	addw	sp,#9
 350                     ; 110 	UART2_Cmd(ENABLE);
 352  00d6 a601          	ld	a,#1
 353  00d8 cd0000        	call	_UART2_Cmd
 355                     ; 111 }
 358  00db 81            	ret
 383                     ; 113 void GPIO_Config(void)
 383                     ; 114 {
 384                     	switch	.text
 385  00dc               _GPIO_Config:
 389                     ; 115 	GPIO_DeInit(GPIOD);
 391  00dc ae500f        	ldw	x,#20495
 392  00df cd0000        	call	_GPIO_DeInit
 394                     ; 116 	GPIO_DeInit(GPIOE);
 396  00e2 ae5014        	ldw	x,#20500
 397  00e5 cd0000        	call	_GPIO_DeInit
 399                     ; 117 	GPIO_DeInit(GPIOC);
 401  00e8 ae500a        	ldw	x,#20490
 402  00eb cd0000        	call	_GPIO_DeInit
 404                     ; 118 	GPIO_Init(GPIOD, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 406  00ee 4be0          	push	#224
 407  00f0 4b01          	push	#1
 408  00f2 ae500f        	ldw	x,#20495
 409  00f5 cd0000        	call	_GPIO_Init
 411  00f8 85            	popw	x
 412                     ; 119 	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_OUT_PP_LOW_FAST);
 414  00f9 4be0          	push	#224
 415  00fb 4b04          	push	#4
 416  00fd ae500f        	ldw	x,#20495
 417  0100 cd0000        	call	_GPIO_Init
 419  0103 85            	popw	x
 420                     ; 120 	GPIO_Init(GPIOE, GPIO_PIN_0, GPIO_MODE_OUT_PP_LOW_FAST);
 422  0104 4be0          	push	#224
 423  0106 4b01          	push	#1
 424  0108 ae5014        	ldw	x,#20500
 425  010b cd0000        	call	_GPIO_Init
 427  010e 85            	popw	x
 428                     ; 121 	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_OUT_PP_LOW_FAST);
 430  010f 4be0          	push	#224
 431  0111 4b08          	push	#8
 432  0113 ae500f        	ldw	x,#20495
 433  0116 cd0000        	call	_GPIO_Init
 435  0119 85            	popw	x
 436                     ; 122 	GPIO_Init(GPIOC, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT);
 438  011a 4b00          	push	#0
 439  011c 4b04          	push	#4
 440  011e ae500a        	ldw	x,#20490
 441  0121 cd0000        	call	_GPIO_Init
 443  0124 85            	popw	x
 444                     ; 123 }
 447  0125 81            	ret
 474                     ; 125 void TIM3_Config(void)
 474                     ; 126 {	
 475                     	switch	.text
 476  0126               _TIM3_Config:
 480                     ; 127 	TIM3_DeInit();
 482  0126 cd0000        	call	_TIM3_DeInit
 484                     ; 130 	TIM3_TimeBaseInit(TIM3_PRESCALER_16, 131); //16M / 16 / 500 = 2k, f = 1kHz
 486  0129 ae0083        	ldw	x,#131
 487  012c 89            	pushw	x
 488  012d a604          	ld	a,#4
 489  012f cd0000        	call	_TIM3_TimeBaseInit
 491  0132 85            	popw	x
 492                     ; 131 	TIM3_ITConfig(TIM3_IT_UPDATE, ENABLE);
 494  0133 ae0101        	ldw	x,#257
 495  0136 cd0000        	call	_TIM3_ITConfig
 497                     ; 132 	TIM3_Cmd(ENABLE);
 499  0139 a601          	ld	a,#1
 500  013b cd0000        	call	_TIM3_Cmd
 502                     ; 133 }
 505  013e 81            	ret
 532                     ; 135 void TIM4_Config(void)
 532                     ; 136 {	
 533                     	switch	.text
 534  013f               _TIM4_Config:
 538                     ; 137 	TIM4_DeInit();
 540  013f cd0000        	call	_TIM4_DeInit
 542                     ; 138 	TIM4_TimeBaseInit(TIM4_PRESCALER_64, 249); //16M / 64 / 250 = 1k = 1ms
 544  0142 ae06f9        	ldw	x,#1785
 545  0145 cd0000        	call	_TIM4_TimeBaseInit
 547                     ; 140 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
 549  0148 ae0101        	ldw	x,#257
 550  014b cd0000        	call	_TIM4_ITConfig
 552                     ; 141 	TIM4_Cmd(ENABLE);
 554  014e a601          	ld	a,#1
 555  0150 cd0000        	call	_TIM4_Cmd
 557                     ; 142 }
 560  0153 81            	ret
 595                     ; 145 void msDelay(uint16_t msTime)
 595                     ; 146 {
 596                     	switch	.text
 597  0154               _msDelay:
 599  0154 89            	pushw	x
 600       00000000      OFST:	set	0
 603  0155               L331:
 604                     ; 147 	while (msTime != (overflow_count_tim4 - 1));
 606  0155 be08          	ldw	x,_overflow_count_tim4
 607  0157 5a            	decw	x
 608  0158 1301          	cpw	x,(OFST+1,sp)
 609  015a 26f9          	jrne	L331
 610                     ; 148 	overflow_count_tim4 = 0;
 612  015c 5f            	clrw	x
 613  015d bf08          	ldw	_overflow_count_tim4,x
 614                     ; 149 }
 617  015f 85            	popw	x
 618  0160 81            	ret
 646                     ; 151 void TIM1_Config(void)
 646                     ; 152 {	
 647                     	switch	.text
 648  0161               _TIM1_Config:
 652                     ; 153 	TIM1_DeInit();
 654  0161 cd0000        	call	_TIM1_DeInit
 656                     ; 154 	TIM1_TimeBaseInit(8, TIM1_COUNTERMODE_UP, 19, 0);	// 16M / 8 / 20 = 100k, 10us
 658  0164 4b00          	push	#0
 659  0166 ae0013        	ldw	x,#19
 660  0169 89            	pushw	x
 661  016a 4b00          	push	#0
 662  016c ae0008        	ldw	x,#8
 663  016f cd0000        	call	_TIM1_TimeBaseInit
 665  0172 5b04          	addw	sp,#4
 666                     ; 156 	TIM1_ICInit(TIM1_CHANNEL_2, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI, 1, 1);
 668  0174 4b01          	push	#1
 669  0176 4b01          	push	#1
 670  0178 4b01          	push	#1
 671  017a ae0100        	ldw	x,#256
 672  017d cd0000        	call	_TIM1_ICInit
 674  0180 5b03          	addw	sp,#3
 675                     ; 158 	TIM1_ITConfig(TIM1_IT_CC2, ENABLE);
 677  0182 ae0401        	ldw	x,#1025
 678  0185 cd0000        	call	_TIM1_ITConfig
 680                     ; 159 	TIM1_Cmd(ENABLE);
 682  0188 a601          	ld	a,#1
 683  018a cd0000        	call	_TIM1_Cmd
 685                     ; 160 }
 688  018d 81            	ret
 716                     ; 162 void TIM2_Config(void)
 716                     ; 163 {
 717                     	switch	.text
 718  018e               _TIM2_Config:
 722                     ; 164 	TIM2_DeInit();
 724  018e cd0000        	call	_TIM2_DeInit
 726                     ; 165 	TIM2_TimeBaseInit(TIM2_PRESCALER_512, 31250/SAMP_RES-1); //16M / 512 / = 31250
 728  0191 ae7a12        	ldw	x,#31250
 729  0194 90be00        	ldw	y,_SAMP_RES
 730  0197 65            	divw	x,y
 731  0198 5a            	decw	x
 732  0199 89            	pushw	x
 733  019a a609          	ld	a,#9
 734  019c cd0000        	call	_TIM2_TimeBaseInit
 736  019f 85            	popw	x
 737                     ; 166 	TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);
 739  01a0 ae0101        	ldw	x,#257
 740  01a3 cd0000        	call	_TIM2_ITConfig
 742                     ; 167 	TIM2_Cmd(ENABLE);
 744  01a6 a601          	ld	a,#1
 745  01a8 cd0000        	call	_TIM2_Cmd
 747                     ; 168 }
 750  01ab 81            	ret
 786                     ; 172 PUTCHAR_PROTOTYPE
 786                     ; 173 {
 787                     	switch	.text
 788  01ac               _putchar:
 790  01ac 88            	push	a
 791       00000000      OFST:	set	0
 794                     ; 175   UART2_SendData8(c);
 796  01ad cd0000        	call	_UART2_SendData8
 799  01b0               L771:
 800                     ; 177   while (UART2_GetFlagStatus(UART2_FLAG_TXE) == RESET);
 802  01b0 ae0080        	ldw	x,#128
 803  01b3 cd0000        	call	_UART2_GetFlagStatus
 805  01b6 4d            	tnz	a
 806  01b7 27f7          	jreq	L771
 807                     ; 178   return (c);
 809  01b9 7b01          	ld	a,(OFST+1,sp)
 812  01bb 5b01          	addw	sp,#1
 813  01bd 81            	ret
 849                     ; 186 GETCHAR_PROTOTYPE
 849                     ; 187 {
 850                     	switch	.text
 851  01be               _getchar:
 853  01be 88            	push	a
 854       00000001      OFST:	set	1
 857                     ; 189   char c = 0;
 860  01bf               L322:
 861                     ; 194   while (UART2_GetFlagStatus(UART2_FLAG_RXNE) == RESET);
 863  01bf ae0020        	ldw	x,#32
 864  01c2 cd0000        	call	_UART2_GetFlagStatus
 866  01c5 4d            	tnz	a
 867  01c6 27f7          	jreq	L322
 868                     ; 195     c = UART2_ReceiveData8();
 870  01c8 cd0000        	call	_UART2_ReceiveData8
 872  01cb 6b01          	ld	(OFST+0,sp),a
 874                     ; 196   return (c);
 876  01cd 7b01          	ld	a,(OFST+0,sp)
 879  01cf 5b01          	addw	sp,#1
 880  01d1 81            	ret
 961                     	xdef	_main
 962                     	xdef	_cap
 963                     	xdef	_freq
 964                     	xdef	_overflow_count_tim4
 965                     	xdef	_overflow_count_tim2
 966                     	xdef	_overflow_count_tim1
 967                     	xdef	_msDelay
 968                     	xdef	_msTime
 969                     	xdef	_SAMP_RES
 970                     	xdef	_TIM4_Config
 971                     	xdef	_TIM3_Config
 972                     	xdef	_TIM2_Config
 973                     	xdef	_TIM1_Config
 974                     	xdef	_UART2_Config
 975                     	xdef	_GPIO_Config
 976                     	xdef	_CLK_Config
 977                     	xdef	_putchar
 978                     	xref	_printf
 979                     	xdef	_getchar
 980                     	xref	_UART2_GetFlagStatus
 981                     	xref	_UART2_SendData8
 982                     	xref	_UART2_ReceiveData8
 983                     	xref	_UART2_Cmd
 984                     	xref	_UART2_Init
 985                     	xref	_UART2_DeInit
 986                     	xref	_TIM3_ITConfig
 987                     	xref	_TIM3_Cmd
 988                     	xref	_TIM3_TimeBaseInit
 989                     	xref	_TIM3_DeInit
 990                     	xref	_TIM2_ITConfig
 991                     	xref	_TIM2_Cmd
 992                     	xref	_TIM2_TimeBaseInit
 993                     	xref	_TIM2_DeInit
 994                     	xref	_TIM4_ITConfig
 995                     	xref	_TIM4_Cmd
 996                     	xref	_TIM4_TimeBaseInit
 997                     	xref	_TIM4_DeInit
 998                     	xref	_TIM1_ITConfig
 999                     	xref	_TIM1_Cmd
1000                     	xref	_TIM1_ICInit
1001                     	xref	_TIM1_TimeBaseInit
1002                     	xref	_TIM1_DeInit
1003                     	xref	_GPIO_WriteReverse
1004                     	xref	_GPIO_Init
1005                     	xref	_GPIO_DeInit
1006                     	xref	_CLK_GetFlagStatus
1007                     	xref	_CLK_SYSCLKConfig
1008                     	xref	_CLK_HSIPrescalerConfig
1009                     	xref	_CLK_ClockSwitchConfig
1010                     	xref	_CLK_PeripheralClockConfig
1011                     	xref	_CLK_ClockSwitchCmd
1012                     	xref	_CLK_LSICmd
1013                     	xref	_CLK_HSICmd
1014                     	xref	_CLK_HSECmd
1015                     	xref	_CLK_DeInit
1016                     .const:	section	.text
1017  0000               L33:
1018  0000 436170207661  	dc.b	"Cap value = %d pF",10,0
1019  0013               L13:
1020  0013 446574656374  	dc.b	"Detected Freq = %d"
1021  0025 20487a0a00    	dc.b	" Hz",10,0
1022  002a               L32:
1023  002a 546869732069  	dc.b	"This is a Example."
1024  003c 0a00          	dc.b	10,0
1025  003e               L12:
1026  003e 54657374210a  	dc.b	"Test!",10,0
1046                     	end
