Example of hybrid (structured-unstructured) mesh plot with matplotlib and
python-vtk.

Allrun script:

1. Creates (if it is not already created) mesh using [Gmsh](http://gmsh.info).
2. Converts disk.msh using gmshToFoam.
3. Corrects boundary dictionary: sets walls patch type to wall, and
   front-n-back patch type to empty.
4. Runs potentialFoam.
5. Samples flow field with sample utility.
6. Creates plots (U_center-plane.pdf & U_center-plane.png) using plot-vtk.py
   script.

Allclean script removes results of Allrun.
