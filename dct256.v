//a fast 1-D 256-point DCT, the top Verilog module
`timescale 1ns/1ps

module dct256(clk, rst, pushin,
	di0, di1, di2, di3, di4, di5, di6, di7, di8, di9, 
	di10, di11, di12, di13, di14, di15, di16, di17, di18, di19, 
	di20, di21, di22, di23, di24, di25, di26, di27, di28, di29, 
	di30, di31, di32, di33, di34, di35, di36, di37, di38, di39, 
	di40, di41, di42, di43, di44, di45, di46, di47, di48, di49, 
	di50, di51, di52, di53, di54, di55, di56, di57, di58, di59, 
	di60, di61, di62, di63, di64, di65, di66, di67, di68, di69, 
	di70, di71, di72, di73, di74, di75, di76, di77, di78, di79, 
	di80, di81, di82, di83, di84, di85, di86, di87, di88, di89, 
	di90, di91, di92, di93, di94, di95, di96, di97, di98, di99, 
	di100, di101, di102, di103, di104, di105, di106, di107, di108, di109, 
	di110, di111, di112, di113, di114, di115, di116, di117, di118, di119, 
	di120, di121, di122, di123, di124, di125, di126, di127, di128, di129, 
	di130, di131, di132, di133, di134, di135, di136, di137, di138, di139, 
	di140, di141, di142, di143, di144, di145, di146, di147, di148, di149, 
	di150, di151, di152, di153, di154, di155, di156, di157, di158, di159, 
	di160, di161, di162, di163, di164, di165, di166, di167, di168, di169, 
	di170, di171, di172, di173, di174, di175, di176, di177, di178, di179, 
	di180, di181, di182, di183, di184, di185, di186, di187, di188, di189, 
	di190, di191, di192, di193, di194, di195, di196, di197, di198, di199, 
	di200, di201, di202, di203, di204, di205, di206, di207, di208, di209, 
	di210, di211, di212, di213, di214, di215, di216, di217, di218, di219, 
	di220, di221, di222, di223, di224, di225, di226, di227, di228, di229, 
	di230, di231, di232, di233, di234, di235, di236, di237, di238, di239, 
	di240, di241, di242, di243, di244, di245, di246, di247, di248, di249, 
	di250, di251, di252, di253, di254, di255, 
	do0, do1, do2, do3, do4, do5, do6, do7, do8, do9, 
	do10, do11, do12, do13, do14, do15, do16, do17, do18, do19, 
	do20, do21, do22, do23, do24, do25, do26, do27, do28, do29, 
	do30, do31, do32, do33, do34, do35, do36, do37, do38, do39, 
	do40, do41, do42, do43, do44, do45, do46, do47, do48, do49, 
	do50, do51, do52, do53, do54, do55, do56, do57, do58, do59, 
	do60, do61, do62, do63, do64, do65, do66, do67, do68, do69, 
	do70, do71, do72, do73, do74, do75, do76, do77, do78, do79, 
	do80, do81, do82, do83, do84, do85, do86, do87, do88, do89, 
	do90, do91, do92, do93, do94, do95, do96, do97, do98, do99, 
	do100, do101, do102, do103, do104, do105, do106, do107, do108, do109, 
	do110, do111, do112, do113, do114, do115, do116, do117, do118, do119, 
	do120, do121, do122, do123, do124, do125, do126, do127, do128, do129, 
	do130, do131, do132, do133, do134, do135, do136, do137, do138, do139, 
	do140, do141, do142, do143, do144, do145, do146, do147, do148, do149, 
	do150, do151, do152, do153, do154, do155, do156, do157, do158, do159, 
	do160, do161, do162, do163, do164, do165, do166, do167, do168, do169, 
	do170, do171, do172, do173, do174, do175, do176, do177, do178, do179, 
	do180, do181, do182, do183, do184, do185, do186, do187, do188, do189, 
	do190, do191, do192, do193, do194, do195, do196, do197, do198, do199, 
	do200, do201, do202, do203, do204, do205, do206, do207, do208, do209, 
	do210, do211, do212, do213, do214, do215, do216, do217, do218, do219, 
	do220, do221, do222, do223, do224, do225, do226, do227, do228, do229, 
	do230, do231, do232, do233, do234, do235, do236, do237, do238, do239, 
	do240, do241, do242, do243, do244, do245, do246, do247, do248, do249, 
	do250, do251, do252, do253, do254, do255);

input clk, rst, pushin;
input [24:0] di0, di1, di2, di3, di4, di5, di6, di7, di8, di9, 
	di10, di11, di12, di13, di14, di15, di16, di17, di18, di19, 
	di20, di21, di22, di23, di24, di25, di26, di27, di28, di29, 
	di30, di31, di32, di33, di34, di35, di36, di37, di38, di39, 
	di40, di41, di42, di43, di44, di45, di46, di47, di48, di49, 
	di50, di51, di52, di53, di54, di55, di56, di57, di58, di59, 
	di60, di61, di62, di63, di64, di65, di66, di67, di68, di69, 
	di70, di71, di72, di73, di74, di75, di76, di77, di78, di79, 
	di80, di81, di82, di83, di84, di85, di86, di87, di88, di89, 
	di90, di91, di92, di93, di94, di95, di96, di97, di98, di99, 
	di100, di101, di102, di103, di104, di105, di106, di107, di108, di109, 
	di110, di111, di112, di113, di114, di115, di116, di117, di118, di119, 
	di120, di121, di122, di123, di124, di125, di126, di127, di128, di129, 
	di130, di131, di132, di133, di134, di135, di136, di137, di138, di139, 
	di140, di141, di142, di143, di144, di145, di146, di147, di148, di149, 
	di150, di151, di152, di153, di154, di155, di156, di157, di158, di159, 
	di160, di161, di162, di163, di164, di165, di166, di167, di168, di169, 
	di170, di171, di172, di173, di174, di175, di176, di177, di178, di179, 
	di180, di181, di182, di183, di184, di185, di186, di187, di188, di189, 
	di190, di191, di192, di193, di194, di195, di196, di197, di198, di199, 
	di200, di201, di202, di203, di204, di205, di206, di207, di208, di209, 
	di210, di211, di212, di213, di214, di215, di216, di217, di218, di219, 
	di220, di221, di222, di223, di224, di225, di226, di227, di228, di229, 
	di230, di231, di232, di233, di234, di235, di236, di237, di238, di239, 
	di240, di241, di242, di243, di244, di245, di246, di247, di248, di249, 
	di250, di251, di252, di253, di254, di255;

output [24:0] do0, do1, do2, do3, do4, do5, do6, do7, do8, do9, 
	do10, do11, do12, do13, do14, do15, do16, do17, do18, do19, 
	do20, do21, do22, do23, do24, do25, do26, do27, do28, do29, 
	do30, do31, do32, do33, do34, do35, do36, do37, do38, do39, 
	do40, do41, do42, do43, do44, do45, do46, do47, do48, do49, 
	do50, do51, do52, do53, do54, do55, do56, do57, do58, do59, 
	do60, do61, do62, do63, do64, do65, do66, do67, do68, do69, 
	do70, do71, do72, do73, do74, do75, do76, do77, do78, do79, 
	do80, do81, do82, do83, do84, do85, do86, do87, do88, do89, 
	do90, do91, do92, do93, do94, do95, do96, do97, do98, do99, 
	do100, do101, do102, do103, do104, do105, do106, do107, do108, do109, 
	do110, do111, do112, do113, do114, do115, do116, do117, do118, do119, 
	do120, do121, do122, do123, do124, do125, do126, do127, do128, do129, 
	do130, do131, do132, do133, do134, do135, do136, do137, do138, do139, 
	do140, do141, do142, do143, do144, do145, do146, do147, do148, do149, 
	do150, do151, do152, do153, do154, do155, do156, do157, do158, do159, 
	do160, do161, do162, do163, do164, do165, do166, do167, do168, do169, 
	do170, do171, do172, do173, do174, do175, do176, do177, do178, do179, 
	do180, do181, do182, do183, do184, do185, do186, do187, do188, do189, 
	do190, do191, do192, do193, do194, do195, do196, do197, do198, do199, 
	do200, do201, do202, do203, do204, do205, do206, do207, do208, do209, 
	do210, do211, do212, do213, do214, do215, do216, do217, do218, do219, 
	do220, do221, do222, do223, do224, do225, do226, do227, do228, do229, 
	do230, do231, do232, do233, do234, do235, do236, do237, do238, do239, 
	do240, do241, do242, do243, do244, do245, do246, do247, do248, do249, 
	do250, do251, do252, do253, do254, do255;

reg [6:0] i;	//0-127, 0-63, 0-31, 0-15, 0-7, 0-3, 0-1
reg [8:0] n;	//256, 128, 64, 32, 16, 8, 4, 2, (1)
reg [3:0] layer;	//0-7 pre-multiple, 8-15 post-addition (0-7)
reg [6:0] counter;	//0-255
reg start;

reg [24:0] bfly_di1, bfly_di2;
wire [24:0] bfly_do1, bfly_do2;

reg [24:0] wr0, wr1, wr2, wr3, wr4, wr5, wr6, wr7, wr8, wr9, 
	wr10, wr11, wr12, wr13, wr14, wr15, wr16, wr17, wr18, wr19, 
	wr20, wr21, wr22, wr23, wr24, wr25, wr26, wr27, wr28, wr29, 
	wr30, wr31, wr32, wr33, wr34, wr35, wr36, wr37, wr38, wr39, 
	wr40, wr41, wr42, wr43, wr44, wr45, wr46, wr47, wr48, wr49, 
	wr50, wr51, wr52, wr53, wr54, wr55, wr56, wr57, wr58, wr59, 
	wr60, wr61, wr62, wr63, wr64, wr65, wr66, wr67, wr68, wr69, 
	wr70, wr71, wr72, wr73, wr74, wr75, wr76, wr77, wr78, wr79, 
	wr80, wr81, wr82, wr83, wr84, wr85, wr86, wr87, wr88, wr89, 
	wr90, wr91, wr92, wr93, wr94, wr95, wr96, wr97, wr98, wr99, 
	wr100, wr101, wr102, wr103, wr104, wr105, wr106, wr107, wr108, wr109, 
	wr110, wr111, wr112, wr113, wr114, wr115, wr116, wr117, wr118, wr119, 
	wr120, wr121, wr122, wr123, wr124, wr125, wr126, wr127, wr128, wr129, 
	wr130, wr131, wr132, wr133, wr134, wr135, wr136, wr137, wr138, wr139, 
	wr140, wr141, wr142, wr143, wr144, wr145, wr146, wr147, wr148, wr149, 
	wr150, wr151, wr152, wr153, wr154, wr155, wr156, wr157, wr158, wr159, 
	wr160, wr161, wr162, wr163, wr164, wr165, wr166, wr167, wr168, wr169, 
	wr170, wr171, wr172, wr173, wr174, wr175, wr176, wr177, wr178, wr179, 
	wr180, wr181, wr182, wr183, wr184, wr185, wr186, wr187, wr188, wr189, 
	wr190, wr191, wr192, wr193, wr194, wr195, wr196, wr197, wr198, wr199, 
	wr200, wr201, wr202, wr203, wr204, wr205, wr206, wr207, wr208, wr209, 
	wr210, wr211, wr212, wr213, wr214, wr215, wr216, wr217, wr218, wr219, 
	wr220, wr221, wr222, wr223, wr224, wr225, wr226, wr227, wr228, wr229, 
	wr230, wr231, wr232, wr233, wr234, wr235, wr236, wr237, wr238, wr239, 
	wr240, wr241, wr242, wr243, wr244, wr245, wr246, wr247, wr248, wr249, 
	wr250, wr251, wr252, wr253, wr254, wr255;

reg [24:0] do0_, do1_, do2_, do3_, do4_, do5_, do6_, do7_, do8_, do9_, 
	do10_, do11_, do12_, do13_, do14_, do15_, do16_, do17_, do18_, do19_, 
	do20_, do21_, do22_, do23_, do24_, do25_, do26_, do27_, do28_, do29_, 
	do30_, do31_, do32_, do33_, do34_, do35_, do36_, do37_, do38_, do39_, 
	do40_, do41_, do42_, do43_, do44_, do45_, do46_, do47_, do48_, do49_, 
	do50_, do51_, do52_, do53_, do54_, do55_, do56_, do57_, do58_, do59_, 
	do60_, do61_, do62_, do63_, do64_, do65_, do66_, do67_, do68_, do69_, 
	do70_, do71_, do72_, do73_, do74_, do75_, do76_, do77_, do78_, do79_, 
	do80_, do81_, do82_, do83_, do84_, do85_, do86_, do87_, do88_, do89_, 
	do90_, do91_, do92_, do93_, do94_, do95_, do96_, do97_, do98_, do99_, 
	do100_, do101_, do102_, do103_, do104_, do105_, do106_, do107_, do108_, do109_, 
	do110_, do111_, do112_, do113_, do114_, do115_, do116_, do117_, do118_, do119_, 
	do120_, do121_, do122_, do123_, do124_, do125_, do126_, do127_, do128_, do129_, 
	do130_, do131_, do132_, do133_, do134_, do135_, do136_, do137_, do138_, do139_, 
	do140_, do141_, do142_, do143_, do144_, do145_, do146_, do147_, do148_, do149_, 
	do150_, do151_, do152_, do153_, do154_, do155_, do156_, do157_, do158_, do159_, 
	do160_, do161_, do162_, do163_, do164_, do165_, do166_, do167_, do168_, do169_, 
	do170_, do171_, do172_, do173_, do174_, do175_, do176_, do177_, do178_, do179_, 
	do180_, do181_, do182_, do183_, do184_, do185_, do186_, do187_, do188_, do189_, 
	do190_, do191_, do192_, do193_, do194_, do195_, do196_, do197_, do198_, do199_, 
	do200_, do201_, do202_, do203_, do204_, do205_, do206_, do207_, do208_, do209_, 
	do210_, do211_, do212_, do213_, do214_, do215_, do216_, do217_, do218_, do219_, 
	do220_, do221_, do222_, do223_, do224_, do225_, do226_, do227_, do228_, do229_, 
	do230_, do231_, do232_, do233_, do234_, do235_, do236_, do237_, do238_, do239_, 
	do240_, do241_, do242_, do243_, do244_, do245_, do246_, do247_, do248_, do249_, 
	do250_, do251_, do252_, do253_, do254_, do255_;


bfly b (bfly_di1, bfly_di2, i, n, bfly_do1, bfly_do2);


assign do0 = do0_;
assign do1 = do1_;
assign do2 = do2_;
assign do3 = do3_;
assign do4 = do4_;
assign do5 = do5_;
assign do6 = do6_;
assign do7 = do7_;
assign do8 = do8_;
assign do9 = do9_;
assign do10 = do10_;
assign do11 = do11_;
assign do12 = do12_;
assign do13 = do13_;
assign do14 = do14_;
assign do15 = do15_;
assign do16 = do16_;
assign do17 = do17_;
assign do18 = do18_;
assign do19 = do19_;
assign do20 = do20_;
assign do21 = do21_;
assign do22 = do22_;
assign do23 = do23_;
assign do24 = do24_;
assign do25 = do25_;
assign do26 = do26_;
assign do27 = do27_;
assign do28 = do28_;
assign do29 = do29_;
assign do30 = do30_;
assign do31 = do31_;
assign do32 = do32_;
assign do33 = do33_;
assign do34 = do34_;
assign do35 = do35_;
assign do36 = do36_;
assign do37 = do37_;
assign do38 = do38_;
assign do39 = do39_;
assign do40 = do40_;
assign do41 = do41_;
assign do42 = do42_;
assign do43 = do43_;
assign do44 = do44_;
assign do45 = do45_;
assign do46 = do46_;
assign do47 = do47_;
assign do48 = do48_;
assign do49 = do49_;
assign do50 = do50_;
assign do51 = do51_;
assign do52 = do52_;
assign do53 = do53_;
assign do54 = do54_;
assign do55 = do55_;
assign do56 = do56_;
assign do57 = do57_;
assign do58 = do58_;
assign do59 = do59_;
assign do60 = do60_;
assign do61 = do61_;
assign do62 = do62_;
assign do63 = do63_;
assign do64 = do64_;
assign do65 = do65_;
assign do66 = do66_;
assign do67 = do67_;
assign do68 = do68_;
assign do69 = do69_;
assign do70 = do70_;
assign do71 = do71_;
assign do72 = do72_;
assign do73 = do73_;
assign do74 = do74_;
assign do75 = do75_;
assign do76 = do76_;
assign do77 = do77_;
assign do78 = do78_;
assign do79 = do79_;
assign do80 = do80_;
assign do81 = do81_;
assign do82 = do82_;
assign do83 = do83_;
assign do84 = do84_;
assign do85 = do85_;
assign do86 = do86_;
assign do87 = do87_;
assign do88 = do88_;
assign do89 = do89_;
assign do90 = do90_;
assign do91 = do91_;
assign do92 = do92_;
assign do93 = do93_;
assign do94 = do94_;
assign do95 = do95_;
assign do96 = do96_;
assign do97 = do97_;
assign do98 = do98_;
assign do99 = do99_;
assign do100 = do100_;
assign do101 = do101_;
assign do102 = do102_;
assign do103 = do103_;
assign do104 = do104_;
assign do105 = do105_;
assign do106 = do106_;
assign do107 = do107_;
assign do108 = do108_;
assign do109 = do109_;
assign do110 = do110_;
assign do111 = do111_;
assign do112 = do112_;
assign do113 = do113_;
assign do114 = do114_;
assign do115 = do115_;
assign do116 = do116_;
assign do117 = do117_;
assign do118 = do118_;
assign do119 = do119_;
assign do120 = do120_;
assign do121 = do121_;
assign do122 = do122_;
assign do123 = do123_;
assign do124 = do124_;
assign do125 = do125_;
assign do126 = do126_;
assign do127 = do127_;
assign do128 = do128_;
assign do129 = do129_;
assign do130 = do130_;
assign do131 = do131_;
assign do132 = do132_;
assign do133 = do133_;
assign do134 = do134_;
assign do135 = do135_;
assign do136 = do136_;
assign do137 = do137_;
assign do138 = do138_;
assign do139 = do139_;
assign do140 = do140_;
assign do141 = do141_;
assign do142 = do142_;
assign do143 = do143_;
assign do144 = do144_;
assign do145 = do145_;
assign do146 = do146_;
assign do147 = do147_;
assign do148 = do148_;
assign do149 = do149_;
assign do150 = do150_;
assign do151 = do151_;
assign do152 = do152_;
assign do153 = do153_;
assign do154 = do154_;
assign do155 = do155_;
assign do156 = do156_;
assign do157 = do157_;
assign do158 = do158_;
assign do159 = do159_;
assign do160 = do160_;
assign do161 = do161_;
assign do162 = do162_;
assign do163 = do163_;
assign do164 = do164_;
assign do165 = do165_;
assign do166 = do166_;
assign do167 = do167_;
assign do168 = do168_;
assign do169 = do169_;
assign do170 = do170_;
assign do171 = do171_;
assign do172 = do172_;
assign do173 = do173_;
assign do174 = do174_;
assign do175 = do175_;
assign do176 = do176_;
assign do177 = do177_;
assign do178 = do178_;
assign do179 = do179_;
assign do180 = do180_;
assign do181 = do181_;
assign do182 = do182_;
assign do183 = do183_;
assign do184 = do184_;
assign do185 = do185_;
assign do186 = do186_;
assign do187 = do187_;
assign do188 = do188_;
assign do189 = do189_;
assign do190 = do190_;
assign do191 = do191_;
assign do192 = do192_;
assign do193 = do193_;
assign do194 = do194_;
assign do195 = do195_;
assign do196 = do196_;
assign do197 = do197_;
assign do198 = do198_;
assign do199 = do199_;
assign do200 = do200_;
assign do201 = do201_;
assign do202 = do202_;
assign do203 = do203_;
assign do204 = do204_;
assign do205 = do205_;
assign do206 = do206_;
assign do207 = do207_;
assign do208 = do208_;
assign do209 = do209_;
assign do210 = do210_;
assign do211 = do211_;
assign do212 = do212_;
assign do213 = do213_;
assign do214 = do214_;
assign do215 = do215_;
assign do216 = do216_;
assign do217 = do217_;
assign do218 = do218_;
assign do219 = do219_;
assign do220 = do220_;
assign do221 = do221_;
assign do222 = do222_;
assign do223 = do223_;
assign do224 = do224_;
assign do225 = do225_;
assign do226 = do226_;
assign do227 = do227_;
assign do228 = do228_;
assign do229 = do229_;
assign do230 = do230_;
assign do231 = do231_;
assign do232 = do232_;
assign do233 = do233_;
assign do234 = do234_;
assign do235 = do235_;
assign do236 = do236_;
assign do237 = do237_;
assign do238 = do238_;
assign do239 = do239_;
assign do240 = do240_;
assign do241 = do241_;
assign do242 = do242_;
assign do243 = do243_;
assign do244 = do244_;
assign do245 = do245_;
assign do246 = do246_;
assign do247 = do247_;
assign do248 = do248_;
assign do249 = do249_;
assign do250 = do250_;
assign do251 = do251_;
assign do252 = do252_;
assign do253 = do253_;
assign do254 = do254_;
assign do255 = do255_;


always @(posedge (clk)) begin
	if (start) begin
	case(layer)
		0: begin
			n <= 256;
			case(counter)
				0: begin
					bfly_di1 <= wr0;
					bfly_di2 <= wr255;
					i <= 0;
					counter <= counter + 1;
				end
				1: begin
					bfly_di1 <= wr1;
					bfly_di2 <= wr254;
					i <= 1;
					wr0 <= bfly_do1;
					wr255 <= bfly_do2;
					counter <= counter + 1;
				end
				2: begin
					bfly_di1 <= wr2;
					bfly_di2 <= wr253;
					i <= 2;
					wr1 <= bfly_do1;
					wr254 <= bfly_do2;
					counter <= counter + 1;
				end
				3: begin
					bfly_di1 <= wr3;
					bfly_di2 <= wr252;
					i <= 3;
					wr2 <= bfly_do1;
					wr253 <= bfly_do2;
					counter <= counter + 1;
				end
				4: begin
					bfly_di1 <= wr4;
					bfly_di2 <= wr251;
					i <= 4;
					wr3 <= bfly_do1;
					wr252 <= bfly_do2;
					counter <= counter + 1;
				end
				5: begin
					bfly_di1 <= wr5;
					bfly_di2 <= wr250;
					i <= 5;
					wr4 <= bfly_do1;
					wr251 <= bfly_do2;
					counter <= counter + 1;
				end
				6: begin
					bfly_di1 <= wr6;
					bfly_di2 <= wr249;
					i <= 6;
					wr5 <= bfly_do1;
					wr250 <= bfly_do2;
					counter <= counter + 1;
				end
				7: begin
					bfly_di1 <= wr7;
					bfly_di2 <= wr248;
					i <= 7;
					wr6 <= bfly_do1;
					wr249 <= bfly_do2;
					counter <= counter + 1;
				end
				8: begin
					bfly_di1 <= wr8;
					bfly_di2 <= wr247;
					i <= 8;
					wr7 <= bfly_do1;
					wr248 <= bfly_do2;
					counter <= counter + 1;
				end
				9: begin
					bfly_di1 <= wr9;
					bfly_di2 <= wr246;
					i <= 9;
					wr8 <= bfly_do1;
					wr247 <= bfly_do2;
					counter <= counter + 1;
				end
				10: begin
					bfly_di1 <= wr10;
					bfly_di2 <= wr245;
					i <= 10;
					wr9 <= bfly_do1;
					wr246 <= bfly_do2;
					counter <= counter + 1;
				end
				11: begin
					bfly_di1 <= wr11;
					bfly_di2 <= wr244;
					i <= 11;
					wr10 <= bfly_do1;
					wr245 <= bfly_do2;
					counter <= counter + 1;
				end
				12: begin
					bfly_di1 <= wr12;
					bfly_di2 <= wr243;
					i <= 12;
					wr11 <= bfly_do1;
					wr244 <= bfly_do2;
					counter <= counter + 1;
				end
				13: begin
					bfly_di1 <= wr13;
					bfly_di2 <= wr242;
					i <= 13;
					wr12 <= bfly_do1;
					wr243 <= bfly_do2;
					counter <= counter + 1;
				end
				14: begin
					bfly_di1 <= wr14;
					bfly_di2 <= wr241;
					i <= 14;
					wr13 <= bfly_do1;
					wr242 <= bfly_do2;
					counter <= counter + 1;
				end
				15: begin
					bfly_di1 <= wr15;
					bfly_di2 <= wr240;
					i <= 15;
					wr14 <= bfly_do1;
					wr241 <= bfly_do2;
					counter <= counter + 1;
				end
				16: begin
					bfly_di1 <= wr16;
					bfly_di2 <= wr239;
					i <= 16;
					wr15 <= bfly_do1;
					wr240 <= bfly_do2;
					counter <= counter + 1;
				end
				17: begin
					bfly_di1 <= wr17;
					bfly_di2 <= wr238;
					i <= 17;
					wr16 <= bfly_do1;
					wr239 <= bfly_do2;
					counter <= counter + 1;
				end
				18: begin
					bfly_di1 <= wr18;
					bfly_di2 <= wr237;
					i <= 18;
					wr17 <= bfly_do1;
					wr238 <= bfly_do2;
					counter <= counter + 1;
				end
				19: begin
					bfly_di1 <= wr19;
					bfly_di2 <= wr236;
					i <= 19;
					wr18 <= bfly_do1;
					wr237 <= bfly_do2;
					counter <= counter + 1;
				end
				20: begin
					bfly_di1 <= wr20;
					bfly_di2 <= wr235;
					i <= 20;
					wr19 <= bfly_do1;
					wr236 <= bfly_do2;
					counter <= counter + 1;
				end
				21: begin
					bfly_di1 <= wr21;
					bfly_di2 <= wr234;
					i <= 21;
					wr20 <= bfly_do1;
					wr235 <= bfly_do2;
					counter <= counter + 1;
				end
				22: begin
					bfly_di1 <= wr22;
					bfly_di2 <= wr233;
					i <= 22;
					wr21 <= bfly_do1;
					wr234 <= bfly_do2;
					counter <= counter + 1;
				end
				23: begin
					bfly_di1 <= wr23;
					bfly_di2 <= wr232;
					i <= 23;
					wr22 <= bfly_do1;
					wr233 <= bfly_do2;
					counter <= counter + 1;
				end
				24: begin
					bfly_di1 <= wr24;
					bfly_di2 <= wr231;
					i <= 24;
					wr23 <= bfly_do1;
					wr232 <= bfly_do2;
					counter <= counter + 1;
				end
				25: begin
					bfly_di1 <= wr25;
					bfly_di2 <= wr230;
					i <= 25;
					wr24 <= bfly_do1;
					wr231 <= bfly_do2;
					counter <= counter + 1;
				end
				26: begin
					bfly_di1 <= wr26;
					bfly_di2 <= wr229;
					i <= 26;
					wr25 <= bfly_do1;
					wr230 <= bfly_do2;
					counter <= counter + 1;
				end
				27: begin
					bfly_di1 <= wr27;
					bfly_di2 <= wr228;
					i <= 27;
					wr26 <= bfly_do1;
					wr229 <= bfly_do2;
					counter <= counter + 1;
				end
				28: begin
					bfly_di1 <= wr28;
					bfly_di2 <= wr227;
					i <= 28;
					wr27 <= bfly_do1;
					wr228 <= bfly_do2;
					counter <= counter + 1;
				end
				29: begin
					bfly_di1 <= wr29;
					bfly_di2 <= wr226;
					i <= 29;
					wr28 <= bfly_do1;
					wr227 <= bfly_do2;
					counter <= counter + 1;
				end
				30: begin
					bfly_di1 <= wr30;
					bfly_di2 <= wr225;
					i <= 30;
					wr29 <= bfly_do1;
					wr226 <= bfly_do2;
					counter <= counter + 1;
				end
				31: begin
					bfly_di1 <= wr31;
					bfly_di2 <= wr224;
					i <= 31;
					wr30 <= bfly_do1;
					wr225 <= bfly_do2;
					counter <= counter + 1;
				end
				32: begin
					bfly_di1 <= wr32;
					bfly_di2 <= wr223;
					i <= 32;
					wr31 <= bfly_do1;
					wr224 <= bfly_do2;
					counter <= counter + 1;
				end
				33: begin
					bfly_di1 <= wr33;
					bfly_di2 <= wr222;
					i <= 33;
					wr32 <= bfly_do1;
					wr223 <= bfly_do2;
					counter <= counter + 1;
				end
				34: begin
					bfly_di1 <= wr34;
					bfly_di2 <= wr221;
					i <= 34;
					wr33 <= bfly_do1;
					wr222 <= bfly_do2;
					counter <= counter + 1;
				end
				35: begin
					bfly_di1 <= wr35;
					bfly_di2 <= wr220;
					i <= 35;
					wr34 <= bfly_do1;
					wr221 <= bfly_do2;
					counter <= counter + 1;
				end
				36: begin
					bfly_di1 <= wr36;
					bfly_di2 <= wr219;
					i <= 36;
					wr35 <= bfly_do1;
					wr220 <= bfly_do2;
					counter <= counter + 1;
				end
				37: begin
					bfly_di1 <= wr37;
					bfly_di2 <= wr218;
					i <= 37;
					wr36 <= bfly_do1;
					wr219 <= bfly_do2;
					counter <= counter + 1;
				end
				38: begin
					bfly_di1 <= wr38;
					bfly_di2 <= wr217;
					i <= 38;
					wr37 <= bfly_do1;
					wr218 <= bfly_do2;
					counter <= counter + 1;
				end
				39: begin
					bfly_di1 <= wr39;
					bfly_di2 <= wr216;
					i <= 39;
					wr38 <= bfly_do1;
					wr217 <= bfly_do2;
					counter <= counter + 1;
				end
				40: begin
					bfly_di1 <= wr40;
					bfly_di2 <= wr215;
					i <= 40;
					wr39 <= bfly_do1;
					wr216 <= bfly_do2;
					counter <= counter + 1;
				end
				41: begin
					bfly_di1 <= wr41;
					bfly_di2 <= wr214;
					i <= 41;
					wr40 <= bfly_do1;
					wr215 <= bfly_do2;
					counter <= counter + 1;
				end
				42: begin
					bfly_di1 <= wr42;
					bfly_di2 <= wr213;
					i <= 42;
					wr41 <= bfly_do1;
					wr214 <= bfly_do2;
					counter <= counter + 1;
				end
				43: begin
					bfly_di1 <= wr43;
					bfly_di2 <= wr212;
					i <= 43;
					wr42 <= bfly_do1;
					wr213 <= bfly_do2;
					counter <= counter + 1;
				end
				44: begin
					bfly_di1 <= wr44;
					bfly_di2 <= wr211;
					i <= 44;
					wr43 <= bfly_do1;
					wr212 <= bfly_do2;
					counter <= counter + 1;
				end
				45: begin
					bfly_di1 <= wr45;
					bfly_di2 <= wr210;
					i <= 45;
					wr44 <= bfly_do1;
					wr211 <= bfly_do2;
					counter <= counter + 1;
				end
				46: begin
					bfly_di1 <= wr46;
					bfly_di2 <= wr209;
					i <= 46;
					wr45 <= bfly_do1;
					wr210 <= bfly_do2;
					counter <= counter + 1;
				end
				47: begin
					bfly_di1 <= wr47;
					bfly_di2 <= wr208;
					i <= 47;
					wr46 <= bfly_do1;
					wr209 <= bfly_do2;
					counter <= counter + 1;
				end
				48: begin
					bfly_di1 <= wr48;
					bfly_di2 <= wr207;
					i <= 48;
					wr47 <= bfly_do1;
					wr208 <= bfly_do2;
					counter <= counter + 1;
				end
				49: begin
					bfly_di1 <= wr49;
					bfly_di2 <= wr206;
					i <= 49;
					wr48 <= bfly_do1;
					wr207 <= bfly_do2;
					counter <= counter + 1;
				end
				50: begin
					bfly_di1 <= wr50;
					bfly_di2 <= wr205;
					i <= 50;
					wr49 <= bfly_do1;
					wr206 <= bfly_do2;
					counter <= counter + 1;
				end
				51: begin
					bfly_di1 <= wr51;
					bfly_di2 <= wr204;
					i <= 51;
					wr50 <= bfly_do1;
					wr205 <= bfly_do2;
					counter <= counter + 1;
				end
				52: begin
					bfly_di1 <= wr52;
					bfly_di2 <= wr203;
					i <= 52;
					wr51 <= bfly_do1;
					wr204 <= bfly_do2;
					counter <= counter + 1;
				end
				53: begin
					bfly_di1 <= wr53;
					bfly_di2 <= wr202;
					i <= 53;
					wr52 <= bfly_do1;
					wr203 <= bfly_do2;
					counter <= counter + 1;
				end
				54: begin
					bfly_di1 <= wr54;
					bfly_di2 <= wr201;
					i <= 54;
					wr53 <= bfly_do1;
					wr202 <= bfly_do2;
					counter <= counter + 1;
				end
				55: begin
					bfly_di1 <= wr55;
					bfly_di2 <= wr200;
					i <= 55;
					wr54 <= bfly_do1;
					wr201 <= bfly_do2;
					counter <= counter + 1;
				end
				56: begin
					bfly_di1 <= wr56;
					bfly_di2 <= wr199;
					i <= 56;
					wr55 <= bfly_do1;
					wr200 <= bfly_do2;
					counter <= counter + 1;
				end
				57: begin
					bfly_di1 <= wr57;
					bfly_di2 <= wr198;
					i <= 57;
					wr56 <= bfly_do1;
					wr199 <= bfly_do2;
					counter <= counter + 1;
				end
				58: begin
					bfly_di1 <= wr58;
					bfly_di2 <= wr197;
					i <= 58;
					wr57 <= bfly_do1;
					wr198 <= bfly_do2;
					counter <= counter + 1;
				end
				59: begin
					bfly_di1 <= wr59;
					bfly_di2 <= wr196;
					i <= 59;
					wr58 <= bfly_do1;
					wr197 <= bfly_do2;
					counter <= counter + 1;
				end
				60: begin
					bfly_di1 <= wr60;
					bfly_di2 <= wr195;
					i <= 60;
					wr59 <= bfly_do1;
					wr196 <= bfly_do2;
					counter <= counter + 1;
				end
				61: begin
					bfly_di1 <= wr61;
					bfly_di2 <= wr194;
					i <= 61;
					wr60 <= bfly_do1;
					wr195 <= bfly_do2;
					counter <= counter + 1;
				end
				62: begin
					bfly_di1 <= wr62;
					bfly_di2 <= wr193;
					i <= 62;
					wr61 <= bfly_do1;
					wr194 <= bfly_do2;
					counter <= counter + 1;
				end
				63: begin
					bfly_di1 <= wr63;
					bfly_di2 <= wr192;
					i <= 63;
					wr62 <= bfly_do1;
					wr193 <= bfly_do2;
					counter <= counter + 1;
				end
				64: begin
					bfly_di1 <= wr64;
					bfly_di2 <= wr191;
					i <= 64;
					wr63 <= bfly_do1;
					wr192 <= bfly_do2;
					counter <= counter + 1;
				end
				65: begin
					bfly_di1 <= wr65;
					bfly_di2 <= wr190;
					i <= 65;
					wr64 <= bfly_do1;
					wr191 <= bfly_do2;
					counter <= counter + 1;
				end
				66: begin
					bfly_di1 <= wr66;
					bfly_di2 <= wr189;
					i <= 66;
					wr65 <= bfly_do1;
					wr190 <= bfly_do2;
					counter <= counter + 1;
				end
				67: begin
					bfly_di1 <= wr67;
					bfly_di2 <= wr188;
					i <= 67;
					wr66 <= bfly_do1;
					wr189 <= bfly_do2;
					counter <= counter + 1;
				end
				68: begin
					bfly_di1 <= wr68;
					bfly_di2 <= wr187;
					i <= 68;
					wr67 <= bfly_do1;
					wr188 <= bfly_do2;
					counter <= counter + 1;
				end
				69: begin
					bfly_di1 <= wr69;
					bfly_di2 <= wr186;
					i <= 69;
					wr68 <= bfly_do1;
					wr187 <= bfly_do2;
					counter <= counter + 1;
				end
				70: begin
					bfly_di1 <= wr70;
					bfly_di2 <= wr185;
					i <= 70;
					wr69 <= bfly_do1;
					wr186 <= bfly_do2;
					counter <= counter + 1;
				end
				71: begin
					bfly_di1 <= wr71;
					bfly_di2 <= wr184;
					i <= 71;
					wr70 <= bfly_do1;
					wr185 <= bfly_do2;
					counter <= counter + 1;
				end
				72: begin
					bfly_di1 <= wr72;
					bfly_di2 <= wr183;
					i <= 72;
					wr71 <= bfly_do1;
					wr184 <= bfly_do2;
					counter <= counter + 1;
				end
				73: begin
					bfly_di1 <= wr73;
					bfly_di2 <= wr182;
					i <= 73;
					wr72 <= bfly_do1;
					wr183 <= bfly_do2;
					counter <= counter + 1;
				end
				74: begin
					bfly_di1 <= wr74;
					bfly_di2 <= wr181;
					i <= 74;
					wr73 <= bfly_do1;
					wr182 <= bfly_do2;
					counter <= counter + 1;
				end
				75: begin
					bfly_di1 <= wr75;
					bfly_di2 <= wr180;
					i <= 75;
					wr74 <= bfly_do1;
					wr181 <= bfly_do2;
					counter <= counter + 1;
				end
				76: begin
					bfly_di1 <= wr76;
					bfly_di2 <= wr179;
					i <= 76;
					wr75 <= bfly_do1;
					wr180 <= bfly_do2;
					counter <= counter + 1;
				end
				77: begin
					bfly_di1 <= wr77;
					bfly_di2 <= wr178;
					i <= 77;
					wr76 <= bfly_do1;
					wr179 <= bfly_do2;
					counter <= counter + 1;
				end
				78: begin
					bfly_di1 <= wr78;
					bfly_di2 <= wr177;
					i <= 78;
					wr77 <= bfly_do1;
					wr178 <= bfly_do2;
					counter <= counter + 1;
				end
				79: begin
					bfly_di1 <= wr79;
					bfly_di2 <= wr176;
					i <= 79;
					wr78 <= bfly_do1;
					wr177 <= bfly_do2;
					counter <= counter + 1;
				end
				80: begin
					bfly_di1 <= wr80;
					bfly_di2 <= wr175;
					i <= 80;
					wr79 <= bfly_do1;
					wr176 <= bfly_do2;
					counter <= counter + 1;
				end
				81: begin
					bfly_di1 <= wr81;
					bfly_di2 <= wr174;
					i <= 81;
					wr80 <= bfly_do1;
					wr175 <= bfly_do2;
					counter <= counter + 1;
				end
				82: begin
					bfly_di1 <= wr82;
					bfly_di2 <= wr173;
					i <= 82;
					wr81 <= bfly_do1;
					wr174 <= bfly_do2;
					counter <= counter + 1;
				end
				83: begin
					bfly_di1 <= wr83;
					bfly_di2 <= wr172;
					i <= 83;
					wr82 <= bfly_do1;
					wr173 <= bfly_do2;
					counter <= counter + 1;
				end
				84: begin
					bfly_di1 <= wr84;
					bfly_di2 <= wr171;
					i <= 84;
					wr83 <= bfly_do1;
					wr172 <= bfly_do2;
					counter <= counter + 1;
				end
				85: begin
					bfly_di1 <= wr85;
					bfly_di2 <= wr170;
					i <= 85;
					wr84 <= bfly_do1;
					wr171 <= bfly_do2;
					counter <= counter + 1;
				end
				86: begin
					bfly_di1 <= wr86;
					bfly_di2 <= wr169;
					i <= 86;
					wr85 <= bfly_do1;
					wr170 <= bfly_do2;
					counter <= counter + 1;
				end
				87: begin
					bfly_di1 <= wr87;
					bfly_di2 <= wr168;
					i <= 87;
					wr86 <= bfly_do1;
					wr169 <= bfly_do2;
					counter <= counter + 1;
				end
				88: begin
					bfly_di1 <= wr88;
					bfly_di2 <= wr167;
					i <= 88;
					wr87 <= bfly_do1;
					wr168 <= bfly_do2;
					counter <= counter + 1;
				end
				89: begin
					bfly_di1 <= wr89;
					bfly_di2 <= wr166;
					i <= 89;
					wr88 <= bfly_do1;
					wr167 <= bfly_do2;
					counter <= counter + 1;
				end
				90: begin
					bfly_di1 <= wr90;
					bfly_di2 <= wr165;
					i <= 90;
					wr89 <= bfly_do1;
					wr166 <= bfly_do2;
					counter <= counter + 1;
				end
				91: begin
					bfly_di1 <= wr91;
					bfly_di2 <= wr164;
					i <= 91;
					wr90 <= bfly_do1;
					wr165 <= bfly_do2;
					counter <= counter + 1;
				end
				92: begin
					bfly_di1 <= wr92;
					bfly_di2 <= wr163;
					i <= 92;
					wr91 <= bfly_do1;
					wr164 <= bfly_do2;
					counter <= counter + 1;
				end
				93: begin
					bfly_di1 <= wr93;
					bfly_di2 <= wr162;
					i <= 93;
					wr92 <= bfly_do1;
					wr163 <= bfly_do2;
					counter <= counter + 1;
				end
				94: begin
					bfly_di1 <= wr94;
					bfly_di2 <= wr161;
					i <= 94;
					wr93 <= bfly_do1;
					wr162 <= bfly_do2;
					counter <= counter + 1;
				end
				95: begin
					bfly_di1 <= wr95;
					bfly_di2 <= wr160;
					i <= 95;
					wr94 <= bfly_do1;
					wr161 <= bfly_do2;
					counter <= counter + 1;
				end
				96: begin
					bfly_di1 <= wr96;
					bfly_di2 <= wr159;
					i <= 96;
					wr95 <= bfly_do1;
					wr160 <= bfly_do2;
					counter <= counter + 1;
				end
				97: begin
					bfly_di1 <= wr97;
					bfly_di2 <= wr158;
					i <= 97;
					wr96 <= bfly_do1;
					wr159 <= bfly_do2;
					counter <= counter + 1;
				end
				98: begin
					bfly_di1 <= wr98;
					bfly_di2 <= wr157;
					i <= 98;
					wr97 <= bfly_do1;
					wr158 <= bfly_do2;
					counter <= counter + 1;
				end
				99: begin
					bfly_di1 <= wr99;
					bfly_di2 <= wr156;
					i <= 99;
					wr98 <= bfly_do1;
					wr157 <= bfly_do2;
					counter <= counter + 1;
				end
				100: begin
					bfly_di1 <= wr100;
					bfly_di2 <= wr155;
					i <= 100;
					wr99 <= bfly_do1;
					wr156 <= bfly_do2;
					counter <= counter + 1;
				end
				101: begin
					bfly_di1 <= wr101;
					bfly_di2 <= wr154;
					i <= 101;
					wr100 <= bfly_do1;
					wr155 <= bfly_do2;
					counter <= counter + 1;
				end
				102: begin
					bfly_di1 <= wr102;
					bfly_di2 <= wr153;
					i <= 102;
					wr101 <= bfly_do1;
					wr154 <= bfly_do2;
					counter <= counter + 1;
				end
				103: begin
					bfly_di1 <= wr103;
					bfly_di2 <= wr152;
					i <= 103;
					wr102 <= bfly_do1;
					wr153 <= bfly_do2;
					counter <= counter + 1;
				end
				104: begin
					bfly_di1 <= wr104;
					bfly_di2 <= wr151;
					i <= 104;
					wr103 <= bfly_do1;
					wr152 <= bfly_do2;
					counter <= counter + 1;
				end
				105: begin
					bfly_di1 <= wr105;
					bfly_di2 <= wr150;
					i <= 105;
					wr104 <= bfly_do1;
					wr151 <= bfly_do2;
					counter <= counter + 1;
				end
				106: begin
					bfly_di1 <= wr106;
					bfly_di2 <= wr149;
					i <= 106;
					wr105 <= bfly_do1;
					wr150 <= bfly_do2;
					counter <= counter + 1;
				end
				107: begin
					bfly_di1 <= wr107;
					bfly_di2 <= wr148;
					i <= 107;
					wr106 <= bfly_do1;
					wr149 <= bfly_do2;
					counter <= counter + 1;
				end
				108: begin
					bfly_di1 <= wr108;
					bfly_di2 <= wr147;
					i <= 108;
					wr107 <= bfly_do1;
					wr148 <= bfly_do2;
					counter <= counter + 1;
				end
				109: begin
					bfly_di1 <= wr109;
					bfly_di2 <= wr146;
					i <= 109;
					wr108 <= bfly_do1;
					wr147 <= bfly_do2;
					counter <= counter + 1;
				end
				110: begin
					bfly_di1 <= wr110;
					bfly_di2 <= wr145;
					i <= 110;
					wr109 <= bfly_do1;
					wr146 <= bfly_do2;
					counter <= counter + 1;
				end
				111: begin
					bfly_di1 <= wr111;
					bfly_di2 <= wr144;
					i <= 111;
					wr110 <= bfly_do1;
					wr145 <= bfly_do2;
					counter <= counter + 1;
				end
				112: begin
					bfly_di1 <= wr112;
					bfly_di2 <= wr143;
					i <= 112;
					wr111 <= bfly_do1;
					wr144 <= bfly_do2;
					counter <= counter + 1;
				end
				113: begin
					bfly_di1 <= wr113;
					bfly_di2 <= wr142;
					i <= 113;
					wr112 <= bfly_do1;
					wr143 <= bfly_do2;
					counter <= counter + 1;
				end
				114: begin
					bfly_di1 <= wr114;
					bfly_di2 <= wr141;
					i <= 114;
					wr113 <= bfly_do1;
					wr142 <= bfly_do2;
					counter <= counter + 1;
				end
				115: begin
					bfly_di1 <= wr115;
					bfly_di2 <= wr140;
					i <= 115;
					wr114 <= bfly_do1;
					wr141 <= bfly_do2;
					counter <= counter + 1;
				end
				116: begin
					bfly_di1 <= wr116;
					bfly_di2 <= wr139;
					i <= 116;
					wr115 <= bfly_do1;
					wr140 <= bfly_do2;
					counter <= counter + 1;
				end
				117: begin
					bfly_di1 <= wr117;
					bfly_di2 <= wr138;
					i <= 117;
					wr116 <= bfly_do1;
					wr139 <= bfly_do2;
					counter <= counter + 1;
				end
				118: begin
					bfly_di1 <= wr118;
					bfly_di2 <= wr137;
					i <= 118;
					wr117 <= bfly_do1;
					wr138 <= bfly_do2;
					counter <= counter + 1;
				end
				119: begin
					bfly_di1 <= wr119;
					bfly_di2 <= wr136;
					i <= 119;
					wr118 <= bfly_do1;
					wr137 <= bfly_do2;
					counter <= counter + 1;
				end
				120: begin
					bfly_di1 <= wr120;
					bfly_di2 <= wr135;
					i <= 120;
					wr119 <= bfly_do1;
					wr136 <= bfly_do2;
					counter <= counter + 1;
				end
				121: begin
					bfly_di1 <= wr121;
					bfly_di2 <= wr134;
					i <= 121;
					wr120 <= bfly_do1;
					wr135 <= bfly_do2;
					counter <= counter + 1;
				end
				122: begin
					bfly_di1 <= wr122;
					bfly_di2 <= wr133;
					i <= 122;
					wr121 <= bfly_do1;
					wr134 <= bfly_do2;
					counter <= counter + 1;
				end
				123: begin
					bfly_di1 <= wr123;
					bfly_di2 <= wr132;
					i <= 123;
					wr122 <= bfly_do1;
					wr133 <= bfly_do2;
					counter <= counter + 1;
				end
				124: begin
					bfly_di1 <= wr124;
					bfly_di2 <= wr131;
					i <= 124;
					wr123 <= bfly_do1;
					wr132 <= bfly_do2;
					counter <= counter + 1;
				end
				125: begin
					bfly_di1 <= wr125;
					bfly_di2 <= wr130;
					i <= 125;
					wr124 <= bfly_do1;
					wr131 <= bfly_do2;
					counter <= counter + 1;
				end
				126: begin
					bfly_di1 <= wr126;
					bfly_di2 <= wr129;
					i <= 126;
					wr125 <= bfly_do1;
					wr130 <= bfly_do2;
					counter <= counter + 1;
				end
				127: begin
					bfly_di1 <= wr127;
					bfly_di2 <= wr128;
					i <= 127;
					wr126 <= bfly_do1;
					wr129 <= bfly_do2;
					//counter <= counter + 1;
					layer <= 1;
					counter <= 0;
				end
			endcase
		end
		1: begin
			n <= 128;
			case(counter)
				0: begin
					//////////write wr127 later////////////////////
					bfly_di1 <= wr1;
					bfly_di2 <= wr126;
					i <= 1;
					wr127 <= bfly_do1;
					wr128 <= bfly_do2;
					counter <= counter + 1;
				end
				1: begin
					bfly_di1 <= wr0;
					bfly_di2 <= wr127;
					i <= 0;
					wr1 <= bfly_do1;
					wr126 <= bfly_do2;
					counter <= counter + 1;
				end
				2: begin
					bfly_di1 <= wr2;
					bfly_di2 <= wr125;
					i <= 2;
					wr0 <= bfly_do1;
					wr127 <= bfly_do2;
					counter <= counter + 1;
				end
				3: begin
					bfly_di1 <= wr3;
					bfly_di2 <= wr124;
					i <= 3;
					wr2 <= bfly_do1;
					wr125 <= bfly_do2;
					counter <= counter + 1;
				end
				4: begin
					bfly_di1 <= wr4;
					bfly_di2 <= wr123;
					i <= 4;
					wr3 <= bfly_do1;
					wr124 <= bfly_do2;
					counter <= counter + 1;
				end
				5: begin
					bfly_di1 <= wr5;
					bfly_di2 <= wr122;
					i <= 5;
					wr4 <= bfly_do1;
					wr123 <= bfly_do2;
					counter <= counter + 1;
				end
				6: begin
					bfly_di1 <= wr6;
					bfly_di2 <= wr121;
					i <= 6;
					wr5 <= bfly_do1;
					wr122 <= bfly_do2;
					counter <= counter + 1;
				end
				7: begin
					bfly_di1 <= wr7;
					bfly_di2 <= wr120;
					i <= 7;
					wr6 <= bfly_do1;
					wr121 <= bfly_do2;
					counter <= counter + 1;
				end
				8: begin
					bfly_di1 <= wr8;
					bfly_di2 <= wr119;
					i <= 8;
					wr7 <= bfly_do1;
					wr120 <= bfly_do2;
					counter <= counter + 1;
				end
				9: begin
					bfly_di1 <= wr9;
					bfly_di2 <= wr118;
					i <= 9;
					wr8 <= bfly_do1;
					wr119 <= bfly_do2;
					counter <= counter + 1;
				end
				10: begin
					bfly_di1 <= wr10;
					bfly_di2 <= wr117;
					i <= 10;
					wr9 <= bfly_do1;
					wr118 <= bfly_do2;
					counter <= counter + 1;
				end
				11: begin
					bfly_di1 <= wr11;
					bfly_di2 <= wr116;
					i <= 11;
					wr10 <= bfly_do1;
					wr117 <= bfly_do2;
					counter <= counter + 1;
				end
				12: begin
					bfly_di1 <= wr12;
					bfly_di2 <= wr115;
					i <= 12;
					wr11 <= bfly_do1;
					wr116 <= bfly_do2;
					counter <= counter + 1;
				end
				13: begin
					bfly_di1 <= wr13;
					bfly_di2 <= wr114;
					i <= 13;
					wr12 <= bfly_do1;
					wr115 <= bfly_do2;
					counter <= counter + 1;
				end
				14: begin
					bfly_di1 <= wr14;
					bfly_di2 <= wr113;
					i <= 14;
					wr13 <= bfly_do1;
					wr114 <= bfly_do2;
					counter <= counter + 1;
				end
				15: begin
					bfly_di1 <= wr15;
					bfly_di2 <= wr112;
					i <= 15;
					wr14 <= bfly_do1;
					wr113 <= bfly_do2;
					counter <= counter + 1;
				end
				16: begin
					bfly_di1 <= wr16;
					bfly_di2 <= wr111;
					i <= 16;
					wr15 <= bfly_do1;
					wr112 <= bfly_do2;
					counter <= counter + 1;
				end
				17: begin
					bfly_di1 <= wr17;
					bfly_di2 <= wr110;
					i <= 17;
					wr16 <= bfly_do1;
					wr111 <= bfly_do2;
					counter <= counter + 1;
				end
				18: begin
					bfly_di1 <= wr18;
					bfly_di2 <= wr109;
					i <= 18;
					wr17 <= bfly_do1;
					wr110 <= bfly_do2;
					counter <= counter + 1;
				end
				19: begin
					bfly_di1 <= wr19;
					bfly_di2 <= wr108;
					i <= 19;
					wr18 <= bfly_do1;
					wr109 <= bfly_do2;
					counter <= counter + 1;
				end
				20: begin
					bfly_di1 <= wr20;
					bfly_di2 <= wr107;
					i <= 20;
					wr19 <= bfly_do1;
					wr108 <= bfly_do2;
					counter <= counter + 1;
				end
				21: begin
					bfly_di1 <= wr21;
					bfly_di2 <= wr106;
					i <= 21;
					wr20 <= bfly_do1;
					wr107 <= bfly_do2;
					counter <= counter + 1;
				end
				22: begin
					bfly_di1 <= wr22;
					bfly_di2 <= wr105;
					i <= 22;
					wr21 <= bfly_do1;
					wr106 <= bfly_do2;
					counter <= counter + 1;
				end
				23: begin
					bfly_di1 <= wr23;
					bfly_di2 <= wr104;
					i <= 23;
					wr22 <= bfly_do1;
					wr105 <= bfly_do2;
					counter <= counter + 1;
				end
				24: begin
					bfly_di1 <= wr24;
					bfly_di2 <= wr103;
					i <= 24;
					wr23 <= bfly_do1;
					wr104 <= bfly_do2;
					counter <= counter + 1;
				end
				25: begin
					bfly_di1 <= wr25;
					bfly_di2 <= wr102;
					i <= 25;
					wr24 <= bfly_do1;
					wr103 <= bfly_do2;
					counter <= counter + 1;
				end
				26: begin
					bfly_di1 <= wr26;
					bfly_di2 <= wr101;
					i <= 26;
					wr25 <= bfly_do1;
					wr102 <= bfly_do2;
					counter <= counter + 1;
				end
				27: begin
					bfly_di1 <= wr27;
					bfly_di2 <= wr100;
					i <= 27;
					wr26 <= bfly_do1;
					wr101 <= bfly_do2;
					counter <= counter + 1;
				end
				28: begin
					bfly_di1 <= wr28;
					bfly_di2 <= wr99;
					i <= 28;
					wr27 <= bfly_do1;
					wr100 <= bfly_do2;
					counter <= counter + 1;
				end
				29: begin
					bfly_di1 <= wr29;
					bfly_di2 <= wr98;
					i <= 29;
					wr28 <= bfly_do1;
					wr99 <= bfly_do2;
					counter <= counter + 1;
				end
				30: begin
					bfly_di1 <= wr30;
					bfly_di2 <= wr97;
					i <= 30;
					wr29 <= bfly_do1;
					wr98 <= bfly_do2;
					counter <= counter + 1;
				end
				31: begin
					bfly_di1 <= wr31;
					bfly_di2 <= wr96;
					i <= 31;
					wr30 <= bfly_do1;
					wr97 <= bfly_do2;
					counter <= counter + 1;
				end
				32: begin
					bfly_di1 <= wr32;
					bfly_di2 <= wr95;
					i <= 32;
					wr31 <= bfly_do1;
					wr96 <= bfly_do2;
					counter <= counter + 1;
				end
				33: begin
					bfly_di1 <= wr33;
					bfly_di2 <= wr94;
					i <= 33;
					wr32 <= bfly_do1;
					wr95 <= bfly_do2;
					counter <= counter + 1;
				end
				34: begin
					bfly_di1 <= wr34;
					bfly_di2 <= wr93;
					i <= 34;
					wr33 <= bfly_do1;
					wr94 <= bfly_do2;
					counter <= counter + 1;
				end
				35: begin
					bfly_di1 <= wr35;
					bfly_di2 <= wr92;
					i <= 35;
					wr34 <= bfly_do1;
					wr93 <= bfly_do2;
					counter <= counter + 1;
				end
				36: begin
					bfly_di1 <= wr36;
					bfly_di2 <= wr91;
					i <= 36;
					wr35 <= bfly_do1;
					wr92 <= bfly_do2;
					counter <= counter + 1;
				end
				37: begin
					bfly_di1 <= wr37;
					bfly_di2 <= wr90;
					i <= 37;
					wr36 <= bfly_do1;
					wr91 <= bfly_do2;
					counter <= counter + 1;
				end
				38: begin
					bfly_di1 <= wr38;
					bfly_di2 <= wr89;
					i <= 38;
					wr37 <= bfly_do1;
					wr90 <= bfly_do2;
					counter <= counter + 1;
				end
				39: begin
					bfly_di1 <= wr39;
					bfly_di2 <= wr88;
					i <= 39;
					wr38 <= bfly_do1;
					wr89 <= bfly_do2;
					counter <= counter + 1;
				end
				40: begin
					bfly_di1 <= wr40;
					bfly_di2 <= wr87;
					i <= 40;
					wr39 <= bfly_do1;
					wr88 <= bfly_do2;
					counter <= counter + 1;
				end
				41: begin
					bfly_di1 <= wr41;
					bfly_di2 <= wr86;
					i <= 41;
					wr40 <= bfly_do1;
					wr87 <= bfly_do2;
					counter <= counter + 1;
				end
				42: begin
					bfly_di1 <= wr42;
					bfly_di2 <= wr85;
					i <= 42;
					wr41 <= bfly_do1;
					wr86 <= bfly_do2;
					counter <= counter + 1;
				end
				43: begin
					bfly_di1 <= wr43;
					bfly_di2 <= wr84;
					i <= 43;
					wr42 <= bfly_do1;
					wr85 <= bfly_do2;
					counter <= counter + 1;
				end
				44: begin
					bfly_di1 <= wr44;
					bfly_di2 <= wr83;
					i <= 44;
					wr43 <= bfly_do1;
					wr84 <= bfly_do2;
					counter <= counter + 1;
				end
				45: begin
					bfly_di1 <= wr45;
					bfly_di2 <= wr82;
					i <= 45;
					wr44 <= bfly_do1;
					wr83 <= bfly_do2;
					counter <= counter + 1;
				end
				46: begin
					bfly_di1 <= wr46;
					bfly_di2 <= wr81;
					i <= 46;
					wr45 <= bfly_do1;
					wr82 <= bfly_do2;
					counter <= counter + 1;
				end
				47: begin
					bfly_di1 <= wr47;
					bfly_di2 <= wr80;
					i <= 47;
					wr46 <= bfly_do1;
					wr81 <= bfly_do2;
					counter <= counter + 1;
				end
				48: begin
					bfly_di1 <= wr48;
					bfly_di2 <= wr79;
					i <= 48;
					wr47 <= bfly_do1;
					wr80 <= bfly_do2;
					counter <= counter + 1;
				end
				49: begin
					bfly_di1 <= wr49;
					bfly_di2 <= wr78;
					i <= 49;
					wr48 <= bfly_do1;
					wr79 <= bfly_do2;
					counter <= counter + 1;
				end
				50: begin
					bfly_di1 <= wr50;
					bfly_di2 <= wr77;
					i <= 50;
					wr49 <= bfly_do1;
					wr78 <= bfly_do2;
					counter <= counter + 1;
				end
				51: begin
					bfly_di1 <= wr51;
					bfly_di2 <= wr76;
					i <= 51;
					wr50 <= bfly_do1;
					wr77 <= bfly_do2;
					counter <= counter + 1;
				end
				52: begin
					bfly_di1 <= wr52;
					bfly_di2 <= wr75;
					i <= 52;
					wr51 <= bfly_do1;
					wr76 <= bfly_do2;
					counter <= counter + 1;
				end
				53: begin
					bfly_di1 <= wr53;
					bfly_di2 <= wr74;
					i <= 53;
					wr52 <= bfly_do1;
					wr75 <= bfly_do2;
					counter <= counter + 1;
				end
				54: begin
					bfly_di1 <= wr54;
					bfly_di2 <= wr73;
					i <= 54;
					wr53 <= bfly_do1;
					wr74 <= bfly_do2;
					counter <= counter + 1;
				end
				55: begin
					bfly_di1 <= wr55;
					bfly_di2 <= wr72;
					i <= 55;
					wr54 <= bfly_do1;
					wr73 <= bfly_do2;
					counter <= counter + 1;
				end
				56: begin
					bfly_di1 <= wr56;
					bfly_di2 <= wr71;
					i <= 56;
					wr55 <= bfly_do1;
					wr72 <= bfly_do2;
					counter <= counter + 1;
				end
				57: begin
					bfly_di1 <= wr57;
					bfly_di2 <= wr70;
					i <= 57;
					wr56 <= bfly_do1;
					wr71 <= bfly_do2;
					counter <= counter + 1;
				end
				58: begin
					bfly_di1 <= wr58;
					bfly_di2 <= wr69;
					i <= 58;
					wr57 <= bfly_do1;
					wr70 <= bfly_do2;
					counter <= counter + 1;
				end
				59: begin
					bfly_di1 <= wr59;
					bfly_di2 <= wr68;
					i <= 59;
					wr58 <= bfly_do1;
					wr69 <= bfly_do2;
					counter <= counter + 1;
				end
				60: begin
					bfly_di1 <= wr60;
					bfly_di2 <= wr67;
					i <= 60;
					wr59 <= bfly_do1;
					wr68 <= bfly_do2;
					counter <= counter + 1;
				end
				61: begin
					bfly_di1 <= wr61;
					bfly_di2 <= wr66;
					i <= 61;
					wr60 <= bfly_do1;
					wr67 <= bfly_do2;
					counter <= counter + 1;
				end
				62: begin
					bfly_di1 <= wr62;
					bfly_di2 <= wr65;
					i <= 62;
					wr61 <= bfly_do1;
					wr66 <= bfly_do2;
					counter <= counter + 1;
				end
				63: begin
					bfly_di1 <= wr63;
					bfly_di2 <= wr64;
					i <= 63;
					wr62 <= bfly_do1;
					wr65 <= bfly_do2;
					counter <= counter + 1;
				end
				64: begin
					bfly_di1 <= wr255;
					bfly_di2 <= wr128;
					i <= 0;
					wr63 <= bfly_do1;
					wr64 <= bfly_do2;
					counter <= counter + 1;
				end
				65: begin
					bfly_di1 <= wr254;
					bfly_di2 <= wr129;
					i <= 1;
					wr128 <= bfly_do1;
					wr255 <= bfly_do2;
					counter <= counter + 1;
				end
				66: begin
					bfly_di1 <= wr253;
					bfly_di2 <= wr130;
					i <= 2;
					wr129 <= bfly_do1;
					wr254 <= bfly_do2;
					counter <= counter + 1;
				end
				67: begin
					bfly_di1 <= wr252;
					bfly_di2 <= wr131;
					i <= 3;
					wr130 <= bfly_do1;
					wr253 <= bfly_do2;
					counter <= counter + 1;
				end
				68: begin
					bfly_di1 <= wr251;
					bfly_di2 <= wr132;
					i <= 4;
					wr131 <= bfly_do1;
					wr252 <= bfly_do2;
					counter <= counter + 1;
				end
				69: begin
					bfly_di1 <= wr250;
					bfly_di2 <= wr133;
					i <= 5;
					wr132 <= bfly_do1;
					wr251 <= bfly_do2;
					counter <= counter + 1;
				end
				70: begin
					bfly_di1 <= wr249;
					bfly_di2 <= wr134;
					i <= 6;
					wr133 <= bfly_do1;
					wr250 <= bfly_do2;
					counter <= counter + 1;
				end
				71: begin
					bfly_di1 <= wr248;
					bfly_di2 <= wr135;
					i <= 7;
					wr134 <= bfly_do1;
					wr249 <= bfly_do2;
					counter <= counter + 1;
				end
				72: begin
					bfly_di1 <= wr247;
					bfly_di2 <= wr136;
					i <= 8;
					wr135 <= bfly_do1;
					wr248 <= bfly_do2;
					counter <= counter + 1;
				end
				73: begin
					bfly_di1 <= wr246;
					bfly_di2 <= wr137;
					i <= 9;
					wr136 <= bfly_do1;
					wr247 <= bfly_do2;
					counter <= counter + 1;
				end
				74: begin
					bfly_di1 <= wr245;
					bfly_di2 <= wr138;
					i <= 10;
					wr137 <= bfly_do1;
					wr246 <= bfly_do2;
					counter <= counter + 1;
				end
				75: begin
					bfly_di1 <= wr244;
					bfly_di2 <= wr139;
					i <= 11;
					wr138 <= bfly_do1;
					wr245 <= bfly_do2;
					counter <= counter + 1;
				end
				76: begin
					bfly_di1 <= wr243;
					bfly_di2 <= wr140;
					i <= 12;
					wr139 <= bfly_do1;
					wr244 <= bfly_do2;
					counter <= counter + 1;
				end
				77: begin
					bfly_di1 <= wr242;
					bfly_di2 <= wr141;
					i <= 13;
					wr140 <= bfly_do1;
					wr243 <= bfly_do2;
					counter <= counter + 1;
				end
				78: begin
					bfly_di1 <= wr241;
					bfly_di2 <= wr142;
					i <= 14;
					wr141 <= bfly_do1;
					wr242 <= bfly_do2;
					counter <= counter + 1;
				end
				79: begin
					bfly_di1 <= wr240;
					bfly_di2 <= wr143;
					i <= 15;
					wr142 <= bfly_do1;
					wr241 <= bfly_do2;
					counter <= counter + 1;
				end
				80: begin
					bfly_di1 <= wr239;
					bfly_di2 <= wr144;
					i <= 16;
					wr143 <= bfly_do1;
					wr240 <= bfly_do2;
					counter <= counter + 1;
				end
				81: begin
					bfly_di1 <= wr238;
					bfly_di2 <= wr145;
					i <= 17;
					wr144 <= bfly_do1;
					wr239 <= bfly_do2;
					counter <= counter + 1;
				end
				82: begin
					bfly_di1 <= wr237;
					bfly_di2 <= wr146;
					i <= 18;
					wr145 <= bfly_do1;
					wr238 <= bfly_do2;
					counter <= counter + 1;
				end
				83: begin
					bfly_di1 <= wr236;
					bfly_di2 <= wr147;
					i <= 19;
					wr146 <= bfly_do1;
					wr237 <= bfly_do2;
					counter <= counter + 1;
				end
				84: begin
					bfly_di1 <= wr235;
					bfly_di2 <= wr148;
					i <= 20;
					wr147 <= bfly_do1;
					wr236 <= bfly_do2;
					counter <= counter + 1;
				end
				85: begin
					bfly_di1 <= wr234;
					bfly_di2 <= wr149;
					i <= 21;
					wr148 <= bfly_do1;
					wr235 <= bfly_do2;
					counter <= counter + 1;
				end
				86: begin
					bfly_di1 <= wr233;
					bfly_di2 <= wr150;
					i <= 22;
					wr149 <= bfly_do1;
					wr234 <= bfly_do2;
					counter <= counter + 1;
				end
				87: begin
					bfly_di1 <= wr232;
					bfly_di2 <= wr151;
					i <= 23;
					wr150 <= bfly_do1;
					wr233 <= bfly_do2;
					counter <= counter + 1;
				end
				88: begin
					bfly_di1 <= wr231;
					bfly_di2 <= wr152;
					i <= 24;
					wr151 <= bfly_do1;
					wr232 <= bfly_do2;
					counter <= counter + 1;
				end
				89: begin
					bfly_di1 <= wr230;
					bfly_di2 <= wr153;
					i <= 25;
					wr152 <= bfly_do1;
					wr231 <= bfly_do2;
					counter <= counter + 1;
				end
				90: begin
					bfly_di1 <= wr229;
					bfly_di2 <= wr154;
					i <= 26;
					wr153 <= bfly_do1;
					wr230 <= bfly_do2;
					counter <= counter + 1;
				end
				91: begin
					bfly_di1 <= wr228;
					bfly_di2 <= wr155;
					i <= 27;
					wr154 <= bfly_do1;
					wr229 <= bfly_do2;
					counter <= counter + 1;
				end
				92: begin
					bfly_di1 <= wr227;
					bfly_di2 <= wr156;
					i <= 28;
					wr155 <= bfly_do1;
					wr228 <= bfly_do2;
					counter <= counter + 1;
				end
				93: begin
					bfly_di1 <= wr226;
					bfly_di2 <= wr157;
					i <= 29;
					wr156 <= bfly_do1;
					wr227 <= bfly_do2;
					counter <= counter + 1;
				end
				94: begin
					bfly_di1 <= wr225;
					bfly_di2 <= wr158;
					i <= 30;
					wr157 <= bfly_do1;
					wr226 <= bfly_do2;
					counter <= counter + 1;
				end
				95: begin
					bfly_di1 <= wr224;
					bfly_di2 <= wr159;
					i <= 31;
					wr158 <= bfly_do1;
					wr225 <= bfly_do2;
					counter <= counter + 1;
				end
				96: begin
					bfly_di1 <= wr223;
					bfly_di2 <= wr160;
					i <= 32;
					wr159 <= bfly_do1;
					wr224 <= bfly_do2;
					counter <= counter + 1;
				end
				97: begin
					bfly_di1 <= wr222;
					bfly_di2 <= wr161;
					i <= 33;
					wr160 <= bfly_do1;
					wr223 <= bfly_do2;
					counter <= counter + 1;
				end
				98: begin
					bfly_di1 <= wr221;
					bfly_di2 <= wr162;
					i <= 34;
					wr161 <= bfly_do1;
					wr222 <= bfly_do2;
					counter <= counter + 1;
				end
				99: begin
					bfly_di1 <= wr220;
					bfly_di2 <= wr163;
					i <= 35;
					wr162 <= bfly_do1;
					wr221 <= bfly_do2;
					counter <= counter + 1;
				end
				100: begin
					bfly_di1 <= wr219;
					bfly_di2 <= wr164;
					i <= 36;
					wr163 <= bfly_do1;
					wr220 <= bfly_do2;
					counter <= counter + 1;
				end
				101: begin
					bfly_di1 <= wr218;
					bfly_di2 <= wr165;
					i <= 37;
					wr164 <= bfly_do1;
					wr219 <= bfly_do2;
					counter <= counter + 1;
				end
				102: begin
					bfly_di1 <= wr217;
					bfly_di2 <= wr166;
					i <= 38;
					wr165 <= bfly_do1;
					wr218 <= bfly_do2;
					counter <= counter + 1;
				end
				103: begin
					bfly_di1 <= wr216;
					bfly_di2 <= wr167;
					i <= 39;
					wr166 <= bfly_do1;
					wr217 <= bfly_do2;
					counter <= counter + 1;
				end
				104: begin
					bfly_di1 <= wr215;
					bfly_di2 <= wr168;
					i <= 40;
					wr167 <= bfly_do1;
					wr216 <= bfly_do2;
					counter <= counter + 1;
				end
				105: begin
					bfly_di1 <= wr214;
					bfly_di2 <= wr169;
					i <= 41;
					wr168 <= bfly_do1;
					wr215 <= bfly_do2;
					counter <= counter + 1;
				end
				106: begin
					bfly_di1 <= wr213;
					bfly_di2 <= wr170;
					i <= 42;
					wr169 <= bfly_do1;
					wr214 <= bfly_do2;
					counter <= counter + 1;
				end
				107: begin
					bfly_di1 <= wr212;
					bfly_di2 <= wr171;
					i <= 43;
					wr170 <= bfly_do1;
					wr213 <= bfly_do2;
					counter <= counter + 1;
				end
				108: begin
					bfly_di1 <= wr211;
					bfly_di2 <= wr172;
					i <= 44;
					wr171 <= bfly_do1;
					wr212 <= bfly_do2;
					counter <= counter + 1;
				end
				109: begin
					bfly_di1 <= wr210;
					bfly_di2 <= wr173;
					i <= 45;
					wr172 <= bfly_do1;
					wr211 <= bfly_do2;
					counter <= counter + 1;
				end
				110: begin
					bfly_di1 <= wr209;
					bfly_di2 <= wr174;
					i <= 46;
					wr173 <= bfly_do1;
					wr210 <= bfly_do2;
					counter <= counter + 1;
				end
				111: begin
					bfly_di1 <= wr208;
					bfly_di2 <= wr175;
					i <= 47;
					wr174 <= bfly_do1;
					wr209 <= bfly_do2;
					counter <= counter + 1;
				end
				112: begin
					bfly_di1 <= wr207;
					bfly_di2 <= wr176;
					i <= 48;
					wr175 <= bfly_do1;
					wr208 <= bfly_do2;
					counter <= counter + 1;
				end
				113: begin
					bfly_di1 <= wr206;
					bfly_di2 <= wr177;
					i <= 49;
					wr176 <= bfly_do1;
					wr207 <= bfly_do2;
					counter <= counter + 1;
				end
				114: begin
					bfly_di1 <= wr205;
					bfly_di2 <= wr178;
					i <= 50;
					wr177 <= bfly_do1;
					wr206 <= bfly_do2;
					counter <= counter + 1;
				end
				115: begin
					bfly_di1 <= wr204;
					bfly_di2 <= wr179;
					i <= 51;
					wr178 <= bfly_do1;
					wr205 <= bfly_do2;
					counter <= counter + 1;
				end
				116: begin
					bfly_di1 <= wr203;
					bfly_di2 <= wr180;
					i <= 52;
					wr179 <= bfly_do1;
					wr204 <= bfly_do2;
					counter <= counter + 1;
				end
				117: begin
					bfly_di1 <= wr202;
					bfly_di2 <= wr181;
					i <= 53;
					wr180 <= bfly_do1;
					wr203 <= bfly_do2;
					counter <= counter + 1;
				end
				118: begin
					bfly_di1 <= wr201;
					bfly_di2 <= wr182;
					i <= 54;
					wr181 <= bfly_do1;
					wr202 <= bfly_do2;
					counter <= counter + 1;
				end
				119: begin
					bfly_di1 <= wr200;
					bfly_di2 <= wr183;
					i <= 55;
					wr182 <= bfly_do1;
					wr201 <= bfly_do2;
					counter <= counter + 1;
				end
				120: begin
					bfly_di1 <= wr199;
					bfly_di2 <= wr184;
					i <= 56;
					wr183 <= bfly_do1;
					wr200 <= bfly_do2;
					counter <= counter + 1;
				end
				121: begin
					bfly_di1 <= wr198;
					bfly_di2 <= wr185;
					i <= 57;
					wr184 <= bfly_do1;
					wr199 <= bfly_do2;
					counter <= counter + 1;
				end
				122: begin
					bfly_di1 <= wr197;
					bfly_di2 <= wr186;
					i <= 58;
					wr185 <= bfly_do1;
					wr198 <= bfly_do2;
					counter <= counter + 1;
				end
				123: begin
					bfly_di1 <= wr196;
					bfly_di2 <= wr187;
					i <= 59;
					wr186 <= bfly_do1;
					wr197 <= bfly_do2;
					counter <= counter + 1;
				end
				124: begin
					bfly_di1 <= wr195;
					bfly_di2 <= wr188;
					i <= 60;
					wr187 <= bfly_do1;
					wr196 <= bfly_do2;
					counter <= counter + 1;
				end
				125: begin
					bfly_di1 <= wr194;
					bfly_di2 <= wr189;
					i <= 61;
					wr188 <= bfly_do1;
					wr195 <= bfly_do2;
					counter <= counter + 1;
				end
				126: begin
					bfly_di1 <= wr193;
					bfly_di2 <= wr190;
					i <= 62;
					wr189 <= bfly_do1;
					wr194 <= bfly_do2;
					counter <= counter + 1;
				end
				127: begin
					bfly_di1 <= wr192;
					bfly_di2 <= wr191;
					i <= 63;
					wr190 <= bfly_do1;
					wr193 <= bfly_do2;
					//counter <= counter + 1;
					layer <= 2;
					counter <= 0;
				end
			endcase
		end
		2: begin
			n <= 64;
			case(counter)
				0: begin
					bfly_di1 <= wr0;
					bfly_di2 <= wr63;
					i <= 0;
					wr191 <= bfly_do1;
					wr192 <= bfly_do2;
					counter <= counter + 1;
				end
				1: begin
					bfly_di1 <= wr1;
					bfly_di2 <= wr62;
					i <= 1;
					wr0 <= bfly_do1;
					wr63 <= bfly_do2;
					counter <= counter + 1;
				end
				2: begin
					bfly_di1 <= wr2;
					bfly_di2 <= wr61;
					i <= 2;
					wr1 <= bfly_do1;
					wr62 <= bfly_do2;
					counter <= counter + 1;
				end
				3: begin
					bfly_di1 <= wr3;
					bfly_di2 <= wr60;
					i <= 3;
					wr2 <= bfly_do1;
					wr61 <= bfly_do2;
					counter <= counter + 1;
				end
				4: begin
					bfly_di1 <= wr4;
					bfly_di2 <= wr59;
					i <= 4;
					wr3 <= bfly_do1;
					wr60 <= bfly_do2;
					counter <= counter + 1;
				end
				5: begin
					bfly_di1 <= wr5;
					bfly_di2 <= wr58;
					i <= 5;
					wr4 <= bfly_do1;
					wr59 <= bfly_do2;
					counter <= counter + 1;
				end
				6: begin
					bfly_di1 <= wr6;
					bfly_di2 <= wr57;
					i <= 6;
					wr5 <= bfly_do1;
					wr58 <= bfly_do2;
					counter <= counter + 1;
				end
				7: begin
					bfly_di1 <= wr7;
					bfly_di2 <= wr56;
					i <= 7;
					wr6 <= bfly_do1;
					wr57 <= bfly_do2;
					counter <= counter + 1;
				end
				8: begin
					bfly_di1 <= wr8;
					bfly_di2 <= wr55;
					i <= 8;
					wr7 <= bfly_do1;
					wr56 <= bfly_do2;
					counter <= counter + 1;
				end
				9: begin
					bfly_di1 <= wr9;
					bfly_di2 <= wr54;
					i <= 9;
					wr8 <= bfly_do1;
					wr55 <= bfly_do2;
					counter <= counter + 1;
				end
				10: begin
					bfly_di1 <= wr10;
					bfly_di2 <= wr53;
					i <= 10;
					wr9 <= bfly_do1;
					wr54 <= bfly_do2;
					counter <= counter + 1;
				end
				11: begin
					bfly_di1 <= wr11;
					bfly_di2 <= wr52;
					i <= 11;
					wr10 <= bfly_do1;
					wr53 <= bfly_do2;
					counter <= counter + 1;
				end
				12: begin
					bfly_di1 <= wr12;
					bfly_di2 <= wr51;
					i <= 12;
					wr11 <= bfly_do1;
					wr52 <= bfly_do2;
					counter <= counter + 1;
				end
				13: begin
					bfly_di1 <= wr13;
					bfly_di2 <= wr50;
					i <= 13;
					wr12 <= bfly_do1;
					wr51 <= bfly_do2;
					counter <= counter + 1;
				end
				14: begin
					bfly_di1 <= wr14;
					bfly_di2 <= wr49;
					i <= 14;
					wr13 <= bfly_do1;
					wr50 <= bfly_do2;
					counter <= counter + 1;
				end
				15: begin
					bfly_di1 <= wr15;
					bfly_di2 <= wr48;
					i <= 15;
					wr14 <= bfly_do1;
					wr49 <= bfly_do2;
					counter <= counter + 1;
				end
				16: begin
					bfly_di1 <= wr16;
					bfly_di2 <= wr47;
					i <= 16;
					wr15 <= bfly_do1;
					wr48 <= bfly_do2;
					counter <= counter + 1;
				end
				17: begin
					bfly_di1 <= wr17;
					bfly_di2 <= wr46;
					i <= 17;
					wr16 <= bfly_do1;
					wr47 <= bfly_do2;
					counter <= counter + 1;
				end
				18: begin
					bfly_di1 <= wr18;
					bfly_di2 <= wr45;
					i <= 18;
					wr17 <= bfly_do1;
					wr46 <= bfly_do2;
					counter <= counter + 1;
				end
				19: begin
					bfly_di1 <= wr19;
					bfly_di2 <= wr44;
					i <= 19;
					wr18 <= bfly_do1;
					wr45 <= bfly_do2;
					counter <= counter + 1;
				end
				20: begin
					bfly_di1 <= wr20;
					bfly_di2 <= wr43;
					i <= 20;
					wr19 <= bfly_do1;
					wr44 <= bfly_do2;
					counter <= counter + 1;
				end
				21: begin
					bfly_di1 <= wr21;
					bfly_di2 <= wr42;
					i <= 21;
					wr20 <= bfly_do1;
					wr43 <= bfly_do2;
					counter <= counter + 1;
				end
				22: begin
					bfly_di1 <= wr22;
					bfly_di2 <= wr41;
					i <= 22;
					wr21 <= bfly_do1;
					wr42 <= bfly_do2;
					counter <= counter + 1;
				end
				23: begin
					bfly_di1 <= wr23;
					bfly_di2 <= wr40;
					i <= 23;
					wr22 <= bfly_do1;
					wr41 <= bfly_do2;
					counter <= counter + 1;
				end
				24: begin
					bfly_di1 <= wr24;
					bfly_di2 <= wr39;
					i <= 24;
					wr23 <= bfly_do1;
					wr40 <= bfly_do2;
					counter <= counter + 1;
				end
				25: begin
					bfly_di1 <= wr25;
					bfly_di2 <= wr38;
					i <= 25;
					wr24 <= bfly_do1;
					wr39 <= bfly_do2;
					counter <= counter + 1;
				end
				26: begin
					bfly_di1 <= wr26;
					bfly_di2 <= wr37;
					i <= 26;
					wr25 <= bfly_do1;
					wr38 <= bfly_do2;
					counter <= counter + 1;
				end
				27: begin
					bfly_di1 <= wr27;
					bfly_di2 <= wr36;
					i <= 27;
					wr26 <= bfly_do1;
					wr37 <= bfly_do2;
					counter <= counter + 1;
				end
				28: begin
					bfly_di1 <= wr28;
					bfly_di2 <= wr35;
					i <= 28;
					wr27 <= bfly_do1;
					wr36 <= bfly_do2;
					counter <= counter + 1;
				end
				29: begin
					bfly_di1 <= wr29;
					bfly_di2 <= wr34;
					i <= 29;
					wr28 <= bfly_do1;
					wr35 <= bfly_do2;
					counter <= counter + 1;
				end
				30: begin
					bfly_di1 <= wr30;
					bfly_di2 <= wr33;
					i <= 30;
					wr29 <= bfly_do1;
					wr34 <= bfly_do2;
					counter <= counter + 1;
				end
				31: begin
					bfly_di1 <= wr31;
					bfly_di2 <= wr32;
					i <= 31;
					wr30 <= bfly_do1;
					wr33 <= bfly_do2;
					counter <= counter + 1;
				end
				32: begin
					bfly_di1 <= wr127;
					bfly_di2 <= wr64;
					i <= 0;
					wr31 <= bfly_do1;
					wr32 <= bfly_do2;
					counter <= counter + 1;
				end
				33: begin
					bfly_di1 <= wr126;
					bfly_di2 <= wr65;
					i <= 1;
					wr64 <= bfly_do1;
					wr127 <= bfly_do2;
					counter <= counter + 1;
				end
				34: begin
					bfly_di1 <= wr125;
					bfly_di2 <= wr66;
					i <= 2;
					wr65 <= bfly_do1;
					wr126 <= bfly_do2;
					counter <= counter + 1;
				end
				35: begin
					bfly_di1 <= wr124;
					bfly_di2 <= wr67;
					i <= 3;
					wr66 <= bfly_do1;
					wr125 <= bfly_do2;
					counter <= counter + 1;
				end
				36: begin
					bfly_di1 <= wr123;
					bfly_di2 <= wr68;
					i <= 4;
					wr67 <= bfly_do1;
					wr124 <= bfly_do2;
					counter <= counter + 1;
				end
				37: begin
					bfly_di1 <= wr122;
					bfly_di2 <= wr69;
					i <= 5;
					wr68 <= bfly_do1;
					wr123 <= bfly_do2;
					counter <= counter + 1;
				end
				38: begin
					bfly_di1 <= wr121;
					bfly_di2 <= wr70;
					i <= 6;
					wr69 <= bfly_do1;
					wr122 <= bfly_do2;
					counter <= counter + 1;
				end
				39: begin
					bfly_di1 <= wr120;
					bfly_di2 <= wr71;
					i <= 7;
					wr70 <= bfly_do1;
					wr121 <= bfly_do2;
					counter <= counter + 1;
				end
				40: begin
					bfly_di1 <= wr119;
					bfly_di2 <= wr72;
					i <= 8;
					wr71 <= bfly_do1;
					wr120 <= bfly_do2;
					counter <= counter + 1;
				end
				41: begin
					bfly_di1 <= wr118;
					bfly_di2 <= wr73;
					i <= 9;
					wr72 <= bfly_do1;
					wr119 <= bfly_do2;
					counter <= counter + 1;
				end
				42: begin
					bfly_di1 <= wr117;
					bfly_di2 <= wr74;
					i <= 10;
					wr73 <= bfly_do1;
					wr118 <= bfly_do2;
					counter <= counter + 1;
				end
				43: begin
					bfly_di1 <= wr116;
					bfly_di2 <= wr75;
					i <= 11;
					wr74 <= bfly_do1;
					wr117 <= bfly_do2;
					counter <= counter + 1;
				end
				44: begin
					bfly_di1 <= wr115;
					bfly_di2 <= wr76;
					i <= 12;
					wr75 <= bfly_do1;
					wr116 <= bfly_do2;
					counter <= counter + 1;
				end
				45: begin
					bfly_di1 <= wr114;
					bfly_di2 <= wr77;
					i <= 13;
					wr76 <= bfly_do1;
					wr115 <= bfly_do2;
					counter <= counter + 1;
				end
				46: begin
					bfly_di1 <= wr113;
					bfly_di2 <= wr78;
					i <= 14;
					wr77 <= bfly_do1;
					wr114 <= bfly_do2;
					counter <= counter + 1;
				end
				47: begin
					bfly_di1 <= wr112;
					bfly_di2 <= wr79;
					i <= 15;
					wr78 <= bfly_do1;
					wr113 <= bfly_do2;
					counter <= counter + 1;
				end
				48: begin
					bfly_di1 <= wr111;
					bfly_di2 <= wr80;
					i <= 16;
					wr79 <= bfly_do1;
					wr112 <= bfly_do2;
					counter <= counter + 1;
				end
				49: begin
					bfly_di1 <= wr110;
					bfly_di2 <= wr81;
					i <= 17;
					wr80 <= bfly_do1;
					wr111 <= bfly_do2;
					counter <= counter + 1;
				end
				50: begin
					bfly_di1 <= wr109;
					bfly_di2 <= wr82;
					i <= 18;
					wr81 <= bfly_do1;
					wr110 <= bfly_do2;
					counter <= counter + 1;
				end
				51: begin
					bfly_di1 <= wr108;
					bfly_di2 <= wr83;
					i <= 19;
					wr82 <= bfly_do1;
					wr109 <= bfly_do2;
					counter <= counter + 1;
				end
				52: begin
					bfly_di1 <= wr107;
					bfly_di2 <= wr84;
					i <= 20;
					wr83 <= bfly_do1;
					wr108 <= bfly_do2;
					counter <= counter + 1;
				end
				53: begin
					bfly_di1 <= wr106;
					bfly_di2 <= wr85;
					i <= 21;
					wr84 <= bfly_do1;
					wr107 <= bfly_do2;
					counter <= counter + 1;
				end
				54: begin
					bfly_di1 <= wr105;
					bfly_di2 <= wr86;
					i <= 22;
					wr85 <= bfly_do1;
					wr106 <= bfly_do2;
					counter <= counter + 1;
				end
				55: begin
					bfly_di1 <= wr104;
					bfly_di2 <= wr87;
					i <= 23;
					wr86 <= bfly_do1;
					wr105 <= bfly_do2;
					counter <= counter + 1;
				end
				56: begin
					bfly_di1 <= wr103;
					bfly_di2 <= wr88;
					i <= 24;
					wr87 <= bfly_do1;
					wr104 <= bfly_do2;
					counter <= counter + 1;
				end
				57: begin
					bfly_di1 <= wr102;
					bfly_di2 <= wr89;
					i <= 25;
					wr88 <= bfly_do1;
					wr103 <= bfly_do2;
					counter <= counter + 1;
				end
				58: begin
					bfly_di1 <= wr101;
					bfly_di2 <= wr90;
					i <= 26;
					wr89 <= bfly_do1;
					wr102 <= bfly_do2;
					counter <= counter + 1;
				end
				59: begin
					bfly_di1 <= wr100;
					bfly_di2 <= wr91;
					i <= 27;
					wr90 <= bfly_do1;
					wr101 <= bfly_do2;
					counter <= counter + 1;
				end
				60: begin
					bfly_di1 <= wr99;
					bfly_di2 <= wr92;
					i <= 28;
					wr91 <= bfly_do1;
					wr100 <= bfly_do2;
					counter <= counter + 1;
				end
				61: begin
					bfly_di1 <= wr98;
					bfly_di2 <= wr93;
					i <= 29;
					wr92 <= bfly_do1;
					wr99 <= bfly_do2;
					counter <= counter + 1;
				end
				62: begin
					bfly_di1 <= wr97;
					bfly_di2 <= wr94;
					i <= 30;
					wr93 <= bfly_do1;
					wr98 <= bfly_do2;
					counter <= counter + 1;
				end
				63: begin
					bfly_di1 <= wr96;
					bfly_di2 <= wr95;
					i <= 31;
					wr94 <= bfly_do1;
					wr97 <= bfly_do2;
					counter <= counter + 1;
				end
				64: begin
					bfly_di1 <= wr128;
					bfly_di2 <= wr191;
					i <= 0;
					wr95 <= bfly_do1;
					wr96 <= bfly_do2;
					counter <= counter + 1;
				end
				65: begin
					bfly_di1 <= wr129;
					bfly_di2 <= wr190;
					i <= 1;
					wr128 <= bfly_do1;
					wr191 <= bfly_do2;
					counter <= counter + 1;
				end
				66: begin
					bfly_di1 <= wr130;
					bfly_di2 <= wr189;
					i <= 2;
					wr129 <= bfly_do1;
					wr190 <= bfly_do2;
					counter <= counter + 1;
				end
				67: begin
					bfly_di1 <= wr131;
					bfly_di2 <= wr188;
					i <= 3;
					wr130 <= bfly_do1;
					wr189 <= bfly_do2;
					counter <= counter + 1;
				end
				68: begin
					bfly_di1 <= wr132;
					bfly_di2 <= wr187;
					i <= 4;
					wr131 <= bfly_do1;
					wr188 <= bfly_do2;
					counter <= counter + 1;
				end
				69: begin
					bfly_di1 <= wr133;
					bfly_di2 <= wr186;
					i <= 5;
					wr132 <= bfly_do1;
					wr187 <= bfly_do2;
					counter <= counter + 1;
				end
				70: begin
					bfly_di1 <= wr134;
					bfly_di2 <= wr185;
					i <= 6;
					wr133 <= bfly_do1;
					wr186 <= bfly_do2;
					counter <= counter + 1;
				end
				71: begin
					bfly_di1 <= wr135;
					bfly_di2 <= wr184;
					i <= 7;
					wr134 <= bfly_do1;
					wr185 <= bfly_do2;
					counter <= counter + 1;
				end
				72: begin
					bfly_di1 <= wr136;
					bfly_di2 <= wr183;
					i <= 8;
					wr135 <= bfly_do1;
					wr184 <= bfly_do2;
					counter <= counter + 1;
				end
				73: begin
					bfly_di1 <= wr137;
					bfly_di2 <= wr182;
					i <= 9;
					wr136 <= bfly_do1;
					wr183 <= bfly_do2;
					counter <= counter + 1;
				end
				74: begin
					bfly_di1 <= wr138;
					bfly_di2 <= wr181;
					i <= 10;
					wr137 <= bfly_do1;
					wr182 <= bfly_do2;
					counter <= counter + 1;
				end
				75: begin
					bfly_di1 <= wr139;
					bfly_di2 <= wr180;
					i <= 11;
					wr138 <= bfly_do1;
					wr181 <= bfly_do2;
					counter <= counter + 1;
				end
				76: begin
					bfly_di1 <= wr140;
					bfly_di2 <= wr179;
					i <= 12;
					wr139 <= bfly_do1;
					wr180 <= bfly_do2;
					counter <= counter + 1;
				end
				77: begin
					bfly_di1 <= wr141;
					bfly_di2 <= wr178;
					i <= 13;
					wr140 <= bfly_do1;
					wr179 <= bfly_do2;
					counter <= counter + 1;
				end
				78: begin
					bfly_di1 <= wr142;
					bfly_di2 <= wr177;
					i <= 14;
					wr141 <= bfly_do1;
					wr178 <= bfly_do2;
					counter <= counter + 1;
				end
				79: begin
					bfly_di1 <= wr143;
					bfly_di2 <= wr176;
					i <= 15;
					wr142 <= bfly_do1;
					wr177 <= bfly_do2;
					counter <= counter + 1;
				end
				80: begin
					bfly_di1 <= wr144;
					bfly_di2 <= wr175;
					i <= 16;
					wr143 <= bfly_do1;
					wr176 <= bfly_do2;
					counter <= counter + 1;
				end
				81: begin
					bfly_di1 <= wr145;
					bfly_di2 <= wr174;
					i <= 17;
					wr144 <= bfly_do1;
					wr175 <= bfly_do2;
					counter <= counter + 1;
				end
				82: begin
					bfly_di1 <= wr146;
					bfly_di2 <= wr173;
					i <= 18;
					wr145 <= bfly_do1;
					wr174 <= bfly_do2;
					counter <= counter + 1;
				end
				83: begin
					bfly_di1 <= wr147;
					bfly_di2 <= wr172;
					i <= 19;
					wr146 <= bfly_do1;
					wr173 <= bfly_do2;
					counter <= counter + 1;
				end
				84: begin
					bfly_di1 <= wr148;
					bfly_di2 <= wr171;
					i <= 20;
					wr147 <= bfly_do1;
					wr172 <= bfly_do2;
					counter <= counter + 1;
				end
				85: begin
					bfly_di1 <= wr149;
					bfly_di2 <= wr170;
					i <= 21;
					wr148 <= bfly_do1;
					wr171 <= bfly_do2;
					counter <= counter + 1;
				end
				86: begin
					bfly_di1 <= wr150;
					bfly_di2 <= wr169;
					i <= 22;
					wr149 <= bfly_do1;
					wr170 <= bfly_do2;
					counter <= counter + 1;
				end
				87: begin
					bfly_di1 <= wr151;
					bfly_di2 <= wr168;
					i <= 23;
					wr150 <= bfly_do1;
					wr169 <= bfly_do2;
					counter <= counter + 1;
				end
				88: begin
					bfly_di1 <= wr152;
					bfly_di2 <= wr167;
					i <= 24;
					wr151 <= bfly_do1;
					wr168 <= bfly_do2;
					counter <= counter + 1;
				end
				89: begin
					bfly_di1 <= wr153;
					bfly_di2 <= wr166;
					i <= 25;
					wr152 <= bfly_do1;
					wr167 <= bfly_do2;
					counter <= counter + 1;
				end
				90: begin
					bfly_di1 <= wr154;
					bfly_di2 <= wr165;
					i <= 26;
					wr153 <= bfly_do1;
					wr166 <= bfly_do2;
					counter <= counter + 1;
				end
				91: begin
					bfly_di1 <= wr155;
					bfly_di2 <= wr164;
					i <= 27;
					wr154 <= bfly_do1;
					wr165 <= bfly_do2;
					counter <= counter + 1;
				end
				92: begin
					bfly_di1 <= wr156;
					bfly_di2 <= wr163;
					i <= 28;
					wr155 <= bfly_do1;
					wr164 <= bfly_do2;
					counter <= counter + 1;
				end
				93: begin
					bfly_di1 <= wr157;
					bfly_di2 <= wr162;
					i <= 29;
					wr156 <= bfly_do1;
					wr163 <= bfly_do2;
					counter <= counter + 1;
				end
				94: begin
					bfly_di1 <= wr158;
					bfly_di2 <= wr161;
					i <= 30;
					wr157 <= bfly_do1;
					wr162 <= bfly_do2;
					counter <= counter + 1;
				end
				95: begin
					bfly_di1 <= wr159;
					bfly_di2 <= wr160;
					i <= 31;
					wr158 <= bfly_do1;
					wr161 <= bfly_do2;
					counter <= counter + 1;
				end
				96: begin
					bfly_di1 <= wr255;
					bfly_di2 <= wr192;
					i <= 0;
					wr159 <= bfly_do1;
					wr160 <= bfly_do2;
					counter <= counter + 1;
				end
				97: begin
					bfly_di1 <= wr254;
					bfly_di2 <= wr193;
					i <= 1;
					wr192 <= bfly_do1;
					wr255 <= bfly_do2;
					counter <= counter + 1;
				end
				98: begin
					bfly_di1 <= wr253;
					bfly_di2 <= wr194;
					i <= 2;
					wr193 <= bfly_do1;
					wr254 <= bfly_do2;
					counter <= counter + 1;
				end
				99: begin
					bfly_di1 <= wr252;
					bfly_di2 <= wr195;
					i <= 3;
					wr194 <= bfly_do1;
					wr253 <= bfly_do2;
					counter <= counter + 1;
				end
				100: begin
					bfly_di1 <= wr251;
					bfly_di2 <= wr196;
					i <= 4;
					wr195 <= bfly_do1;
					wr252 <= bfly_do2;
					counter <= counter + 1;
				end
				101: begin
					bfly_di1 <= wr250;
					bfly_di2 <= wr197;
					i <= 5;
					wr196 <= bfly_do1;
					wr251 <= bfly_do2;
					counter <= counter + 1;
				end
				102: begin
					bfly_di1 <= wr249;
					bfly_di2 <= wr198;
					i <= 6;
					wr197 <= bfly_do1;
					wr250 <= bfly_do2;
					counter <= counter + 1;
				end
				103: begin
					bfly_di1 <= wr248;
					bfly_di2 <= wr199;
					i <= 7;
					wr198 <= bfly_do1;
					wr249 <= bfly_do2;
					counter <= counter + 1;
				end
				104: begin
					bfly_di1 <= wr247;
					bfly_di2 <= wr200;
					i <= 8;
					wr199 <= bfly_do1;
					wr248 <= bfly_do2;
					counter <= counter + 1;
				end
				105: begin
					bfly_di1 <= wr246;
					bfly_di2 <= wr201;
					i <= 9;
					wr200 <= bfly_do1;
					wr247 <= bfly_do2;
					counter <= counter + 1;
				end
				106: begin
					bfly_di1 <= wr245;
					bfly_di2 <= wr202;
					i <= 10;
					wr201 <= bfly_do1;
					wr246 <= bfly_do2;
					counter <= counter + 1;
				end
				107: begin
					bfly_di1 <= wr244;
					bfly_di2 <= wr203;
					i <= 11;
					wr202 <= bfly_do1;
					wr245 <= bfly_do2;
					counter <= counter + 1;
				end
				108: begin
					bfly_di1 <= wr243;
					bfly_di2 <= wr204;
					i <= 12;
					wr203 <= bfly_do1;
					wr244 <= bfly_do2;
					counter <= counter + 1;
				end
				109: begin
					bfly_di1 <= wr242;
					bfly_di2 <= wr205;
					i <= 13;
					wr204 <= bfly_do1;
					wr243 <= bfly_do2;
					counter <= counter + 1;
				end
				110: begin
					bfly_di1 <= wr241;
					bfly_di2 <= wr206;
					i <= 14;
					wr205 <= bfly_do1;
					wr242 <= bfly_do2;
					counter <= counter + 1;
				end
				111: begin
					bfly_di1 <= wr240;
					bfly_di2 <= wr207;
					i <= 15;
					wr206 <= bfly_do1;
					wr241 <= bfly_do2;
					counter <= counter + 1;
				end
				112: begin
					bfly_di1 <= wr239;
					bfly_di2 <= wr208;
					i <= 16;
					wr207 <= bfly_do1;
					wr240 <= bfly_do2;
					counter <= counter + 1;
				end
				113: begin
					bfly_di1 <= wr238;
					bfly_di2 <= wr209;
					i <= 17;
					wr208 <= bfly_do1;
					wr239 <= bfly_do2;
					counter <= counter + 1;
				end
				114: begin
					bfly_di1 <= wr237;
					bfly_di2 <= wr210;
					i <= 18;
					wr209 <= bfly_do1;
					wr238 <= bfly_do2;
					counter <= counter + 1;
				end
				115: begin
					bfly_di1 <= wr236;
					bfly_di2 <= wr211;
					i <= 19;
					wr210 <= bfly_do1;
					wr237 <= bfly_do2;
					counter <= counter + 1;
				end
				116: begin
					bfly_di1 <= wr235;
					bfly_di2 <= wr212;
					i <= 20;
					wr211 <= bfly_do1;
					wr236 <= bfly_do2;
					counter <= counter + 1;
				end
				117: begin
					bfly_di1 <= wr234;
					bfly_di2 <= wr213;
					i <= 21;
					wr212 <= bfly_do1;
					wr235 <= bfly_do2;
					counter <= counter + 1;
				end
				118: begin
					bfly_di1 <= wr233;
					bfly_di2 <= wr214;
					i <= 22;
					wr213 <= bfly_do1;
					wr234 <= bfly_do2;
					counter <= counter + 1;
				end
				119: begin
					bfly_di1 <= wr232;
					bfly_di2 <= wr215;
					i <= 23;
					wr214 <= bfly_do1;
					wr233 <= bfly_do2;
					counter <= counter + 1;
				end
				120: begin
					bfly_di1 <= wr231;
					bfly_di2 <= wr216;
					i <= 24;
					wr215 <= bfly_do1;
					wr232 <= bfly_do2;
					counter <= counter + 1;
				end
				121: begin
					bfly_di1 <= wr230;
					bfly_di2 <= wr217;
					i <= 25;
					wr216 <= bfly_do1;
					wr231 <= bfly_do2;
					counter <= counter + 1;
				end
				122: begin
					bfly_di1 <= wr229;
					bfly_di2 <= wr218;
					i <= 26;
					wr217 <= bfly_do1;
					wr230 <= bfly_do2;
					counter <= counter + 1;
				end
				123: begin
					bfly_di1 <= wr228;
					bfly_di2 <= wr219;
					i <= 27;
					wr218 <= bfly_do1;
					wr229 <= bfly_do2;
					counter <= counter + 1;
				end
				124: begin
					bfly_di1 <= wr227;
					bfly_di2 <= wr220;
					i <= 28;
					wr219 <= bfly_do1;
					wr228 <= bfly_do2;
					counter <= counter + 1;
				end
				125: begin
					bfly_di1 <= wr226;
					bfly_di2 <= wr221;
					i <= 29;
					wr220 <= bfly_do1;
					wr227 <= bfly_do2;
					counter <= counter + 1;
				end
				126: begin
					bfly_di1 <= wr225;
					bfly_di2 <= wr222;
					i <= 30;
					wr221 <= bfly_do1;
					wr226 <= bfly_do2;
					counter <= counter + 1;
				end
				127: begin
					bfly_di1 <= wr224;
					bfly_di2 <= wr223;
					i <= 31;
					wr222 <= bfly_do1;
					wr225 <= bfly_do2;
					//counter <= counter + 1;
					layer <= 3;
					counter <= 0;
				end
			endcase
		end
		3: begin
			n <= 32;
			case(counter)
				0: begin
					bfly_di1 <= wr0;
					bfly_di2 <= wr31;
					i <= 0;
					wr223 <= bfly_do1;
					wr224 <= bfly_do2;
					counter <= counter + 1;
				end
				1: begin
					bfly_di1 <= wr1;
					bfly_di2 <= wr30;
					i <= 1;
					wr0 <= bfly_do1;
					wr31 <= bfly_do2;
					counter <= counter + 1;
				end
				2: begin
					bfly_di1 <= wr2;
					bfly_di2 <= wr29;
					i <= 2;
					wr1 <= bfly_do1;
					wr30 <= bfly_do2;
					counter <= counter + 1;
				end
				3: begin
					bfly_di1 <= wr3;
					bfly_di2 <= wr28;
					i <= 3;
					wr2 <= bfly_do1;
					wr29 <= bfly_do2;
					counter <= counter + 1;
				end
				4: begin
					bfly_di1 <= wr4;
					bfly_di2 <= wr27;
					i <= 4;
					wr3 <= bfly_do1;
					wr28 <= bfly_do2;
					counter <= counter + 1;
				end
				5: begin
					bfly_di1 <= wr5;
					bfly_di2 <= wr26;
					i <= 5;
					wr4 <= bfly_do1;
					wr27 <= bfly_do2;
					counter <= counter + 1;
				end
				6: begin
					bfly_di1 <= wr6;
					bfly_di2 <= wr25;
					i <= 6;
					wr5 <= bfly_do1;
					wr26 <= bfly_do2;
					counter <= counter + 1;
				end
				7: begin
					bfly_di1 <= wr7;
					bfly_di2 <= wr24;
					i <= 7;
					wr6 <= bfly_do1;
					wr25 <= bfly_do2;
					counter <= counter + 1;
				end
				8: begin
					bfly_di1 <= wr8;
					bfly_di2 <= wr23;
					i <= 8;
					wr7 <= bfly_do1;
					wr24 <= bfly_do2;
					counter <= counter + 1;
				end
				9: begin
					bfly_di1 <= wr9;
					bfly_di2 <= wr22;
					i <= 9;
					wr8 <= bfly_do1;
					wr23 <= bfly_do2;
					counter <= counter + 1;
				end
				10: begin
					bfly_di1 <= wr10;
					bfly_di2 <= wr21;
					i <= 10;
					wr9 <= bfly_do1;
					wr22 <= bfly_do2;
					counter <= counter + 1;
				end
				11: begin
					bfly_di1 <= wr11;
					bfly_di2 <= wr20;
					i <= 11;
					wr10 <= bfly_do1;
					wr21 <= bfly_do2;
					counter <= counter + 1;
				end
				12: begin
					bfly_di1 <= wr12;
					bfly_di2 <= wr19;
					i <= 12;
					wr11 <= bfly_do1;
					wr20 <= bfly_do2;
					counter <= counter + 1;
				end
				13: begin
					bfly_di1 <= wr13;
					bfly_di2 <= wr18;
					i <= 13;
					wr12 <= bfly_do1;
					wr19 <= bfly_do2;
					counter <= counter + 1;
				end
				14: begin
					bfly_di1 <= wr14;
					bfly_di2 <= wr17;
					i <= 14;
					wr13 <= bfly_do1;
					wr18 <= bfly_do2;
					counter <= counter + 1;
				end
				15: begin
					bfly_di1 <= wr15;
					bfly_di2 <= wr16;
					i <= 15;
					wr14 <= bfly_do1;
					wr17 <= bfly_do2;
					counter <= counter + 1;
				end
				16: begin
					bfly_di1 <= wr63;
					bfly_di2 <= wr32;
					i <= 0;
					wr15 <= bfly_do1;
					wr16 <= bfly_do2;
					counter <= counter + 1;
				end
				17: begin
					bfly_di1 <= wr62;
					bfly_di2 <= wr33;
					i <= 1;
					wr32 <= bfly_do1;
					wr63 <= bfly_do2;
					counter <= counter + 1;
				end
				18: begin
					bfly_di1 <= wr61;
					bfly_di2 <= wr34;
					i <= 2;
					wr33 <= bfly_do1;
					wr62 <= bfly_do2;
					counter <= counter + 1;
				end
				19: begin
					bfly_di1 <= wr60;
					bfly_di2 <= wr35;
					i <= 3;
					wr34 <= bfly_do1;
					wr61 <= bfly_do2;
					counter <= counter + 1;
				end
				20: begin
					bfly_di1 <= wr59;
					bfly_di2 <= wr36;
					i <= 4;
					wr35 <= bfly_do1;
					wr60 <= bfly_do2;
					counter <= counter + 1;
				end
				21: begin
					bfly_di1 <= wr58;
					bfly_di2 <= wr37;
					i <= 5;
					wr36 <= bfly_do1;
					wr59 <= bfly_do2;
					counter <= counter + 1;
				end
				22: begin
					bfly_di1 <= wr57;
					bfly_di2 <= wr38;
					i <= 6;
					wr37 <= bfly_do1;
					wr58 <= bfly_do2;
					counter <= counter + 1;
				end
				23: begin
					bfly_di1 <= wr56;
					bfly_di2 <= wr39;
					i <= 7;
					wr38 <= bfly_do1;
					wr57 <= bfly_do2;
					counter <= counter + 1;
				end
				24: begin
					bfly_di1 <= wr55;
					bfly_di2 <= wr40;
					i <= 8;
					wr39 <= bfly_do1;
					wr56 <= bfly_do2;
					counter <= counter + 1;
				end
				25: begin
					bfly_di1 <= wr54;
					bfly_di2 <= wr41;
					i <= 9;
					wr40 <= bfly_do1;
					wr55 <= bfly_do2;
					counter <= counter + 1;
				end
				26: begin
					bfly_di1 <= wr53;
					bfly_di2 <= wr42;
					i <= 10;
					wr41 <= bfly_do1;
					wr54 <= bfly_do2;
					counter <= counter + 1;
				end
				27: begin
					bfly_di1 <= wr52;
					bfly_di2 <= wr43;
					i <= 11;
					wr42 <= bfly_do1;
					wr53 <= bfly_do2;
					counter <= counter + 1;
				end
				28: begin
					bfly_di1 <= wr51;
					bfly_di2 <= wr44;
					i <= 12;
					wr43 <= bfly_do1;
					wr52 <= bfly_do2;
					counter <= counter + 1;
				end
				29: begin
					bfly_di1 <= wr50;
					bfly_di2 <= wr45;
					i <= 13;
					wr44 <= bfly_do1;
					wr51 <= bfly_do2;
					counter <= counter + 1;
				end
				30: begin
					bfly_di1 <= wr49;
					bfly_di2 <= wr46;
					i <= 14;
					wr45 <= bfly_do1;
					wr50 <= bfly_do2;
					counter <= counter + 1;
				end
				31: begin
					bfly_di1 <= wr48;
					bfly_di2 <= wr47;
					i <= 15;
					wr46 <= bfly_do1;
					wr49 <= bfly_do2;
					counter <= counter + 1;
				end
				32: begin
					bfly_di1 <= wr64;
					bfly_di2 <= wr95;
					i <= 0;
					wr47 <= bfly_do1;
					wr48 <= bfly_do2;
					counter <= counter + 1;
				end
				33: begin
					bfly_di1 <= wr65;
					bfly_di2 <= wr94;
					i <= 1;
					wr64 <= bfly_do1;
					wr95 <= bfly_do2;
					counter <= counter + 1;
				end
				34: begin
					bfly_di1 <= wr66;
					bfly_di2 <= wr93;
					i <= 2;
					wr65 <= bfly_do1;
					wr94 <= bfly_do2;
					counter <= counter + 1;
				end
				35: begin
					bfly_di1 <= wr67;
					bfly_di2 <= wr92;
					i <= 3;
					wr66 <= bfly_do1;
					wr93 <= bfly_do2;
					counter <= counter + 1;
				end
				36: begin
					bfly_di1 <= wr68;
					bfly_di2 <= wr91;
					i <= 4;
					wr67 <= bfly_do1;
					wr92 <= bfly_do2;
					counter <= counter + 1;
				end
				37: begin
					bfly_di1 <= wr69;
					bfly_di2 <= wr90;
					i <= 5;
					wr68 <= bfly_do1;
					wr91 <= bfly_do2;
					counter <= counter + 1;
				end
				38: begin
					bfly_di1 <= wr70;
					bfly_di2 <= wr89;
					i <= 6;
					wr69 <= bfly_do1;
					wr90 <= bfly_do2;
					counter <= counter + 1;
				end
				39: begin
					bfly_di1 <= wr71;
					bfly_di2 <= wr88;
					i <= 7;
					wr70 <= bfly_do1;
					wr89 <= bfly_do2;
					counter <= counter + 1;
				end
				40: begin
					bfly_di1 <= wr72;
					bfly_di2 <= wr87;
					i <= 8;
					wr71 <= bfly_do1;
					wr88 <= bfly_do2;
					counter <= counter + 1;
				end
				41: begin
					bfly_di1 <= wr73;
					bfly_di2 <= wr86;
					i <= 9;
					wr72 <= bfly_do1;
					wr87 <= bfly_do2;
					counter <= counter + 1;
				end
				42: begin
					bfly_di1 <= wr74;
					bfly_di2 <= wr85;
					i <= 10;
					wr73 <= bfly_do1;
					wr86 <= bfly_do2;
					counter <= counter + 1;
				end
				43: begin
					bfly_di1 <= wr75;
					bfly_di2 <= wr84;
					i <= 11;
					wr74 <= bfly_do1;
					wr85 <= bfly_do2;
					counter <= counter + 1;
				end
				44: begin
					bfly_di1 <= wr76;
					bfly_di2 <= wr83;
					i <= 12;
					wr75 <= bfly_do1;
					wr84 <= bfly_do2;
					counter <= counter + 1;
				end
				45: begin
					bfly_di1 <= wr77;
					bfly_di2 <= wr82;
					i <= 13;
					wr76 <= bfly_do1;
					wr83 <= bfly_do2;
					counter <= counter + 1;
				end
				46: begin
					bfly_di1 <= wr78;
					bfly_di2 <= wr81;
					i <= 14;
					wr77 <= bfly_do1;
					wr82 <= bfly_do2;
					counter <= counter + 1;
				end
				47: begin
					bfly_di1 <= wr79;
					bfly_di2 <= wr80;
					i <= 15;
					wr78 <= bfly_do1;
					wr81 <= bfly_do2;
					counter <= counter + 1;
				end
				48: begin
					bfly_di1 <= wr127;
					bfly_di2 <= wr96;
					i <= 0;
					wr79 <= bfly_do1;
					wr80 <= bfly_do2;
					counter <= counter + 1;
				end
				49: begin
					bfly_di1 <= wr126;
					bfly_di2 <= wr97;
					i <= 1;
					wr96 <= bfly_do1;
					wr127 <= bfly_do2;
					counter <= counter + 1;
				end
				50: begin
					bfly_di1 <= wr125;
					bfly_di2 <= wr98;
					i <= 2;
					wr97 <= bfly_do1;
					wr126 <= bfly_do2;
					counter <= counter + 1;
				end
				51: begin
					bfly_di1 <= wr124;
					bfly_di2 <= wr99;
					i <= 3;
					wr98 <= bfly_do1;
					wr125 <= bfly_do2;
					counter <= counter + 1;
				end
				52: begin
					bfly_di1 <= wr123;
					bfly_di2 <= wr100;
					i <= 4;
					wr99 <= bfly_do1;
					wr124 <= bfly_do2;
					counter <= counter + 1;
				end
				53: begin
					bfly_di1 <= wr122;
					bfly_di2 <= wr101;
					i <= 5;
					wr100 <= bfly_do1;
					wr123 <= bfly_do2;
					counter <= counter + 1;
				end
				54: begin
					bfly_di1 <= wr121;
					bfly_di2 <= wr102;
					i <= 6;
					wr101 <= bfly_do1;
					wr122 <= bfly_do2;
					counter <= counter + 1;
				end
				55: begin
					bfly_di1 <= wr120;
					bfly_di2 <= wr103;
					i <= 7;
					wr102 <= bfly_do1;
					wr121 <= bfly_do2;
					counter <= counter + 1;
				end
				56: begin
					bfly_di1 <= wr119;
					bfly_di2 <= wr104;
					i <= 8;
					wr103 <= bfly_do1;
					wr120 <= bfly_do2;
					counter <= counter + 1;
				end
				57: begin
					bfly_di1 <= wr118;
					bfly_di2 <= wr105;
					i <= 9;
					wr104 <= bfly_do1;
					wr119 <= bfly_do2;
					counter <= counter + 1;
				end
				58: begin
					bfly_di1 <= wr117;
					bfly_di2 <= wr106;
					i <= 10;
					wr105 <= bfly_do1;
					wr118 <= bfly_do2;
					counter <= counter + 1;
				end
				59: begin
					bfly_di1 <= wr116;
					bfly_di2 <= wr107;
					i <= 11;
					wr106 <= bfly_do1;
					wr117 <= bfly_do2;
					counter <= counter + 1;
				end
				60: begin
					bfly_di1 <= wr115;
					bfly_di2 <= wr108;
					i <= 12;
					wr107 <= bfly_do1;
					wr116 <= bfly_do2;
					counter <= counter + 1;
				end
				61: begin
					bfly_di1 <= wr114;
					bfly_di2 <= wr109;
					i <= 13;
					wr108 <= bfly_do1;
					wr115 <= bfly_do2;
					counter <= counter + 1;
				end
				62: begin
					bfly_di1 <= wr113;
					bfly_di2 <= wr110;
					i <= 14;
					wr109 <= bfly_do1;
					wr114 <= bfly_do2;
					counter <= counter + 1;
				end
				63: begin
					bfly_di1 <= wr112;
					bfly_di2 <= wr111;
					i <= 15;
					wr110 <= bfly_do1;
					wr113 <= bfly_do2;
					counter <= counter + 1;
				end
				64: begin
					bfly_di1 <= wr128;
					bfly_di2 <= wr159;
					i <= 0;
					wr111 <= bfly_do1;
					wr112 <= bfly_do2;
					counter <= counter + 1;
				end
				65: begin
					bfly_di1 <= wr129;
					bfly_di2 <= wr158;
					i <= 1;
					wr128 <= bfly_do1;
					wr159 <= bfly_do2;
					counter <= counter + 1;
				end
				66: begin
					bfly_di1 <= wr130;
					bfly_di2 <= wr157;
					i <= 2;
					wr129 <= bfly_do1;
					wr158 <= bfly_do2;
					counter <= counter + 1;
				end
				67: begin
					bfly_di1 <= wr131;
					bfly_di2 <= wr156;
					i <= 3;
					wr130 <= bfly_do1;
					wr157 <= bfly_do2;
					counter <= counter + 1;
				end
				68: begin
					bfly_di1 <= wr132;
					bfly_di2 <= wr155;
					i <= 4;
					wr131 <= bfly_do1;
					wr156 <= bfly_do2;
					counter <= counter + 1;
				end
				69: begin
					bfly_di1 <= wr133;
					bfly_di2 <= wr154;
					i <= 5;
					wr132 <= bfly_do1;
					wr155 <= bfly_do2;
					counter <= counter + 1;
				end
				70: begin
					bfly_di1 <= wr134;
					bfly_di2 <= wr153;
					i <= 6;
					wr133 <= bfly_do1;
					wr154 <= bfly_do2;
					counter <= counter + 1;
				end
				71: begin
					bfly_di1 <= wr135;
					bfly_di2 <= wr152;
					i <= 7;
					wr134 <= bfly_do1;
					wr153 <= bfly_do2;
					counter <= counter + 1;
				end
				72: begin
					bfly_di1 <= wr136;
					bfly_di2 <= wr151;
					i <= 8;
					wr135 <= bfly_do1;
					wr152 <= bfly_do2;
					counter <= counter + 1;
				end
				73: begin
					bfly_di1 <= wr137;
					bfly_di2 <= wr150;
					i <= 9;
					wr136 <= bfly_do1;
					wr151 <= bfly_do2;
					counter <= counter + 1;
				end
				74: begin
					bfly_di1 <= wr138;
					bfly_di2 <= wr149;
					i <= 10;
					wr137 <= bfly_do1;
					wr150 <= bfly_do2;
					counter <= counter + 1;
				end
				75: begin
					bfly_di1 <= wr139;
					bfly_di2 <= wr148;
					i <= 11;
					wr138 <= bfly_do1;
					wr149 <= bfly_do2;
					counter <= counter + 1;
				end
				76: begin
					bfly_di1 <= wr140;
					bfly_di2 <= wr147;
					i <= 12;
					wr139 <= bfly_do1;
					wr148 <= bfly_do2;
					counter <= counter + 1;
				end
				77: begin
					bfly_di1 <= wr141;
					bfly_di2 <= wr146;
					i <= 13;
					wr140 <= bfly_do1;
					wr147 <= bfly_do2;
					counter <= counter + 1;
				end
				78: begin
					bfly_di1 <= wr142;
					bfly_di2 <= wr145;
					i <= 14;
					wr141 <= bfly_do1;
					wr146 <= bfly_do2;
					counter <= counter + 1;
				end
				79: begin
					bfly_di1 <= wr143;
					bfly_di2 <= wr144;
					i <= 15;
					wr142 <= bfly_do1;
					wr145 <= bfly_do2;
					counter <= counter + 1;
				end
				80: begin
					bfly_di1 <= wr191;
					bfly_di2 <= wr160;
					i <= 0;
					wr143 <= bfly_do1;
					wr144 <= bfly_do2;
					counter <= counter + 1;
				end
				81: begin
					bfly_di1 <= wr190;
					bfly_di2 <= wr161;
					i <= 1;
					wr160 <= bfly_do1;
					wr191 <= bfly_do2;
					counter <= counter + 1;
				end
				82: begin
					bfly_di1 <= wr189;
					bfly_di2 <= wr162;
					i <= 2;
					wr161 <= bfly_do1;
					wr190 <= bfly_do2;
					counter <= counter + 1;
				end
				83: begin
					bfly_di1 <= wr188;
					bfly_di2 <= wr163;
					i <= 3;
					wr162 <= bfly_do1;
					wr189 <= bfly_do2;
					counter <= counter + 1;
				end
				84: begin
					bfly_di1 <= wr187;
					bfly_di2 <= wr164;
					i <= 4;
					wr163 <= bfly_do1;
					wr188 <= bfly_do2;
					counter <= counter + 1;
				end
				85: begin
					bfly_di1 <= wr186;
					bfly_di2 <= wr165;
					i <= 5;
					wr164 <= bfly_do1;
					wr187 <= bfly_do2;
					counter <= counter + 1;
				end
				86: begin
					bfly_di1 <= wr185;
					bfly_di2 <= wr166;
					i <= 6;
					wr165 <= bfly_do1;
					wr186 <= bfly_do2;
					counter <= counter + 1;
				end
				87: begin
					bfly_di1 <= wr184;
					bfly_di2 <= wr167;
					i <= 7;
					wr166 <= bfly_do1;
					wr185 <= bfly_do2;
					counter <= counter + 1;
				end
				88: begin
					bfly_di1 <= wr183;
					bfly_di2 <= wr168;
					i <= 8;
					wr167 <= bfly_do1;
					wr184 <= bfly_do2;
					counter <= counter + 1;
				end
				89: begin
					bfly_di1 <= wr182;
					bfly_di2 <= wr169;
					i <= 9;
					wr168 <= bfly_do1;
					wr183 <= bfly_do2;
					counter <= counter + 1;
				end
				90: begin
					bfly_di1 <= wr181;
					bfly_di2 <= wr170;
					i <= 10;
					wr169 <= bfly_do1;
					wr182 <= bfly_do2;
					counter <= counter + 1;
				end
				91: begin
					bfly_di1 <= wr180;
					bfly_di2 <= wr171;
					i <= 11;
					wr170 <= bfly_do1;
					wr181 <= bfly_do2;
					counter <= counter + 1;
				end
				92: begin
					bfly_di1 <= wr179;
					bfly_di2 <= wr172;
					i <= 12;
					wr171 <= bfly_do1;
					wr180 <= bfly_do2;
					counter <= counter + 1;
				end
				93: begin
					bfly_di1 <= wr178;
					bfly_di2 <= wr173;
					i <= 13;
					wr172 <= bfly_do1;
					wr179 <= bfly_do2;
					counter <= counter + 1;
				end
				94: begin
					bfly_di1 <= wr177;
					bfly_di2 <= wr174;
					i <= 14;
					wr173 <= bfly_do1;
					wr178 <= bfly_do2;
					counter <= counter + 1;
				end
				95: begin
					bfly_di1 <= wr176;
					bfly_di2 <= wr175;
					i <= 15;
					wr174 <= bfly_do1;
					wr177 <= bfly_do2;
					counter <= counter + 1;
				end
				96: begin
					bfly_di1 <= wr192;
					bfly_di2 <= wr223;
					i <= 0;
					wr175 <= bfly_do1;
					wr176 <= bfly_do2;
					counter <= counter + 1;
				end
				97: begin
					bfly_di1 <= wr193;
					bfly_di2 <= wr222;
					i <= 1;
					wr192 <= bfly_do1;
					wr223 <= bfly_do2;
					counter <= counter + 1;
				end
				98: begin
					bfly_di1 <= wr194;
					bfly_di2 <= wr221;
					i <= 2;
					wr193 <= bfly_do1;
					wr222 <= bfly_do2;
					counter <= counter + 1;
				end
				99: begin
					bfly_di1 <= wr195;
					bfly_di2 <= wr220;
					i <= 3;
					wr194 <= bfly_do1;
					wr221 <= bfly_do2;
					counter <= counter + 1;
				end
				100: begin
					bfly_di1 <= wr196;
					bfly_di2 <= wr219;
					i <= 4;
					wr195 <= bfly_do1;
					wr220 <= bfly_do2;
					counter <= counter + 1;
				end
				101: begin
					bfly_di1 <= wr197;
					bfly_di2 <= wr218;
					i <= 5;
					wr196 <= bfly_do1;
					wr219 <= bfly_do2;
					counter <= counter + 1;
				end
				102: begin
					bfly_di1 <= wr198;
					bfly_di2 <= wr217;
					i <= 6;
					wr197 <= bfly_do1;
					wr218 <= bfly_do2;
					counter <= counter + 1;
				end
				103: begin
					bfly_di1 <= wr199;
					bfly_di2 <= wr216;
					i <= 7;
					wr198 <= bfly_do1;
					wr217 <= bfly_do2;
					counter <= counter + 1;
				end
				104: begin
					bfly_di1 <= wr200;
					bfly_di2 <= wr215;
					i <= 8;
					wr199 <= bfly_do1;
					wr216 <= bfly_do2;
					counter <= counter + 1;
				end
				105: begin
					bfly_di1 <= wr201;
					bfly_di2 <= wr214;
					i <= 9;
					wr200 <= bfly_do1;
					wr215 <= bfly_do2;
					counter <= counter + 1;
				end
				106: begin
					bfly_di1 <= wr202;
					bfly_di2 <= wr213;
					i <= 10;
					wr201 <= bfly_do1;
					wr214 <= bfly_do2;
					counter <= counter + 1;
				end
				107: begin
					bfly_di1 <= wr203;
					bfly_di2 <= wr212;
					i <= 11;
					wr202 <= bfly_do1;
					wr213 <= bfly_do2;
					counter <= counter + 1;
				end
				108: begin
					bfly_di1 <= wr204;
					bfly_di2 <= wr211;
					i <= 12;
					wr203 <= bfly_do1;
					wr212 <= bfly_do2;
					counter <= counter + 1;
				end
				109: begin
					bfly_di1 <= wr205;
					bfly_di2 <= wr210;
					i <= 13;
					wr204 <= bfly_do1;
					wr211 <= bfly_do2;
					counter <= counter + 1;
				end
				110: begin
					bfly_di1 <= wr206;
					bfly_di2 <= wr209;
					i <= 14;
					wr205 <= bfly_do1;
					wr210 <= bfly_do2;
					counter <= counter + 1;
				end
				111: begin
					bfly_di1 <= wr207;
					bfly_di2 <= wr208;
					i <= 15;
					wr206 <= bfly_do1;
					wr209 <= bfly_do2;
					counter <= counter + 1;
				end
				112: begin
					bfly_di1 <= wr255;
					bfly_di2 <= wr224;
					i <= 0;
					wr207 <= bfly_do1;
					wr208 <= bfly_do2;
					counter <= counter + 1;
				end
				113: begin
					bfly_di1 <= wr254;
					bfly_di2 <= wr225;
					i <= 1;
					wr224 <= bfly_do1;
					wr255 <= bfly_do2;
					counter <= counter + 1;
				end
				114: begin
					bfly_di1 <= wr253;
					bfly_di2 <= wr226;
					i <= 2;
					wr225 <= bfly_do1;
					wr254 <= bfly_do2;
					counter <= counter + 1;
				end
				115: begin
					bfly_di1 <= wr252;
					bfly_di2 <= wr227;
					i <= 3;
					wr226 <= bfly_do1;
					wr253 <= bfly_do2;
					counter <= counter + 1;
				end
				116: begin
					bfly_di1 <= wr251;
					bfly_di2 <= wr228;
					i <= 4;
					wr227 <= bfly_do1;
					wr252 <= bfly_do2;
					counter <= counter + 1;
				end
				117: begin
					bfly_di1 <= wr250;
					bfly_di2 <= wr229;
					i <= 5;
					wr228 <= bfly_do1;
					wr251 <= bfly_do2;
					counter <= counter + 1;
				end
				118: begin
					bfly_di1 <= wr249;
					bfly_di2 <= wr230;
					i <= 6;
					wr229 <= bfly_do1;
					wr250 <= bfly_do2;
					counter <= counter + 1;
				end
				119: begin
					bfly_di1 <= wr248;
					bfly_di2 <= wr231;
					i <= 7;
					wr230 <= bfly_do1;
					wr249 <= bfly_do2;
					counter <= counter + 1;
				end
				120: begin
					bfly_di1 <= wr247;
					bfly_di2 <= wr232;
					i <= 8;
					wr231 <= bfly_do1;
					wr248 <= bfly_do2;
					counter <= counter + 1;
				end
				121: begin
					bfly_di1 <= wr246;
					bfly_di2 <= wr233;
					i <= 9;
					wr232 <= bfly_do1;
					wr247 <= bfly_do2;
					counter <= counter + 1;
				end
				122: begin
					bfly_di1 <= wr245;
					bfly_di2 <= wr234;
					i <= 10;
					wr233 <= bfly_do1;
					wr246 <= bfly_do2;
					counter <= counter + 1;
				end
				123: begin
					bfly_di1 <= wr244;
					bfly_di2 <= wr235;
					i <= 11;
					wr234 <= bfly_do1;
					wr245 <= bfly_do2;
					counter <= counter + 1;
				end
				124: begin
					bfly_di1 <= wr243;
					bfly_di2 <= wr236;
					i <= 12;
					wr235 <= bfly_do1;
					wr244 <= bfly_do2;
					counter <= counter + 1;
				end
				125: begin
					bfly_di1 <= wr242;
					bfly_di2 <= wr237;
					i <= 13;
					wr236 <= bfly_do1;
					wr243 <= bfly_do2;
					counter <= counter + 1;
				end
				126: begin
					bfly_di1 <= wr241;
					bfly_di2 <= wr238;
					i <= 14;
					wr237 <= bfly_do1;
					wr242 <= bfly_do2;
					counter <= counter + 1;
				end
				127: begin
					bfly_di1 <= wr240;
					bfly_di2 <= wr239;
					i <= 15;
					wr238 <= bfly_do1;
					wr241 <= bfly_do2;
					//counter <= counter + 1;
					layer <= 4;
					counter <= 0;
				end
			endcase
		end
		4: begin
			n <= 16;
			case(counter)
				0: begin
					bfly_di1 <= wr0;
					bfly_di2 <= wr15;
					i <= 0;
					wr239 <= bfly_do1;
					wr240 <= bfly_do2;
					counter <= counter + 1;
				end
				1: begin
					bfly_di1 <= wr1;
					bfly_di2 <= wr14;
					i <= 1;
					wr0 <= bfly_do1;
					wr15 <= bfly_do2;
					counter <= counter + 1;
				end
				2: begin
					bfly_di1 <= wr2;
					bfly_di2 <= wr13;
					i <= 2;
					wr1 <= bfly_do1;
					wr14 <= bfly_do2;
					counter <= counter + 1;
				end
				3: begin
					bfly_di1 <= wr3;
					bfly_di2 <= wr12;
					i <= 3;
					wr2 <= bfly_do1;
					wr13 <= bfly_do2;
					counter <= counter + 1;
				end
				4: begin
					bfly_di1 <= wr4;
					bfly_di2 <= wr11;
					i <= 4;
					wr3 <= bfly_do1;
					wr12 <= bfly_do2;
					counter <= counter + 1;
				end
				5: begin
					bfly_di1 <= wr5;
					bfly_di2 <= wr10;
					i <= 5;
					wr4 <= bfly_do1;
					wr11 <= bfly_do2;
					counter <= counter + 1;
				end
				6: begin
					bfly_di1 <= wr6;
					bfly_di2 <= wr9;
					i <= 6;
					wr5 <= bfly_do1;
					wr10 <= bfly_do2;
					counter <= counter + 1;
				end
				7: begin
					bfly_di1 <= wr7;
					bfly_di2 <= wr8;
					i <= 7;
					wr6 <= bfly_do1;
					wr9 <= bfly_do2;
					counter <= counter + 1;
				end
				8: begin
					bfly_di1 <= wr31;
					bfly_di2 <= wr16;
					i <= 0;
					wr7 <= bfly_do1;
					wr8 <= bfly_do2;
					counter <= counter + 1;
				end
				9: begin
					bfly_di1 <= wr30;
					bfly_di2 <= wr17;
					i <= 1;
					wr16 <= bfly_do1;
					wr31 <= bfly_do2;
					counter <= counter + 1;
				end
				10: begin
					bfly_di1 <= wr29;
					bfly_di2 <= wr18;
					i <= 2;
					wr17 <= bfly_do1;
					wr30 <= bfly_do2;
					counter <= counter + 1;
				end
				11: begin
					bfly_di1 <= wr28;
					bfly_di2 <= wr19;
					i <= 3;
					wr18 <= bfly_do1;
					wr29 <= bfly_do2;
					counter <= counter + 1;
				end
				12: begin
					bfly_di1 <= wr27;
					bfly_di2 <= wr20;
					i <= 4;
					wr19 <= bfly_do1;
					wr28 <= bfly_do2;
					counter <= counter + 1;
				end
				13: begin
					bfly_di1 <= wr26;
					bfly_di2 <= wr21;
					i <= 5;
					wr20 <= bfly_do1;
					wr27 <= bfly_do2;
					counter <= counter + 1;
				end
				14: begin
					bfly_di1 <= wr25;
					bfly_di2 <= wr22;
					i <= 6;
					wr21 <= bfly_do1;
					wr26 <= bfly_do2;
					counter <= counter + 1;
				end
				15: begin
					bfly_di1 <= wr24;
					bfly_di2 <= wr23;
					i <= 7;
					wr22 <= bfly_do1;
					wr25 <= bfly_do2;
					counter <= counter + 1;
				end
				16: begin
					bfly_di1 <= wr32;
					bfly_di2 <= wr47;
					i <= 0;
					wr23 <= bfly_do1;
					wr24 <= bfly_do2;
					counter <= counter + 1;
				end
				17: begin
					bfly_di1 <= wr33;
					bfly_di2 <= wr46;
					i <= 1;
					wr32 <= bfly_do1;
					wr47 <= bfly_do2;
					counter <= counter + 1;
				end
				18: begin
					bfly_di1 <= wr34;
					bfly_di2 <= wr45;
					i <= 2;
					wr33 <= bfly_do1;
					wr46 <= bfly_do2;
					counter <= counter + 1;
				end
				19: begin
					bfly_di1 <= wr35;
					bfly_di2 <= wr44;
					i <= 3;
					wr34 <= bfly_do1;
					wr45 <= bfly_do2;
					counter <= counter + 1;
				end
				20: begin
					bfly_di1 <= wr36;
					bfly_di2 <= wr43;
					i <= 4;
					wr35 <= bfly_do1;
					wr44 <= bfly_do2;
					counter <= counter + 1;
				end
				21: begin
					bfly_di1 <= wr37;
					bfly_di2 <= wr42;
					i <= 5;
					wr36 <= bfly_do1;
					wr43 <= bfly_do2;
					counter <= counter + 1;
				end
				22: begin
					bfly_di1 <= wr38;
					bfly_di2 <= wr41;
					i <= 6;
					wr37 <= bfly_do1;
					wr42 <= bfly_do2;
					counter <= counter + 1;
				end
				23: begin
					bfly_di1 <= wr39;
					bfly_di2 <= wr40;
					i <= 7;
					wr38 <= bfly_do1;
					wr41 <= bfly_do2;
					counter <= counter + 1;
				end
				24: begin
					bfly_di1 <= wr63;
					bfly_di2 <= wr48;
					i <= 0;
					wr39 <= bfly_do1;
					wr40 <= bfly_do2;
					counter <= counter + 1;
				end
				25: begin
					bfly_di1 <= wr62;
					bfly_di2 <= wr49;
					i <= 1;
					wr48 <= bfly_do1;
					wr63 <= bfly_do2;
					counter <= counter + 1;
				end
				26: begin
					bfly_di1 <= wr61;
					bfly_di2 <= wr50;
					i <= 2;
					wr49 <= bfly_do1;
					wr62 <= bfly_do2;
					counter <= counter + 1;
				end
				27: begin
					bfly_di1 <= wr60;
					bfly_di2 <= wr51;
					i <= 3;
					wr50 <= bfly_do1;
					wr61 <= bfly_do2;
					counter <= counter + 1;
				end
				28: begin
					bfly_di1 <= wr59;
					bfly_di2 <= wr52;
					i <= 4;
					wr51 <= bfly_do1;
					wr60 <= bfly_do2;
					counter <= counter + 1;
				end
				29: begin
					bfly_di1 <= wr58;
					bfly_di2 <= wr53;
					i <= 5;
					wr52 <= bfly_do1;
					wr59 <= bfly_do2;
					counter <= counter + 1;
				end
				30: begin
					bfly_di1 <= wr57;
					bfly_di2 <= wr54;
					i <= 6;
					wr53 <= bfly_do1;
					wr58 <= bfly_do2;
					counter <= counter + 1;
				end
				31: begin
					bfly_di1 <= wr56;
					bfly_di2 <= wr55;
					i <= 7;
					wr54 <= bfly_do1;
					wr57 <= bfly_do2;
					counter <= counter + 1;
				end
				32: begin
					bfly_di1 <= wr64;
					bfly_di2 <= wr79;
					i <= 0;
					wr55 <= bfly_do1;
					wr56 <= bfly_do2;
					counter <= counter + 1;
				end
				33: begin
					bfly_di1 <= wr65;
					bfly_di2 <= wr78;
					i <= 1;
					wr64 <= bfly_do1;
					wr79 <= bfly_do2;
					counter <= counter + 1;
				end
				34: begin
					bfly_di1 <= wr66;
					bfly_di2 <= wr77;
					i <= 2;
					wr65 <= bfly_do1;
					wr78 <= bfly_do2;
					counter <= counter + 1;
				end
				35: begin
					bfly_di1 <= wr67;
					bfly_di2 <= wr76;
					i <= 3;
					wr66 <= bfly_do1;
					wr77 <= bfly_do2;
					counter <= counter + 1;
				end
				36: begin
					bfly_di1 <= wr68;
					bfly_di2 <= wr75;
					i <= 4;
					wr67 <= bfly_do1;
					wr76 <= bfly_do2;
					counter <= counter + 1;
				end
				37: begin
					bfly_di1 <= wr69;
					bfly_di2 <= wr74;
					i <= 5;
					wr68 <= bfly_do1;
					wr75 <= bfly_do2;
					counter <= counter + 1;
				end
				38: begin
					bfly_di1 <= wr70;
					bfly_di2 <= wr73;
					i <= 6;
					wr69 <= bfly_do1;
					wr74 <= bfly_do2;
					counter <= counter + 1;
				end
				39: begin
					bfly_di1 <= wr71;
					bfly_di2 <= wr72;
					i <= 7;
					wr70 <= bfly_do1;
					wr73 <= bfly_do2;
					counter <= counter + 1;
				end
				40: begin
					bfly_di1 <= wr95;
					bfly_di2 <= wr80;
					i <= 0;
					wr71 <= bfly_do1;
					wr72 <= bfly_do2;
					counter <= counter + 1;
				end
				41: begin
					bfly_di1 <= wr94;
					bfly_di2 <= wr81;
					i <= 1;
					wr80 <= bfly_do1;
					wr95 <= bfly_do2;
					counter <= counter + 1;
				end
				42: begin
					bfly_di1 <= wr93;
					bfly_di2 <= wr82;
					i <= 2;
					wr81 <= bfly_do1;
					wr94 <= bfly_do2;
					counter <= counter + 1;
				end
				43: begin
					bfly_di1 <= wr92;
					bfly_di2 <= wr83;
					i <= 3;
					wr82 <= bfly_do1;
					wr93 <= bfly_do2;
					counter <= counter + 1;
				end
				44: begin
					bfly_di1 <= wr91;
					bfly_di2 <= wr84;
					i <= 4;
					wr83 <= bfly_do1;
					wr92 <= bfly_do2;
					counter <= counter + 1;
				end
				45: begin
					bfly_di1 <= wr90;
					bfly_di2 <= wr85;
					i <= 5;
					wr84 <= bfly_do1;
					wr91 <= bfly_do2;
					counter <= counter + 1;
				end
				46: begin
					bfly_di1 <= wr89;
					bfly_di2 <= wr86;
					i <= 6;
					wr85 <= bfly_do1;
					wr90 <= bfly_do2;
					counter <= counter + 1;
				end
				47: begin
					bfly_di1 <= wr88;
					bfly_di2 <= wr87;
					i <= 7;
					wr86 <= bfly_do1;
					wr89 <= bfly_do2;
					counter <= counter + 1;
				end
				48: begin
					bfly_di1 <= wr96;
					bfly_di2 <= wr111;
					i <= 0;
					wr87 <= bfly_do1;
					wr88 <= bfly_do2;
					counter <= counter + 1;
				end
				49: begin
					bfly_di1 <= wr97;
					bfly_di2 <= wr110;
					i <= 1;
					wr96 <= bfly_do1;
					wr111 <= bfly_do2;
					counter <= counter + 1;
				end
				50: begin
					bfly_di1 <= wr98;
					bfly_di2 <= wr109;
					i <= 2;
					wr97 <= bfly_do1;
					wr110 <= bfly_do2;
					counter <= counter + 1;
				end
				51: begin
					bfly_di1 <= wr99;
					bfly_di2 <= wr108;
					i <= 3;
					wr98 <= bfly_do1;
					wr109 <= bfly_do2;
					counter <= counter + 1;
				end
				52: begin
					bfly_di1 <= wr100;
					bfly_di2 <= wr107;
					i <= 4;
					wr99 <= bfly_do1;
					wr108 <= bfly_do2;
					counter <= counter + 1;
				end
				53: begin
					bfly_di1 <= wr101;
					bfly_di2 <= wr106;
					i <= 5;
					wr100 <= bfly_do1;
					wr107 <= bfly_do2;
					counter <= counter + 1;
				end
				54: begin
					bfly_di1 <= wr102;
					bfly_di2 <= wr105;
					i <= 6;
					wr101 <= bfly_do1;
					wr106 <= bfly_do2;
					counter <= counter + 1;
				end
				55: begin
					bfly_di1 <= wr103;
					bfly_di2 <= wr104;
					i <= 7;
					wr102 <= bfly_do1;
					wr105 <= bfly_do2;
					counter <= counter + 1;
				end
				56: begin
					bfly_di1 <= wr127;
					bfly_di2 <= wr112;
					i <= 0;
					wr103 <= bfly_do1;
					wr104 <= bfly_do2;
					counter <= counter + 1;
				end
				57: begin
					bfly_di1 <= wr126;
					bfly_di2 <= wr113;
					i <= 1;
					wr112 <= bfly_do1;
					wr127 <= bfly_do2;
					counter <= counter + 1;
				end
				58: begin
					bfly_di1 <= wr125;
					bfly_di2 <= wr114;
					i <= 2;
					wr113 <= bfly_do1;
					wr126 <= bfly_do2;
					counter <= counter + 1;
				end
				59: begin
					bfly_di1 <= wr124;
					bfly_di2 <= wr115;
					i <= 3;
					wr114 <= bfly_do1;
					wr125 <= bfly_do2;
					counter <= counter + 1;
				end
				60: begin
					bfly_di1 <= wr123;
					bfly_di2 <= wr116;
					i <= 4;
					wr115 <= bfly_do1;
					wr124 <= bfly_do2;
					counter <= counter + 1;
				end
				61: begin
					bfly_di1 <= wr122;
					bfly_di2 <= wr117;
					i <= 5;
					wr116 <= bfly_do1;
					wr123 <= bfly_do2;
					counter <= counter + 1;
				end
				62: begin
					bfly_di1 <= wr121;
					bfly_di2 <= wr118;
					i <= 6;
					wr117 <= bfly_do1;
					wr122 <= bfly_do2;
					counter <= counter + 1;
				end
				63: begin
					bfly_di1 <= wr120;
					bfly_di2 <= wr119;
					i <= 7;
					wr118 <= bfly_do1;
					wr121 <= bfly_do2;
					counter <= counter + 1;
				end
				64: begin
					bfly_di1 <= wr128;
					bfly_di2 <= wr143;
					i <= 0;
					wr119 <= bfly_do1;
					wr120 <= bfly_do2;
					counter <= counter + 1;
				end
				65: begin
					bfly_di1 <= wr129;
					bfly_di2 <= wr142;
					i <= 1;
					wr128 <= bfly_do1;
					wr143 <= bfly_do2;
					counter <= counter + 1;
				end
				66: begin
					bfly_di1 <= wr130;
					bfly_di2 <= wr141;
					i <= 2;
					wr129 <= bfly_do1;
					wr142 <= bfly_do2;
					counter <= counter + 1;
				end
				67: begin
					bfly_di1 <= wr131;
					bfly_di2 <= wr140;
					i <= 3;
					wr130 <= bfly_do1;
					wr141 <= bfly_do2;
					counter <= counter + 1;
				end
				68: begin
					bfly_di1 <= wr132;
					bfly_di2 <= wr139;
					i <= 4;
					wr131 <= bfly_do1;
					wr140 <= bfly_do2;
					counter <= counter + 1;
				end
				69: begin
					bfly_di1 <= wr133;
					bfly_di2 <= wr138;
					i <= 5;
					wr132 <= bfly_do1;
					wr139 <= bfly_do2;
					counter <= counter + 1;
				end
				70: begin
					bfly_di1 <= wr134;
					bfly_di2 <= wr137;
					i <= 6;
					wr133 <= bfly_do1;
					wr138 <= bfly_do2;
					counter <= counter + 1;
				end
				71: begin
					bfly_di1 <= wr135;
					bfly_di2 <= wr136;
					i <= 7;
					wr134 <= bfly_do1;
					wr137 <= bfly_do2;
					counter <= counter + 1;
				end
				72: begin
					bfly_di1 <= wr159;
					bfly_di2 <= wr144;
					i <= 0;
					wr135 <= bfly_do1;
					wr136 <= bfly_do2;
					counter <= counter + 1;
				end
				73: begin
					bfly_di1 <= wr158;
					bfly_di2 <= wr145;
					i <= 1;
					wr144 <= bfly_do1;
					wr159 <= bfly_do2;
					counter <= counter + 1;
				end
				74: begin
					bfly_di1 <= wr157;
					bfly_di2 <= wr146;
					i <= 2;
					wr145 <= bfly_do1;
					wr158 <= bfly_do2;
					counter <= counter + 1;
				end
				75: begin
					bfly_di1 <= wr156;
					bfly_di2 <= wr147;
					i <= 3;
					wr146 <= bfly_do1;
					wr157 <= bfly_do2;
					counter <= counter + 1;
				end
				76: begin
					bfly_di1 <= wr155;
					bfly_di2 <= wr148;
					i <= 4;
					wr147 <= bfly_do1;
					wr156 <= bfly_do2;
					counter <= counter + 1;
				end
				77: begin
					bfly_di1 <= wr154;
					bfly_di2 <= wr149;
					i <= 5;
					wr148 <= bfly_do1;
					wr155 <= bfly_do2;
					counter <= counter + 1;
				end
				78: begin
					bfly_di1 <= wr153;
					bfly_di2 <= wr150;
					i <= 6;
					wr149 <= bfly_do1;
					wr154 <= bfly_do2;
					counter <= counter + 1;
				end
				79: begin
					bfly_di1 <= wr152;
					bfly_di2 <= wr151;
					i <= 7;
					wr150 <= bfly_do1;
					wr153 <= bfly_do2;
					counter <= counter + 1;
				end
				80: begin
					bfly_di1 <= wr160;
					bfly_di2 <= wr175;
					i <= 0;
					wr151 <= bfly_do1;
					wr152 <= bfly_do2;
					counter <= counter + 1;
				end
				81: begin
					bfly_di1 <= wr161;
					bfly_di2 <= wr174;
					i <= 1;
					wr160 <= bfly_do1;
					wr175 <= bfly_do2;
					counter <= counter + 1;
				end
				82: begin
					bfly_di1 <= wr162;
					bfly_di2 <= wr173;
					i <= 2;
					wr161 <= bfly_do1;
					wr174 <= bfly_do2;
					counter <= counter + 1;
				end
				83: begin
					bfly_di1 <= wr163;
					bfly_di2 <= wr172;
					i <= 3;
					wr162 <= bfly_do1;
					wr173 <= bfly_do2;
					counter <= counter + 1;
				end
				84: begin
					bfly_di1 <= wr164;
					bfly_di2 <= wr171;
					i <= 4;
					wr163 <= bfly_do1;
					wr172 <= bfly_do2;
					counter <= counter + 1;
				end
				85: begin
					bfly_di1 <= wr165;
					bfly_di2 <= wr170;
					i <= 5;
					wr164 <= bfly_do1;
					wr171 <= bfly_do2;
					counter <= counter + 1;
				end
				86: begin
					bfly_di1 <= wr166;
					bfly_di2 <= wr169;
					i <= 6;
					wr165 <= bfly_do1;
					wr170 <= bfly_do2;
					counter <= counter + 1;
				end
				87: begin
					bfly_di1 <= wr167;
					bfly_di2 <= wr168;
					i <= 7;
					wr166 <= bfly_do1;
					wr169 <= bfly_do2;
					counter <= counter + 1;
				end
				88: begin
					bfly_di1 <= wr191;
					bfly_di2 <= wr176;
					i <= 0;
					wr167 <= bfly_do1;
					wr168 <= bfly_do2;
					counter <= counter + 1;
				end
				89: begin
					bfly_di1 <= wr190;
					bfly_di2 <= wr177;
					i <= 1;
					wr176 <= bfly_do1;
					wr191 <= bfly_do2;
					counter <= counter + 1;
				end
				90: begin
					bfly_di1 <= wr189;
					bfly_di2 <= wr178;
					i <= 2;
					wr177 <= bfly_do1;
					wr190 <= bfly_do2;
					counter <= counter + 1;
				end
				91: begin
					bfly_di1 <= wr188;
					bfly_di2 <= wr179;
					i <= 3;
					wr178 <= bfly_do1;
					wr189 <= bfly_do2;
					counter <= counter + 1;
				end
				92: begin
					bfly_di1 <= wr187;
					bfly_di2 <= wr180;
					i <= 4;
					wr179 <= bfly_do1;
					wr188 <= bfly_do2;
					counter <= counter + 1;
				end
				93: begin
					bfly_di1 <= wr186;
					bfly_di2 <= wr181;
					i <= 5;
					wr180 <= bfly_do1;
					wr187 <= bfly_do2;
					counter <= counter + 1;
				end
				94: begin
					bfly_di1 <= wr185;
					bfly_di2 <= wr182;
					i <= 6;
					wr181 <= bfly_do1;
					wr186 <= bfly_do2;
					counter <= counter + 1;
				end
				95: begin
					bfly_di1 <= wr184;
					bfly_di2 <= wr183;
					i <= 7;
					wr182 <= bfly_do1;
					wr185 <= bfly_do2;
					counter <= counter + 1;
				end
				96: begin
					bfly_di1 <= wr192;
					bfly_di2 <= wr207;
					i <= 0;
					wr183 <= bfly_do1;
					wr184 <= bfly_do2;
					counter <= counter + 1;
				end
				97: begin
					bfly_di1 <= wr193;
					bfly_di2 <= wr206;
					i <= 1;
					wr192 <= bfly_do1;
					wr207 <= bfly_do2;
					counter <= counter + 1;
				end
				98: begin
					bfly_di1 <= wr194;
					bfly_di2 <= wr205;
					i <= 2;
					wr193 <= bfly_do1;
					wr206 <= bfly_do2;
					counter <= counter + 1;
				end
				99: begin
					bfly_di1 <= wr195;
					bfly_di2 <= wr204;
					i <= 3;
					wr194 <= bfly_do1;
					wr205 <= bfly_do2;
					counter <= counter + 1;
				end
				100: begin
					bfly_di1 <= wr196;
					bfly_di2 <= wr203;
					i <= 4;
					wr195 <= bfly_do1;
					wr204 <= bfly_do2;
					counter <= counter + 1;
				end
				101: begin
					bfly_di1 <= wr197;
					bfly_di2 <= wr202;
					i <= 5;
					wr196 <= bfly_do1;
					wr203 <= bfly_do2;
					counter <= counter + 1;
				end
				102: begin
					bfly_di1 <= wr198;
					bfly_di2 <= wr201;
					i <= 6;
					wr197 <= bfly_do1;
					wr202 <= bfly_do2;
					counter <= counter + 1;
				end
				103: begin
					bfly_di1 <= wr199;
					bfly_di2 <= wr200;
					i <= 7;
					wr198 <= bfly_do1;
					wr201 <= bfly_do2;
					counter <= counter + 1;
				end
				104: begin
					bfly_di1 <= wr223;
					bfly_di2 <= wr208;
					i <= 0;
					wr199 <= bfly_do1;
					wr200 <= bfly_do2;
					counter <= counter + 1;
				end
				105: begin
					bfly_di1 <= wr222;
					bfly_di2 <= wr209;
					i <= 1;
					wr208 <= bfly_do1;
					wr223 <= bfly_do2;
					counter <= counter + 1;
				end
				106: begin
					bfly_di1 <= wr221;
					bfly_di2 <= wr210;
					i <= 2;
					wr209 <= bfly_do1;
					wr222 <= bfly_do2;
					counter <= counter + 1;
				end
				107: begin
					bfly_di1 <= wr220;
					bfly_di2 <= wr211;
					i <= 3;
					wr210 <= bfly_do1;
					wr221 <= bfly_do2;
					counter <= counter + 1;
				end
				108: begin
					bfly_di1 <= wr219;
					bfly_di2 <= wr212;
					i <= 4;
					wr211 <= bfly_do1;
					wr220 <= bfly_do2;
					counter <= counter + 1;
				end
				109: begin
					bfly_di1 <= wr218;
					bfly_di2 <= wr213;
					i <= 5;
					wr212 <= bfly_do1;
					wr219 <= bfly_do2;
					counter <= counter + 1;
				end
				110: begin
					bfly_di1 <= wr217;
					bfly_di2 <= wr214;
					i <= 6;
					wr213 <= bfly_do1;
					wr218 <= bfly_do2;
					counter <= counter + 1;
				end
				111: begin
					bfly_di1 <= wr216;
					bfly_di2 <= wr215;
					i <= 7;
					wr214 <= bfly_do1;
					wr217 <= bfly_do2;
					counter <= counter + 1;
				end
				112: begin
					bfly_di1 <= wr224;
					bfly_di2 <= wr239;
					i <= 0;
					wr215 <= bfly_do1;
					wr216 <= bfly_do2;
					counter <= counter + 1;
				end
				113: begin
					bfly_di1 <= wr225;
					bfly_di2 <= wr238;
					i <= 1;
					wr224 <= bfly_do1;
					wr239 <= bfly_do2;
					counter <= counter + 1;
				end
				114: begin
					bfly_di1 <= wr226;
					bfly_di2 <= wr237;
					i <= 2;
					wr225 <= bfly_do1;
					wr238 <= bfly_do2;
					counter <= counter + 1;
				end
				115: begin
					bfly_di1 <= wr227;
					bfly_di2 <= wr236;
					i <= 3;
					wr226 <= bfly_do1;
					wr237 <= bfly_do2;
					counter <= counter + 1;
				end
				116: begin
					bfly_di1 <= wr228;
					bfly_di2 <= wr235;
					i <= 4;
					wr227 <= bfly_do1;
					wr236 <= bfly_do2;
					counter <= counter + 1;
				end
				117: begin
					bfly_di1 <= wr229;
					bfly_di2 <= wr234;
					i <= 5;
					wr228 <= bfly_do1;
					wr235 <= bfly_do2;
					counter <= counter + 1;
				end
				118: begin
					bfly_di1 <= wr230;
					bfly_di2 <= wr233;
					i <= 6;
					wr229 <= bfly_do1;
					wr234 <= bfly_do2;
					counter <= counter + 1;
				end
				119: begin
					bfly_di1 <= wr231;
					bfly_di2 <= wr232;
					i <= 7;
					wr230 <= bfly_do1;
					wr233 <= bfly_do2;
					counter <= counter + 1;
				end
				120: begin
					bfly_di1 <= wr255;
					bfly_di2 <= wr240;
					i <= 0;
					wr231 <= bfly_do1;
					wr232 <= bfly_do2;
					counter <= counter + 1;
				end
				121: begin
					bfly_di1 <= wr254;
					bfly_di2 <= wr241;
					i <= 1;
					wr240 <= bfly_do1;
					wr255 <= bfly_do2;
					counter <= counter + 1;
				end
				122: begin
					bfly_di1 <= wr253;
					bfly_di2 <= wr242;
					i <= 2;
					wr241 <= bfly_do1;
					wr254 <= bfly_do2;
					counter <= counter + 1;
				end
				123: begin
					bfly_di1 <= wr252;
					bfly_di2 <= wr243;
					i <= 3;
					wr242 <= bfly_do1;
					wr253 <= bfly_do2;
					counter <= counter + 1;
				end
				124: begin
					bfly_di1 <= wr251;
					bfly_di2 <= wr244;
					i <= 4;
					wr243 <= bfly_do1;
					wr252 <= bfly_do2;
					counter <= counter + 1;
				end
				125: begin
					bfly_di1 <= wr250;
					bfly_di2 <= wr245;
					i <= 5;
					wr244 <= bfly_do1;
					wr251 <= bfly_do2;
					counter <= counter + 1;
				end
				126: begin
					bfly_di1 <= wr249;
					bfly_di2 <= wr246;
					i <= 6;
					wr245 <= bfly_do1;
					wr250 <= bfly_do2;
					counter <= counter + 1;
				end
				127: begin
					bfly_di1 <= wr248;
					bfly_di2 <= wr247;
					i <= 7;
					wr246 <= bfly_do1;
					wr249 <= bfly_do2;
					//counter <= counter + 1;
					layer <= 5;
					counter <= 0;
				end
			endcase
		end
		5: begin
			n <= 8;
			case(counter)
				0: begin
					bfly_di1 <= wr0;
					bfly_di2 <= wr7;
					i <= 0;
					wr247 <= bfly_do1;
					wr248 <= bfly_do2;
					counter <= counter + 1;
				end
				1: begin
					bfly_di1 <= wr1;
					bfly_di2 <= wr6;
					i <= 1;
					wr0 <= bfly_do1;
					wr7 <= bfly_do2;
					counter <= counter + 1;
				end
				2: begin
					bfly_di1 <= wr2;
					bfly_di2 <= wr5;
					i <= 2;
					wr1 <= bfly_do1;
					wr6 <= bfly_do2;
					counter <= counter + 1;
				end
				3: begin
					bfly_di1 <= wr3;
					bfly_di2 <= wr4;
					i <= 3;
					wr2 <= bfly_do1;
					wr5 <= bfly_do2;
					counter <= counter + 1;
				end
				4: begin
					bfly_di1 <= wr15;
					bfly_di2 <= wr8;
					i <= 0;
					wr3 <= bfly_do1;
					wr4 <= bfly_do2;
					counter <= counter + 1;
				end
				5: begin
					bfly_di1 <= wr14;
					bfly_di2 <= wr9;
					i <= 1;
					wr8 <= bfly_do1;
					wr15 <= bfly_do2;
					counter <= counter + 1;
				end
				6: begin
					bfly_di1 <= wr13;
					bfly_di2 <= wr10;
					i <= 2;
					wr9 <= bfly_do1;
					wr14 <= bfly_do2;
					counter <= counter + 1;
				end
				7: begin
					bfly_di1 <= wr12;
					bfly_di2 <= wr11;
					i <= 3;
					wr10 <= bfly_do1;
					wr13 <= bfly_do2;
					counter <= counter + 1;
				end
				8: begin
					bfly_di1 <= wr16;
					bfly_di2 <= wr23;
					i <= 0;
					wr11 <= bfly_do1;
					wr12 <= bfly_do2;
					counter <= counter + 1;
				end
				9: begin
					bfly_di1 <= wr17;
					bfly_di2 <= wr22;
					i <= 1;
					wr16 <= bfly_do1;
					wr23 <= bfly_do2;
					counter <= counter + 1;
				end
				10: begin
					bfly_di1 <= wr18;
					bfly_di2 <= wr21;
					i <= 2;
					wr17 <= bfly_do1;
					wr22 <= bfly_do2;
					counter <= counter + 1;
				end
				11: begin
					bfly_di1 <= wr19;
					bfly_di2 <= wr20;
					i <= 3;
					wr18 <= bfly_do1;
					wr21 <= bfly_do2;
					counter <= counter + 1;
				end
				12: begin
					bfly_di1 <= wr31;
					bfly_di2 <= wr24;
					i <= 0;
					wr19 <= bfly_do1;
					wr20 <= bfly_do2;
					counter <= counter + 1;
				end
				13: begin
					bfly_di1 <= wr30;
					bfly_di2 <= wr25;
					i <= 1;
					wr24 <= bfly_do1;
					wr31 <= bfly_do2;
					counter <= counter + 1;
				end
				14: begin
					bfly_di1 <= wr29;
					bfly_di2 <= wr26;
					i <= 2;
					wr25 <= bfly_do1;
					wr30 <= bfly_do2;
					counter <= counter + 1;
				end
				15: begin
					bfly_di1 <= wr28;
					bfly_di2 <= wr27;
					i <= 3;
					wr26 <= bfly_do1;
					wr29 <= bfly_do2;
					counter <= counter + 1;
				end
				16: begin
					bfly_di1 <= wr32;
					bfly_di2 <= wr39;
					i <= 0;
					wr27 <= bfly_do1;
					wr28 <= bfly_do2;
					counter <= counter + 1;
				end
				17: begin
					bfly_di1 <= wr33;
					bfly_di2 <= wr38;
					i <= 1;
					wr32 <= bfly_do1;
					wr39 <= bfly_do2;
					counter <= counter + 1;
				end
				18: begin
					bfly_di1 <= wr34;
					bfly_di2 <= wr37;
					i <= 2;
					wr33 <= bfly_do1;
					wr38 <= bfly_do2;
					counter <= counter + 1;
				end
				19: begin
					bfly_di1 <= wr35;
					bfly_di2 <= wr36;
					i <= 3;
					wr34 <= bfly_do1;
					wr37 <= bfly_do2;
					counter <= counter + 1;
				end
				20: begin
					bfly_di1 <= wr47;
					bfly_di2 <= wr40;
					i <= 0;
					wr35 <= bfly_do1;
					wr36 <= bfly_do2;
					counter <= counter + 1;
				end
				21: begin
					bfly_di1 <= wr46;
					bfly_di2 <= wr41;
					i <= 1;
					wr40 <= bfly_do1;
					wr47 <= bfly_do2;
					counter <= counter + 1;
				end
				22: begin
					bfly_di1 <= wr45;
					bfly_di2 <= wr42;
					i <= 2;
					wr41 <= bfly_do1;
					wr46 <= bfly_do2;
					counter <= counter + 1;
				end
				23: begin
					bfly_di1 <= wr44;
					bfly_di2 <= wr43;
					i <= 3;
					wr42 <= bfly_do1;
					wr45 <= bfly_do2;
					counter <= counter + 1;
				end
				24: begin
					bfly_di1 <= wr48;
					bfly_di2 <= wr55;
					i <= 0;
					wr43 <= bfly_do1;
					wr44 <= bfly_do2;
					counter <= counter + 1;
				end
				25: begin
					bfly_di1 <= wr49;
					bfly_di2 <= wr54;
					i <= 1;
					wr48 <= bfly_do1;
					wr55 <= bfly_do2;
					counter <= counter + 1;
				end
				26: begin
					bfly_di1 <= wr50;
					bfly_di2 <= wr53;
					i <= 2;
					wr49 <= bfly_do1;
					wr54 <= bfly_do2;
					counter <= counter + 1;
				end
				27: begin
					bfly_di1 <= wr51;
					bfly_di2 <= wr52;
					i <= 3;
					wr50 <= bfly_do1;
					wr53 <= bfly_do2;
					counter <= counter + 1;
				end
				28: begin
					bfly_di1 <= wr63;
					bfly_di2 <= wr56;
					i <= 0;
					wr51 <= bfly_do1;
					wr52 <= bfly_do2;
					counter <= counter + 1;
				end
				29: begin
					bfly_di1 <= wr62;
					bfly_di2 <= wr57;
					i <= 1;
					wr56 <= bfly_do1;
					wr63 <= bfly_do2;
					counter <= counter + 1;
				end
				30: begin
					bfly_di1 <= wr61;
					bfly_di2 <= wr58;
					i <= 2;
					wr57 <= bfly_do1;
					wr62 <= bfly_do2;
					counter <= counter + 1;
				end
				31: begin
					bfly_di1 <= wr60;
					bfly_di2 <= wr59;
					i <= 3;
					wr58 <= bfly_do1;
					wr61 <= bfly_do2;
					counter <= counter + 1;
				end
				32: begin
					bfly_di1 <= wr64;
					bfly_di2 <= wr71;
					i <= 0;
					wr59 <= bfly_do1;
					wr60 <= bfly_do2;
					counter <= counter + 1;
				end
				33: begin
					bfly_di1 <= wr65;
					bfly_di2 <= wr70;
					i <= 1;
					wr64 <= bfly_do1;
					wr71 <= bfly_do2;
					counter <= counter + 1;
				end
				34: begin
					bfly_di1 <= wr66;
					bfly_di2 <= wr69;
					i <= 2;
					wr65 <= bfly_do1;
					wr70 <= bfly_do2;
					counter <= counter + 1;
				end
				35: begin
					bfly_di1 <= wr67;
					bfly_di2 <= wr68;
					i <= 3;
					wr66 <= bfly_do1;
					wr69 <= bfly_do2;
					counter <= counter + 1;
				end
				36: begin
					bfly_di1 <= wr79;
					bfly_di2 <= wr72;
					i <= 0;
					wr67 <= bfly_do1;
					wr68 <= bfly_do2;
					counter <= counter + 1;
				end
				37: begin
					bfly_di1 <= wr78;
					bfly_di2 <= wr73;
					i <= 1;
					wr72 <= bfly_do1;
					wr79 <= bfly_do2;
					counter <= counter + 1;
				end
				38: begin
					bfly_di1 <= wr77;
					bfly_di2 <= wr74;
					i <= 2;
					wr73 <= bfly_do1;
					wr78 <= bfly_do2;
					counter <= counter + 1;
				end
				39: begin
					bfly_di1 <= wr76;
					bfly_di2 <= wr75;
					i <= 3;
					wr74 <= bfly_do1;
					wr77 <= bfly_do2;
					counter <= counter + 1;
				end
				40: begin
					bfly_di1 <= wr80;
					bfly_di2 <= wr87;
					i <= 0;
					wr75 <= bfly_do1;
					wr76 <= bfly_do2;
					counter <= counter + 1;
				end
				41: begin
					bfly_di1 <= wr81;
					bfly_di2 <= wr86;
					i <= 1;
					wr80 <= bfly_do1;
					wr87 <= bfly_do2;
					counter <= counter + 1;
				end
				42: begin
					bfly_di1 <= wr82;
					bfly_di2 <= wr85;
					i <= 2;
					wr81 <= bfly_do1;
					wr86 <= bfly_do2;
					counter <= counter + 1;
				end
				43: begin
					bfly_di1 <= wr83;
					bfly_di2 <= wr84;
					i <= 3;
					wr82 <= bfly_do1;
					wr85 <= bfly_do2;
					counter <= counter + 1;
				end
				44: begin
					bfly_di1 <= wr95;
					bfly_di2 <= wr88;
					i <= 0;
					wr83 <= bfly_do1;
					wr84 <= bfly_do2;
					counter <= counter + 1;
				end
				45: begin
					bfly_di1 <= wr94;
					bfly_di2 <= wr89;
					i <= 1;
					wr88 <= bfly_do1;
					wr95 <= bfly_do2;
					counter <= counter + 1;
				end
				46: begin
					bfly_di1 <= wr93;
					bfly_di2 <= wr90;
					i <= 2;
					wr89 <= bfly_do1;
					wr94 <= bfly_do2;
					counter <= counter + 1;
				end
				47: begin
					bfly_di1 <= wr92;
					bfly_di2 <= wr91;
					i <= 3;
					wr90 <= bfly_do1;
					wr93 <= bfly_do2;
					counter <= counter + 1;
				end
				48: begin
					bfly_di1 <= wr96;
					bfly_di2 <= wr103;
					i <= 0;
					wr91 <= bfly_do1;
					wr92 <= bfly_do2;
					counter <= counter + 1;
				end
				49: begin
					bfly_di1 <= wr97;
					bfly_di2 <= wr102;
					i <= 1;
					wr96 <= bfly_do1;
					wr103 <= bfly_do2;
					counter <= counter + 1;
				end
				50: begin
					bfly_di1 <= wr98;
					bfly_di2 <= wr101;
					i <= 2;
					wr97 <= bfly_do1;
					wr102 <= bfly_do2;
					counter <= counter + 1;
				end
				51: begin
					bfly_di1 <= wr99;
					bfly_di2 <= wr100;
					i <= 3;
					wr98 <= bfly_do1;
					wr101 <= bfly_do2;
					counter <= counter + 1;
				end
				52: begin
					bfly_di1 <= wr111;
					bfly_di2 <= wr104;
					i <= 0;
					wr99 <= bfly_do1;
					wr100 <= bfly_do2;
					counter <= counter + 1;
				end
				53: begin
					bfly_di1 <= wr110;
					bfly_di2 <= wr105;
					i <= 1;
					wr104 <= bfly_do1;
					wr111 <= bfly_do2;
					counter <= counter + 1;
				end
				54: begin
					bfly_di1 <= wr109;
					bfly_di2 <= wr106;
					i <= 2;
					wr105 <= bfly_do1;
					wr110 <= bfly_do2;
					counter <= counter + 1;
				end
				55: begin
					bfly_di1 <= wr108;
					bfly_di2 <= wr107;
					i <= 3;
					wr106 <= bfly_do1;
					wr109 <= bfly_do2;
					counter <= counter + 1;
				end
				56: begin
					bfly_di1 <= wr112;
					bfly_di2 <= wr119;
					i <= 0;
					wr107 <= bfly_do1;
					wr108 <= bfly_do2;
					counter <= counter + 1;
				end
				57: begin
					bfly_di1 <= wr113;
					bfly_di2 <= wr118;
					i <= 1;
					wr112 <= bfly_do1;
					wr119 <= bfly_do2;
					counter <= counter + 1;
				end
				58: begin
					bfly_di1 <= wr114;
					bfly_di2 <= wr117;
					i <= 2;
					wr113 <= bfly_do1;
					wr118 <= bfly_do2;
					counter <= counter + 1;
				end
				59: begin
					bfly_di1 <= wr115;
					bfly_di2 <= wr116;
					i <= 3;
					wr114 <= bfly_do1;
					wr117 <= bfly_do2;
					counter <= counter + 1;
				end
				60: begin
					bfly_di1 <= wr127;
					bfly_di2 <= wr120;
					i <= 0;
					wr115 <= bfly_do1;
					wr116 <= bfly_do2;
					counter <= counter + 1;
				end
				61: begin
					bfly_di1 <= wr126;
					bfly_di2 <= wr121;
					i <= 1;
					wr120 <= bfly_do1;
					wr127 <= bfly_do2;
					counter <= counter + 1;
				end
				62: begin
					bfly_di1 <= wr125;
					bfly_di2 <= wr122;
					i <= 2;
					wr121 <= bfly_do1;
					wr126 <= bfly_do2;
					counter <= counter + 1;
				end
				63: begin
					bfly_di1 <= wr124;
					bfly_di2 <= wr123;
					i <= 3;
					wr122 <= bfly_do1;
					wr125 <= bfly_do2;
					counter <= counter + 1;
				end
				64: begin
					bfly_di1 <= wr128;
					bfly_di2 <= wr135;
					i <= 0;
					wr123 <= bfly_do1;
					wr124 <= bfly_do2;
					counter <= counter + 1;
				end
				65: begin
					bfly_di1 <= wr129;
					bfly_di2 <= wr134;
					i <= 1;
					wr128 <= bfly_do1;
					wr135 <= bfly_do2;
					counter <= counter + 1;
				end
				66: begin
					bfly_di1 <= wr130;
					bfly_di2 <= wr133;
					i <= 2;
					wr129 <= bfly_do1;
					wr134 <= bfly_do2;
					counter <= counter + 1;
				end
				67: begin
					bfly_di1 <= wr131;
					bfly_di2 <= wr132;
					i <= 3;
					wr130 <= bfly_do1;
					wr133 <= bfly_do2;
					counter <= counter + 1;
				end
				68: begin
					bfly_di1 <= wr143;
					bfly_di2 <= wr136;
					i <= 0;
					wr131 <= bfly_do1;
					wr132 <= bfly_do2;
					counter <= counter + 1;
				end
				69: begin
					bfly_di1 <= wr142;
					bfly_di2 <= wr137;
					i <= 1;
					wr136 <= bfly_do1;
					wr143 <= bfly_do2;
					counter <= counter + 1;
				end
				70: begin
					bfly_di1 <= wr141;
					bfly_di2 <= wr138;
					i <= 2;
					wr137 <= bfly_do1;
					wr142 <= bfly_do2;
					counter <= counter + 1;
				end
				71: begin
					bfly_di1 <= wr140;
					bfly_di2 <= wr139;
					i <= 3;
					wr138 <= bfly_do1;
					wr141 <= bfly_do2;
					counter <= counter + 1;
				end
				72: begin
					bfly_di1 <= wr144;
					bfly_di2 <= wr151;
					i <= 0;
					wr139 <= bfly_do1;
					wr140 <= bfly_do2;
					counter <= counter + 1;
				end
				73: begin
					bfly_di1 <= wr145;
					bfly_di2 <= wr150;
					i <= 1;
					wr144 <= bfly_do1;
					wr151 <= bfly_do2;
					counter <= counter + 1;
				end
				74: begin
					bfly_di1 <= wr146;
					bfly_di2 <= wr149;
					i <= 2;
					wr145 <= bfly_do1;
					wr150 <= bfly_do2;
					counter <= counter + 1;
				end
				75: begin
					bfly_di1 <= wr147;
					bfly_di2 <= wr148;
					i <= 3;
					wr146 <= bfly_do1;
					wr149 <= bfly_do2;
					counter <= counter + 1;
				end
				76: begin
					bfly_di1 <= wr159;
					bfly_di2 <= wr152;
					i <= 0;
					wr147 <= bfly_do1;
					wr148 <= bfly_do2;
					counter <= counter + 1;
				end
				77: begin
					bfly_di1 <= wr158;
					bfly_di2 <= wr153;
					i <= 1;
					wr152 <= bfly_do1;
					wr159 <= bfly_do2;
					counter <= counter + 1;
				end
				78: begin
					bfly_di1 <= wr157;
					bfly_di2 <= wr154;
					i <= 2;
					wr153 <= bfly_do1;
					wr158 <= bfly_do2;
					counter <= counter + 1;
				end
				79: begin
					bfly_di1 <= wr156;
					bfly_di2 <= wr155;
					i <= 3;
					wr154 <= bfly_do1;
					wr157 <= bfly_do2;
					counter <= counter + 1;
				end
				80: begin
					bfly_di1 <= wr160;
					bfly_di2 <= wr167;
					i <= 0;
					wr155 <= bfly_do1;
					wr156 <= bfly_do2;
					counter <= counter + 1;
				end
				81: begin
					bfly_di1 <= wr161;
					bfly_di2 <= wr166;
					i <= 1;
					wr160 <= bfly_do1;
					wr167 <= bfly_do2;
					counter <= counter + 1;
				end
				82: begin
					bfly_di1 <= wr162;
					bfly_di2 <= wr165;
					i <= 2;
					wr161 <= bfly_do1;
					wr166 <= bfly_do2;
					counter <= counter + 1;
				end
				83: begin
					bfly_di1 <= wr163;
					bfly_di2 <= wr164;
					i <= 3;
					wr162 <= bfly_do1;
					wr165 <= bfly_do2;
					counter <= counter + 1;
				end
				84: begin
					bfly_di1 <= wr175;
					bfly_di2 <= wr168;
					i <= 0;
					wr163 <= bfly_do1;
					wr164 <= bfly_do2;
					counter <= counter + 1;
				end
				85: begin
					bfly_di1 <= wr174;
					bfly_di2 <= wr169;
					i <= 1;
					wr168 <= bfly_do1;
					wr175 <= bfly_do2;
					counter <= counter + 1;
				end
				86: begin
					bfly_di1 <= wr173;
					bfly_di2 <= wr170;
					i <= 2;
					wr169 <= bfly_do1;
					wr174 <= bfly_do2;
					counter <= counter + 1;
				end
				87: begin
					bfly_di1 <= wr172;
					bfly_di2 <= wr171;
					i <= 3;
					wr170 <= bfly_do1;
					wr173 <= bfly_do2;
					counter <= counter + 1;
				end
				88: begin
					bfly_di1 <= wr176;
					bfly_di2 <= wr183;
					i <= 0;
					wr171 <= bfly_do1;
					wr172 <= bfly_do2;
					counter <= counter + 1;
				end
				89: begin
					bfly_di1 <= wr177;
					bfly_di2 <= wr182;
					i <= 1;
					wr176 <= bfly_do1;
					wr183 <= bfly_do2;
					counter <= counter + 1;
				end
				90: begin
					bfly_di1 <= wr178;
					bfly_di2 <= wr181;
					i <= 2;
					wr177 <= bfly_do1;
					wr182 <= bfly_do2;
					counter <= counter + 1;
				end
				91: begin
					bfly_di1 <= wr179;
					bfly_di2 <= wr180;
					i <= 3;
					wr178 <= bfly_do1;
					wr181 <= bfly_do2;
					counter <= counter + 1;
				end
				92: begin
					bfly_di1 <= wr191;
					bfly_di2 <= wr184;
					i <= 0;
					wr179 <= bfly_do1;
					wr180 <= bfly_do2;
					counter <= counter + 1;
				end
				93: begin
					bfly_di1 <= wr190;
					bfly_di2 <= wr185;
					i <= 1;
					wr184 <= bfly_do1;
					wr191 <= bfly_do2;
					counter <= counter + 1;
				end
				94: begin
					bfly_di1 <= wr189;
					bfly_di2 <= wr186;
					i <= 2;
					wr185 <= bfly_do1;
					wr190 <= bfly_do2;
					counter <= counter + 1;
				end
				95: begin
					bfly_di1 <= wr188;
					bfly_di2 <= wr187;
					i <= 3;
					wr186 <= bfly_do1;
					wr189 <= bfly_do2;
					counter <= counter + 1;
				end
				96: begin
					bfly_di1 <= wr192;
					bfly_di2 <= wr199;
					i <= 0;
					wr187 <= bfly_do1;
					wr188 <= bfly_do2;
					counter <= counter + 1;
				end
				97: begin
					bfly_di1 <= wr193;
					bfly_di2 <= wr198;
					i <= 1;
					wr192 <= bfly_do1;
					wr199 <= bfly_do2;
					counter <= counter + 1;
				end
				98: begin
					bfly_di1 <= wr194;
					bfly_di2 <= wr197;
					i <= 2;
					wr193 <= bfly_do1;
					wr198 <= bfly_do2;
					counter <= counter + 1;
				end
				99: begin
					bfly_di1 <= wr195;
					bfly_di2 <= wr196;
					i <= 3;
					wr194 <= bfly_do1;
					wr197 <= bfly_do2;
					counter <= counter + 1;
				end
				100: begin
					bfly_di1 <= wr207;
					bfly_di2 <= wr200;
					i <= 0;
					wr195 <= bfly_do1;
					wr196 <= bfly_do2;
					counter <= counter + 1;
				end
				101: begin
					bfly_di1 <= wr206;
					bfly_di2 <= wr201;
					i <= 1;
					wr200 <= bfly_do1;
					wr207 <= bfly_do2;
					counter <= counter + 1;
				end
				102: begin
					bfly_di1 <= wr205;
					bfly_di2 <= wr202;
					i <= 2;
					wr201 <= bfly_do1;
					wr206 <= bfly_do2;
					counter <= counter + 1;
				end
				103: begin
					bfly_di1 <= wr204;
					bfly_di2 <= wr203;
					i <= 3;
					wr202 <= bfly_do1;
					wr205 <= bfly_do2;
					counter <= counter + 1;
				end
				104: begin
					bfly_di1 <= wr208;
					bfly_di2 <= wr215;
					i <= 0;
					wr203 <= bfly_do1;
					wr204 <= bfly_do2;
					counter <= counter + 1;
				end
				105: begin
					bfly_di1 <= wr209;
					bfly_di2 <= wr214;
					i <= 1;
					wr208 <= bfly_do1;
					wr215 <= bfly_do2;
					counter <= counter + 1;
				end
				106: begin
					bfly_di1 <= wr210;
					bfly_di2 <= wr213;
					i <= 2;
					wr209 <= bfly_do1;
					wr214 <= bfly_do2;
					counter <= counter + 1;
				end
				107: begin
					bfly_di1 <= wr211;
					bfly_di2 <= wr212;
					i <= 3;
					wr210 <= bfly_do1;
					wr213 <= bfly_do2;
					counter <= counter + 1;
				end
				108: begin
					bfly_di1 <= wr223;
					bfly_di2 <= wr216;
					i <= 0;
					wr211 <= bfly_do1;
					wr212 <= bfly_do2;
					counter <= counter + 1;
				end
				109: begin
					bfly_di1 <= wr222;
					bfly_di2 <= wr217;
					i <= 1;
					wr216 <= bfly_do1;
					wr223 <= bfly_do2;
					counter <= counter + 1;
				end
				110: begin
					bfly_di1 <= wr221;
					bfly_di2 <= wr218;
					i <= 2;
					wr217 <= bfly_do1;
					wr222 <= bfly_do2;
					counter <= counter + 1;
				end
				111: begin
					bfly_di1 <= wr220;
					bfly_di2 <= wr219;
					i <= 3;
					wr218 <= bfly_do1;
					wr221 <= bfly_do2;
					counter <= counter + 1;
				end
				112: begin
					bfly_di1 <= wr224;
					bfly_di2 <= wr231;
					i <= 0;
					wr219 <= bfly_do1;
					wr220 <= bfly_do2;
					counter <= counter + 1;
				end
				113: begin
					bfly_di1 <= wr225;
					bfly_di2 <= wr230;
					i <= 1;
					wr224 <= bfly_do1;
					wr231 <= bfly_do2;
					counter <= counter + 1;
				end
				114: begin
					bfly_di1 <= wr226;
					bfly_di2 <= wr229;
					i <= 2;
					wr225 <= bfly_do1;
					wr230 <= bfly_do2;
					counter <= counter + 1;
				end
				115: begin
					bfly_di1 <= wr227;
					bfly_di2 <= wr228;
					i <= 3;
					wr226 <= bfly_do1;
					wr229 <= bfly_do2;
					counter <= counter + 1;
				end
				116: begin
					bfly_di1 <= wr239;
					bfly_di2 <= wr232;
					i <= 0;
					wr227 <= bfly_do1;
					wr228 <= bfly_do2;
					counter <= counter + 1;
				end
				117: begin
					bfly_di1 <= wr238;
					bfly_di2 <= wr233;
					i <= 1;
					wr232 <= bfly_do1;
					wr239 <= bfly_do2;
					counter <= counter + 1;
				end
				118: begin
					bfly_di1 <= wr237;
					bfly_di2 <= wr234;
					i <= 2;
					wr233 <= bfly_do1;
					wr238 <= bfly_do2;
					counter <= counter + 1;
				end
				119: begin
					bfly_di1 <= wr236;
					bfly_di2 <= wr235;
					i <= 3;
					wr234 <= bfly_do1;
					wr237 <= bfly_do2;
					counter <= counter + 1;
				end
				120: begin
					bfly_di1 <= wr240;
					bfly_di2 <= wr247;
					i <= 0;
					wr235 <= bfly_do1;
					wr236 <= bfly_do2;
					counter <= counter + 1;
				end
				121: begin
					bfly_di1 <= wr241;
					bfly_di2 <= wr246;
					i <= 1;
					wr240 <= bfly_do1;
					wr247 <= bfly_do2;
					counter <= counter + 1;
				end
				122: begin
					bfly_di1 <= wr242;
					bfly_di2 <= wr245;
					i <= 2;
					wr241 <= bfly_do1;
					wr246 <= bfly_do2;
					counter <= counter + 1;
				end
				123: begin
					bfly_di1 <= wr243;
					bfly_di2 <= wr244;
					i <= 3;
					wr242 <= bfly_do1;
					wr245 <= bfly_do2;
					counter <= counter + 1;
				end
				124: begin
					bfly_di1 <= wr255;
					bfly_di2 <= wr248;
					i <= 0;
					wr243 <= bfly_do1;
					wr244 <= bfly_do2;
					counter <= counter + 1;
				end
				125: begin
					bfly_di1 <= wr254;
					bfly_di2 <= wr249;
					i <= 1;
					wr248 <= bfly_do1;
					wr255 <= bfly_do2;
					counter <= counter + 1;
				end
				126: begin
					bfly_di1 <= wr253;
					bfly_di2 <= wr250;
					i <= 2;
					wr249 <= bfly_do1;
					wr254 <= bfly_do2;
					counter <= counter + 1;
				end
				127: begin
					bfly_di1 <= wr252;
					bfly_di2 <= wr251;
					i <= 3;
					wr250 <= bfly_do1;
					wr253 <= bfly_do2;
					//counter <= counter + 1;
					layer <= 6;
					counter <= 0;
				end
			endcase
		end
		6: begin
			n <= 4;
			case(counter)
				0: begin
					bfly_di1 <= wr0;
					bfly_di2 <= wr3;
					i <= 0;
					wr251 <= bfly_do1;
					wr252 <= bfly_do2;
					counter <= counter + 1;
				end
				1: begin
					bfly_di1 <= wr1;
					bfly_di2 <= wr2;
					i <= 1;
					wr0 <= bfly_do1;
					wr3 <= bfly_do2;
					counter <= counter + 1;
				end
				2: begin
					bfly_di1 <= wr7;
					bfly_di2 <= wr4;
					i <= 0;
					wr1 <= bfly_do1;
					wr2 <= bfly_do2;
					counter <= counter + 1;
				end
				3: begin
					bfly_di1 <= wr6;
					bfly_di2 <= wr5;
					i <= 1;
					wr4 <= bfly_do1;
					wr7 <= bfly_do2;
					counter <= counter + 1;
				end
				4: begin
					bfly_di1 <= wr8;
					bfly_di2 <= wr11;
					i <= 0;
					wr5 <= bfly_do1;
					wr6 <= bfly_do2;
					counter <= counter + 1;
				end
				5: begin
					bfly_di1 <= wr9;
					bfly_di2 <= wr10;
					i <= 1;
					wr8 <= bfly_do1;
					wr11 <= bfly_do2;
					counter <= counter + 1;
				end
				6: begin
					bfly_di1 <= wr15;
					bfly_di2 <= wr12;
					i <= 0;
					wr9 <= bfly_do1;
					wr10 <= bfly_do2;
					counter <= counter + 1;
				end
				7: begin
					bfly_di1 <= wr14;
					bfly_di2 <= wr13;
					i <= 1;
					wr12 <= bfly_do1;
					wr15 <= bfly_do2;
					counter <= counter + 1;
				end
				8: begin
					bfly_di1 <= wr16;
					bfly_di2 <= wr19;
					i <= 0;
					wr13 <= bfly_do1;
					wr14 <= bfly_do2;
					counter <= counter + 1;
				end
				9: begin
					bfly_di1 <= wr17;
					bfly_di2 <= wr18;
					i <= 1;
					wr16 <= bfly_do1;
					wr19 <= bfly_do2;
					counter <= counter + 1;
				end
				10: begin
					bfly_di1 <= wr23;
					bfly_di2 <= wr20;
					i <= 0;
					wr17 <= bfly_do1;
					wr18 <= bfly_do2;
					counter <= counter + 1;
				end
				11: begin
					bfly_di1 <= wr22;
					bfly_di2 <= wr21;
					i <= 1;
					wr20 <= bfly_do1;
					wr23 <= bfly_do2;
					counter <= counter + 1;
				end
				12: begin
					bfly_di1 <= wr24;
					bfly_di2 <= wr27;
					i <= 0;
					wr21 <= bfly_do1;
					wr22 <= bfly_do2;
					counter <= counter + 1;
				end
				13: begin
					bfly_di1 <= wr25;
					bfly_di2 <= wr26;
					i <= 1;
					wr24 <= bfly_do1;
					wr27 <= bfly_do2;
					counter <= counter + 1;
				end
				14: begin
					bfly_di1 <= wr31;
					bfly_di2 <= wr28;
					i <= 0;
					wr25 <= bfly_do1;
					wr26 <= bfly_do2;
					counter <= counter + 1;
				end
				15: begin
					bfly_di1 <= wr30;
					bfly_di2 <= wr29;
					i <= 1;
					wr28 <= bfly_do1;
					wr31 <= bfly_do2;
					counter <= counter + 1;
				end
				16: begin
					bfly_di1 <= wr32;
					bfly_di2 <= wr35;
					i <= 0;
					wr29 <= bfly_do1;
					wr30 <= bfly_do2;
					counter <= counter + 1;
				end
				17: begin
					bfly_di1 <= wr33;
					bfly_di2 <= wr34;
					i <= 1;
					wr32 <= bfly_do1;
					wr35 <= bfly_do2;
					counter <= counter + 1;
				end
				18: begin
					bfly_di1 <= wr39;
					bfly_di2 <= wr36;
					i <= 0;
					wr33 <= bfly_do1;
					wr34 <= bfly_do2;
					counter <= counter + 1;
				end
				19: begin
					bfly_di1 <= wr38;
					bfly_di2 <= wr37;
					i <= 1;
					wr36 <= bfly_do1;
					wr39 <= bfly_do2;
					counter <= counter + 1;
				end
				20: begin
					bfly_di1 <= wr40;
					bfly_di2 <= wr43;
					i <= 0;
					wr37 <= bfly_do1;
					wr38 <= bfly_do2;
					counter <= counter + 1;
				end
				21: begin
					bfly_di1 <= wr41;
					bfly_di2 <= wr42;
					i <= 1;
					wr40 <= bfly_do1;
					wr43 <= bfly_do2;
					counter <= counter + 1;
				end
				22: begin
					bfly_di1 <= wr47;
					bfly_di2 <= wr44;
					i <= 0;
					wr41 <= bfly_do1;
					wr42 <= bfly_do2;
					counter <= counter + 1;
				end
				23: begin
					bfly_di1 <= wr46;
					bfly_di2 <= wr45;
					i <= 1;
					wr44 <= bfly_do1;
					wr47 <= bfly_do2;
					counter <= counter + 1;
				end
				24: begin
					bfly_di1 <= wr48;
					bfly_di2 <= wr51;
					i <= 0;
					wr45 <= bfly_do1;
					wr46 <= bfly_do2;
					counter <= counter + 1;
				end
				25: begin
					bfly_di1 <= wr49;
					bfly_di2 <= wr50;
					i <= 1;
					wr48 <= bfly_do1;
					wr51 <= bfly_do2;
					counter <= counter + 1;
				end
				26: begin
					bfly_di1 <= wr55;
					bfly_di2 <= wr52;
					i <= 0;
					wr49 <= bfly_do1;
					wr50 <= bfly_do2;
					counter <= counter + 1;
				end
				27: begin
					bfly_di1 <= wr54;
					bfly_di2 <= wr53;
					i <= 1;
					wr52 <= bfly_do1;
					wr55 <= bfly_do2;
					counter <= counter + 1;
				end
				28: begin
					bfly_di1 <= wr56;
					bfly_di2 <= wr59;
					i <= 0;
					wr53 <= bfly_do1;
					wr54 <= bfly_do2;
					counter <= counter + 1;
				end
				29: begin
					bfly_di1 <= wr57;
					bfly_di2 <= wr58;
					i <= 1;
					wr56 <= bfly_do1;
					wr59 <= bfly_do2;
					counter <= counter + 1;
				end
				30: begin
					bfly_di1 <= wr63;
					bfly_di2 <= wr60;
					i <= 0;
					wr57 <= bfly_do1;
					wr58 <= bfly_do2;
					counter <= counter + 1;
				end
				31: begin
					bfly_di1 <= wr62;
					bfly_di2 <= wr61;
					i <= 1;
					wr60 <= bfly_do1;
					wr63 <= bfly_do2;
					counter <= counter + 1;
				end
				32: begin
					bfly_di1 <= wr64;
					bfly_di2 <= wr67;
					i <= 0;
					wr61 <= bfly_do1;
					wr62 <= bfly_do2;
					counter <= counter + 1;
				end
				33: begin
					bfly_di1 <= wr65;
					bfly_di2 <= wr66;
					i <= 1;
					wr64 <= bfly_do1;
					wr67 <= bfly_do2;
					counter <= counter + 1;
				end
				34: begin
					bfly_di1 <= wr71;
					bfly_di2 <= wr68;
					i <= 0;
					wr65 <= bfly_do1;
					wr66 <= bfly_do2;
					counter <= counter + 1;
				end
				35: begin
					bfly_di1 <= wr70;
					bfly_di2 <= wr69;
					i <= 1;
					wr68 <= bfly_do1;
					wr71 <= bfly_do2;
					counter <= counter + 1;
				end
				36: begin
					bfly_di1 <= wr72;
					bfly_di2 <= wr75;
					i <= 0;
					wr69 <= bfly_do1;
					wr70 <= bfly_do2;
					counter <= counter + 1;
				end
				37: begin
					bfly_di1 <= wr73;
					bfly_di2 <= wr74;
					i <= 1;
					wr72 <= bfly_do1;
					wr75 <= bfly_do2;
					counter <= counter + 1;
				end
				38: begin
					bfly_di1 <= wr79;
					bfly_di2 <= wr76;
					i <= 0;
					wr73 <= bfly_do1;
					wr74 <= bfly_do2;
					counter <= counter + 1;
				end
				39: begin
					bfly_di1 <= wr78;
					bfly_di2 <= wr77;
					i <= 1;
					wr76 <= bfly_do1;
					wr79 <= bfly_do2;
					counter <= counter + 1;
				end
				40: begin
					bfly_di1 <= wr80;
					bfly_di2 <= wr83;
					i <= 0;
					wr77 <= bfly_do1;
					wr78 <= bfly_do2;
					counter <= counter + 1;
				end
				41: begin
					bfly_di1 <= wr81;
					bfly_di2 <= wr82;
					i <= 1;
					wr80 <= bfly_do1;
					wr83 <= bfly_do2;
					counter <= counter + 1;
				end
				42: begin
					bfly_di1 <= wr87;
					bfly_di2 <= wr84;
					i <= 0;
					wr81 <= bfly_do1;
					wr82 <= bfly_do2;
					counter <= counter + 1;
				end
				43: begin
					bfly_di1 <= wr86;
					bfly_di2 <= wr85;
					i <= 1;
					wr84 <= bfly_do1;
					wr87 <= bfly_do2;
					counter <= counter + 1;
				end
				44: begin
					bfly_di1 <= wr88;
					bfly_di2 <= wr91;
					i <= 0;
					wr85 <= bfly_do1;
					wr86 <= bfly_do2;
					counter <= counter + 1;
				end
				45: begin
					bfly_di1 <= wr89;
					bfly_di2 <= wr90;
					i <= 1;
					wr88 <= bfly_do1;
					wr91 <= bfly_do2;
					counter <= counter + 1;
				end
				46: begin
					bfly_di1 <= wr95;
					bfly_di2 <= wr92;
					i <= 0;
					wr89 <= bfly_do1;
					wr90 <= bfly_do2;
					counter <= counter + 1;
				end
				47: begin
					bfly_di1 <= wr94;
					bfly_di2 <= wr93;
					i <= 1;
					wr92 <= bfly_do1;
					wr95 <= bfly_do2;
					counter <= counter + 1;
				end
				48: begin
					bfly_di1 <= wr96;
					bfly_di2 <= wr99;
					i <= 0;
					wr93 <= bfly_do1;
					wr94 <= bfly_do2;
					counter <= counter + 1;
				end
				49: begin
					bfly_di1 <= wr97;
					bfly_di2 <= wr98;
					i <= 1;
					wr96 <= bfly_do1;
					wr99 <= bfly_do2;
					counter <= counter + 1;
				end
				50: begin
					bfly_di1 <= wr103;
					bfly_di2 <= wr100;
					i <= 0;
					wr97 <= bfly_do1;
					wr98 <= bfly_do2;
					counter <= counter + 1;
				end
				51: begin
					bfly_di1 <= wr102;
					bfly_di2 <= wr101;
					i <= 1;
					wr100 <= bfly_do1;
					wr103 <= bfly_do2;
					counter <= counter + 1;
				end
				52: begin
					bfly_di1 <= wr104;
					bfly_di2 <= wr107;
					i <= 0;
					wr101 <= bfly_do1;
					wr102 <= bfly_do2;
					counter <= counter + 1;
				end
				53: begin
					bfly_di1 <= wr105;
					bfly_di2 <= wr106;
					i <= 1;
					wr104 <= bfly_do1;
					wr107 <= bfly_do2;
					counter <= counter + 1;
				end
				54: begin
					bfly_di1 <= wr111;
					bfly_di2 <= wr108;
					i <= 0;
					wr105 <= bfly_do1;
					wr106 <= bfly_do2;
					counter <= counter + 1;
				end
				55: begin
					bfly_di1 <= wr110;
					bfly_di2 <= wr109;
					i <= 1;
					wr108 <= bfly_do1;
					wr111 <= bfly_do2;
					counter <= counter + 1;
				end
				56: begin
					bfly_di1 <= wr112;
					bfly_di2 <= wr115;
					i <= 0;
					wr109 <= bfly_do1;
					wr110 <= bfly_do2;
					counter <= counter + 1;
				end
				57: begin
					bfly_di1 <= wr113;
					bfly_di2 <= wr114;
					i <= 1;
					wr112 <= bfly_do1;
					wr115 <= bfly_do2;
					counter <= counter + 1;
				end
				58: begin
					bfly_di1 <= wr119;
					bfly_di2 <= wr116;
					i <= 0;
					wr113 <= bfly_do1;
					wr114 <= bfly_do2;
					counter <= counter + 1;
				end
				59: begin
					bfly_di1 <= wr118;
					bfly_di2 <= wr117;
					i <= 1;
					wr116 <= bfly_do1;
					wr119 <= bfly_do2;
					counter <= counter + 1;
				end
				60: begin
					bfly_di1 <= wr120;
					bfly_di2 <= wr123;
					i <= 0;
					wr117 <= bfly_do1;
					wr118 <= bfly_do2;
					counter <= counter + 1;
				end
				61: begin
					bfly_di1 <= wr121;
					bfly_di2 <= wr122;
					i <= 1;
					wr120 <= bfly_do1;
					wr123 <= bfly_do2;
					counter <= counter + 1;
				end
				62: begin
					bfly_di1 <= wr127;
					bfly_di2 <= wr124;
					i <= 0;
					wr121 <= bfly_do1;
					wr122 <= bfly_do2;
					counter <= counter + 1;
				end
				63: begin
					bfly_di1 <= wr126;
					bfly_di2 <= wr125;
					i <= 1;
					wr124 <= bfly_do1;
					wr127 <= bfly_do2;
					counter <= counter + 1;
				end
				64: begin
					bfly_di1 <= wr128;
					bfly_di2 <= wr131;
					i <= 0;
					wr125 <= bfly_do1;
					wr126 <= bfly_do2;
					counter <= counter + 1;
				end
				65: begin
					bfly_di1 <= wr129;
					bfly_di2 <= wr130;
					i <= 1;
					wr128 <= bfly_do1;
					wr131 <= bfly_do2;
					counter <= counter + 1;
				end
				66: begin
					bfly_di1 <= wr135;
					bfly_di2 <= wr132;
					i <= 0;
					wr129 <= bfly_do1;
					wr130 <= bfly_do2;
					counter <= counter + 1;
				end
				67: begin
					bfly_di1 <= wr134;
					bfly_di2 <= wr133;
					i <= 1;
					wr132 <= bfly_do1;
					wr135 <= bfly_do2;
					counter <= counter + 1;
				end
				68: begin
					bfly_di1 <= wr136;
					bfly_di2 <= wr139;
					i <= 0;
					wr133 <= bfly_do1;
					wr134 <= bfly_do2;
					counter <= counter + 1;
				end
				69: begin
					bfly_di1 <= wr137;
					bfly_di2 <= wr138;
					i <= 1;
					wr136 <= bfly_do1;
					wr139 <= bfly_do2;
					counter <= counter + 1;
				end
				70: begin
					bfly_di1 <= wr143;
					bfly_di2 <= wr140;
					i <= 0;
					wr137 <= bfly_do1;
					wr138 <= bfly_do2;
					counter <= counter + 1;
				end
				71: begin
					bfly_di1 <= wr142;
					bfly_di2 <= wr141;
					i <= 1;
					wr140 <= bfly_do1;
					wr143 <= bfly_do2;
					counter <= counter + 1;
				end
				72: begin
					bfly_di1 <= wr144;
					bfly_di2 <= wr147;
					i <= 0;
					wr141 <= bfly_do1;
					wr142 <= bfly_do2;
					counter <= counter + 1;
				end
				73: begin
					bfly_di1 <= wr145;
					bfly_di2 <= wr146;
					i <= 1;
					wr144 <= bfly_do1;
					wr147 <= bfly_do2;
					counter <= counter + 1;
				end
				74: begin
					bfly_di1 <= wr151;
					bfly_di2 <= wr148;
					i <= 0;
					wr145 <= bfly_do1;
					wr146 <= bfly_do2;
					counter <= counter + 1;
				end
				75: begin
					bfly_di1 <= wr150;
					bfly_di2 <= wr149;
					i <= 1;
					wr148 <= bfly_do1;
					wr151 <= bfly_do2;
					counter <= counter + 1;
				end
				76: begin
					bfly_di1 <= wr152;
					bfly_di2 <= wr155;
					i <= 0;
					wr149 <= bfly_do1;
					wr150 <= bfly_do2;
					counter <= counter + 1;
				end
				77: begin
					bfly_di1 <= wr153;
					bfly_di2 <= wr154;
					i <= 1;
					wr152 <= bfly_do1;
					wr155 <= bfly_do2;
					counter <= counter + 1;
				end
				78: begin
					bfly_di1 <= wr159;
					bfly_di2 <= wr156;
					i <= 0;
					wr153 <= bfly_do1;
					wr154 <= bfly_do2;
					counter <= counter + 1;
				end
				79: begin
					bfly_di1 <= wr158;
					bfly_di2 <= wr157;
					i <= 1;
					wr156 <= bfly_do1;
					wr159 <= bfly_do2;
					counter <= counter + 1;
				end
				80: begin
					bfly_di1 <= wr160;
					bfly_di2 <= wr163;
					i <= 0;
					wr157 <= bfly_do1;
					wr158 <= bfly_do2;
					counter <= counter + 1;
				end
				81: begin
					bfly_di1 <= wr161;
					bfly_di2 <= wr162;
					i <= 1;
					wr160 <= bfly_do1;
					wr163 <= bfly_do2;
					counter <= counter + 1;
				end
				82: begin
					bfly_di1 <= wr167;
					bfly_di2 <= wr164;
					i <= 0;
					wr161 <= bfly_do1;
					wr162 <= bfly_do2;
					counter <= counter + 1;
				end
				83: begin
					bfly_di1 <= wr166;
					bfly_di2 <= wr165;
					i <= 1;
					wr164 <= bfly_do1;
					wr167 <= bfly_do2;
					counter <= counter + 1;
				end
				84: begin
					bfly_di1 <= wr168;
					bfly_di2 <= wr171;
					i <= 0;
					wr165 <= bfly_do1;
					wr166 <= bfly_do2;
					counter <= counter + 1;
				end
				85: begin
					bfly_di1 <= wr169;
					bfly_di2 <= wr170;
					i <= 1;
					wr168 <= bfly_do1;
					wr171 <= bfly_do2;
					counter <= counter + 1;
				end
				86: begin
					bfly_di1 <= wr175;
					bfly_di2 <= wr172;
					i <= 0;
					wr169 <= bfly_do1;
					wr170 <= bfly_do2;
					counter <= counter + 1;
				end
				87: begin
					bfly_di1 <= wr174;
					bfly_di2 <= wr173;
					i <= 1;
					wr172 <= bfly_do1;
					wr175 <= bfly_do2;
					counter <= counter + 1;
				end
				88: begin
					bfly_di1 <= wr176;
					bfly_di2 <= wr179;
					i <= 0;
					wr173 <= bfly_do1;
					wr174 <= bfly_do2;
					counter <= counter + 1;
				end
				89: begin
					bfly_di1 <= wr177;
					bfly_di2 <= wr178;
					i <= 1;
					wr176 <= bfly_do1;
					wr179 <= bfly_do2;
					counter <= counter + 1;
				end
				90: begin
					bfly_di1 <= wr183;
					bfly_di2 <= wr180;
					i <= 0;
					wr177 <= bfly_do1;
					wr178 <= bfly_do2;
					counter <= counter + 1;
				end
				91: begin
					bfly_di1 <= wr182;
					bfly_di2 <= wr181;
					i <= 1;
					wr180 <= bfly_do1;
					wr183 <= bfly_do2;
					counter <= counter + 1;
				end
				92: begin
					bfly_di1 <= wr184;
					bfly_di2 <= wr187;
					i <= 0;
					wr181 <= bfly_do1;
					wr182 <= bfly_do2;
					counter <= counter + 1;
				end
				93: begin
					bfly_di1 <= wr185;
					bfly_di2 <= wr186;
					i <= 1;
					wr184 <= bfly_do1;
					wr187 <= bfly_do2;
					counter <= counter + 1;
				end
				94: begin
					bfly_di1 <= wr191;
					bfly_di2 <= wr188;
					i <= 0;
					wr185 <= bfly_do1;
					wr186 <= bfly_do2;
					counter <= counter + 1;
				end
				95: begin
					bfly_di1 <= wr190;
					bfly_di2 <= wr189;
					i <= 1;
					wr188 <= bfly_do1;
					wr191 <= bfly_do2;
					counter <= counter + 1;
				end
				96: begin
					bfly_di1 <= wr192;
					bfly_di2 <= wr195;
					i <= 0;
					wr189 <= bfly_do1;
					wr190 <= bfly_do2;
					counter <= counter + 1;
				end
				97: begin
					bfly_di1 <= wr193;
					bfly_di2 <= wr194;
					i <= 1;
					wr192 <= bfly_do1;
					wr195 <= bfly_do2;
					counter <= counter + 1;
				end
				98: begin
					bfly_di1 <= wr199;
					bfly_di2 <= wr196;
					i <= 0;
					wr193 <= bfly_do1;
					wr194 <= bfly_do2;
					counter <= counter + 1;
				end
				99: begin
					bfly_di1 <= wr198;
					bfly_di2 <= wr197;
					i <= 1;
					wr196 <= bfly_do1;
					wr199 <= bfly_do2;
					counter <= counter + 1;
				end
				100: begin
					bfly_di1 <= wr200;
					bfly_di2 <= wr203;
					i <= 0;
					wr197 <= bfly_do1;
					wr198 <= bfly_do2;
					counter <= counter + 1;
				end
				101: begin
					bfly_di1 <= wr201;
					bfly_di2 <= wr202;
					i <= 1;
					wr200 <= bfly_do1;
					wr203 <= bfly_do2;
					counter <= counter + 1;
				end
				102: begin
					bfly_di1 <= wr207;
					bfly_di2 <= wr204;
					i <= 0;
					wr201 <= bfly_do1;
					wr202 <= bfly_do2;
					counter <= counter + 1;
				end
				103: begin
					bfly_di1 <= wr206;
					bfly_di2 <= wr205;
					i <= 1;
					wr204 <= bfly_do1;
					wr207 <= bfly_do2;
					counter <= counter + 1;
				end
				104: begin
					bfly_di1 <= wr208;
					bfly_di2 <= wr211;
					i <= 0;
					wr205 <= bfly_do1;
					wr206 <= bfly_do2;
					counter <= counter + 1;
				end
				105: begin
					bfly_di1 <= wr209;
					bfly_di2 <= wr210;
					i <= 1;
					wr208 <= bfly_do1;
					wr211 <= bfly_do2;
					counter <= counter + 1;
				end
				106: begin
					bfly_di1 <= wr215;
					bfly_di2 <= wr212;
					i <= 0;
					wr209 <= bfly_do1;
					wr210 <= bfly_do2;
					counter <= counter + 1;
				end
				107: begin
					bfly_di1 <= wr214;
					bfly_di2 <= wr213;
					i <= 1;
					wr212 <= bfly_do1;
					wr215 <= bfly_do2;
					counter <= counter + 1;
				end
				108: begin
					bfly_di1 <= wr216;
					bfly_di2 <= wr219;
					i <= 0;
					wr213 <= bfly_do1;
					wr214 <= bfly_do2;
					counter <= counter + 1;
				end
				109: begin
					bfly_di1 <= wr217;
					bfly_di2 <= wr218;
					i <= 1;
					wr216 <= bfly_do1;
					wr219 <= bfly_do2;
					counter <= counter + 1;
				end
				110: begin
					bfly_di1 <= wr223;
					bfly_di2 <= wr220;
					i <= 0;
					wr217 <= bfly_do1;
					wr218 <= bfly_do2;
					counter <= counter + 1;
				end
				111: begin
					bfly_di1 <= wr222;
					bfly_di2 <= wr221;
					i <= 1;
					wr220 <= bfly_do1;
					wr223 <= bfly_do2;
					counter <= counter + 1;
				end
				112: begin
					bfly_di1 <= wr224;
					bfly_di2 <= wr227;
					i <= 0;
					wr221 <= bfly_do1;
					wr222 <= bfly_do2;
					counter <= counter + 1;
				end
				113: begin
					bfly_di1 <= wr225;
					bfly_di2 <= wr226;
					i <= 1;
					wr224 <= bfly_do1;
					wr227 <= bfly_do2;
					counter <= counter + 1;
				end
				114: begin
					bfly_di1 <= wr231;
					bfly_di2 <= wr228;
					i <= 0;
					wr225 <= bfly_do1;
					wr226 <= bfly_do2;
					counter <= counter + 1;
				end
				115: begin
					bfly_di1 <= wr230;
					bfly_di2 <= wr229;
					i <= 1;
					wr228 <= bfly_do1;
					wr231 <= bfly_do2;
					counter <= counter + 1;
				end
				116: begin
					bfly_di1 <= wr232;
					bfly_di2 <= wr235;
					i <= 0;
					wr229 <= bfly_do1;
					wr230 <= bfly_do2;
					counter <= counter + 1;
				end
				117: begin
					bfly_di1 <= wr233;
					bfly_di2 <= wr234;
					i <= 1;
					wr232 <= bfly_do1;
					wr235 <= bfly_do2;
					counter <= counter + 1;
				end
				118: begin
					bfly_di1 <= wr239;
					bfly_di2 <= wr236;
					i <= 0;
					wr233 <= bfly_do1;
					wr234 <= bfly_do2;
					counter <= counter + 1;
				end
				119: begin
					bfly_di1 <= wr238;
					bfly_di2 <= wr237;
					i <= 1;
					wr236 <= bfly_do1;
					wr239 <= bfly_do2;
					counter <= counter + 1;
				end
				120: begin
					bfly_di1 <= wr240;
					bfly_di2 <= wr243;
					i <= 0;
					wr237 <= bfly_do1;
					wr238 <= bfly_do2;
					counter <= counter + 1;
				end
				121: begin
					bfly_di1 <= wr241;
					bfly_di2 <= wr242;
					i <= 1;
					wr240 <= bfly_do1;
					wr243 <= bfly_do2;
					counter <= counter + 1;
				end
				122: begin
					bfly_di1 <= wr247;
					bfly_di2 <= wr244;
					i <= 0;
					wr241 <= bfly_do1;
					wr242 <= bfly_do2;
					counter <= counter + 1;
				end
				123: begin
					bfly_di1 <= wr246;
					bfly_di2 <= wr245;
					i <= 1;
					wr244 <= bfly_do1;
					wr247 <= bfly_do2;
					counter <= counter + 1;
				end
				124: begin
					bfly_di1 <= wr248;
					bfly_di2 <= wr251;
					i <= 0;
					wr245 <= bfly_do1;
					wr246 <= bfly_do2;
					counter <= counter + 1;
				end
				125: begin
					bfly_di1 <= wr249;
					bfly_di2 <= wr250;
					i <= 1;
					wr248 <= bfly_do1;
					wr251 <= bfly_do2;
					counter <= counter + 1;
				end
				126: begin
					bfly_di1 <= wr255;
					bfly_di2 <= wr252;
					i <= 0;
					wr249 <= bfly_do1;
					wr250 <= bfly_do2;
					counter <= counter + 1;
				end
				127: begin
					bfly_di1 <= wr254;
					bfly_di2 <= wr253;
					i <= 1;
					wr252 <= bfly_do1;
					wr255 <= bfly_do2;
					//counter <= counter + 1;
					layer <= 7;
					counter <= 0;
				end
			endcase
		end
		7: begin
			n <= 2;
			case(counter)
				0: begin
					bfly_di1 <= wr0;
					bfly_di2 <= wr1;
					wr253 <= bfly_do1;
					wr254 <= bfly_do2;
					counter <= counter + 1;
				end
				1: begin
					bfly_di1 <= wr3;
					bfly_di2 <= wr2;
					wr0 <= bfly_do1;
					wr1 <= bfly_do2;
					counter <= counter + 1;
				end
				2: begin
					bfly_di1 <= wr4;
					bfly_di2 <= wr5;
					wr2 <= bfly_do1;
					wr3 <= bfly_do2;
					counter <= counter + 1;
				end
				3: begin
					bfly_di1 <= wr7;
					bfly_di2 <= wr6;
					wr4 <= bfly_do1;
					wr5 <= bfly_do2;
					counter <= counter + 1;
				end
				4: begin
					bfly_di1 <= wr8;
					bfly_di2 <= wr9;
					wr6 <= bfly_do1;
					wr7 <= bfly_do2;
					counter <= counter + 1;
				end
				5: begin
					bfly_di1 <= wr11;
					bfly_di2 <= wr10;
					wr8 <= bfly_do1;
					wr9 <= bfly_do2;
					counter <= counter + 1;
				end
				6: begin
					bfly_di1 <= wr12;
					bfly_di2 <= wr13;
					wr10 <= bfly_do1;
					wr11 <= bfly_do2;
					counter <= counter + 1;
				end
				7: begin
					bfly_di1 <= wr15;
					bfly_di2 <= wr14;
					wr12 <= bfly_do1;
					wr13 <= bfly_do2;
					counter <= counter + 1;
				end
				8: begin
					bfly_di1 <= wr16;
					bfly_di2 <= wr17;
					wr14 <= bfly_do1;
					wr15 <= bfly_do2;
					counter <= counter + 1;
				end
				9: begin
					bfly_di1 <= wr19;
					bfly_di2 <= wr18;
					wr16 <= bfly_do1;
					wr17 <= bfly_do2;
					counter <= counter + 1;
				end
				10: begin
					bfly_di1 <= wr20;
					bfly_di2 <= wr21;
					wr18 <= bfly_do1;
					wr19 <= bfly_do2;
					counter <= counter + 1;
				end
				11: begin
					bfly_di1 <= wr23;
					bfly_di2 <= wr22;
					wr20 <= bfly_do1;
					wr21 <= bfly_do2;
					counter <= counter + 1;
				end
				12: begin
					bfly_di1 <= wr24;
					bfly_di2 <= wr25;
					wr22 <= bfly_do1;
					wr23 <= bfly_do2;
					counter <= counter + 1;
				end
				13: begin
					bfly_di1 <= wr27;
					bfly_di2 <= wr26;
					wr24 <= bfly_do1;
					wr25 <= bfly_do2;
					counter <= counter + 1;
				end
				14: begin
					bfly_di1 <= wr28;
					bfly_di2 <= wr29;
					wr26 <= bfly_do1;
					wr27 <= bfly_do2;
					counter <= counter + 1;
				end
				15: begin
					bfly_di1 <= wr31;
					bfly_di2 <= wr30;
					wr28 <= bfly_do1;
					wr29 <= bfly_do2;
					counter <= counter + 1;
				end
				16: begin
					bfly_di1 <= wr32;
					bfly_di2 <= wr33;
					wr30 <= bfly_do1;
					wr31 <= bfly_do2;
					counter <= counter + 1;
				end
				17: begin
					bfly_di1 <= wr35;
					bfly_di2 <= wr34;
					wr32 <= bfly_do1;
					wr33 <= bfly_do2;
					counter <= counter + 1;
				end
				18: begin
					bfly_di1 <= wr36;
					bfly_di2 <= wr37;
					wr34 <= bfly_do1;
					wr35 <= bfly_do2;
					counter <= counter + 1;
				end
				19: begin
					bfly_di1 <= wr39;
					bfly_di2 <= wr38;
					wr36 <= bfly_do1;
					wr37 <= bfly_do2;
					counter <= counter + 1;
				end
				20: begin
					bfly_di1 <= wr40;
					bfly_di2 <= wr41;
					wr38 <= bfly_do1;
					wr39 <= bfly_do2;
					counter <= counter + 1;
				end
				21: begin
					bfly_di1 <= wr43;
					bfly_di2 <= wr42;
					wr40 <= bfly_do1;
					wr41 <= bfly_do2;
					counter <= counter + 1;
				end
				22: begin
					bfly_di1 <= wr44;
					bfly_di2 <= wr45;
					wr42 <= bfly_do1;
					wr43 <= bfly_do2;
					counter <= counter + 1;
				end
				23: begin
					bfly_di1 <= wr47;
					bfly_di2 <= wr46;
					wr44 <= bfly_do1;
					wr45 <= bfly_do2;
					counter <= counter + 1;
				end
				24: begin
					bfly_di1 <= wr48;
					bfly_di2 <= wr49;
					wr46 <= bfly_do1;
					wr47 <= bfly_do2;
					counter <= counter + 1;
				end
				25: begin
					bfly_di1 <= wr51;
					bfly_di2 <= wr50;
					wr48 <= bfly_do1;
					wr49 <= bfly_do2;
					counter <= counter + 1;
				end
				26: begin
					bfly_di1 <= wr52;
					bfly_di2 <= wr53;
					wr50 <= bfly_do1;
					wr51 <= bfly_do2;
					counter <= counter + 1;
				end
				27: begin
					bfly_di1 <= wr55;
					bfly_di2 <= wr54;
					wr52 <= bfly_do1;
					wr53 <= bfly_do2;
					counter <= counter + 1;
				end
				28: begin
					bfly_di1 <= wr56;
					bfly_di2 <= wr57;
					wr54 <= bfly_do1;
					wr55 <= bfly_do2;
					counter <= counter + 1;
				end
				29: begin
					bfly_di1 <= wr59;
					bfly_di2 <= wr58;
					wr56 <= bfly_do1;
					wr57 <= bfly_do2;
					counter <= counter + 1;
				end
				30: begin
					bfly_di1 <= wr60;
					bfly_di2 <= wr61;
					wr58 <= bfly_do1;
					wr59 <= bfly_do2;
					counter <= counter + 1;
				end
				31: begin
					bfly_di1 <= wr63;
					bfly_di2 <= wr62;
					wr60 <= bfly_do1;
					wr61 <= bfly_do2;
					counter <= counter + 1;
				end
				32: begin
					bfly_di1 <= wr64;
					bfly_di2 <= wr65;
					wr62 <= bfly_do1;
					wr63 <= bfly_do2;
					counter <= counter + 1;
				end
				33: begin
					bfly_di1 <= wr67;
					bfly_di2 <= wr66;
					wr64 <= bfly_do1;
					wr65 <= bfly_do2;
					counter <= counter + 1;
				end
				34: begin
					bfly_di1 <= wr68;
					bfly_di2 <= wr69;
					wr66 <= bfly_do1;
					wr67 <= bfly_do2;
					counter <= counter + 1;
				end
				35: begin
					bfly_di1 <= wr71;
					bfly_di2 <= wr70;
					wr68 <= bfly_do1;
					wr69 <= bfly_do2;
					counter <= counter + 1;
				end
				36: begin
					bfly_di1 <= wr72;
					bfly_di2 <= wr73;
					wr70 <= bfly_do1;
					wr71 <= bfly_do2;
					counter <= counter + 1;
				end
				37: begin
					bfly_di1 <= wr75;
					bfly_di2 <= wr74;
					wr72 <= bfly_do1;
					wr73 <= bfly_do2;
					counter <= counter + 1;
				end
				38: begin
					bfly_di1 <= wr76;
					bfly_di2 <= wr77;
					wr74 <= bfly_do1;
					wr75 <= bfly_do2;
					counter <= counter + 1;
				end
				39: begin
					bfly_di1 <= wr79;
					bfly_di2 <= wr78;
					wr76 <= bfly_do1;
					wr77 <= bfly_do2;
					counter <= counter + 1;
				end
				40: begin
					bfly_di1 <= wr80;
					bfly_di2 <= wr81;
					wr78 <= bfly_do1;
					wr79 <= bfly_do2;
					counter <= counter + 1;
				end
				41: begin
					bfly_di1 <= wr83;
					bfly_di2 <= wr82;
					wr80 <= bfly_do1;
					wr81 <= bfly_do2;
					counter <= counter + 1;
				end
				42: begin
					bfly_di1 <= wr84;
					bfly_di2 <= wr85;
					wr82 <= bfly_do1;
					wr83 <= bfly_do2;
					counter <= counter + 1;
				end
				43: begin
					bfly_di1 <= wr87;
					bfly_di2 <= wr86;
					wr84 <= bfly_do1;
					wr85 <= bfly_do2;
					counter <= counter + 1;
				end
				44: begin
					bfly_di1 <= wr88;
					bfly_di2 <= wr89;
					wr86 <= bfly_do1;
					wr87 <= bfly_do2;
					counter <= counter + 1;
				end
				45: begin
					bfly_di1 <= wr91;
					bfly_di2 <= wr90;
					wr88 <= bfly_do1;
					wr89 <= bfly_do2;
					counter <= counter + 1;
				end
				46: begin
					bfly_di1 <= wr92;
					bfly_di2 <= wr93;
					wr90 <= bfly_do1;
					wr91 <= bfly_do2;
					counter <= counter + 1;
				end
				47: begin
					bfly_di1 <= wr95;
					bfly_di2 <= wr94;
					wr92 <= bfly_do1;
					wr93 <= bfly_do2;
					counter <= counter + 1;
				end
				48: begin
					bfly_di1 <= wr96;
					bfly_di2 <= wr97;
					wr94 <= bfly_do1;
					wr95 <= bfly_do2;
					counter <= counter + 1;
				end
				49: begin
					bfly_di1 <= wr99;
					bfly_di2 <= wr98;
					wr96 <= bfly_do1;
					wr97 <= bfly_do2;
					counter <= counter + 1;
				end
				50: begin
					bfly_di1 <= wr100;
					bfly_di2 <= wr101;
					wr98 <= bfly_do1;
					wr99 <= bfly_do2;
					counter <= counter + 1;
				end
				51: begin
					bfly_di1 <= wr103;
					bfly_di2 <= wr102;
					wr100 <= bfly_do1;
					wr101 <= bfly_do2;
					counter <= counter + 1;
				end
				52: begin
					bfly_di1 <= wr104;
					bfly_di2 <= wr105;
					wr102 <= bfly_do1;
					wr103 <= bfly_do2;
					counter <= counter + 1;
				end
				53: begin
					bfly_di1 <= wr107;
					bfly_di2 <= wr106;
					wr104 <= bfly_do1;
					wr105 <= bfly_do2;
					counter <= counter + 1;
				end
				54: begin
					bfly_di1 <= wr108;
					bfly_di2 <= wr109;
					wr106 <= bfly_do1;
					wr107 <= bfly_do2;
					counter <= counter + 1;
				end
				55: begin
					bfly_di1 <= wr111;
					bfly_di2 <= wr110;
					wr108 <= bfly_do1;
					wr109 <= bfly_do2;
					counter <= counter + 1;
				end
				56: begin
					bfly_di1 <= wr112;
					bfly_di2 <= wr113;
					wr110 <= bfly_do1;
					wr111 <= bfly_do2;
					counter <= counter + 1;
				end
				57: begin
					bfly_di1 <= wr115;
					bfly_di2 <= wr114;
					wr112 <= bfly_do1;
					wr113 <= bfly_do2;
					counter <= counter + 1;
				end
				58: begin
					bfly_di1 <= wr116;
					bfly_di2 <= wr117;
					wr114 <= bfly_do1;
					wr115 <= bfly_do2;
					counter <= counter + 1;
				end
				59: begin
					bfly_di1 <= wr119;
					bfly_di2 <= wr118;
					wr116 <= bfly_do1;
					wr117 <= bfly_do2;
					counter <= counter + 1;
				end
				60: begin
					bfly_di1 <= wr120;
					bfly_di2 <= wr121;
					wr118 <= bfly_do1;
					wr119 <= bfly_do2;
					counter <= counter + 1;
				end
				61: begin
					bfly_di1 <= wr123;
					bfly_di2 <= wr122;
					wr120 <= bfly_do1;
					wr121 <= bfly_do2;
					counter <= counter + 1;
				end
				62: begin
					bfly_di1 <= wr124;
					bfly_di2 <= wr125;
					wr122 <= bfly_do1;
					wr123 <= bfly_do2;
					counter <= counter + 1;
				end
				63: begin
					bfly_di1 <= wr127;
					bfly_di2 <= wr126;
					wr124 <= bfly_do1;
					wr125 <= bfly_do2;
					counter <= counter + 1;
				end
				64: begin
					bfly_di1 <= wr128;
					bfly_di2 <= wr129;
					wr126 <= bfly_do1;
					wr127 <= bfly_do2;
					counter <= counter + 1;
				end
				65: begin
					bfly_di1 <= wr131;
					bfly_di2 <= wr130;
					wr128 <= bfly_do1;
					wr129 <= bfly_do2;
					counter <= counter + 1;
				end
				66: begin
					bfly_di1 <= wr132;
					bfly_di2 <= wr133;
					wr130 <= bfly_do1;
					wr131 <= bfly_do2;
					counter <= counter + 1;
				end
				67: begin
					bfly_di1 <= wr135;
					bfly_di2 <= wr134;
					wr132 <= bfly_do1;
					wr133 <= bfly_do2;
					counter <= counter + 1;
				end
				68: begin
					bfly_di1 <= wr136;
					bfly_di2 <= wr137;
					wr134 <= bfly_do1;
					wr135 <= bfly_do2;
					counter <= counter + 1;
				end
				69: begin
					bfly_di1 <= wr139;
					bfly_di2 <= wr138;
					wr136 <= bfly_do1;
					wr137 <= bfly_do2;
					counter <= counter + 1;
				end
				70: begin
					bfly_di1 <= wr140;
					bfly_di2 <= wr141;
					wr138 <= bfly_do1;
					wr139 <= bfly_do2;
					counter <= counter + 1;
				end
				71: begin
					bfly_di1 <= wr143;
					bfly_di2 <= wr142;
					wr140 <= bfly_do1;
					wr141 <= bfly_do2;
					counter <= counter + 1;
				end
				72: begin
					bfly_di1 <= wr144;
					bfly_di2 <= wr145;
					wr142 <= bfly_do1;
					wr143 <= bfly_do2;
					counter <= counter + 1;
				end
				73: begin
					bfly_di1 <= wr147;
					bfly_di2 <= wr146;
					wr144 <= bfly_do1;
					wr145 <= bfly_do2;
					counter <= counter + 1;
				end
				74: begin
					bfly_di1 <= wr148;
					bfly_di2 <= wr149;
					wr146 <= bfly_do1;
					wr147 <= bfly_do2;
					counter <= counter + 1;
				end
				75: begin
					bfly_di1 <= wr151;
					bfly_di2 <= wr150;
					wr148 <= bfly_do1;
					wr149 <= bfly_do2;
					counter <= counter + 1;
				end
				76: begin
					bfly_di1 <= wr152;
					bfly_di2 <= wr153;
					wr150 <= bfly_do1;
					wr151 <= bfly_do2;
					counter <= counter + 1;
				end
				77: begin
					bfly_di1 <= wr155;
					bfly_di2 <= wr154;
					wr152 <= bfly_do1;
					wr153 <= bfly_do2;
					counter <= counter + 1;
				end
				78: begin
					bfly_di1 <= wr156;
					bfly_di2 <= wr157;
					wr154 <= bfly_do1;
					wr155 <= bfly_do2;
					counter <= counter + 1;
				end
				79: begin
					bfly_di1 <= wr159;
					bfly_di2 <= wr158;
					wr156 <= bfly_do1;
					wr157 <= bfly_do2;
					counter <= counter + 1;
				end
				80: begin
					bfly_di1 <= wr160;
					bfly_di2 <= wr161;
					wr158 <= bfly_do1;
					wr159 <= bfly_do2;
					counter <= counter + 1;
				end
				81: begin
					bfly_di1 <= wr163;
					bfly_di2 <= wr162;
					wr160 <= bfly_do1;
					wr161 <= bfly_do2;
					counter <= counter + 1;
				end
				82: begin
					bfly_di1 <= wr164;
					bfly_di2 <= wr165;
					wr162 <= bfly_do1;
					wr163 <= bfly_do2;
					counter <= counter + 1;
				end
				83: begin
					bfly_di1 <= wr167;
					bfly_di2 <= wr166;
					wr164 <= bfly_do1;
					wr165 <= bfly_do2;
					counter <= counter + 1;
				end
				84: begin
					bfly_di1 <= wr168;
					bfly_di2 <= wr169;
					wr166 <= bfly_do1;
					wr167 <= bfly_do2;
					counter <= counter + 1;
				end
				85: begin
					bfly_di1 <= wr171;
					bfly_di2 <= wr170;
					wr168 <= bfly_do1;
					wr169 <= bfly_do2;
					counter <= counter + 1;
				end
				86: begin
					bfly_di1 <= wr172;
					bfly_di2 <= wr173;
					wr170 <= bfly_do1;
					wr171 <= bfly_do2;
					counter <= counter + 1;
				end
				87: begin
					bfly_di1 <= wr175;
					bfly_di2 <= wr174;
					wr172 <= bfly_do1;
					wr173 <= bfly_do2;
					counter <= counter + 1;
				end
				88: begin
					bfly_di1 <= wr176;
					bfly_di2 <= wr177;
					wr174 <= bfly_do1;
					wr175 <= bfly_do2;
					counter <= counter + 1;
				end
				89: begin
					bfly_di1 <= wr179;
					bfly_di2 <= wr178;
					wr176 <= bfly_do1;
					wr177 <= bfly_do2;
					counter <= counter + 1;
				end
				90: begin
					bfly_di1 <= wr180;
					bfly_di2 <= wr181;
					wr178 <= bfly_do1;
					wr179 <= bfly_do2;
					counter <= counter + 1;
				end
				91: begin
					bfly_di1 <= wr183;
					bfly_di2 <= wr182;
					wr180 <= bfly_do1;
					wr181 <= bfly_do2;
					counter <= counter + 1;
				end
				92: begin
					bfly_di1 <= wr184;
					bfly_di2 <= wr185;
					wr182 <= bfly_do1;
					wr183 <= bfly_do2;
					counter <= counter + 1;
				end
				93: begin
					bfly_di1 <= wr187;
					bfly_di2 <= wr186;
					wr184 <= bfly_do1;
					wr185 <= bfly_do2;
					counter <= counter + 1;
				end
				94: begin
					bfly_di1 <= wr188;
					bfly_di2 <= wr189;
					wr186 <= bfly_do1;
					wr187 <= bfly_do2;
					counter <= counter + 1;
				end
				95: begin
					bfly_di1 <= wr191;
					bfly_di2 <= wr190;
					wr188 <= bfly_do1;
					wr189 <= bfly_do2;
					counter <= counter + 1;
				end
				96: begin
					bfly_di1 <= wr192;
					bfly_di2 <= wr193;
					wr190 <= bfly_do1;
					wr191 <= bfly_do2;
					counter <= counter + 1;
				end
				97: begin
					bfly_di1 <= wr195;
					bfly_di2 <= wr194;
					wr192 <= bfly_do1;
					wr193 <= bfly_do2;
					counter <= counter + 1;
				end
				98: begin
					bfly_di1 <= wr196;
					bfly_di2 <= wr197;
					wr194 <= bfly_do1;
					wr195 <= bfly_do2;
					counter <= counter + 1;
				end
				99: begin
					bfly_di1 <= wr199;
					bfly_di2 <= wr198;
					wr196 <= bfly_do1;
					wr197 <= bfly_do2;
					counter <= counter + 1;
				end
				100: begin
					bfly_di1 <= wr200;
					bfly_di2 <= wr201;
					wr198 <= bfly_do1;
					wr199 <= bfly_do2;
					counter <= counter + 1;
				end
				101: begin
					bfly_di1 <= wr203;
					bfly_di2 <= wr202;
					wr200 <= bfly_do1;
					wr201 <= bfly_do2;
					counter <= counter + 1;
				end
				102: begin
					bfly_di1 <= wr204;
					bfly_di2 <= wr205;
					wr202 <= bfly_do1;
					wr203 <= bfly_do2;
					counter <= counter + 1;
				end
				103: begin
					bfly_di1 <= wr207;
					bfly_di2 <= wr206;
					wr204 <= bfly_do1;
					wr205 <= bfly_do2;
					counter <= counter + 1;
				end
				104: begin
					bfly_di1 <= wr208;
					bfly_di2 <= wr209;
					wr206 <= bfly_do1;
					wr207 <= bfly_do2;
					counter <= counter + 1;
				end
				105: begin
					bfly_di1 <= wr211;
					bfly_di2 <= wr210;
					wr208 <= bfly_do1;
					wr209 <= bfly_do2;
					counter <= counter + 1;
				end
				106: begin
					bfly_di1 <= wr212;
					bfly_di2 <= wr213;
					wr210 <= bfly_do1;
					wr211 <= bfly_do2;
					counter <= counter + 1;
				end
				107: begin
					bfly_di1 <= wr215;
					bfly_di2 <= wr214;
					wr212 <= bfly_do1;
					wr213 <= bfly_do2;
					counter <= counter + 1;
				end
				108: begin
					bfly_di1 <= wr216;
					bfly_di2 <= wr217;
					wr214 <= bfly_do1;
					wr215 <= bfly_do2;
					counter <= counter + 1;
				end
				109: begin
					bfly_di1 <= wr219;
					bfly_di2 <= wr218;
					wr216 <= bfly_do1;
					wr217 <= bfly_do2;
					counter <= counter + 1;
				end
				110: begin
					bfly_di1 <= wr220;
					bfly_di2 <= wr221;
					wr218 <= bfly_do1;
					wr219 <= bfly_do2;
					counter <= counter + 1;
				end
				111: begin
					bfly_di1 <= wr223;
					bfly_di2 <= wr222;
					wr220 <= bfly_do1;
					wr221 <= bfly_do2;
					counter <= counter + 1;
				end
				112: begin
					bfly_di1 <= wr224;
					bfly_di2 <= wr225;
					wr222 <= bfly_do1;
					wr223 <= bfly_do2;
					counter <= counter + 1;
				end
				113: begin
					bfly_di1 <= wr227;
					bfly_di2 <= wr226;
					wr224 <= bfly_do1;
					wr225 <= bfly_do2;
					counter <= counter + 1;
				end
				114: begin
					bfly_di1 <= wr228;
					bfly_di2 <= wr229;
					wr226 <= bfly_do1;
					wr227 <= bfly_do2;
					counter <= counter + 1;
				end
				115: begin
					bfly_di1 <= wr231;
					bfly_di2 <= wr230;
					wr228 <= bfly_do1;
					wr229 <= bfly_do2;
					counter <= counter + 1;
				end
				116: begin
					bfly_di1 <= wr232;
					bfly_di2 <= wr233;
					wr230 <= bfly_do1;
					wr231 <= bfly_do2;
					counter <= counter + 1;
				end
				117: begin
					bfly_di1 <= wr235;
					bfly_di2 <= wr234;
					wr232 <= bfly_do1;
					wr233 <= bfly_do2;
					counter <= counter + 1;
				end
				118: begin
					bfly_di1 <= wr236;
					bfly_di2 <= wr237;
					wr234 <= bfly_do1;
					wr235 <= bfly_do2;
					counter <= counter + 1;
				end
				119: begin
					bfly_di1 <= wr239;
					bfly_di2 <= wr238;
					wr236 <= bfly_do1;
					wr237 <= bfly_do2;
					counter <= counter + 1;
				end
				120: begin
					bfly_di1 <= wr240;
					bfly_di2 <= wr241;
					wr238 <= bfly_do1;
					wr239 <= bfly_do2;
					counter <= counter + 1;
				end
				121: begin
					bfly_di1 <= wr243;
					bfly_di2 <= wr242;
					wr240 <= bfly_do1;
					wr241 <= bfly_do2;
					counter <= counter + 1;
				end
				122: begin
					bfly_di1 <= wr244;
					bfly_di2 <= wr245;
					wr242 <= bfly_do1;
					wr243 <= bfly_do2;
					counter <= counter + 1;
				end
				123: begin
					bfly_di1 <= wr247;
					bfly_di2 <= wr246;
					wr244 <= bfly_do1;
					wr245 <= bfly_do2;
					counter <= counter + 1;
				end
				124: begin
					bfly_di1 <= wr248;
					bfly_di2 <= wr249;
					wr246 <= bfly_do1;
					wr247 <= bfly_do2;
					counter <= counter + 1;
				end
				125: begin
					bfly_di1 <= wr251;
					bfly_di2 <= wr250;
					wr248 <= bfly_do1;
					wr249 <= bfly_do2;
					counter <= counter + 1;
				end
				126: begin
					bfly_di1 <= wr252;
					bfly_di2 <= wr253;
					wr250 <= bfly_do1;
					wr251 <= bfly_do2;
					counter <= counter + 1;
				end
				127: begin
					bfly_di1 <= wr255;
					bfly_di2 <= wr254;
					wr252 <= bfly_do1;
					wr253 <= bfly_do2;
					//counter <= counter + 1;
					layer <= 8;
					counter <= 0;
				end
			endcase
		end
		8: begin	//post-addition-0(R6)
			n <= 1;
			case(counter)
				0: begin
					wr2 <= wr1;
					bfly_di1 <= wr2;
					bfly_di2 <= wr3;
					wr254 <= bfly_do1;
					wr255 <= bfly_do2;
					counter <= counter + 1;
				end
				1: begin
					wr6 <= wr5;
					bfly_di1 <= wr6;
					bfly_di2 <= wr7;
					wr1 <= bfly_do1;
					counter <= counter + 1;
				end
				2: begin
					wr10 <= wr9;
					bfly_di1 <= wr10;
					bfly_di2 <= wr11;
					wr5 <= bfly_do1;
					counter <= counter + 1;
				end
				3: begin
					wr14 <= wr13;
					bfly_di1 <= wr14;
					bfly_di2 <= wr15;
					wr9 <= bfly_do1;
					counter <= counter + 1;
				end
				4: begin
					wr18 <= wr17;
					bfly_di1 <= wr18;
					bfly_di2 <= wr19;
					wr13 <= bfly_do1;
					counter <= counter + 1;
				end
				5: begin
					wr22 <= wr21;
					bfly_di1 <= wr22;
					bfly_di2 <= wr23;
					wr17 <= bfly_do1;
					counter <= counter + 1;
				end
				6: begin
					wr26 <= wr25;
					bfly_di1 <= wr26;
					bfly_di2 <= wr27;
					wr21 <= bfly_do1;
					counter <= counter + 1;
				end
				7: begin
					wr30 <= wr29;
					bfly_di1 <= wr30;
					bfly_di2 <= wr31;
					wr25 <= bfly_do1;
					counter <= counter + 1;
				end
				8: begin
					wr34 <= wr33;
					bfly_di1 <= wr34;
					bfly_di2 <= wr35;
					wr29 <= bfly_do1;
					counter <= counter + 1;
				end
				9: begin
					wr38 <= wr37;
					bfly_di1 <= wr38;
					bfly_di2 <= wr39;
					wr33 <= bfly_do1;
					counter <= counter + 1;
				end
				10: begin
					wr42 <= wr41;
					bfly_di1 <= wr42;
					bfly_di2 <= wr43;
					wr37 <= bfly_do1;
					counter <= counter + 1;
				end
				11: begin
					wr46 <= wr45;
					bfly_di1 <= wr46;
					bfly_di2 <= wr47;
					wr41 <= bfly_do1;
					counter <= counter + 1;
				end
				12: begin
					wr50 <= wr49;
					bfly_di1 <= wr50;
					bfly_di2 <= wr51;
					wr45 <= bfly_do1;
					counter <= counter + 1;
				end
				13: begin
					wr54 <= wr53;
					bfly_di1 <= wr54;
					bfly_di2 <= wr55;
					wr49 <= bfly_do1;
					counter <= counter + 1;
				end
				14: begin
					wr58 <= wr57;
					bfly_di1 <= wr58;
					bfly_di2 <= wr59;
					wr53 <= bfly_do1;
					counter <= counter + 1;
				end
				15: begin
					wr62 <= wr61;
					bfly_di1 <= wr62;
					bfly_di2 <= wr63;
					wr57 <= bfly_do1;
					counter <= counter + 1;
				end
				16: begin
					wr66 <= wr65;
					bfly_di1 <= wr66;
					bfly_di2 <= wr67;
					wr61 <= bfly_do1;
					counter <= counter + 1;
				end
				17: begin
					wr70 <= wr69;
					bfly_di1 <= wr70;
					bfly_di2 <= wr71;
					wr65 <= bfly_do1;
					counter <= counter + 1;
				end
				18: begin
					wr74 <= wr73;
					bfly_di1 <= wr74;
					bfly_di2 <= wr75;
					wr69 <= bfly_do1;
					counter <= counter + 1;
				end
				19: begin
					wr78 <= wr77;
					bfly_di1 <= wr78;
					bfly_di2 <= wr79;
					wr73 <= bfly_do1;
					counter <= counter + 1;
				end
				20: begin
					wr82 <= wr81;
					bfly_di1 <= wr82;
					bfly_di2 <= wr83;
					wr77 <= bfly_do1;
					counter <= counter + 1;
				end
				21: begin
					wr86 <= wr85;
					bfly_di1 <= wr86;
					bfly_di2 <= wr87;
					wr81 <= bfly_do1;
					counter <= counter + 1;
				end
				22: begin
					wr90 <= wr89;
					bfly_di1 <= wr90;
					bfly_di2 <= wr91;
					wr85 <= bfly_do1;
					counter <= counter + 1;
				end
				23: begin
					wr94 <= wr93;
					bfly_di1 <= wr94;
					bfly_di2 <= wr95;
					wr89 <= bfly_do1;
					counter <= counter + 1;
				end
				24: begin
					wr98 <= wr97;
					bfly_di1 <= wr98;
					bfly_di2 <= wr99;
					wr93 <= bfly_do1;
					counter <= counter + 1;
				end
				25: begin
					wr102 <= wr101;
					bfly_di1 <= wr102;
					bfly_di2 <= wr103;
					wr97 <= bfly_do1;
					counter <= counter + 1;
				end
				26: begin
					wr106 <= wr105;
					bfly_di1 <= wr106;
					bfly_di2 <= wr107;
					wr101 <= bfly_do1;
					counter <= counter + 1;
				end
				27: begin
					wr110 <= wr109;
					bfly_di1 <= wr110;
					bfly_di2 <= wr111;
					wr105 <= bfly_do1;
					counter <= counter + 1;
				end
				28: begin
					wr114 <= wr113;
					bfly_di1 <= wr114;
					bfly_di2 <= wr115;
					wr109 <= bfly_do1;
					counter <= counter + 1;
				end
				29: begin
					wr118 <= wr117;
					bfly_di1 <= wr118;
					bfly_di2 <= wr119;
					wr113 <= bfly_do1;
					counter <= counter + 1;
				end
				30: begin
					wr122 <= wr121;
					bfly_di1 <= wr122;
					bfly_di2 <= wr123;
					wr117 <= bfly_do1;
					counter <= counter + 1;
				end
				31: begin
					wr126 <= wr125;
					bfly_di1 <= wr126;
					bfly_di2 <= wr127;
					wr121 <= bfly_do1;
					counter <= counter + 1;
				end
				32: begin
					wr130 <= wr129;
					bfly_di1 <= wr130;
					bfly_di2 <= wr131;
					wr125 <= bfly_do1;
					counter <= counter + 1;
				end
				33: begin
					wr134 <= wr133;
					bfly_di1 <= wr134;
					bfly_di2 <= wr135;
					wr129 <= bfly_do1;
					counter <= counter + 1;
				end
				34: begin
					wr138 <= wr137;
					bfly_di1 <= wr138;
					bfly_di2 <= wr139;
					wr133 <= bfly_do1;
					counter <= counter + 1;
				end
				35: begin
					wr142 <= wr141;
					bfly_di1 <= wr142;
					bfly_di2 <= wr143;
					wr137 <= bfly_do1;
					counter <= counter + 1;
				end
				36: begin
					wr146 <= wr145;
					bfly_di1 <= wr146;
					bfly_di2 <= wr147;
					wr141 <= bfly_do1;
					counter <= counter + 1;
				end
				37: begin
					wr150 <= wr149;
					bfly_di1 <= wr150;
					bfly_di2 <= wr151;
					wr145 <= bfly_do1;
					counter <= counter + 1;
				end
				38: begin
					wr154 <= wr153;
					bfly_di1 <= wr154;
					bfly_di2 <= wr155;
					wr149 <= bfly_do1;
					counter <= counter + 1;
				end
				39: begin
					wr158 <= wr157;
					bfly_di1 <= wr158;
					bfly_di2 <= wr159;
					wr153 <= bfly_do1;
					counter <= counter + 1;
				end
				40: begin
					wr162 <= wr161;
					bfly_di1 <= wr162;
					bfly_di2 <= wr163;
					wr157 <= bfly_do1;
					counter <= counter + 1;
				end
				41: begin
					wr166 <= wr165;
					bfly_di1 <= wr166;
					bfly_di2 <= wr167;
					wr161 <= bfly_do1;
					counter <= counter + 1;
				end
				42: begin
					wr170 <= wr169;
					bfly_di1 <= wr170;
					bfly_di2 <= wr171;
					wr165 <= bfly_do1;
					counter <= counter + 1;
				end
				43: begin
					wr174 <= wr173;
					bfly_di1 <= wr174;
					bfly_di2 <= wr175;
					wr169 <= bfly_do1;
					counter <= counter + 1;
				end
				44: begin
					wr178 <= wr177;
					bfly_di1 <= wr178;
					bfly_di2 <= wr179;
					wr173 <= bfly_do1;
					counter <= counter + 1;
				end
				45: begin
					wr182 <= wr181;
					bfly_di1 <= wr182;
					bfly_di2 <= wr183;
					wr177 <= bfly_do1;
					counter <= counter + 1;
				end
				46: begin
					wr186 <= wr185;
					bfly_di1 <= wr186;
					bfly_di2 <= wr187;
					wr181 <= bfly_do1;
					counter <= counter + 1;
				end
				47: begin
					wr190 <= wr189;
					bfly_di1 <= wr190;
					bfly_di2 <= wr191;
					wr185 <= bfly_do1;
					counter <= counter + 1;
				end
				48: begin
					wr194 <= wr193;
					bfly_di1 <= wr194;
					bfly_di2 <= wr195;
					wr189 <= bfly_do1;
					counter <= counter + 1;
				end
				49: begin
					wr198 <= wr197;
					bfly_di1 <= wr198;
					bfly_di2 <= wr199;
					wr193 <= bfly_do1;
					counter <= counter + 1;
				end
				50: begin
					wr202 <= wr201;
					bfly_di1 <= wr202;
					bfly_di2 <= wr203;
					wr197 <= bfly_do1;
					counter <= counter + 1;
				end
				51: begin
					wr206 <= wr205;
					bfly_di1 <= wr206;
					bfly_di2 <= wr207;
					wr201 <= bfly_do1;
					counter <= counter + 1;
				end
				52: begin
					wr210 <= wr209;
					bfly_di1 <= wr210;
					bfly_di2 <= wr211;
					wr205 <= bfly_do1;
					counter <= counter + 1;
				end
				53: begin
					wr214 <= wr213;
					bfly_di1 <= wr214;
					bfly_di2 <= wr215;
					wr209 <= bfly_do1;
					counter <= counter + 1;
				end
				54: begin
					wr218 <= wr217;
					bfly_di1 <= wr218;
					bfly_di2 <= wr219;
					wr213 <= bfly_do1;
					counter <= counter + 1;
				end
				55: begin
					wr222 <= wr221;
					bfly_di1 <= wr222;
					bfly_di2 <= wr223;
					wr217 <= bfly_do1;
					counter <= counter + 1;
				end
				56: begin
					wr226 <= wr225;
					bfly_di1 <= wr226;
					bfly_di2 <= wr227;
					wr221 <= bfly_do1;
					counter <= counter + 1;
				end
				57: begin
					wr230 <= wr229;
					bfly_di1 <= wr230;
					bfly_di2 <= wr231;
					wr225 <= bfly_do1;
					counter <= counter + 1;
				end
				58: begin
					wr234 <= wr233;
					bfly_di1 <= wr234;
					bfly_di2 <= wr235;
					wr229 <= bfly_do1;
					counter <= counter + 1;
				end
				59: begin
					wr238 <= wr237;
					bfly_di1 <= wr238;
					bfly_di2 <= wr239;
					wr233 <= bfly_do1;
					counter <= counter + 1;
				end
				60: begin
					wr242 <= wr241;
					bfly_di1 <= wr242;
					bfly_di2 <= wr243;
					wr237 <= bfly_do1;
					counter <= counter + 1;
				end
				61: begin
					wr246 <= wr245;
					bfly_di1 <= wr246;
					bfly_di2 <= wr247;
					wr241 <= bfly_do1;
					counter <= counter + 1;
				end
				62: begin
					wr250 <= wr249;
					bfly_di1 <= wr250;
					bfly_di2 <= wr251;
					wr245 <= bfly_do1;
					counter <= counter + 1;
				end
				63: begin
					wr254 <= wr253;
					bfly_di1 <= wr254;
					bfly_di2 <= wr255;
					wr249 <= bfly_do1;
					//counter <= counter + 1;
					layer <= 9;
					counter <= 0;
				end
			endcase
		end
		9: begin	//post-addition-1(R5)
			//n <= 1;
			case(counter)
				0: begin
					wr253 <= bfly_do1;
					wr1 <= wr4+wr5;
					wr2 <= wr1;
					wr3 <= wr5+wr6;
					wr4 <= wr2;
					wr5 <= wr6+wr7;
					wr6 <= wr3;
					counter <= counter + 1;
				end
				1: begin
					wr9 <= wr12+wr13;
					wr10 <= wr9;
					wr11 <= wr13+wr14;
					wr12 <= wr10;
					wr13 <= wr14+wr15;
					wr14 <= wr11;
					counter <= counter + 1;
				end
				2: begin
					wr17 <= wr20+wr21;
					wr18 <= wr17;
					wr19 <= wr21+wr22;
					wr20 <= wr18;
					wr21 <= wr22+wr23;
					wr22 <= wr19;
					counter <= counter + 1;
				end
				3: begin
					wr25 <= wr28+wr29;
					wr26 <= wr25;
					wr27 <= wr29+wr30;
					wr28 <= wr26;
					wr29 <= wr30+wr31;
					wr30 <= wr27;
					counter <= counter + 1;
				end
				4: begin
					wr33 <= wr36+wr37;
					wr34 <= wr33;
					wr35 <= wr37+wr38;
					wr36 <= wr34;
					wr37 <= wr38+wr39;
					wr38 <= wr35;
					counter <= counter + 1;
				end
				5: begin
					wr41 <= wr44+wr45;
					wr42 <= wr41;
					wr43 <= wr45+wr46;
					wr44 <= wr42;
					wr45 <= wr46+wr47;
					wr46 <= wr43;
					counter <= counter + 1;
				end
				6: begin
					wr49 <= wr52+wr53;
					wr50 <= wr49;
					wr51 <= wr53+wr54;
					wr52 <= wr50;
					wr53 <= wr54+wr55;
					wr54 <= wr51;
					counter <= counter + 1;
				end
				7: begin
					wr57 <= wr60+wr61;
					wr58 <= wr57;
					wr59 <= wr61+wr62;
					wr60 <= wr58;
					wr61 <= wr62+wr63;
					wr62 <= wr59;
					counter <= counter + 1;
				end
				8: begin
					wr65 <= wr68+wr69;
					wr66 <= wr65;
					wr67 <= wr69+wr70;
					wr68 <= wr66;
					wr69 <= wr70+wr71;
					wr70 <= wr67;
					counter <= counter + 1;
				end
				9: begin
					wr73 <= wr76+wr77;
					wr74 <= wr73;
					wr75 <= wr77+wr78;
					wr76 <= wr74;
					wr77 <= wr78+wr79;
					wr78 <= wr75;
					counter <= counter + 1;
				end
				10: begin
					wr81 <= wr84+wr85;
					wr82 <= wr81;
					wr83 <= wr85+wr86;
					wr84 <= wr82;
					wr85 <= wr86+wr87;
					wr86 <= wr83;
					counter <= counter + 1;
				end
				11: begin
					wr89 <= wr92+wr93;
					wr90 <= wr89;
					wr91 <= wr93+wr94;
					wr92 <= wr90;
					wr93 <= wr94+wr95;
					wr94 <= wr91;
					counter <= counter + 1;
				end
				12: begin
					wr97 <= wr100+wr101;
					wr98 <= wr97;
					wr99 <= wr101+wr102;
					wr100 <= wr98;
					wr101 <= wr102+wr103;
					wr102 <= wr99;
					counter <= counter + 1;
				end
				13: begin
					wr105 <= wr108+wr109;
					wr106 <= wr105;
					wr107 <= wr109+wr110;
					wr108 <= wr106;
					wr109 <= wr110+wr111;
					wr110 <= wr107;
					counter <= counter + 1;
				end
				14: begin
					wr113 <= wr116+wr117;
					wr114 <= wr113;
					wr115 <= wr117+wr118;
					wr116 <= wr114;
					wr117 <= wr118+wr119;
					wr118 <= wr115;
					counter <= counter + 1;
				end
				15: begin
					wr121 <= wr124+wr125;
					wr122 <= wr121;
					wr123 <= wr125+wr126;
					wr124 <= wr122;
					wr125 <= wr126+wr127;
					wr126 <= wr123;
					counter <= counter + 1;
				end
				16: begin
					wr129 <= wr132+wr133;
					wr130 <= wr129;
					wr131 <= wr133+wr134;
					wr132 <= wr130;
					wr133 <= wr134+wr135;
					wr134 <= wr131;
					counter <= counter + 1;
				end
				17: begin
					wr137 <= wr140+wr141;
					wr138 <= wr137;
					wr139 <= wr141+wr142;
					wr140 <= wr138;
					wr141 <= wr142+wr143;
					wr142 <= wr139;
					counter <= counter + 1;
				end
				18: begin
					wr145 <= wr148+wr149;
					wr146 <= wr145;
					wr147 <= wr149+wr150;
					wr148 <= wr146;
					wr149 <= wr150+wr151;
					wr150 <= wr147;
					counter <= counter + 1;
				end
				19: begin
					wr153 <= wr156+wr157;
					wr154 <= wr153;
					wr155 <= wr157+wr158;
					wr156 <= wr154;
					wr157 <= wr158+wr159;
					wr158 <= wr155;
					counter <= counter + 1;
				end
				20: begin
					wr161 <= wr164+wr165;
					wr162 <= wr161;
					wr163 <= wr165+wr166;
					wr164 <= wr162;
					wr165 <= wr166+wr167;
					wr166 <= wr163;
					counter <= counter + 1;
				end
				21: begin
					wr169 <= wr172+wr173;
					wr170 <= wr169;
					wr171 <= wr173+wr174;
					wr172 <= wr170;
					wr173 <= wr174+wr175;
					wr174 <= wr171;
					counter <= counter + 1;
				end
				22: begin
					wr177 <= wr180+wr181;
					wr178 <= wr177;
					wr179 <= wr181+wr182;
					wr180 <= wr178;
					wr181 <= wr182+wr183;
					wr182 <= wr179;
					counter <= counter + 1;
				end
				23: begin
					wr185 <= wr188+wr189;
					wr186 <= wr185;
					wr187 <= wr189+wr190;
					wr188 <= wr186;
					wr189 <= wr190+wr191;
					wr190 <= wr187;
					counter <= counter + 1;
				end
				24: begin
					wr193 <= wr196+wr197;
					wr194 <= wr193;
					wr195 <= wr197+wr198;
					wr196 <= wr194;
					wr197 <= wr198+wr199;
					wr198 <= wr195;
					counter <= counter + 1;
				end
				25: begin
					wr201 <= wr204+wr205;
					wr202 <= wr201;
					wr203 <= wr205+wr206;
					wr204 <= wr202;
					wr205 <= wr206+wr207;
					wr206 <= wr203;
					counter <= counter + 1;
				end
				26: begin
					wr209 <= wr212+wr213;
					wr210 <= wr209;
					wr211 <= wr213+wr214;
					wr212 <= wr210;
					wr213 <= wr214+wr215;
					wr214 <= wr211;
					counter <= counter + 1;
				end
				27: begin
					wr217 <= wr220+wr221;
					wr218 <= wr217;
					wr219 <= wr221+wr222;
					wr220 <= wr218;
					wr221 <= wr222+wr223;
					wr222 <= wr219;
					counter <= counter + 1;
				end
				28: begin
					wr225 <= wr228+wr229;
					wr226 <= wr225;
					wr227 <= wr229+wr230;
					wr228 <= wr226;
					wr229 <= wr230+wr231;
					wr230 <= wr227;
					counter <= counter + 1;
				end
				29: begin
					wr233 <= wr236+wr237;
					wr234 <= wr233;
					wr235 <= wr237+wr238;
					wr236 <= wr234;
					wr237 <= wr238+wr239;
					wr238 <= wr235;
					counter <= counter + 1;
				end
				30: begin
					wr241 <= wr244+wr245;
					wr242 <= wr241;
					wr243 <= wr245+wr246;
					wr244 <= wr242;
					wr245 <= wr246+wr247;
					wr246 <= wr243;
					counter <= counter + 1;
				end
				31: begin
					wr249 <= wr252+wr253;
					wr250 <= wr249;
					wr251 <= wr253+wr254;
					wr252 <= wr250;
					wr253 <= wr254+wr255;
					wr254 <= wr251;
					//counter <= counter + 1;
					layer <= 10;
					counter <= 0;
				end
			endcase
		end
		10: begin	//post-addition-2(R4)
			//n <= 1;
			case(counter)
				0: begin
					wr1 <= wr8+wr9;
					wr2 <= wr1;
					wr3 <= wr9+wr10;
					wr4 <= wr2;
					wr5 <= wr10+wr11;
					wr6 <= wr3;
					wr7 <= wr11+wr12;
					wr8 <= wr4;
					wr9 <= wr12+wr13;
					wr10 <= wr5;
					wr11 <= wr13+wr14;
					wr12 <= wr6;
					wr13 <= wr14+wr15;
					wr14 <= wr7;
					counter <= counter + 1;
				end
				1: begin
					wr17 <= wr24+wr25;
					wr18 <= wr17;
					wr19 <= wr25+wr26;
					wr20 <= wr18;
					wr21 <= wr26+wr27;
					wr22 <= wr19;
					wr23 <= wr27+wr28;
					wr24 <= wr20;
					wr25 <= wr28+wr29;
					wr26 <= wr21;
					wr27 <= wr29+wr30;
					wr28 <= wr22;
					wr29 <= wr30+wr31;
					wr30 <= wr23;
					counter <= counter + 1;
				end
				2: begin
					wr33 <= wr40+wr41;
					wr34 <= wr33;
					wr35 <= wr41+wr42;
					wr36 <= wr34;
					wr37 <= wr42+wr43;
					wr38 <= wr35;
					wr39 <= wr43+wr44;
					wr40 <= wr36;
					wr41 <= wr44+wr45;
					wr42 <= wr37;
					wr43 <= wr45+wr46;
					wr44 <= wr38;
					wr45 <= wr46+wr47;
					wr46 <= wr39;
					counter <= counter + 1;
				end
				3: begin
					wr49 <= wr56+wr57;
					wr50 <= wr49;
					wr51 <= wr57+wr58;
					wr52 <= wr50;
					wr53 <= wr58+wr59;
					wr54 <= wr51;
					wr55 <= wr59+wr60;
					wr56 <= wr52;
					wr57 <= wr60+wr61;
					wr58 <= wr53;
					wr59 <= wr61+wr62;
					wr60 <= wr54;
					wr61 <= wr62+wr63;
					wr62 <= wr55;
					counter <= counter + 1;
				end
				4: begin
					wr65 <= wr72+wr73;
					wr66 <= wr65;
					wr67 <= wr73+wr74;
					wr68 <= wr66;
					wr69 <= wr74+wr75;
					wr70 <= wr67;
					wr71 <= wr75+wr76;
					wr72 <= wr68;
					wr73 <= wr76+wr77;
					wr74 <= wr69;
					wr75 <= wr77+wr78;
					wr76 <= wr70;
					wr77 <= wr78+wr79;
					wr78 <= wr71;
					counter <= counter + 1;
				end
				5: begin
					wr81 <= wr88+wr89;
					wr82 <= wr81;
					wr83 <= wr89+wr90;
					wr84 <= wr82;
					wr85 <= wr90+wr91;
					wr86 <= wr83;
					wr87 <= wr91+wr92;
					wr88 <= wr84;
					wr89 <= wr92+wr93;
					wr90 <= wr85;
					wr91 <= wr93+wr94;
					wr92 <= wr86;
					wr93 <= wr94+wr95;
					wr94 <= wr87;
					counter <= counter + 1;
				end
				6: begin
					wr97 <= wr104+wr105;
					wr98 <= wr97;
					wr99 <= wr105+wr106;
					wr100 <= wr98;
					wr101 <= wr106+wr107;
					wr102 <= wr99;
					wr103 <= wr107+wr108;
					wr104 <= wr100;
					wr105 <= wr108+wr109;
					wr106 <= wr101;
					wr107 <= wr109+wr110;
					wr108 <= wr102;
					wr109 <= wr110+wr111;
					wr110 <= wr103;
					counter <= counter + 1;
				end
				7: begin
					wr113 <= wr120+wr121;
					wr114 <= wr113;
					wr115 <= wr121+wr122;
					wr116 <= wr114;
					wr117 <= wr122+wr123;
					wr118 <= wr115;
					wr119 <= wr123+wr124;
					wr120 <= wr116;
					wr121 <= wr124+wr125;
					wr122 <= wr117;
					wr123 <= wr125+wr126;
					wr124 <= wr118;
					wr125 <= wr126+wr127;
					wr126 <= wr119;
					counter <= counter + 1;
				end
				8: begin
					wr129 <= wr136+wr137;
					wr130 <= wr129;
					wr131 <= wr137+wr138;
					wr132 <= wr130;
					wr133 <= wr138+wr139;
					wr134 <= wr131;
					wr135 <= wr139+wr140;
					wr136 <= wr132;
					wr137 <= wr140+wr141;
					wr138 <= wr133;
					wr139 <= wr141+wr142;
					wr140 <= wr134;
					wr141 <= wr142+wr143;
					wr142 <= wr135;
					counter <= counter + 1;
				end
				9: begin
					wr145 <= wr152+wr153;
					wr146 <= wr145;
					wr147 <= wr153+wr154;
					wr148 <= wr146;
					wr149 <= wr154+wr155;
					wr150 <= wr147;
					wr151 <= wr155+wr156;
					wr152 <= wr148;
					wr153 <= wr156+wr157;
					wr154 <= wr149;
					wr155 <= wr157+wr158;
					wr156 <= wr150;
					wr157 <= wr158+wr159;
					wr158 <= wr151;
					counter <= counter + 1;
				end
				10: begin
					wr161 <= wr168+wr169;
					wr162 <= wr161;
					wr163 <= wr169+wr170;
					wr164 <= wr162;
					wr165 <= wr170+wr171;
					wr166 <= wr163;
					wr167 <= wr171+wr172;
					wr168 <= wr164;
					wr169 <= wr172+wr173;
					wr170 <= wr165;
					wr171 <= wr173+wr174;
					wr172 <= wr166;
					wr173 <= wr174+wr175;
					wr174 <= wr167;
					counter <= counter + 1;
				end
				11: begin
					wr177 <= wr184+wr185;
					wr178 <= wr177;
					wr179 <= wr185+wr186;
					wr180 <= wr178;
					wr181 <= wr186+wr187;
					wr182 <= wr179;
					wr183 <= wr187+wr188;
					wr184 <= wr180;
					wr185 <= wr188+wr189;
					wr186 <= wr181;
					wr187 <= wr189+wr190;
					wr188 <= wr182;
					wr189 <= wr190+wr191;
					wr190 <= wr183;
					counter <= counter + 1;
				end
				12: begin
					wr193 <= wr200+wr201;
					wr194 <= wr193;
					wr195 <= wr201+wr202;
					wr196 <= wr194;
					wr197 <= wr202+wr203;
					wr198 <= wr195;
					wr199 <= wr203+wr204;
					wr200 <= wr196;
					wr201 <= wr204+wr205;
					wr202 <= wr197;
					wr203 <= wr205+wr206;
					wr204 <= wr198;
					wr205 <= wr206+wr207;
					wr206 <= wr199;
					counter <= counter + 1;
				end
				13: begin
					wr209 <= wr216+wr217;
					wr210 <= wr209;
					wr211 <= wr217+wr218;
					wr212 <= wr210;
					wr213 <= wr218+wr219;
					wr214 <= wr211;
					wr215 <= wr219+wr220;
					wr216 <= wr212;
					wr217 <= wr220+wr221;
					wr218 <= wr213;
					wr219 <= wr221+wr222;
					wr220 <= wr214;
					wr221 <= wr222+wr223;
					wr222 <= wr215;
					counter <= counter + 1;
				end
				14: begin
					wr225 <= wr232+wr233;
					wr226 <= wr225;
					wr227 <= wr233+wr234;
					wr228 <= wr226;
					wr229 <= wr234+wr235;
					wr230 <= wr227;
					wr231 <= wr235+wr236;
					wr232 <= wr228;
					wr233 <= wr236+wr237;
					wr234 <= wr229;
					wr235 <= wr237+wr238;
					wr236 <= wr230;
					wr237 <= wr238+wr239;
					wr238 <= wr231;
					counter <= counter + 1;
				end
				15: begin
					wr241 <= wr248+wr249;
					wr242 <= wr241;
					wr243 <= wr249+wr250;
					wr244 <= wr242;
					wr245 <= wr250+wr251;
					wr246 <= wr243;
					wr247 <= wr251+wr252;
					wr248 <= wr244;
					wr249 <= wr252+wr253;
					wr250 <= wr245;
					wr251 <= wr253+wr254;
					wr252 <= wr246;
					wr253 <= wr254+wr255;
					wr254 <= wr247;
					//counter <= counter + 1;
					layer <= 11;
					counter <= 0;
				end
			endcase
		end
		11: begin	//post-addition-3(R3)
			//n <= 1;
			case(counter)
				0: begin
					wr1 <= wr16+wr17;
					wr2 <= wr1;
					wr3 <= wr17+wr18;
					wr4 <= wr2;
					wr5 <= wr18+wr19;
					wr6 <= wr3;
					wr7 <= wr19+wr20;
					wr8 <= wr4;
					wr9 <= wr20+wr21;
					wr10 <= wr5;
					wr11 <= wr21+wr22;
					wr12 <= wr6;
					wr13 <= wr22+wr23;
					wr14 <= wr7;
					wr15 <= wr23+wr24;
					wr16 <= wr8;
					wr17 <= wr24+wr25;
					wr18 <= wr9;
					wr19 <= wr25+wr26;
					wr20 <= wr10;
					wr21 <= wr26+wr27;
					wr22 <= wr11;
					wr23 <= wr27+wr28;
					wr24 <= wr12;
					wr25 <= wr28+wr29;
					wr26 <= wr13;
					wr27 <= wr29+wr30;
					wr28 <= wr14;
					wr29 <= wr30+wr31;
					wr30 <= wr15;
					counter <= counter + 1;
				end
				1: begin
					wr33 <= wr48+wr49;
					wr34 <= wr33;
					wr35 <= wr49+wr50;
					wr36 <= wr34;
					wr37 <= wr50+wr51;
					wr38 <= wr35;
					wr39 <= wr51+wr52;
					wr40 <= wr36;
					wr41 <= wr52+wr53;
					wr42 <= wr37;
					wr43 <= wr53+wr54;
					wr44 <= wr38;
					wr45 <= wr54+wr55;
					wr46 <= wr39;
					wr47 <= wr55+wr56;
					wr48 <= wr40;
					wr49 <= wr56+wr57;
					wr50 <= wr41;
					wr51 <= wr57+wr58;
					wr52 <= wr42;
					wr53 <= wr58+wr59;
					wr54 <= wr43;
					wr55 <= wr59+wr60;
					wr56 <= wr44;
					wr57 <= wr60+wr61;
					wr58 <= wr45;
					wr59 <= wr61+wr62;
					wr60 <= wr46;
					wr61 <= wr62+wr63;
					wr62 <= wr47;
					counter <= counter + 1;
				end
				2: begin
					wr65 <= wr80+wr81;
					wr66 <= wr65;
					wr67 <= wr81+wr82;
					wr68 <= wr66;
					wr69 <= wr82+wr83;
					wr70 <= wr67;
					wr71 <= wr83+wr84;
					wr72 <= wr68;
					wr73 <= wr84+wr85;
					wr74 <= wr69;
					wr75 <= wr85+wr86;
					wr76 <= wr70;
					wr77 <= wr86+wr87;
					wr78 <= wr71;
					wr79 <= wr87+wr88;
					wr80 <= wr72;
					wr81 <= wr88+wr89;
					wr82 <= wr73;
					wr83 <= wr89+wr90;
					wr84 <= wr74;
					wr85 <= wr90+wr91;
					wr86 <= wr75;
					wr87 <= wr91+wr92;
					wr88 <= wr76;
					wr89 <= wr92+wr93;
					wr90 <= wr77;
					wr91 <= wr93+wr94;
					wr92 <= wr78;
					wr93 <= wr94+wr95;
					wr94 <= wr79;
					counter <= counter + 1;
				end
				3: begin
					wr97 <= wr112+wr113;
					wr98 <= wr97;
					wr99 <= wr113+wr114;
					wr100 <= wr98;
					wr101 <= wr114+wr115;
					wr102 <= wr99;
					wr103 <= wr115+wr116;
					wr104 <= wr100;
					wr105 <= wr116+wr117;
					wr106 <= wr101;
					wr107 <= wr117+wr118;
					wr108 <= wr102;
					wr109 <= wr118+wr119;
					wr110 <= wr103;
					wr111 <= wr119+wr120;
					wr112 <= wr104;
					wr113 <= wr120+wr121;
					wr114 <= wr105;
					wr115 <= wr121+wr122;
					wr116 <= wr106;
					wr117 <= wr122+wr123;
					wr118 <= wr107;
					wr119 <= wr123+wr124;
					wr120 <= wr108;
					wr121 <= wr124+wr125;
					wr122 <= wr109;
					wr123 <= wr125+wr126;
					wr124 <= wr110;
					wr125 <= wr126+wr127;
					wr126 <= wr111;
					counter <= counter + 1;
				end
				4: begin
					wr129 <= wr144+wr145;
					wr130 <= wr129;
					wr131 <= wr145+wr146;
					wr132 <= wr130;
					wr133 <= wr146+wr147;
					wr134 <= wr131;
					wr135 <= wr147+wr148;
					wr136 <= wr132;
					wr137 <= wr148+wr149;
					wr138 <= wr133;
					wr139 <= wr149+wr150;
					wr140 <= wr134;
					wr141 <= wr150+wr151;
					wr142 <= wr135;
					wr143 <= wr151+wr152;
					wr144 <= wr136;
					wr145 <= wr152+wr153;
					wr146 <= wr137;
					wr147 <= wr153+wr154;
					wr148 <= wr138;
					wr149 <= wr154+wr155;
					wr150 <= wr139;
					wr151 <= wr155+wr156;
					wr152 <= wr140;
					wr153 <= wr156+wr157;
					wr154 <= wr141;
					wr155 <= wr157+wr158;
					wr156 <= wr142;
					wr157 <= wr158+wr159;
					wr158 <= wr143;
					counter <= counter + 1;
				end
				5: begin
					wr161 <= wr176+wr177;
					wr162 <= wr161;
					wr163 <= wr177+wr178;
					wr164 <= wr162;
					wr165 <= wr178+wr179;
					wr166 <= wr163;
					wr167 <= wr179+wr180;
					wr168 <= wr164;
					wr169 <= wr180+wr181;
					wr170 <= wr165;
					wr171 <= wr181+wr182;
					wr172 <= wr166;
					wr173 <= wr182+wr183;
					wr174 <= wr167;
					wr175 <= wr183+wr184;
					wr176 <= wr168;
					wr177 <= wr184+wr185;
					wr178 <= wr169;
					wr179 <= wr185+wr186;
					wr180 <= wr170;
					wr181 <= wr186+wr187;
					wr182 <= wr171;
					wr183 <= wr187+wr188;
					wr184 <= wr172;
					wr185 <= wr188+wr189;
					wr186 <= wr173;
					wr187 <= wr189+wr190;
					wr188 <= wr174;
					wr189 <= wr190+wr191;
					wr190 <= wr175;
					counter <= counter + 1;
				end
				6: begin
					wr193 <= wr208+wr209;
					wr194 <= wr193;
					wr195 <= wr209+wr210;
					wr196 <= wr194;
					wr197 <= wr210+wr211;
					wr198 <= wr195;
					wr199 <= wr211+wr212;
					wr200 <= wr196;
					wr201 <= wr212+wr213;
					wr202 <= wr197;
					wr203 <= wr213+wr214;
					wr204 <= wr198;
					wr205 <= wr214+wr215;
					wr206 <= wr199;
					wr207 <= wr215+wr216;
					wr208 <= wr200;
					wr209 <= wr216+wr217;
					wr210 <= wr201;
					wr211 <= wr217+wr218;
					wr212 <= wr202;
					wr213 <= wr218+wr219;
					wr214 <= wr203;
					wr215 <= wr219+wr220;
					wr216 <= wr204;
					wr217 <= wr220+wr221;
					wr218 <= wr205;
					wr219 <= wr221+wr222;
					wr220 <= wr206;
					wr221 <= wr222+wr223;
					wr222 <= wr207;
					counter <= counter + 1;
				end
				7: begin
					wr225 <= wr240+wr241;
					wr226 <= wr225;
					wr227 <= wr241+wr242;
					wr228 <= wr226;
					wr229 <= wr242+wr243;
					wr230 <= wr227;
					wr231 <= wr243+wr244;
					wr232 <= wr228;
					wr233 <= wr244+wr245;
					wr234 <= wr229;
					wr235 <= wr245+wr246;
					wr236 <= wr230;
					wr237 <= wr246+wr247;
					wr238 <= wr231;
					wr239 <= wr247+wr248;
					wr240 <= wr232;
					wr241 <= wr248+wr249;
					wr242 <= wr233;
					wr243 <= wr249+wr250;
					wr244 <= wr234;
					wr245 <= wr250+wr251;
					wr246 <= wr235;
					wr247 <= wr251+wr252;
					wr248 <= wr236;
					wr249 <= wr252+wr253;
					wr250 <= wr237;
					wr251 <= wr253+wr254;
					wr252 <= wr238;
					wr253 <= wr254+wr255;
					wr254 <= wr239;
					//counter <= counter + 1;
					layer <= 12;
					counter <= 0;
				end
			endcase
		end
		12: begin	//post-addition-4(R2)
			//n <= 1;
			case(counter)
				0: begin
					wr1 <= wr32+wr33;
					wr2 <= wr1;
					wr3 <= wr33+wr34;
					wr4 <= wr2;
					wr5 <= wr34+wr35;
					wr6 <= wr3;
					wr7 <= wr35+wr36;
					wr8 <= wr4;
					wr9 <= wr36+wr37;
					wr10 <= wr5;
					wr11 <= wr37+wr38;
					wr12 <= wr6;
					wr13 <= wr38+wr39;
					wr14 <= wr7;
					wr15 <= wr39+wr40;
					wr16 <= wr8;
					wr17 <= wr40+wr41;
					wr18 <= wr9;
					wr19 <= wr41+wr42;
					wr20 <= wr10;
					wr21 <= wr42+wr43;
					wr22 <= wr11;
					wr23 <= wr43+wr44;
					wr24 <= wr12;
					wr25 <= wr44+wr45;
					wr26 <= wr13;
					wr27 <= wr45+wr46;
					wr28 <= wr14;
					wr29 <= wr46+wr47;
					wr30 <= wr15;
					wr31 <= wr47+wr48;
					wr32 <= wr16;
					wr33 <= wr48+wr49;
					wr34 <= wr17;
					wr35 <= wr49+wr50;
					wr36 <= wr18;
					wr37 <= wr50+wr51;
					wr38 <= wr19;
					wr39 <= wr51+wr52;
					wr40 <= wr20;
					wr41 <= wr52+wr53;
					wr42 <= wr21;
					wr43 <= wr53+wr54;
					wr44 <= wr22;
					wr45 <= wr54+wr55;
					wr46 <= wr23;
					wr47 <= wr55+wr56;
					wr48 <= wr24;
					wr49 <= wr56+wr57;
					wr50 <= wr25;
					wr51 <= wr57+wr58;
					wr52 <= wr26;
					wr53 <= wr58+wr59;
					wr54 <= wr27;
					wr55 <= wr59+wr60;
					wr56 <= wr28;
					wr57 <= wr60+wr61;
					wr58 <= wr29;
					wr59 <= wr61+wr62;
					wr60 <= wr30;
					wr61 <= wr62+wr63;
					wr62 <= wr31;
					counter <= counter + 1;
				end
				1: begin
					wr65 <= wr96+wr97;
					wr66 <= wr65;
					wr67 <= wr97+wr98;
					wr68 <= wr66;
					wr69 <= wr98+wr99;
					wr70 <= wr67;
					wr71 <= wr99+wr100;
					wr72 <= wr68;
					wr73 <= wr100+wr101;
					wr74 <= wr69;
					wr75 <= wr101+wr102;
					wr76 <= wr70;
					wr77 <= wr102+wr103;
					wr78 <= wr71;
					wr79 <= wr103+wr104;
					wr80 <= wr72;
					wr81 <= wr104+wr105;
					wr82 <= wr73;
					wr83 <= wr105+wr106;
					wr84 <= wr74;
					wr85 <= wr106+wr107;
					wr86 <= wr75;
					wr87 <= wr107+wr108;
					wr88 <= wr76;
					wr89 <= wr108+wr109;
					wr90 <= wr77;
					wr91 <= wr109+wr110;
					wr92 <= wr78;
					wr93 <= wr110+wr111;
					wr94 <= wr79;
					wr95 <= wr111+wr112;
					wr96 <= wr80;
					wr97 <= wr112+wr113;
					wr98 <= wr81;
					wr99 <= wr113+wr114;
					wr100 <= wr82;
					wr101 <= wr114+wr115;
					wr102 <= wr83;
					wr103 <= wr115+wr116;
					wr104 <= wr84;
					wr105 <= wr116+wr117;
					wr106 <= wr85;
					wr107 <= wr117+wr118;
					wr108 <= wr86;
					wr109 <= wr118+wr119;
					wr110 <= wr87;
					wr111 <= wr119+wr120;
					wr112 <= wr88;
					wr113 <= wr120+wr121;
					wr114 <= wr89;
					wr115 <= wr121+wr122;
					wr116 <= wr90;
					wr117 <= wr122+wr123;
					wr118 <= wr91;
					wr119 <= wr123+wr124;
					wr120 <= wr92;
					wr121 <= wr124+wr125;
					wr122 <= wr93;
					wr123 <= wr125+wr126;
					wr124 <= wr94;
					wr125 <= wr126+wr127;
					wr126 <= wr95;
					counter <= counter + 1;
				end
				2: begin
					wr129 <= wr160+wr161;
					wr130 <= wr129;
					wr131 <= wr161+wr162;
					wr132 <= wr130;
					wr133 <= wr162+wr163;
					wr134 <= wr131;
					wr135 <= wr163+wr164;
					wr136 <= wr132;
					wr137 <= wr164+wr165;
					wr138 <= wr133;
					wr139 <= wr165+wr166;
					wr140 <= wr134;
					wr141 <= wr166+wr167;
					wr142 <= wr135;
					wr143 <= wr167+wr168;
					wr144 <= wr136;
					wr145 <= wr168+wr169;
					wr146 <= wr137;
					wr147 <= wr169+wr170;
					wr148 <= wr138;
					wr149 <= wr170+wr171;
					wr150 <= wr139;
					wr151 <= wr171+wr172;
					wr152 <= wr140;
					wr153 <= wr172+wr173;
					wr154 <= wr141;
					wr155 <= wr173+wr174;
					wr156 <= wr142;
					wr157 <= wr174+wr175;
					wr158 <= wr143;
					wr159 <= wr175+wr176;
					wr160 <= wr144;
					wr161 <= wr176+wr177;
					wr162 <= wr145;
					wr163 <= wr177+wr178;
					wr164 <= wr146;
					wr165 <= wr178+wr179;
					wr166 <= wr147;
					wr167 <= wr179+wr180;
					wr168 <= wr148;
					wr169 <= wr180+wr181;
					wr170 <= wr149;
					wr171 <= wr181+wr182;
					wr172 <= wr150;
					wr173 <= wr182+wr183;
					wr174 <= wr151;
					wr175 <= wr183+wr184;
					wr176 <= wr152;
					wr177 <= wr184+wr185;
					wr178 <= wr153;
					wr179 <= wr185+wr186;
					wr180 <= wr154;
					wr181 <= wr186+wr187;
					wr182 <= wr155;
					wr183 <= wr187+wr188;
					wr184 <= wr156;
					wr185 <= wr188+wr189;
					wr186 <= wr157;
					wr187 <= wr189+wr190;
					wr188 <= wr158;
					wr189 <= wr190+wr191;
					wr190 <= wr159;
					counter <= counter + 1;
				end
				3: begin
					wr193 <= wr224+wr225;
					wr194 <= wr193;
					wr195 <= wr225+wr226;
					wr196 <= wr194;
					wr197 <= wr226+wr227;
					wr198 <= wr195;
					wr199 <= wr227+wr228;
					wr200 <= wr196;
					wr201 <= wr228+wr229;
					wr202 <= wr197;
					wr203 <= wr229+wr230;
					wr204 <= wr198;
					wr205 <= wr230+wr231;
					wr206 <= wr199;
					wr207 <= wr231+wr232;
					wr208 <= wr200;
					wr209 <= wr232+wr233;
					wr210 <= wr201;
					wr211 <= wr233+wr234;
					wr212 <= wr202;
					wr213 <= wr234+wr235;
					wr214 <= wr203;
					wr215 <= wr235+wr236;
					wr216 <= wr204;
					wr217 <= wr236+wr237;
					wr218 <= wr205;
					wr219 <= wr237+wr238;
					wr220 <= wr206;
					wr221 <= wr238+wr239;
					wr222 <= wr207;
					wr223 <= wr239+wr240;
					wr224 <= wr208;
					wr225 <= wr240+wr241;
					wr226 <= wr209;
					wr227 <= wr241+wr242;
					wr228 <= wr210;
					wr229 <= wr242+wr243;
					wr230 <= wr211;
					wr231 <= wr243+wr244;
					wr232 <= wr212;
					wr233 <= wr244+wr245;
					wr234 <= wr213;
					wr235 <= wr245+wr246;
					wr236 <= wr214;
					wr237 <= wr246+wr247;
					wr238 <= wr215;
					wr239 <= wr247+wr248;
					wr240 <= wr216;
					wr241 <= wr248+wr249;
					wr242 <= wr217;
					wr243 <= wr249+wr250;
					wr244 <= wr218;
					wr245 <= wr250+wr251;
					wr246 <= wr219;
					wr247 <= wr251+wr252;
					wr248 <= wr220;
					wr249 <= wr252+wr253;
					wr250 <= wr221;
					wr251 <= wr253+wr254;
					wr252 <= wr222;
					wr253 <= wr254+wr255;
					wr254 <= wr223;
					//counter <= counter + 1;
					layer <= 13;
					counter <= 0;
				end
			endcase
		end
		13: begin	//post-addition-5(R1)
			//n <= 1;
			case(counter)
				0: begin
					wr1 <= wr64+wr65;
					wr2 <= wr1;
					wr3 <= wr65+wr66;
					wr4 <= wr2;
					wr5 <= wr66+wr67;
					wr6 <= wr3;
					wr7 <= wr67+wr68;
					wr8 <= wr4;
					wr9 <= wr68+wr69;
					wr10 <= wr5;
					wr11 <= wr69+wr70;
					wr12 <= wr6;
					wr13 <= wr70+wr71;
					wr14 <= wr7;
					wr15 <= wr71+wr72;
					wr16 <= wr8;
					wr17 <= wr72+wr73;
					wr18 <= wr9;
					wr19 <= wr73+wr74;
					wr20 <= wr10;
					wr21 <= wr74+wr75;
					wr22 <= wr11;
					wr23 <= wr75+wr76;
					wr24 <= wr12;
					wr25 <= wr76+wr77;
					wr26 <= wr13;
					wr27 <= wr77+wr78;
					wr28 <= wr14;
					wr29 <= wr78+wr79;
					wr30 <= wr15;
					wr31 <= wr79+wr80;
					wr32 <= wr16;
					wr33 <= wr80+wr81;
					wr34 <= wr17;
					wr35 <= wr81+wr82;
					wr36 <= wr18;
					wr37 <= wr82+wr83;
					wr38 <= wr19;
					wr39 <= wr83+wr84;
					wr40 <= wr20;
					wr41 <= wr84+wr85;
					wr42 <= wr21;
					wr43 <= wr85+wr86;
					wr44 <= wr22;
					wr45 <= wr86+wr87;
					wr46 <= wr23;
					wr47 <= wr87+wr88;
					wr48 <= wr24;
					wr49 <= wr88+wr89;
					wr50 <= wr25;
					wr51 <= wr89+wr90;
					wr52 <= wr26;
					wr53 <= wr90+wr91;
					wr54 <= wr27;
					wr55 <= wr91+wr92;
					wr56 <= wr28;
					wr57 <= wr92+wr93;
					wr58 <= wr29;
					wr59 <= wr93+wr94;
					wr60 <= wr30;
					wr61 <= wr94+wr95;
					wr62 <= wr31;
					wr63 <= wr95+wr96;
					wr64 <= wr32;
					wr65 <= wr96+wr97;
					wr66 <= wr33;
					wr67 <= wr97+wr98;
					wr68 <= wr34;
					wr69 <= wr98+wr99;
					wr70 <= wr35;
					wr71 <= wr99+wr100;
					wr72 <= wr36;
					wr73 <= wr100+wr101;
					wr74 <= wr37;
					wr75 <= wr101+wr102;
					wr76 <= wr38;
					wr77 <= wr102+wr103;
					wr78 <= wr39;
					wr79 <= wr103+wr104;
					wr80 <= wr40;
					wr81 <= wr104+wr105;
					wr82 <= wr41;
					wr83 <= wr105+wr106;
					wr84 <= wr42;
					wr85 <= wr106+wr107;
					wr86 <= wr43;
					wr87 <= wr107+wr108;
					wr88 <= wr44;
					wr89 <= wr108+wr109;
					wr90 <= wr45;
					wr91 <= wr109+wr110;
					wr92 <= wr46;
					wr93 <= wr110+wr111;
					wr94 <= wr47;
					wr95 <= wr111+wr112;
					wr96 <= wr48;
					wr97 <= wr112+wr113;
					wr98 <= wr49;
					wr99 <= wr113+wr114;
					wr100 <= wr50;
					wr101 <= wr114+wr115;
					wr102 <= wr51;
					wr103 <= wr115+wr116;
					wr104 <= wr52;
					wr105 <= wr116+wr117;
					wr106 <= wr53;
					wr107 <= wr117+wr118;
					wr108 <= wr54;
					wr109 <= wr118+wr119;
					wr110 <= wr55;
					wr111 <= wr119+wr120;
					wr112 <= wr56;
					wr113 <= wr120+wr121;
					wr114 <= wr57;
					wr115 <= wr121+wr122;
					wr116 <= wr58;
					wr117 <= wr122+wr123;
					wr118 <= wr59;
					wr119 <= wr123+wr124;
					wr120 <= wr60;
					wr121 <= wr124+wr125;
					wr122 <= wr61;
					wr123 <= wr125+wr126;
					wr124 <= wr62;
					wr125 <= wr126+wr127;
					wr126 <= wr63;
					counter <= counter + 1;
				end
				1: begin
					wr129 <= wr192+wr193;
					wr130 <= wr129;
					wr131 <= wr193+wr194;
					wr132 <= wr130;
					wr133 <= wr194+wr195;
					wr134 <= wr131;
					wr135 <= wr195+wr196;
					wr136 <= wr132;
					wr137 <= wr196+wr197;
					wr138 <= wr133;
					wr139 <= wr197+wr198;
					wr140 <= wr134;
					wr141 <= wr198+wr199;
					wr142 <= wr135;
					wr143 <= wr199+wr200;
					wr144 <= wr136;
					wr145 <= wr200+wr201;
					wr146 <= wr137;
					wr147 <= wr201+wr202;
					wr148 <= wr138;
					wr149 <= wr202+wr203;
					wr150 <= wr139;
					wr151 <= wr203+wr204;
					wr152 <= wr140;
					wr153 <= wr204+wr205;
					wr154 <= wr141;
					wr155 <= wr205+wr206;
					wr156 <= wr142;
					wr157 <= wr206+wr207;
					wr158 <= wr143;
					wr159 <= wr207+wr208;
					wr160 <= wr144;
					wr161 <= wr208+wr209;
					wr162 <= wr145;
					wr163 <= wr209+wr210;
					wr164 <= wr146;
					wr165 <= wr210+wr211;
					wr166 <= wr147;
					wr167 <= wr211+wr212;
					wr168 <= wr148;
					wr169 <= wr212+wr213;
					wr170 <= wr149;
					wr171 <= wr213+wr214;
					wr172 <= wr150;
					wr173 <= wr214+wr215;
					wr174 <= wr151;
					wr175 <= wr215+wr216;
					wr176 <= wr152;
					wr177 <= wr216+wr217;
					wr178 <= wr153;
					wr179 <= wr217+wr218;
					wr180 <= wr154;
					wr181 <= wr218+wr219;
					wr182 <= wr155;
					wr183 <= wr219+wr220;
					wr184 <= wr156;
					wr185 <= wr220+wr221;
					wr186 <= wr157;
					wr187 <= wr221+wr222;
					wr188 <= wr158;
					wr189 <= wr222+wr223;
					wr190 <= wr159;
					wr191 <= wr223+wr224;
					wr192 <= wr160;
					wr193 <= wr224+wr225;
					wr194 <= wr161;
					wr195 <= wr225+wr226;
					wr196 <= wr162;
					wr197 <= wr226+wr227;
					wr198 <= wr163;
					wr199 <= wr227+wr228;
					wr200 <= wr164;
					wr201 <= wr228+wr229;
					wr202 <= wr165;
					wr203 <= wr229+wr230;
					wr204 <= wr166;
					wr205 <= wr230+wr231;
					wr206 <= wr167;
					wr207 <= wr231+wr232;
					wr208 <= wr168;
					wr209 <= wr232+wr233;
					wr210 <= wr169;
					wr211 <= wr233+wr234;
					wr212 <= wr170;
					wr213 <= wr234+wr235;
					wr214 <= wr171;
					wr215 <= wr235+wr236;
					wr216 <= wr172;
					wr217 <= wr236+wr237;
					wr218 <= wr173;
					wr219 <= wr237+wr238;
					wr220 <= wr174;
					wr221 <= wr238+wr239;
					wr222 <= wr175;
					wr223 <= wr239+wr240;
					wr224 <= wr176;
					wr225 <= wr240+wr241;
					wr226 <= wr177;
					wr227 <= wr241+wr242;
					wr228 <= wr178;
					wr229 <= wr242+wr243;
					wr230 <= wr179;
					wr231 <= wr243+wr244;
					wr232 <= wr180;
					wr233 <= wr244+wr245;
					wr234 <= wr181;
					wr235 <= wr245+wr246;
					wr236 <= wr182;
					wr237 <= wr246+wr247;
					wr238 <= wr183;
					wr239 <= wr247+wr248;
					wr240 <= wr184;
					wr241 <= wr248+wr249;
					wr242 <= wr185;
					wr243 <= wr249+wr250;
					wr244 <= wr186;
					wr245 <= wr250+wr251;
					wr246 <= wr187;
					wr247 <= wr251+wr252;
					wr248 <= wr188;
					wr249 <= wr252+wr253;
					wr250 <= wr189;
					wr251 <= wr253+wr254;
					wr252 <= wr190;
					wr253 <= wr254+wr255;
					wr254 <= wr191;
					//counter <= counter + 1;
					layer <= 14;
					counter <= 0;
				end
			endcase
		end
		14: begin	//post-addition-6(R0)
			//n <= 1;
			wr1 <= wr128+wr129;
			wr2 <= wr1;
			wr3 <= wr129+wr130;
			wr4 <= wr2;
			wr5 <= wr130+wr131;
			wr6 <= wr3;
			wr7 <= wr131+wr132;
			wr8 <= wr4;
			wr9 <= wr132+wr133;
			wr10 <= wr5;
			wr11 <= wr133+wr134;
			wr12 <= wr6;
			wr13 <= wr134+wr135;
			wr14 <= wr7;
			wr15 <= wr135+wr136;
			wr16 <= wr8;
			wr17 <= wr136+wr137;
			wr18 <= wr9;
			wr19 <= wr137+wr138;
			wr20 <= wr10;
			wr21 <= wr138+wr139;
			wr22 <= wr11;
			wr23 <= wr139+wr140;
			wr24 <= wr12;
			wr25 <= wr140+wr141;
			wr26 <= wr13;
			wr27 <= wr141+wr142;
			wr28 <= wr14;
			wr29 <= wr142+wr143;
			wr30 <= wr15;
			wr31 <= wr143+wr144;
			wr32 <= wr16;
			wr33 <= wr144+wr145;
			wr34 <= wr17;
			wr35 <= wr145+wr146;
			wr36 <= wr18;
			wr37 <= wr146+wr147;
			wr38 <= wr19;
			wr39 <= wr147+wr148;
			wr40 <= wr20;
			wr41 <= wr148+wr149;
			wr42 <= wr21;
			wr43 <= wr149+wr150;
			wr44 <= wr22;
			wr45 <= wr150+wr151;
			wr46 <= wr23;
			wr47 <= wr151+wr152;
			wr48 <= wr24;
			wr49 <= wr152+wr153;
			wr50 <= wr25;
			wr51 <= wr153+wr154;
			wr52 <= wr26;
			wr53 <= wr154+wr155;
			wr54 <= wr27;
			wr55 <= wr155+wr156;
			wr56 <= wr28;
			wr57 <= wr156+wr157;
			wr58 <= wr29;
			wr59 <= wr157+wr158;
			wr60 <= wr30;
			wr61 <= wr158+wr159;
			wr62 <= wr31;
			wr63 <= wr159+wr160;
			wr64 <= wr32;
			wr65 <= wr160+wr161;
			wr66 <= wr33;
			wr67 <= wr161+wr162;
			wr68 <= wr34;
			wr69 <= wr162+wr163;
			wr70 <= wr35;
			wr71 <= wr163+wr164;
			wr72 <= wr36;
			wr73 <= wr164+wr165;
			wr74 <= wr37;
			wr75 <= wr165+wr166;
			wr76 <= wr38;
			wr77 <= wr166+wr167;
			wr78 <= wr39;
			wr79 <= wr167+wr168;
			wr80 <= wr40;
			wr81 <= wr168+wr169;
			wr82 <= wr41;
			wr83 <= wr169+wr170;
			wr84 <= wr42;
			wr85 <= wr170+wr171;
			wr86 <= wr43;
			wr87 <= wr171+wr172;
			wr88 <= wr44;
			wr89 <= wr172+wr173;
			wr90 <= wr45;
			wr91 <= wr173+wr174;
			wr92 <= wr46;
			wr93 <= wr174+wr175;
			wr94 <= wr47;
			wr95 <= wr175+wr176;
			wr96 <= wr48;
			wr97 <= wr176+wr177;
			wr98 <= wr49;
			wr99 <= wr177+wr178;
			wr100 <= wr50;
			wr101 <= wr178+wr179;
			wr102 <= wr51;
			wr103 <= wr179+wr180;
			wr104 <= wr52;
			wr105 <= wr180+wr181;
			wr106 <= wr53;
			wr107 <= wr181+wr182;
			wr108 <= wr54;
			wr109 <= wr182+wr183;
			wr110 <= wr55;
			wr111 <= wr183+wr184;
			wr112 <= wr56;
			wr113 <= wr184+wr185;
			wr114 <= wr57;
			wr115 <= wr185+wr186;
			wr116 <= wr58;
			wr117 <= wr186+wr187;
			wr118 <= wr59;
			wr119 <= wr187+wr188;
			wr120 <= wr60;
			wr121 <= wr188+wr189;
			wr122 <= wr61;
			wr123 <= wr189+wr190;
			wr124 <= wr62;
			wr125 <= wr190+wr191;
			wr126 <= wr63;
			wr127 <= wr191+wr192;
			wr128 <= wr64;
			wr129 <= wr192+wr193;
			wr130 <= wr65;
			wr131 <= wr193+wr194;
			wr132 <= wr66;
			wr133 <= wr194+wr195;
			wr134 <= wr67;
			wr135 <= wr195+wr196;
			wr136 <= wr68;
			wr137 <= wr196+wr197;
			wr138 <= wr69;
			wr139 <= wr197+wr198;
			wr140 <= wr70;
			wr141 <= wr198+wr199;
			wr142 <= wr71;
			wr143 <= wr199+wr200;
			wr144 <= wr72;
			wr145 <= wr200+wr201;
			wr146 <= wr73;
			wr147 <= wr201+wr202;
			wr148 <= wr74;
			wr149 <= wr202+wr203;
			wr150 <= wr75;
			wr151 <= wr203+wr204;
			wr152 <= wr76;
			wr153 <= wr204+wr205;
			wr154 <= wr77;
			wr155 <= wr205+wr206;
			wr156 <= wr78;
			wr157 <= wr206+wr207;
			wr158 <= wr79;
			wr159 <= wr207+wr208;
			wr160 <= wr80;
			wr161 <= wr208+wr209;
			wr162 <= wr81;
			wr163 <= wr209+wr210;
			wr164 <= wr82;
			wr165 <= wr210+wr211;
			wr166 <= wr83;
			wr167 <= wr211+wr212;
			wr168 <= wr84;
			wr169 <= wr212+wr213;
			wr170 <= wr85;
			wr171 <= wr213+wr214;
			wr172 <= wr86;
			wr173 <= wr214+wr215;
			wr174 <= wr87;
			wr175 <= wr215+wr216;
			wr176 <= wr88;
			wr177 <= wr216+wr217;
			wr178 <= wr89;
			wr179 <= wr217+wr218;
			wr180 <= wr90;
			wr181 <= wr218+wr219;
			wr182 <= wr91;
			wr183 <= wr219+wr220;
			wr184 <= wr92;
			wr185 <= wr220+wr221;
			wr186 <= wr93;
			wr187 <= wr221+wr222;
			wr188 <= wr94;
			wr189 <= wr222+wr223;
			wr190 <= wr95;
			wr191 <= wr223+wr224;
			wr192 <= wr96;
			wr193 <= wr224+wr225;
			wr194 <= wr97;
			wr195 <= wr225+wr226;
			wr196 <= wr98;
			wr197 <= wr226+wr227;
			wr198 <= wr99;
			wr199 <= wr227+wr228;
			wr200 <= wr100;
			wr201 <= wr228+wr229;
			wr202 <= wr101;
			wr203 <= wr229+wr230;
			wr204 <= wr102;
			wr205 <= wr230+wr231;
			wr206 <= wr103;
			wr207 <= wr231+wr232;
			wr208 <= wr104;
			wr209 <= wr232+wr233;
			wr210 <= wr105;
			wr211 <= wr233+wr234;
			wr212 <= wr106;
			wr213 <= wr234+wr235;
			wr214 <= wr107;
			wr215 <= wr235+wr236;
			wr216 <= wr108;
			wr217 <= wr236+wr237;
			wr218 <= wr109;
			wr219 <= wr237+wr238;
			wr220 <= wr110;
			wr221 <= wr238+wr239;
			wr222 <= wr111;
			wr223 <= wr239+wr240;
			wr224 <= wr112;
			wr225 <= wr240+wr241;
			wr226 <= wr113;
			wr227 <= wr241+wr242;
			wr228 <= wr114;
			wr229 <= wr242+wr243;
			wr230 <= wr115;
			wr231 <= wr243+wr244;
			wr232 <= wr116;
			wr233 <= wr244+wr245;
			wr234 <= wr117;
			wr235 <= wr245+wr246;
			wr236 <= wr118;
			wr237 <= wr246+wr247;
			wr238 <= wr119;
			wr239 <= wr247+wr248;
			wr240 <= wr120;
			wr241 <= wr248+wr249;
			wr242 <= wr121;
			wr243 <= wr249+wr250;
			wr244 <= wr122;
			wr245 <= wr250+wr251;
			wr246 <= wr123;
			wr247 <= wr251+wr252;
			wr248 <= wr124;
			wr249 <= wr252+wr253;
			wr250 <= wr125;
			wr251 <= wr253+wr254;
			wr252 <= wr126;
			wr253 <= wr254+wr255;
			wr254 <= wr127;
			layer <= 15;
		end
		15: begin
			do0_ <= wr0;
			do1_ <= wr1;
			do2_ <= wr2;
			do3_ <= wr3;
			do4_ <= wr4;
			do5_ <= wr5;
			do6_ <= wr6;
			do7_ <= wr7;
			do8_ <= wr8;
			do9_ <= wr9;
			do10_ <= wr10;
			do11_ <= wr11;
			do12_ <= wr12;
			do13_ <= wr13;
			do14_ <= wr14;
			do15_ <= wr15;
			do16_ <= wr16;
			do17_ <= wr17;
			do18_ <= wr18;
			do19_ <= wr19;
			do20_ <= wr20;
			do21_ <= wr21;
			do22_ <= wr22;
			do23_ <= wr23;
			do24_ <= wr24;
			do25_ <= wr25;
			do26_ <= wr26;
			do27_ <= wr27;
			do28_ <= wr28;
			do29_ <= wr29;
			do30_ <= wr30;
			do31_ <= wr31;
			do32_ <= wr32;
			do33_ <= wr33;
			do34_ <= wr34;
			do35_ <= wr35;
			do36_ <= wr36;
			do37_ <= wr37;
			do38_ <= wr38;
			do39_ <= wr39;
			do40_ <= wr40;
			do41_ <= wr41;
			do42_ <= wr42;
			do43_ <= wr43;
			do44_ <= wr44;
			do45_ <= wr45;
			do46_ <= wr46;
			do47_ <= wr47;
			do48_ <= wr48;
			do49_ <= wr49;
			do50_ <= wr50;
			do51_ <= wr51;
			do52_ <= wr52;
			do53_ <= wr53;
			do54_ <= wr54;
			do55_ <= wr55;
			do56_ <= wr56;
			do57_ <= wr57;
			do58_ <= wr58;
			do59_ <= wr59;
			do60_ <= wr60;
			do61_ <= wr61;
			do62_ <= wr62;
			do63_ <= wr63;
			do64_ <= wr64;
			do65_ <= wr65;
			do66_ <= wr66;
			do67_ <= wr67;
			do68_ <= wr68;
			do69_ <= wr69;
			do70_ <= wr70;
			do71_ <= wr71;
			do72_ <= wr72;
			do73_ <= wr73;
			do74_ <= wr74;
			do75_ <= wr75;
			do76_ <= wr76;
			do77_ <= wr77;
			do78_ <= wr78;
			do79_ <= wr79;
			do80_ <= wr80;
			do81_ <= wr81;
			do82_ <= wr82;
			do83_ <= wr83;
			do84_ <= wr84;
			do85_ <= wr85;
			do86_ <= wr86;
			do87_ <= wr87;
			do88_ <= wr88;
			do89_ <= wr89;
			do90_ <= wr90;
			do91_ <= wr91;
			do92_ <= wr92;
			do93_ <= wr93;
			do94_ <= wr94;
			do95_ <= wr95;
			do96_ <= wr96;
			do97_ <= wr97;
			do98_ <= wr98;
			do99_ <= wr99;
			do100_ <= wr100;
			do101_ <= wr101;
			do102_ <= wr102;
			do103_ <= wr103;
			do104_ <= wr104;
			do105_ <= wr105;
			do106_ <= wr106;
			do107_ <= wr107;
			do108_ <= wr108;
			do109_ <= wr109;
			do110_ <= wr110;
			do111_ <= wr111;
			do112_ <= wr112;
			do113_ <= wr113;
			do114_ <= wr114;
			do115_ <= wr115;
			do116_ <= wr116;
			do117_ <= wr117;
			do118_ <= wr118;
			do119_ <= wr119;
			do120_ <= wr120;
			do121_ <= wr121;
			do122_ <= wr122;
			do123_ <= wr123;
			do124_ <= wr124;
			do125_ <= wr125;
			do126_ <= wr126;
			do127_ <= wr127;
			do128_ <= wr128;
			do129_ <= wr129;
			do130_ <= wr130;
			do131_ <= wr131;
			do132_ <= wr132;
			do133_ <= wr133;
			do134_ <= wr134;
			do135_ <= wr135;
			do136_ <= wr136;
			do137_ <= wr137;
			do138_ <= wr138;
			do139_ <= wr139;
			do140_ <= wr140;
			do141_ <= wr141;
			do142_ <= wr142;
			do143_ <= wr143;
			do144_ <= wr144;
			do145_ <= wr145;
			do146_ <= wr146;
			do147_ <= wr147;
			do148_ <= wr148;
			do149_ <= wr149;
			do150_ <= wr150;
			do151_ <= wr151;
			do152_ <= wr152;
			do153_ <= wr153;
			do154_ <= wr154;
			do155_ <= wr155;
			do156_ <= wr156;
			do157_ <= wr157;
			do158_ <= wr158;
			do159_ <= wr159;
			do160_ <= wr160;
			do161_ <= wr161;
			do162_ <= wr162;
			do163_ <= wr163;
			do164_ <= wr164;
			do165_ <= wr165;
			do166_ <= wr166;
			do167_ <= wr167;
			do168_ <= wr168;
			do169_ <= wr169;
			do170_ <= wr170;
			do171_ <= wr171;
			do172_ <= wr172;
			do173_ <= wr173;
			do174_ <= wr174;
			do175_ <= wr175;
			do176_ <= wr176;
			do177_ <= wr177;
			do178_ <= wr178;
			do179_ <= wr179;
			do180_ <= wr180;
			do181_ <= wr181;
			do182_ <= wr182;
			do183_ <= wr183;
			do184_ <= wr184;
			do185_ <= wr185;
			do186_ <= wr186;
			do187_ <= wr187;
			do188_ <= wr188;
			do189_ <= wr189;
			do190_ <= wr190;
			do191_ <= wr191;
			do192_ <= wr192;
			do193_ <= wr193;
			do194_ <= wr194;
			do195_ <= wr195;
			do196_ <= wr196;
			do197_ <= wr197;
			do198_ <= wr198;
			do199_ <= wr199;
			do200_ <= wr200;
			do201_ <= wr201;
			do202_ <= wr202;
			do203_ <= wr203;
			do204_ <= wr204;
			do205_ <= wr205;
			do206_ <= wr206;
			do207_ <= wr207;
			do208_ <= wr208;
			do209_ <= wr209;
			do210_ <= wr210;
			do211_ <= wr211;
			do212_ <= wr212;
			do213_ <= wr213;
			do214_ <= wr214;
			do215_ <= wr215;
			do216_ <= wr216;
			do217_ <= wr217;
			do218_ <= wr218;
			do219_ <= wr219;
			do220_ <= wr220;
			do221_ <= wr221;
			do222_ <= wr222;
			do223_ <= wr223;
			do224_ <= wr224;
			do225_ <= wr225;
			do226_ <= wr226;
			do227_ <= wr227;
			do228_ <= wr228;
			do229_ <= wr229;
			do230_ <= wr230;
			do231_ <= wr231;
			do232_ <= wr232;
			do233_ <= wr233;
			do234_ <= wr234;
			do235_ <= wr235;
			do236_ <= wr236;
			do237_ <= wr237;
			do238_ <= wr238;
			do239_ <= wr239;
			do240_ <= wr240;
			do241_ <= wr241;
			do242_ <= wr242;
			do243_ <= wr243;
			do244_ <= wr244;
			do245_ <= wr245;
			do246_ <= wr246;
			do247_ <= wr247;
			do248_ <= wr248;
			do249_ <= wr249;
			do250_ <= wr250;
			do251_ <= wr251;
			do252_ <= wr252;
			do253_ <= wr253;
			do254_ <= wr254;
			do255_ <= wr255;
			start <= 0;
		end
	endcase
	end
	else counter = 0;
end


always @(posedge(clk) or posedge(rst)) begin
	if (rst) begin
		i <= 0;
		n <= 0;
		layer <= 0;
		counter <= 0;
		start <= 0;
		bfly_di1 <= 0;
		bfly_di2 <= 0;

		wr0 <= 0;
		wr1 <= 0;
		wr2 <= 0;
		wr3 <= 0;
		wr4 <= 0;
		wr5 <= 0;
		wr6 <= 0;
		wr7 <= 0;
		wr8 <= 0;
		wr9 <= 0;
		wr10 <= 0;
		wr11 <= 0;
		wr12 <= 0;
		wr13 <= 0;
		wr14 <= 0;
		wr15 <= 0;
		wr16 <= 0;
		wr17 <= 0;
		wr18 <= 0;
		wr19 <= 0;
		wr20 <= 0;
		wr21 <= 0;
		wr22 <= 0;
		wr23 <= 0;
		wr24 <= 0;
		wr25 <= 0;
		wr26 <= 0;
		wr27 <= 0;
		wr28 <= 0;
		wr29 <= 0;
		wr30 <= 0;
		wr31 <= 0;
		wr32 <= 0;
		wr33 <= 0;
		wr34 <= 0;
		wr35 <= 0;
		wr36 <= 0;
		wr37 <= 0;
		wr38 <= 0;
		wr39 <= 0;
		wr40 <= 0;
		wr41 <= 0;
		wr42 <= 0;
		wr43 <= 0;
		wr44 <= 0;
		wr45 <= 0;
		wr46 <= 0;
		wr47 <= 0;
		wr48 <= 0;
		wr49 <= 0;
		wr50 <= 0;
		wr51 <= 0;
		wr52 <= 0;
		wr53 <= 0;
		wr54 <= 0;
		wr55 <= 0;
		wr56 <= 0;
		wr57 <= 0;
		wr58 <= 0;
		wr59 <= 0;
		wr60 <= 0;
		wr61 <= 0;
		wr62 <= 0;
		wr63 <= 0;
		wr64 <= 0;
		wr65 <= 0;
		wr66 <= 0;
		wr67 <= 0;
		wr68 <= 0;
		wr69 <= 0;
		wr70 <= 0;
		wr71 <= 0;
		wr72 <= 0;
		wr73 <= 0;
		wr74 <= 0;
		wr75 <= 0;
		wr76 <= 0;
		wr77 <= 0;
		wr78 <= 0;
		wr79 <= 0;
		wr80 <= 0;
		wr81 <= 0;
		wr82 <= 0;
		wr83 <= 0;
		wr84 <= 0;
		wr85 <= 0;
		wr86 <= 0;
		wr87 <= 0;
		wr88 <= 0;
		wr89 <= 0;
		wr90 <= 0;
		wr91 <= 0;
		wr92 <= 0;
		wr93 <= 0;
		wr94 <= 0;
		wr95 <= 0;
		wr96 <= 0;
		wr97 <= 0;
		wr98 <= 0;
		wr99 <= 0;
		wr100 <= 0;
		wr101 <= 0;
		wr102 <= 0;
		wr103 <= 0;
		wr104 <= 0;
		wr105 <= 0;
		wr106 <= 0;
		wr107 <= 0;
		wr108 <= 0;
		wr109 <= 0;
		wr110 <= 0;
		wr111 <= 0;
		wr112 <= 0;
		wr113 <= 0;
		wr114 <= 0;
		wr115 <= 0;
		wr116 <= 0;
		wr117 <= 0;
		wr118 <= 0;
		wr119 <= 0;
		wr120 <= 0;
		wr121 <= 0;
		wr122 <= 0;
		wr123 <= 0;
		wr124 <= 0;
		wr125 <= 0;
		wr126 <= 0;
		wr127 <= 0;
		wr128 <= 0;
		wr129 <= 0;
		wr130 <= 0;
		wr131 <= 0;
		wr132 <= 0;
		wr133 <= 0;
		wr134 <= 0;
		wr135 <= 0;
		wr136 <= 0;
		wr137 <= 0;
		wr138 <= 0;
		wr139 <= 0;
		wr140 <= 0;
		wr141 <= 0;
		wr142 <= 0;
		wr143 <= 0;
		wr144 <= 0;
		wr145 <= 0;
		wr146 <= 0;
		wr147 <= 0;
		wr148 <= 0;
		wr149 <= 0;
		wr150 <= 0;
		wr151 <= 0;
		wr152 <= 0;
		wr153 <= 0;
		wr154 <= 0;
		wr155 <= 0;
		wr156 <= 0;
		wr157 <= 0;
		wr158 <= 0;
		wr159 <= 0;
		wr160 <= 0;
		wr161 <= 0;
		wr162 <= 0;
		wr163 <= 0;
		wr164 <= 0;
		wr165 <= 0;
		wr166 <= 0;
		wr167 <= 0;
		wr168 <= 0;
		wr169 <= 0;
		wr170 <= 0;
		wr171 <= 0;
		wr172 <= 0;
		wr173 <= 0;
		wr174 <= 0;
		wr175 <= 0;
		wr176 <= 0;
		wr177 <= 0;
		wr178 <= 0;
		wr179 <= 0;
		wr180 <= 0;
		wr181 <= 0;
		wr182 <= 0;
		wr183 <= 0;
		wr184 <= 0;
		wr185 <= 0;
		wr186 <= 0;
		wr187 <= 0;
		wr188 <= 0;
		wr189 <= 0;
		wr190 <= 0;
		wr191 <= 0;
		wr192 <= 0;
		wr193 <= 0;
		wr194 <= 0;
		wr195 <= 0;
		wr196 <= 0;
		wr197 <= 0;
		wr198 <= 0;
		wr199 <= 0;
		wr200 <= 0;
		wr201 <= 0;
		wr202 <= 0;
		wr203 <= 0;
		wr204 <= 0;
		wr205 <= 0;
		wr206 <= 0;
		wr207 <= 0;
		wr208 <= 0;
		wr209 <= 0;
		wr210 <= 0;
		wr211 <= 0;
		wr212 <= 0;
		wr213 <= 0;
		wr214 <= 0;
		wr215 <= 0;
		wr216 <= 0;
		wr217 <= 0;
		wr218 <= 0;
		wr219 <= 0;
		wr220 <= 0;
		wr221 <= 0;
		wr222 <= 0;
		wr223 <= 0;
		wr224 <= 0;
		wr225 <= 0;
		wr226 <= 0;
		wr227 <= 0;
		wr228 <= 0;
		wr229 <= 0;
		wr230 <= 0;
		wr231 <= 0;
		wr232 <= 0;
		wr233 <= 0;
		wr234 <= 0;
		wr235 <= 0;
		wr236 <= 0;
		wr237 <= 0;
		wr238 <= 0;
		wr239 <= 0;
		wr240 <= 0;
		wr241 <= 0;
		wr242 <= 0;
		wr243 <= 0;
		wr244 <= 0;
		wr245 <= 0;
		wr246 <= 0;
		wr247 <= 0;
		wr248 <= 0;
		wr249 <= 0;
		wr250 <= 0;
		wr251 <= 0;
		wr252 <= 0;
		wr253 <= 0;
		wr254 <= 0;
		wr255 <= 0;
	end
	else if (pushin == 1) begin
		start <= 1;
		wr0 <= di0;
		wr1 <= di1;
		wr2 <= di2;
		wr3 <= di3;
		wr4 <= di4;
		wr5 <= di5;
		wr6 <= di6;
		wr7 <= di7;
		wr8 <= di8;
		wr9 <= di9;
		wr10 <= di10;
		wr11 <= di11;
		wr12 <= di12;
		wr13 <= di13;
		wr14 <= di14;
		wr15 <= di15;
		wr16 <= di16;
		wr17 <= di17;
		wr18 <= di18;
		wr19 <= di19;
		wr20 <= di20;
		wr21 <= di21;
		wr22 <= di22;
		wr23 <= di23;
		wr24 <= di24;
		wr25 <= di25;
		wr26 <= di26;
		wr27 <= di27;
		wr28 <= di28;
		wr29 <= di29;
		wr30 <= di30;
		wr31 <= di31;
		wr32 <= di32;
		wr33 <= di33;
		wr34 <= di34;
		wr35 <= di35;
		wr36 <= di36;
		wr37 <= di37;
		wr38 <= di38;
		wr39 <= di39;
		wr40 <= di40;
		wr41 <= di41;
		wr42 <= di42;
		wr43 <= di43;
		wr44 <= di44;
		wr45 <= di45;
		wr46 <= di46;
		wr47 <= di47;
		wr48 <= di48;
		wr49 <= di49;
		wr50 <= di50;
		wr51 <= di51;
		wr52 <= di52;
		wr53 <= di53;
		wr54 <= di54;
		wr55 <= di55;
		wr56 <= di56;
		wr57 <= di57;
		wr58 <= di58;
		wr59 <= di59;
		wr60 <= di60;
		wr61 <= di61;
		wr62 <= di62;
		wr63 <= di63;
		wr64 <= di64;
		wr65 <= di65;
		wr66 <= di66;
		wr67 <= di67;
		wr68 <= di68;
		wr69 <= di69;
		wr70 <= di70;
		wr71 <= di71;
		wr72 <= di72;
		wr73 <= di73;
		wr74 <= di74;
		wr75 <= di75;
		wr76 <= di76;
		wr77 <= di77;
		wr78 <= di78;
		wr79 <= di79;
		wr80 <= di80;
		wr81 <= di81;
		wr82 <= di82;
		wr83 <= di83;
		wr84 <= di84;
		wr85 <= di85;
		wr86 <= di86;
		wr87 <= di87;
		wr88 <= di88;
		wr89 <= di89;
		wr90 <= di90;
		wr91 <= di91;
		wr92 <= di92;
		wr93 <= di93;
		wr94 <= di94;
		wr95 <= di95;
		wr96 <= di96;
		wr97 <= di97;
		wr98 <= di98;
		wr99 <= di99;
		wr100 <= di100;
		wr101 <= di101;
		wr102 <= di102;
		wr103 <= di103;
		wr104 <= di104;
		wr105 <= di105;
		wr106 <= di106;
		wr107 <= di107;
		wr108 <= di108;
		wr109 <= di109;
		wr110 <= di110;
		wr111 <= di111;
		wr112 <= di112;
		wr113 <= di113;
		wr114 <= di114;
		wr115 <= di115;
		wr116 <= di116;
		wr117 <= di117;
		wr118 <= di118;
		wr119 <= di119;
		wr120 <= di120;
		wr121 <= di121;
		wr122 <= di122;
		wr123 <= di123;
		wr124 <= di124;
		wr125 <= di125;
		wr126 <= di126;
		wr127 <= di127;
		wr128 <= di128;
		wr129 <= di129;
		wr130 <= di130;
		wr131 <= di131;
		wr132 <= di132;
		wr133 <= di133;
		wr134 <= di134;
		wr135 <= di135;
		wr136 <= di136;
		wr137 <= di137;
		wr138 <= di138;
		wr139 <= di139;
		wr140 <= di140;
		wr141 <= di141;
		wr142 <= di142;
		wr143 <= di143;
		wr144 <= di144;
		wr145 <= di145;
		wr146 <= di146;
		wr147 <= di147;
		wr148 <= di148;
		wr149 <= di149;
		wr150 <= di150;
		wr151 <= di151;
		wr152 <= di152;
		wr153 <= di153;
		wr154 <= di154;
		wr155 <= di155;
		wr156 <= di156;
		wr157 <= di157;
		wr158 <= di158;
		wr159 <= di159;
		wr160 <= di160;
		wr161 <= di161;
		wr162 <= di162;
		wr163 <= di163;
		wr164 <= di164;
		wr165 <= di165;
		wr166 <= di166;
		wr167 <= di167;
		wr168 <= di168;
		wr169 <= di169;
		wr170 <= di170;
		wr171 <= di171;
		wr172 <= di172;
		wr173 <= di173;
		wr174 <= di174;
		wr175 <= di175;
		wr176 <= di176;
		wr177 <= di177;
		wr178 <= di178;
		wr179 <= di179;
		wr180 <= di180;
		wr181 <= di181;
		wr182 <= di182;
		wr183 <= di183;
		wr184 <= di184;
		wr185 <= di185;
		wr186 <= di186;
		wr187 <= di187;
		wr188 <= di188;
		wr189 <= di189;
		wr190 <= di190;
		wr191 <= di191;
		wr192 <= di192;
		wr193 <= di193;
		wr194 <= di194;
		wr195 <= di195;
		wr196 <= di196;
		wr197 <= di197;
		wr198 <= di198;
		wr199 <= di199;
		wr200 <= di200;
		wr201 <= di201;
		wr202 <= di202;
		wr203 <= di203;
		wr204 <= di204;
		wr205 <= di205;
		wr206 <= di206;
		wr207 <= di207;
		wr208 <= di208;
		wr209 <= di209;
		wr210 <= di210;
		wr211 <= di211;
		wr212 <= di212;
		wr213 <= di213;
		wr214 <= di214;
		wr215 <= di215;
		wr216 <= di216;
		wr217 <= di217;
		wr218 <= di218;
		wr219 <= di219;
		wr220 <= di220;
		wr221 <= di221;
		wr222 <= di222;
		wr223 <= di223;
		wr224 <= di224;
		wr225 <= di225;
		wr226 <= di226;
		wr227 <= di227;
		wr228 <= di228;
		wr229 <= di229;
		wr230 <= di230;
		wr231 <= di231;
		wr232 <= di232;
		wr233 <= di233;
		wr234 <= di234;
		wr235 <= di235;
		wr236 <= di236;
		wr237 <= di237;
		wr238 <= di238;
		wr239 <= di239;
		wr240 <= di240;
		wr241 <= di241;
		wr242 <= di242;
		wr243 <= di243;
		wr244 <= di244;
		wr245 <= di245;
		wr246 <= di246;
		wr247 <= di247;
		wr248 <= di248;
		wr249 <= di249;
		wr250 <= di250;
		wr251 <= di251;
		wr252 <= di252;
		wr253 <= di253;
		wr254 <= di254;
		wr255 <= di255;
	end
	//else ;
end

endmodule
