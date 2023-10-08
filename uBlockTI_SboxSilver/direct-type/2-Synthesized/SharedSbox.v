/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Mon Aug 14 23:11:08 2023
/////////////////////////////////////////////////////////////


module SharedSbox ( clk, d0c0b0a0, d1c1b1a1, guards, h0g0f0e0, h1g1f1e1 );
(* SILVER="[3:0]_0" *)  input [3:0] d0c0b0a0;
(* SILVER="[3:0]_1" *)  input [3:0] d1c1b1a1;
(* SILVER="refresh" *)  input [9:0] guards;
(* SILVER="[3:0]_0" *)  output [3:0] h0g0f0e0;
(* SILVER="[3:0]_1" *)  output [3:0] h1g1f1e1;
(* SILVER="clock" *)  input clk;
  wire   e0, e1, e2, e3, f3, f5, f7, g1, g2, g4, g5, g6, g7, h0, h1, h2, h3,
         n274, n275, n276, n277, n278, n279, n280, n281, n282, n283, n284,
         n285, n286, n287, n288, n289, n290, n291, n292, n293, n294, n295,
         n296, n297, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472;

  DFF_X1 e0_r_reg ( .D(e0), .CK(clk), .QN(n296) );
  DFF_X1 e1_r_reg ( .D(e1), .CK(clk), .QN(n297) );
  DFF_X1 e2_r_reg ( .D(e2), .CK(clk), .QN(n292) );
  DFF_X1 e3_r_reg ( .D(e3), .CK(clk), .QN(n293) );
  DFF_X1 f0_r_reg ( .D(n383), .CK(clk), .QN(n286) );
  DFF_X1 f1_r_reg ( .D(n387), .CK(clk), .QN(n287) );
  DFF_X1 f2_r_reg ( .D(n386), .CK(clk), .QN(n288) );
  DFF_X1 f3_r_reg ( .D(f3), .CK(clk), .QN(n289) );
  DFF_X1 f4_r_reg ( .D(n382), .CK(clk), .QN(n278) );
  DFF_X1 f5_r_reg ( .D(f5), .CK(clk), .QN(n279) );
  DFF_X1 f6_r_reg ( .D(n384), .CK(clk), .QN(n280) );
  DFF_X1 f7_r_reg ( .D(f7), .CK(clk), .QN(n281) );
  DFF_X1 g0_r_reg ( .D(n385), .CK(clk), .QN(n282) );
  DFF_X1 g1_r_reg ( .D(g1), .CK(clk), .QN(n283) );
  DFF_X1 g2_r_reg ( .D(g2), .CK(clk), .QN(n284) );
  DFF_X1 g3_r_reg ( .D(n388), .CK(clk), .QN(n285) );
  DFF_X1 g4_r_reg ( .D(g4), .CK(clk), .QN(n274) );
  DFF_X1 g5_r_reg ( .D(g5), .CK(clk), .QN(n275) );
  DFF_X1 g6_r_reg ( .D(g6), .CK(clk), .QN(n276) );
  DFF_X1 g7_r_reg ( .D(g7), .CK(clk), .QN(n277) );
  DFF_X1 h0_r_reg ( .D(h0), .CK(clk), .QN(n294) );
  DFF_X1 h1_r_reg ( .D(h1), .CK(clk), .QN(n295) );
  DFF_X1 h2_r_reg ( .D(h2), .CK(clk), .QN(n290) );
  DFF_X1 h3_r_reg ( .D(h3), .CK(clk), .QN(n291) );
  XOR2_X1 U292 ( .A(n291), .B(n290), .Z(h1g1f1e1[3]) );
  XOR2_X1 U293 ( .A(n275), .B(n274), .Z(n390) );
  XNOR2_X1 U294 ( .A(n276), .B(n277), .ZN(n389) );
  XNOR2_X1 U295 ( .A(n390), .B(n389), .ZN(h1g1f1e1[2]) );
  XOR2_X1 U296 ( .A(n279), .B(n278), .Z(n392) );
  XNOR2_X1 U297 ( .A(n280), .B(n281), .ZN(n391) );
  XNOR2_X1 U298 ( .A(n392), .B(n391), .ZN(h1g1f1e1[1]) );
  XOR2_X1 U299 ( .A(n293), .B(n292), .Z(h1g1f1e1[0]) );
  INV_X1 U300 ( .A(d1c1b1a1[3]), .ZN(n458) );
  XNOR2_X1 U301 ( .A(n458), .B(guards[8]), .ZN(n394) );
  INV_X1 U302 ( .A(d1c1b1a1[2]), .ZN(n446) );
  NAND2_X1 U303 ( .A1(d0c0b0a0[1]), .A2(n446), .ZN(n393) );
  XNOR2_X1 U304 ( .A(n394), .B(n393), .ZN(h1) );
  XOR2_X1 U305 ( .A(n295), .B(n294), .Z(h0g0f0e0[3]) );
  XOR2_X1 U306 ( .A(n283), .B(n282), .Z(n396) );
  XNOR2_X1 U307 ( .A(n284), .B(n285), .ZN(n395) );
  XNOR2_X1 U308 ( .A(n396), .B(n395), .ZN(h0g0f0e0[2]) );
  XOR2_X1 U309 ( .A(n287), .B(n286), .Z(n398) );
  XNOR2_X1 U310 ( .A(n288), .B(n289), .ZN(n397) );
  XNOR2_X1 U311 ( .A(n398), .B(n397), .ZN(h0g0f0e0[1]) );
  XOR2_X1 U312 ( .A(n297), .B(n296), .Z(h0g0f0e0[0]) );
  NAND2_X1 U313 ( .A1(d0c0b0a0[2]), .A2(d0c0b0a0[1]), .ZN(n467) );
  XNOR2_X1 U314 ( .A(guards[8]), .B(n467), .ZN(h0) );
  INV_X1 U315 ( .A(d1c1b1a1[0]), .ZN(n438) );
  XNOR2_X1 U316 ( .A(n438), .B(guards[9]), .ZN(n400) );
  NAND2_X1 U317 ( .A1(d1c1b1a1[2]), .A2(d0c0b0a0[3]), .ZN(n399) );
  XNOR2_X1 U318 ( .A(n400), .B(n399), .ZN(e3) );
  NAND2_X1 U319 ( .A1(d1c1b1a1[3]), .A2(d0c0b0a0[2]), .ZN(n401) );
  XNOR2_X1 U320 ( .A(n401), .B(guards[9]), .ZN(e2) );
  XOR2_X1 U321 ( .A(d0c0b0a0[0]), .B(guards[9]), .Z(n403) );
  NAND2_X1 U322 ( .A1(d1c1b1a1[3]), .A2(d1c1b1a1[2]), .ZN(n402) );
  XNOR2_X1 U323 ( .A(n403), .B(n402), .ZN(e1) );
  INV_X1 U324 ( .A(d0c0b0a0[2]), .ZN(n468) );
  INV_X1 U325 ( .A(d0c0b0a0[3]), .ZN(n436) );
  NOR2_X1 U326 ( .A1(n468), .A2(n436), .ZN(n404) );
  XNOR2_X1 U327 ( .A(n404), .B(guards[9]), .ZN(e0) );
  NAND2_X1 U328 ( .A1(d1c1b1a1[2]), .A2(d0c0b0a0[1]), .ZN(n409) );
  NOR2_X1 U329 ( .A1(n409), .A2(d0c0b0a0[3]), .ZN(n405) );
  XNOR2_X1 U330 ( .A(guards[0]), .B(guards[1]), .ZN(n408) );
  XNOR2_X1 U331 ( .A(n405), .B(n408), .ZN(g2) );
  NAND2_X1 U332 ( .A1(d1c1b1a1[0]), .A2(d0c0b0a0[1]), .ZN(n407) );
  NOR2_X1 U333 ( .A1(d0c0b0a0[1]), .A2(n458), .ZN(n455) );
  NAND2_X1 U334 ( .A1(d1c1b1a1[2]), .A2(n455), .ZN(n406) );
  NAND2_X1 U335 ( .A1(n407), .A2(n406), .ZN(n411) );
  XNOR2_X1 U336 ( .A(n409), .B(n408), .ZN(n410) );
  XNOR2_X1 U337 ( .A(n411), .B(n410), .ZN(g6) );
  NAND2_X1 U338 ( .A1(d0c0b0a0[1]), .A2(n438), .ZN(n412) );
  XNOR2_X1 U339 ( .A(n436), .B(n412), .ZN(n413) );
  NOR2_X1 U340 ( .A1(d1c1b1a1[2]), .A2(n413), .ZN(n414) );
  XNOR2_X1 U341 ( .A(guards[6]), .B(guards[5]), .ZN(n450) );
  XNOR2_X1 U342 ( .A(n414), .B(n450), .ZN(f5) );
  NOR2_X1 U343 ( .A1(d1c1b1a1[0]), .A2(d1c1b1a1[1]), .ZN(n415) );
  XOR2_X1 U344 ( .A(n458), .B(n415), .Z(n416) );
  NAND2_X1 U345 ( .A1(n416), .A2(d1c1b1a1[2]), .ZN(n417) );
  XOR2_X1 U346 ( .A(guards[7]), .B(guards[4]), .Z(n434) );
  XNOR2_X1 U347 ( .A(n417), .B(n434), .ZN(f7) );
  XOR2_X1 U348 ( .A(guards[8]), .B(d0c0b0a0[3]), .Z(n418) );
  OR2_X1 U349 ( .A1(n468), .A2(d1c1b1a1[1]), .ZN(n452) );
  XNOR2_X1 U350 ( .A(n418), .B(n452), .ZN(h2) );
  NOR2_X1 U351 ( .A1(n436), .A2(n467), .ZN(n419) );
  NOR2_X1 U352 ( .A1(d0c0b0a0[0]), .A2(d0c0b0a0[1]), .ZN(n447) );
  NOR2_X1 U353 ( .A1(n419), .A2(n447), .ZN(n420) );
  XNOR2_X1 U354 ( .A(guards[3]), .B(guards[2]), .ZN(n456) );
  XNOR2_X1 U355 ( .A(n420), .B(n456), .ZN(g4) );
  NAND2_X1 U356 ( .A1(d0c0b0a0[2]), .A2(d1c1b1a1[1]), .ZN(n421) );
  NAND2_X1 U357 ( .A1(n421), .A2(d0c0b0a0[3]), .ZN(n423) );
  XNOR2_X1 U358 ( .A(d1c1b1a1[1]), .B(guards[2]), .ZN(n422) );
  XNOR2_X1 U359 ( .A(n422), .B(guards[1]), .ZN(n428) );
  XNOR2_X1 U360 ( .A(n423), .B(n428), .ZN(n424) );
  XOR2_X1 U361 ( .A(d0c0b0a0[0]), .B(n424), .Z(g1) );
  NAND2_X1 U362 ( .A1(n468), .A2(d1c1b1a1[3]), .ZN(n427) );
  NAND2_X1 U363 ( .A1(d1c1b1a1[1]), .A2(d1c1b1a1[3]), .ZN(n425) );
  NAND2_X1 U364 ( .A1(d0c0b0a0[2]), .A2(n425), .ZN(n426) );
  NAND2_X1 U365 ( .A1(n427), .A2(n426), .ZN(n429) );
  XNOR2_X1 U366 ( .A(n429), .B(n428), .ZN(n431) );
  NAND2_X1 U367 ( .A1(d0c0b0a0[0]), .A2(d1c1b1a1[1]), .ZN(n430) );
  XOR2_X1 U368 ( .A(n431), .B(n430), .Z(g5) );
  NOR2_X1 U369 ( .A1(d1c1b1a1[1]), .A2(d1c1b1a1[2]), .ZN(n442) );
  XNOR2_X1 U370 ( .A(n458), .B(n442), .ZN(n432) );
  NOR2_X1 U371 ( .A1(d0c0b0a0[0]), .A2(n432), .ZN(n433) );
  XOR2_X1 U372 ( .A(n434), .B(n433), .Z(f3) );
  XOR2_X1 U373 ( .A(n438), .B(guards[3]), .Z(n435) );
  XNOR2_X1 U374 ( .A(n435), .B(guards[0]), .ZN(n445) );
  XNOR2_X1 U375 ( .A(n436), .B(n445), .ZN(n441) );
  NAND2_X1 U376 ( .A1(d1c1b1a1[2]), .A2(n436), .ZN(n437) );
  XNOR2_X1 U377 ( .A(n438), .B(n437), .ZN(n439) );
  NAND2_X1 U378 ( .A1(n439), .A2(d1c1b1a1[1]), .ZN(n440) );
  XNOR2_X1 U379 ( .A(n441), .B(n440), .ZN(g7) );
  XNOR2_X1 U380 ( .A(n442), .B(guards[8]), .ZN(h3) );
  NOR2_X1 U381 ( .A1(d1c1b1a1[1]), .A2(n446), .ZN(n443) );
  NOR2_X1 U382 ( .A1(d1c1b1a1[3]), .A2(n443), .ZN(n444) );
  XNOR2_X1 U383 ( .A(n445), .B(n444), .ZN(n388) );
  NAND2_X1 U384 ( .A1(d0c0b0a0[0]), .A2(n446), .ZN(n449) );
  NAND2_X1 U385 ( .A1(d1c1b1a1[2]), .A2(n447), .ZN(n448) );
  NAND2_X1 U386 ( .A1(n449), .A2(n448), .ZN(n451) );
  XNOR2_X1 U387 ( .A(n451), .B(n450), .ZN(n387) );
  XOR2_X1 U388 ( .A(guards[5]), .B(guards[4]), .Z(n463) );
  XNOR2_X1 U389 ( .A(n463), .B(n458), .ZN(n454) );
  NAND2_X1 U390 ( .A1(d0c0b0a0[0]), .A2(n452), .ZN(n453) );
  XNOR2_X1 U391 ( .A(n454), .B(n453), .ZN(n386) );
  NAND2_X1 U392 ( .A1(n455), .A2(d0c0b0a0[2]), .ZN(n457) );
  XNOR2_X1 U393 ( .A(n457), .B(n456), .ZN(n385) );
  XNOR2_X1 U394 ( .A(n468), .B(d1c1b1a1[0]), .ZN(n461) );
  NOR2_X1 U395 ( .A1(d0c0b0a0[2]), .A2(d1c1b1a1[1]), .ZN(n459) );
  XOR2_X1 U396 ( .A(n459), .B(n458), .Z(n460) );
  NAND2_X1 U397 ( .A1(n461), .A2(n460), .ZN(n462) );
  XNOR2_X1 U398 ( .A(n463), .B(n462), .ZN(n384) );
  XNOR2_X1 U399 ( .A(guards[6]), .B(guards[7]), .ZN(n472) );
  NAND2_X1 U400 ( .A1(d0c0b0a0[1]), .A2(n468), .ZN(n464) );
  XOR2_X1 U401 ( .A(d0c0b0a0[3]), .B(n464), .Z(n465) );
  NAND2_X1 U402 ( .A1(n465), .A2(d0c0b0a0[0]), .ZN(n466) );
  XNOR2_X1 U403 ( .A(n472), .B(n466), .ZN(n383) );
  XOR2_X1 U404 ( .A(d0c0b0a0[3]), .B(n467), .Z(n470) );
  XOR2_X1 U405 ( .A(n468), .B(d1c1b1a1[0]), .Z(n469) );
  NAND2_X1 U406 ( .A1(n470), .A2(n469), .ZN(n471) );
  XNOR2_X1 U407 ( .A(n472), .B(n471), .ZN(n382) );
endmodule

