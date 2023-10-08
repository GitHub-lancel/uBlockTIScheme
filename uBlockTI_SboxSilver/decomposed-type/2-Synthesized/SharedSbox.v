/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Ultra(TM) in wire load mode
// Version   : L-2016.03-SP1
// Date      : Mon Aug 14 23:04:21 2023
/////////////////////////////////////////////////////////////


module FSharedSbox ( clk, d0c0b0a0, d1c1b1a1, guards, h0g0f0e0, h1g1f1e1 );
  input [3:0] d0c0b0a0;
  input [3:0] d1c1b1a1;
  input [1:0] guards;
  output [3:0] h0g0f0e0;
  output [3:0] h1g1f1e1;
  input clk;
  wire   e0, e1, e2, e3, h0, h1, h2, h3, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38;

  DFF_X1 e0_r_reg ( .D(e0), .CK(clk), .QN(n23) );
  DFF_X1 e1_r_reg ( .D(e1), .CK(clk), .QN(n24) );
  DFF_X1 e2_r_reg ( .D(e2), .CK(clk), .QN(n19) );
  DFF_X1 e3_r_reg ( .D(e3), .CK(clk), .QN(n20) );
  DFF_X1 f0_r_reg ( .D(d0c0b0a0[1]), .CK(clk), .Q(h0g0f0e0[1]) );
  DFF_X1 f1_r_reg ( .D(d1c1b1a1[1]), .CK(clk), .Q(h1g1f1e1[1]) );
  DFF_X1 g0_r_reg ( .D(d1c1b1a1[2]), .CK(clk), .Q(h0g0f0e0[2]) );
  DFF_X1 g1_r_reg ( .D(d0c0b0a0[2]), .CK(clk), .Q(h1g1f1e1[2]) );
  DFF_X1 h0_r_reg ( .D(h0), .CK(clk), .QN(n21) );
  DFF_X1 h1_r_reg ( .D(h1), .CK(clk), .QN(n22) );
  DFF_X1 h2_r_reg ( .D(h2), .CK(clk), .QN(n17) );
  DFF_X1 h3_r_reg ( .D(h3), .CK(clk), .QN(n18) );
  NOR2_X1 U3 ( .A1(d1c1b1a1[2]), .A2(d1c1b1a1[1]), .ZN(n25) );
  XNOR2_X1 U4 ( .A(n25), .B(guards[1]), .ZN(h3) );
  XNOR2_X1 U5 ( .A(guards[1]), .B(d0c0b0a0[3]), .ZN(n28) );
  INV_X1 U6 ( .A(d0c0b0a0[2]), .ZN(n26) );
  NOR2_X1 U7 ( .A1(n26), .A2(d1c1b1a1[1]), .ZN(n27) );
  XNOR2_X1 U8 ( .A(n28), .B(n27), .ZN(h2) );
  XOR2_X1 U9 ( .A(n18), .B(n17), .Z(h1g1f1e1[3]) );
  XOR2_X1 U10 ( .A(n20), .B(n19), .Z(h1g1f1e1[0]) );
  XOR2_X1 U11 ( .A(d1c1b1a1[3]), .B(guards[1]), .Z(n31) );
  INV_X1 U12 ( .A(d1c1b1a1[2]), .ZN(n29) );
  NAND2_X1 U13 ( .A1(d0c0b0a0[1]), .A2(n29), .ZN(n30) );
  XNOR2_X1 U14 ( .A(n31), .B(n30), .ZN(h1) );
  XOR2_X1 U15 ( .A(n22), .B(n21), .Z(h0g0f0e0[3]) );
  XOR2_X1 U16 ( .A(n24), .B(n23), .Z(h0g0f0e0[0]) );
  NAND2_X1 U17 ( .A1(d0c0b0a0[1]), .A2(d0c0b0a0[2]), .ZN(n32) );
  XNOR2_X1 U18 ( .A(n32), .B(guards[1]), .ZN(h0) );
  XOR2_X1 U19 ( .A(guards[0]), .B(d1c1b1a1[0]), .Z(n34) );
  NAND2_X1 U20 ( .A1(d1c1b1a1[2]), .A2(d0c0b0a0[3]), .ZN(n33) );
  XNOR2_X1 U21 ( .A(n34), .B(n33), .ZN(e3) );
  NAND2_X1 U22 ( .A1(d1c1b1a1[3]), .A2(d0c0b0a0[2]), .ZN(n35) );
  XNOR2_X1 U23 ( .A(n35), .B(guards[0]), .ZN(e2) );
  XOR2_X1 U24 ( .A(guards[0]), .B(d0c0b0a0[0]), .Z(n37) );
  NAND2_X1 U25 ( .A1(d1c1b1a1[2]), .A2(d1c1b1a1[3]), .ZN(n36) );
  XNOR2_X1 U26 ( .A(n37), .B(n36), .ZN(e1) );
  NAND2_X1 U27 ( .A1(d0c0b0a0[2]), .A2(d0c0b0a0[3]), .ZN(n38) );
  XOR2_X1 U28 ( .A(guards[0]), .B(n38), .Z(e0) );
endmodule


module GSharedSbox ( clk, d0c0b0a0, d1c1b1a1, guards, h0g0f0e0, h1g1f1e1 );
  input [3:0] d0c0b0a0;
  input [3:0] d1c1b1a1;
  input [1:0] guards;
  output [3:0] h0g0f0e0;
  output [3:0] h1g1f1e1;
  input clk;
  wire   f0, f1, f2, f3, g0, g1, g2, g3, h1, n18, n19, n20, n21, n22, n23, n24,
         n25, n16, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40;

  DFF_X1 e0_r_reg ( .D(d0c0b0a0[0]), .CK(clk), .Q(h0g0f0e0[0]) );
  DFF_X1 e1_r_reg ( .D(d1c1b1a1[0]), .CK(clk), .Q(h1g1f1e1[0]) );
  DFF_X1 f0_r_reg ( .D(f0), .CK(clk), .QN(n24) );
  DFF_X1 f1_r_reg ( .D(f1), .CK(clk), .QN(n25) );
  DFF_X1 f2_r_reg ( .D(f2), .CK(clk), .QN(n20) );
  DFF_X1 f3_r_reg ( .D(f3), .CK(clk), .QN(n21) );
  DFF_X1 g0_r_reg ( .D(g0), .CK(clk), .QN(n22) );
  DFF_X1 g1_r_reg ( .D(g1), .CK(clk), .QN(n23) );
  DFF_X1 g2_r_reg ( .D(g2), .CK(clk), .QN(n18) );
  DFF_X1 g3_r_reg ( .D(g3), .CK(clk), .QN(n19) );
  DFF_X1 h0_r_reg ( .D(n16), .CK(clk), .Q(h0g0f0e0[3]) );
  DFF_X1 h1_r_reg ( .D(h1), .CK(clk), .Q(h1g1f1e1[3]) );
  XOR2_X1 U3 ( .A(n19), .B(n18), .Z(h1g1f1e1[2]) );
  XOR2_X1 U4 ( .A(n21), .B(n20), .Z(h1g1f1e1[1]) );
  XOR2_X1 U5 ( .A(d1c1b1a1[2]), .B(d0c0b0a0[3]), .Z(h1) );
  XOR2_X1 U6 ( .A(n23), .B(n22), .Z(h0g0f0e0[2]) );
  XOR2_X1 U7 ( .A(n25), .B(n24), .Z(h0g0f0e0[1]) );
  XOR2_X1 U8 ( .A(guards[1]), .B(d0c0b0a0[2]), .Z(n27) );
  NAND2_X1 U9 ( .A1(d0c0b0a0[1]), .A2(d1c1b1a1[0]), .ZN(n26) );
  XNOR2_X1 U10 ( .A(n27), .B(n26), .ZN(g2) );
  XOR2_X1 U11 ( .A(guards[1]), .B(d1c1b1a1[3]), .Z(n29) );
  NAND2_X1 U12 ( .A1(d0c0b0a0[0]), .A2(d1c1b1a1[1]), .ZN(n28) );
  XNOR2_X1 U13 ( .A(n29), .B(n28), .ZN(g1) );
  NAND2_X1 U14 ( .A1(d0c0b0a0[0]), .A2(d0c0b0a0[1]), .ZN(n30) );
  XOR2_X1 U15 ( .A(guards[1]), .B(n30), .Z(g0) );
  NOR2_X1 U16 ( .A1(d1c1b1a1[3]), .A2(d1c1b1a1[0]), .ZN(n31) );
  XOR2_X1 U17 ( .A(guards[0]), .B(n31), .Z(n32) );
  XNOR2_X1 U18 ( .A(d1c1b1a1[1]), .B(n32), .ZN(f3) );
  INV_X1 U19 ( .A(d1c1b1a1[0]), .ZN(n33) );
  NAND2_X1 U20 ( .A1(n33), .A2(d0c0b0a0[3]), .ZN(n34) );
  XNOR2_X1 U21 ( .A(n34), .B(guards[0]), .ZN(f2) );
  XNOR2_X1 U22 ( .A(d0c0b0a0[1]), .B(guards[0]), .ZN(n37) );
  INV_X1 U23 ( .A(d0c0b0a0[0]), .ZN(n35) );
  NOR2_X1 U24 ( .A1(n35), .A2(d1c1b1a1[3]), .ZN(n36) );
  XNOR2_X1 U25 ( .A(n37), .B(n36), .ZN(f1) );
  NAND2_X1 U26 ( .A1(d0c0b0a0[3]), .A2(d0c0b0a0[0]), .ZN(n38) );
  XNOR2_X1 U27 ( .A(n38), .B(guards[0]), .ZN(f0) );
  XOR2_X1 U28 ( .A(d1c1b1a1[3]), .B(d1c1b1a1[2]), .Z(n16) );
  XOR2_X1 U29 ( .A(n16), .B(guards[1]), .Z(n40) );
  NAND2_X1 U30 ( .A1(d1c1b1a1[1]), .A2(d1c1b1a1[0]), .ZN(n39) );
  XNOR2_X1 U31 ( .A(n40), .B(n39), .ZN(g3) );
endmodule


module SharedSbox ( clk, d0c0b0a0, d1c1b1a1, guards, h0g0f0e0, h1g1f1e1 );

(* SILVER="clock" *)  input       clk;
  
(* SILVER="[3:0]_0" *)  input [03:00]   d0c0b0a0;
(* SILVER="[3:0]_1" *)  input [03:00]   d1c1b1a1;
(* SILVER="refresh" *)  input [03:00]   guards;
  
(* SILVER="[3:0]_0" *)  output  [03:00]   h0g0f0e0;
(* SILVER="[3:0]_1" *)  output  [03:00]   h1g1f1e1;

  wire   [1:0] guards_r;
  wire   [3:0] h0g0f0e0_f;
  wire   [3:0] h1g1f1e1_f;

  FSharedSbox FSharedSbox_Inst ( .clk(clk), .d0c0b0a0(d0c0b0a0), .d1c1b1a1(
        d1c1b1a1), .guards(guards[3:2]), .h0g0f0e0(h0g0f0e0_f), .h1g1f1e1(
        h1g1f1e1_f) );
  GSharedSbox GSharedSbox_Inst ( .clk(clk), .d0c0b0a0(h0g0f0e0_f), .d1c1b1a1(
        h1g1f1e1_f), .guards(guards_r), .h0g0f0e0(h0g0f0e0), .h1g1f1e1(
        h1g1f1e1) );
  DFF_X1 \guards_r_reg[1]  ( .D(guards[1]), .CK(clk), .Q(guards_r[1]) );
  DFF_X1 \guards_r_reg[0]  ( .D(guards[0]), .CK(clk), .Q(guards_r[0]) );
endmodule

