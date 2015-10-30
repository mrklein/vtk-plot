Example of hybrid (structured-unstructured) mesh plot with matplotlib and
python-vtk.

Allrun script:

1. Creates (if it is not already created) mesh using [Gmsh](http://gmsh.info).
2. Converts disk.msh using gmshToFoam.
3. Corrects boundary dictionary: sets walls patch type to wall, and
   front-n-back patch type to empty.
4. Runs potentialFoam.
5. Samples flow field with sample utility.
6. Creates plots (U_center-plane.pdf & U_center-plane.pnd) using plot-vtk.py
   script.

Allclean script removes results of Allrun.

Case was created as a response to comment - <http://matveichev.blogspot.com/2014/03/plotting-vtk-files-with-matplotlib-and.html?showComment=1446136078228#c564942294285278208>

