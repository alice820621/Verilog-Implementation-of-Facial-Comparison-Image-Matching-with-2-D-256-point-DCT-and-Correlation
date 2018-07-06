//a testbench for dct256.v

module dct256_tb();

reg clk, rst, pushin;
reg [24:0] di0, di1, di2, di3, di4, di5, di6, di7, di8, di9, 
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

wire [24:0] do0, do1, do2, do3, do4, do5, do6, do7, do8, do9, 
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

dct256 d(clk, rst, pushin,
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

initial begin
	clk = 0;
	forever begin
		#5 clk = 1;
		#5 clk = 0;
	end
end

reg [7:0] i;
initial begin
	rst = 0;
	pushin = 0;
	i = 0;

	while (i<=255) begin
		#20 rst = 1;
		#20 rst = 0;
		#5 pushin = 1;

		//normalize di by dividing by 256, which is >>> 8
        di0 =   $signed(di0) >>> 8;
        di1 =   $signed(di1) >>> 8;
        di2 =   $signed(di2) >>> 8;
        di3 =   $signed(di3) >>> 8;
        di4 =   $signed(di4) >>> 8;
        di5 =   $signed(di5) >>> 8;
        di6 =   $signed(di6) >>> 8;
        di7 =   $signed(di7) >>> 8;
        di8 =   $signed(di8) >>> 8;
        di9 =   $signed(di9) >>> 8;
        di10 =  $signed(di10) >>> 8;
        di11 =  $signed(di11) >>> 8;
        di12 =  $signed(di12) >>> 8;
        di13 =  $signed(di13) >>> 8;
        di14 =  $signed(di14) >>> 8;
        di15 =  $signed(di15) >>> 8;
        di16 =  $signed(di16) >>> 8;
        di17 =  $signed(di17) >>> 8;
        di18 =  $signed(di18) >>> 8;
        di19 =  $signed(di19) >>> 8;
        di20 =  $signed(di20) >>> 8;
        di21 =  $signed(di21) >>> 8;
        di22 =  $signed(di22) >>> 8;
        di23 =  $signed(di23) >>> 8;
        di24 =  $signed(di24) >>> 8;
        di25 =  $signed(di25) >>> 8;
        di26 =  $signed(di26) >>> 8;
        di27 =  $signed(di27) >>> 8;
        di28 =  $signed(di28) >>> 8;
        di29 =  $signed(di29) >>> 8;
        di30 =  $signed(di30) >>> 8;
        di31 =  $signed(di31) >>> 8;
        di32 =  $signed(di32) >>> 8;
        di33 =  $signed(di33) >>> 8;
        di34 =  $signed(di34) >>> 8;
        di35 =  $signed(di35) >>> 8;
        di36 =  $signed(di36) >>> 8;
        di37 =  $signed(di37) >>> 8;
        di38 =  $signed(di38) >>> 8;
        di39 =  $signed(di39) >>> 8;
        di40 =  $signed(di40) >>> 8;
        di41 =  $signed(di41) >>> 8;
        di42 =  $signed(di42) >>> 8;
        di43 =  $signed(di43) >>> 8;
        di44 =  $signed(di44) >>> 8;
        di45 =  $signed(di45) >>> 8;
        di46 =  $signed(di46) >>> 8;
        di47 =  $signed(di47) >>> 8;
        di48 =  $signed(di48) >>> 8;
        di49 =  $signed(di49) >>> 8;
        di50 =  $signed(di50) >>> 8;
        di51 =  $signed(di51) >>> 8;
        di52 =  $signed(di52) >>> 8;
        di53 =  $signed(di53) >>> 8;
        di54 =  $signed(di54) >>> 8;
        di55 =  $signed(di55) >>> 8;
        di56 =  $signed(di56) >>> 8;
        di57 =  $signed(di57) >>> 8;
        di58 =  $signed(di58) >>> 8;
        di59 =  $signed(di59) >>> 8;
        di60 =  $signed(di60) >>> 8;
        di61 =  $signed(di61) >>> 8;
        di62 =  $signed(di62) >>> 8;
        di63 =  $signed(di63) >>> 8;
        di64 =  $signed(di64) >>> 8;
        di65 =  $signed(di65) >>> 8;
        di66 =  $signed(di66) >>> 8;
        di67 =  $signed(di67) >>> 8;
        di68 =  $signed(di68) >>> 8;
        di69 =  $signed(di69) >>> 8;
        di70 =  $signed(di70) >>> 8;
        di71 =  $signed(di71) >>> 8;
        di72 =  $signed(di72) >>> 8;
        di73 =  $signed(di73) >>> 8;
        di74 =  $signed(di74) >>> 8;
        di75 =  $signed(di75) >>> 8;
        di76 =  $signed(di76) >>> 8;
        di77 =  $signed(di77) >>> 8;
        di78 =  $signed(di78) >>> 8;
        di79 =  $signed(di79) >>> 8;
        di80 =  $signed(di80) >>> 8;
        di81 =  $signed(di81) >>> 8;
        di82 =  $signed(di82) >>> 8;
        di83 =  $signed(di83) >>> 8;
        di84 =  $signed(di84) >>> 8;
        di85 =  $signed(di85) >>> 8;
        di86 =  $signed(di86) >>> 8;
        di87 =  $signed(di87) >>> 8;
        di88 =  $signed(di88) >>> 8;
        di89 =  $signed(di89) >>> 8;
        di90 =  $signed(di90) >>> 8;
        di91 =  $signed(di91) >>> 8;
        di92 =  $signed(di92) >>> 8;
        di93 =  $signed(di93) >>> 8;
        di94 =  $signed(di94) >>> 8;
        di95 =  $signed(di95) >>> 8;
        di96 =  $signed(di96) >>> 8;
        di97 =  $signed(di97) >>> 8;
        di98 =  $signed(di98) >>> 8;
        di99 =  $signed(di99) >>> 8;
        di100 = $signed(di100) >>> 8;
        di101 = $signed(di101) >>> 8;
        di102 = $signed(di102) >>> 8;
        di103 = $signed(di103) >>> 8;
        di104 = $signed(di104) >>> 8;
        di105 = $signed(di105) >>> 8;
        di106 = $signed(di106) >>> 8;
        di107 = $signed(di107) >>> 8;
        di108 = $signed(di108) >>> 8;
        di109 = $signed(di109) >>> 8;
        di110 = $signed(di110) >>> 8;
        di111 = $signed(di111) >>> 8;
        di112 = $signed(di112) >>> 8;
        di113 = $signed(di113) >>> 8;
        di114 = $signed(di114) >>> 8;
        di115 = $signed(di115) >>> 8;
        di116 = $signed(di116) >>> 8;
        di117 = $signed(di117) >>> 8;
        di118 = $signed(di118) >>> 8;
        di119 = $signed(di119) >>> 8;
        di120 = $signed(di120) >>> 8;
        di121 = $signed(di121) >>> 8;
        di122 = $signed(di122) >>> 8;
        di123 = $signed(di123) >>> 8;
        di124 = $signed(di124) >>> 8;
        di125 = $signed(di125) >>> 8;
        di126 = $signed(di126) >>> 8;
        di127 = $signed(di127) >>> 8;
        di128 = $signed(di128) >>> 8;
        di129 = $signed(di129) >>> 8;
        di130 = $signed(di130) >>> 8;
        di131 = $signed(di131) >>> 8;
        di132 = $signed(di132) >>> 8;
        di133 = $signed(di133) >>> 8;
        di134 = $signed(di134) >>> 8;
        di135 = $signed(di135) >>> 8;
        di136 = $signed(di136) >>> 8;
        di137 = $signed(di137) >>> 8;
        di138 = $signed(di138) >>> 8;
        di139 = $signed(di139) >>> 8;
        di140 = $signed(di140) >>> 8;
        di141 = $signed(di141) >>> 8;
        di142 = $signed(di142) >>> 8;
        di143 = $signed(di143) >>> 8;
        di144 = $signed(di144) >>> 8;
        di145 = $signed(di145) >>> 8;
        di146 = $signed(di146) >>> 8;
        di147 = $signed(di147) >>> 8;
        di148 = $signed(di148) >>> 8;
        di149 = $signed(di149) >>> 8;
        di150 = $signed(di150) >>> 8;
        di151 = $signed(di151) >>> 8;
        di152 = $signed(di152) >>> 8;
        di153 = $signed(di153) >>> 8;
        di154 = $signed(di154) >>> 8;
        di155 = $signed(di155) >>> 8;
        di156 = $signed(di156) >>> 8;
        di157 = $signed(di157) >>> 8;
        di158 = $signed(di158) >>> 8;
        di159 = $signed(di159) >>> 8;
        di160 = $signed(di160) >>> 8;
        di161 = $signed(di161) >>> 8;
        di162 = $signed(di162) >>> 8;
        di163 = $signed(di163) >>> 8;
        di164 = $signed(di164) >>> 8;
        di165 = $signed(di165) >>> 8;
        di166 = $signed(di166) >>> 8;
        di167 = $signed(di167) >>> 8;
        di168 = $signed(di168) >>> 8;
        di169 = $signed(di169) >>> 8;
        di170 = $signed(di170) >>> 8;
        di171 = $signed(di171) >>> 8;
        di172 = $signed(di172) >>> 8;
        di173 = $signed(di173) >>> 8;
        di174 = $signed(di174) >>> 8;
        di175 = $signed(di175) >>> 8;
        di176 = $signed(di176) >>> 8;
        di177 = $signed(di177) >>> 8;
        di178 = $signed(di178) >>> 8;
        di179 = $signed(di179) >>> 8;
        di180 = $signed(di180) >>> 8;
        di181 = $signed(di181) >>> 8;
        di182 = $signed(di182) >>> 8;
        di183 = $signed(di183) >>> 8;
        di184 = $signed(di184) >>> 8;
        di185 = $signed(di185) >>> 8;
        di186 = $signed(di186) >>> 8;
        di187 = $signed(di187) >>> 8;
        di188 = $signed(di188) >>> 8;
        di189 = $signed(di189) >>> 8;
        di190 = $signed(di190) >>> 8;
        di191 = $signed(di191) >>> 8;
        di192 = $signed(di192) >>> 8;
        di193 = $signed(di193) >>> 8;
        di194 = $signed(di194) >>> 8;
        di195 = $signed(di195) >>> 8;
        di196 = $signed(di196) >>> 8;
        di197 = $signed(di197) >>> 8;
        di198 = $signed(di198) >>> 8;
        di199 = $signed(di199) >>> 8;
        di200 = $signed(di200) >>> 8;
        di201 = $signed(di201) >>> 8;
        di202 = $signed(di202) >>> 8;
        di203 = $signed(di203) >>> 8;
        di204 = $signed(di204) >>> 8;
        di205 = $signed(di205) >>> 8;
        di206 = $signed(di206) >>> 8;
        di207 = $signed(di207) >>> 8;
        di208 = $signed(di208) >>> 8;
        di209 = $signed(di209) >>> 8;
        di210 = $signed(di210) >>> 8;
        di211 = $signed(di211) >>> 8;
        di212 = $signed(di212) >>> 8;
        di213 = $signed(di213) >>> 8;
        di214 = $signed(di214) >>> 8;
        di215 = $signed(di215) >>> 8;
        di216 = $signed(di216) >>> 8;
        di217 = $signed(di217) >>> 8;
        di218 = $signed(di218) >>> 8;
        di219 = $signed(di219) >>> 8;
        di220 = $signed(di220) >>> 8;
        di221 = $signed(di221) >>> 8;
        di222 = $signed(di222) >>> 8;
        di223 = $signed(di223) >>> 8;
        di224 = $signed(di224) >>> 8;
        di225 = $signed(di225) >>> 8;
        di226 = $signed(di226) >>> 8;
        di227 = $signed(di227) >>> 8;
        di228 = $signed(di228) >>> 8;
        di229 = $signed(di229) >>> 8;
        di230 = $signed(di230) >>> 8;
        di231 = $signed(di231) >>> 8;
        di232 = $signed(di232) >>> 8;
        di233 = $signed(di233) >>> 8;
        di234 = $signed(di234) >>> 8;
        di235 = $signed(di235) >>> 8;
        di236 = $signed(di236) >>> 8;
        di237 = $signed(di237) >>> 8;
        di238 = $signed(di238) >>> 8;
        di239 = $signed(di239) >>> 8;
        di240 = $signed(di240) >>> 8;
        di241 = $signed(di241) >>> 8;
        di242 = $signed(di242) >>> 8;
        di243 = $signed(di243) >>> 8;
        di244 = $signed(di244) >>> 8;
        di245 = $signed(di245) >>> 8;
        di246 = $signed(di246) >>> 8;
        di247 = $signed(di247) >>> 8;
        di248 = $signed(di248) >>> 8;
        di249 = $signed(di249) >>> 8;
        di250 = $signed(di250) >>> 8;
        di251 = $signed(di251) >>> 8;
        di252 = $signed(di252) >>> 8;
        di253 = $signed(di253) >>> 8;
        di254 = $signed(di254) >>> 8;
        di255 = $signed(di255) >>> 8;

		#10 pushin = 0;
		i = i + 1;
		#(15000-20-20-5-10);
	end
end

integer file_in;
initial begin
	//file_in = $fopen("data_row_in/row_in9.txt", "r");
	file_in = $fopen("data_col_in/col_in9.txt", "r");
	while(! $feof(file_in)) begin		//read one line (one data set) every 15000 cycles
		$fscanf(file_in, "%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d ", di0,di1,di2,di3,di4,di5,di6,di7,di8,di9,di10,di11,di12,di13,di14,di15,di16,di17,di18,di19,di20,di21,di22,di23,di24,di25,di26,di27,di28,di29,di30,di31,di32,di33,di34,di35,di36,di37,di38,di39,di40,di41,di42,di43,di44,di45,di46,di47,di48,di49,di50,di51,di52,di53,di54,di55,di56,di57,di58,di59,di60,di61,di62,di63,di64,di65,di66,di67,di68,di69,di70,di71,di72,di73,di74,di75,di76,di77,di78,di79,di80,di81,di82,di83,di84,di85,di86,di87,di88,di89,di90,di91,di92,di93,di94,di95,di96,di97,di98,di99,di100,di101,di102,di103,di104,di105,di106,di107,di108,di109,di110,di111,di112,di113,di114,di115,di116,di117,di118,di119,di120,di121,di122,di123,di124,di125,di126,di127,di128,di129,di130,di131,di132,di133,di134,di135,di136,di137,di138,di139,di140,di141,di142,di143,di144,di145,di146,di147,di148,di149,di150,di151,di152,di153,di154,di155,di156,di157,di158,di159,di160,di161,di162,di163,di164,di165,di166,di167,di168,di169,di170,di171,di172,di173,di174,di175,di176,di177,di178,di179,di180,di181,di182,di183,di184,di185,di186,di187,di188,di189,di190,di191,di192,di193,di194,di195,di196,di197,di198,di199,di200,di201,di202,di203,di204,di205,di206,di207,di208,di209,di210,di211,di212,di213,di214,di215,di216,di217,di218,di219,di220,di221,di222,di223,di224,di225,di226,di227,di228,di229,di230,di231,di232,di233,di234,di235,di236,di237,di238,di239,di240,di241,di242,di243,di244,di245,di246,di247,di248,di249,di250,di251,di252,di253,di254,di255);
		#15000;
	end
	$fclose(file_in);
end

integer file_out;
initial begin
	//file_out = $fopen("data_row_out/row_out9.txt");
	file_out = $fopen("data_col_out/col_out9.txt");
	while (i<=255) begin			//write one line (one data set) every 15000 cycles
		#15000;
		//$fwrite(file_out, "the No.%d output set:\n", i);
		$fwrite(file_out, "%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d\n", do0,do1,do2,do3,do4,do5,do6,do7,do8,do9,do10,do11,do12,do13,do14,do15,do16,do17,do18,do19,do20,do21,do22,do23,do24,do25,do26,do27,do28,do29,do30,do31,do32,do33,do34,do35,do36,do37,do38,do39,do40,do41,do42,do43,do44,do45,do46,do47,do48,do49,do50,do51,do52,do53,do54,do55,do56,do57,do58,do59,do60,do61,do62,do63,do64,do65,do66,do67,do68,do69,do70,do71,do72,do73,do74,do75,do76,do77,do78,do79,do80,do81,do82,do83,do84,do85,do86,do87,do88,do89,do90,do91,do92,do93,do94,do95,do96,do97,do98,do99,do100,do101,do102,do103,do104,do105,do106,do107,do108,do109,do110,do111,do112,do113,do114,do115,do116,do117,do118,do119,do120,do121,do122,do123,do124,do125,do126,do127,do128,do129,do130,do131,do132,do133,do134,do135,do136,do137,do138,do139,do140,do141,do142,do143,do144,do145,do146,do147,do148,do149,do150,do151,do152,do153,do154,do155,do156,do157,do158,do159,do160,do161,do162,do163,do164,do165,do166,do167,do168,do169,do170,do171,do172,do173,do174,do175,do176,do177,do178,do179,do180,do181,do182,do183,do184,do185,do186,do187,do188,do189,do190,do191,do192,do193,do194,do195,do196,do197,do198,do199,do200,do201,do202,do203,do204,do205,do206,do207,do208,do209,do210,do211,do212,do213,do214,do215,do216,do217,do218,do219,do220,do221,do222,do223,do224,do225,do226,do227,do228,do229,do230,do231,do232,do233,do234,do235,do236,do237,do238,do239,do240,do241,do242,do243,do244,do245,do246,do247,do248,do249,do250,do251,do252,do253,do254,do255);
	end
	$fclose(file_out);
end

initial begin
	#3840001;
	$finish;
end

/*initial begin
	$dumpfile("dct256.vpd");
	$dumpvars(9, dct256);
end*/

endmodule
