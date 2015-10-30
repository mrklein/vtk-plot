Point(1) = { 0,  0, 0};

Point(2) = { 1,  0, 0};
Point(3) = { 0,  1, 0};
Point(4) = {-1,  0, 0};
Point(5) = { 0, -1, 0};

Point(6) = { 2,  0, 0, 0.1};
Point(7) = { 0,  2, 0, 0.1};
Point(8) = {-2,  0, 0, 0.1};
Point(9) = { 0, -2, 0, 0.1};

Point(10) = { 10,   0, 0, 1};
Point(11) = { 10,  10, 0, 1};
Point(12) = {  0,  10, 0, 1};
Point(13) = {-10,  10, 0, 1};
Point(14) = {-10,   0, 0, 1};
Point(15) = {-10, -10, 0, 1};
Point(16) = {  0, -10, 0, 1};
Point(17) = { 10, -10, 0, 1};

Circle(1) = {2, 1, 3};
Circle(2) = {3, 1, 4};
Circle(3) = {4, 1, 5};
Circle(4) = {5, 1, 2};
Circle(5) = {6, 1, 7};
Circle(6) = {7, 1, 8};
Circle(7) = {8, 1, 9};
Circle(8) = {9, 1, 6};
Line(9) = {11, 12};
Line(10) = {12, 13};
Line(11) = {13, 14};
Line(12) = {14, 15};
Line(13) = {15, 16};
Line(14) = {16, 17};
Line(15) = {17, 10};
Line(16) = {10, 11};
Line(17) = {2, 6};
Line(18) = {6, 10};
Line(19) = {3, 7};
Line(20) = {7, 12};
Line(21) = {4, 8};
Line(22) = {8, 14};
Line(23) = {5, 9};
Line(24) = {9, 16};
Line Loop(25) = {17, 5, -19, -1};
Ruled Surface(26) = {25};
Line Loop(27) = {19, 6, -21, -2};
Ruled Surface(28) = {27};
Line Loop(29) = {21, 7, -23, -3};
Ruled Surface(30) = {29};
Line Loop(31) = {23, 8, -17, -4};
Ruled Surface(32) = {31};
Line Loop(33) = {20, -9, -16, -18, 5};
Plane Surface(34) = {33};
Line Loop(35) = {20, 10, 11, -22, -6};
Plane Surface(36) = {35};
Line Loop(37) = {12, 13, -24, -7, 22};
Plane Surface(38) = {37};
Line Loop(39) = {14, 15, -18, -8, 24};
Plane Surface(40) = {39};

rhoArc = 21;
rhoLink = 11;

Transfinite Line {1, 2, 3, 4, 5, 6, 7, 8} = rhoArc;
Transfinite Line {17, 19, 21, 23} = rhoLink;

Transfinite Surface {26, 28, 30, 32};
Recombine Surface {26, 28, 30, 32};
Extrude {0, 0, 1} {
  Surface{36, 34, 40, 38, 30, 28, 26, 32};
  Layers{1};
  Recombine;
}

Physical Surface("cylinder") = {169, 191, 213, 235};
Physical Surface("inlet") = {131, 58};
Physical Surface("outlet") = {85, 108};
Physical Surface("walls") = {104, 135, 54, 81};
Physical Surface("front-n-back") = {67, 94, 121, 148, 38, 36, 34, 40, 192, 214, 236, 170, 30, 28, 26, 32};
Physical Volume("channel") = {4, 1, 2, 3, 8, 7, 6, 5};
