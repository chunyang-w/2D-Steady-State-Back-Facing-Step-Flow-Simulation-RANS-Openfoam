// source file: https://github.com/FluidityProject/fluidity/blob/master/examples/backward_facing_step_3d/src/step3d.geo
// modified by: Chunyang.Wang
// Email: w.chunyang@outlook.com

// points and lines
//
//
//        ----------------------------------------------
//       / |      |                                    /|
//      /                                             / |
//     /   |      |                                  /  |
//    /       --                                    /   |
//  p4----/------/----------------------------------p3  |
//    |           |                                |    |
//    | /      /   --  --  --  --  --  --  --   -- | - / 
//    |         /                                  |  /
//    --------p6                                   | /
//    p5     |/                                    |/   
//           ---------------------------------------
//           p1                                    p2        


// Values based on Le, Moin and Kim, 1997, JFM 330, 349-374.

Point(1) = {0.0,   0.0, 0.0, 0.2};
Point(2) = {35.0,  0.0 ,0.0, 0.2};
Point(3) = {35.0,  0.0, 8.0, 0.2};
Point(4) = {-8.0,  0.0, 8.0, 0.2};
Point(5) = {-8.0,  0.0, 1.0, 0.2};
Point(6) = {0.0,   0.0, 1.0, 0.2};


Line(1) = {1,2};
Line(2) = {2,3};
Line(3) = {3,4};
Line(4) = {4,5};
Line(5) = {5,6};
Line(6) = {6,1};

Line Loop(7) = {5,6,1,2,3,4};

Plane Surface(8) = {7};
Extrude {0, 0.1, 0} {
  Surface{8};
  Layers{1};  // Specify one layer
  Recombine;  // Optional: to create hexahedral cells instead of tetrahedral
}

// in
Physical Surface("inlet") = {39};
//out
Physical Surface("outlet") = {31};
//top
Physical Surface("top") = {35};
//front
Physical Surface("front") = {8};
//back
Physical Surface("back") = {40};
//bottom of domain
Physical Surface("bottom") = {23,19,27};

Physical Volume(49) = {1};