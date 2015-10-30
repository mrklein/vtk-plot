#!/usr/bin/env python


def load_velocity(filename):
    import os

    if not os.path.exists(filename):
        return None

    from numpy import zeros
    from vtk import vtkPolyDataReader, vtkCellDataToPointData

    reader = vtkPolyDataReader()
    reader.SetFileName(filename)
    reader.ReadAllVectorsOn()
    reader.Update()

    data = reader.GetOutput()

    # Extracting triangulation information
    triangles = data.GetPolys().GetData()
    points = data.GetPoints()

    # Mapping data: cell -> point
    mapper = vtkCellDataToPointData()
    mapper.AddInputData(data)
    mapper.Update()
    mapped_data = mapper.GetOutput()

    # Extracting interpolate point data
    udata = mapped_data.GetPointData().GetArray(0)

    ntri = triangles.GetNumberOfTuples()/4
    npts = points.GetNumberOfPoints()
    nvls = udata.GetNumberOfTuples()

    tri = zeros((ntri, 3))
    x = zeros(npts)
    y = zeros(npts)
    ux = zeros(nvls)
    uy = zeros(nvls)

    for i in xrange(0, ntri):
        tri[i, 0] = triangles.GetTuple(4*i + 1)[0]
        tri[i, 1] = triangles.GetTuple(4*i + 2)[0]
        tri[i, 2] = triangles.GetTuple(4*i + 3)[0]

    for i in xrange(npts):
        pt = points.GetPoint(i)
        x[i] = pt[0]
        y[i] = pt[1]

    for i in xrange(0, nvls):
        U = udata.GetTuple(i)
        ux[i] = U[0]
        uy[i] = U[1]

    return (x, y, tri, ux, uy)


def plot(filename):
    import os
    from matplotlib.pyplot import clf, tricontour, tricontourf, \
        gca, savefig, rc, minorticks_on

    if not os.path.exists(filename):
        return -1

    rc('text', usetex=True)
    clf()
    x, y, tri, ux, uy = load_velocity(filename)
    tricontourf(x, y, tri, ux, 16)
    tricontour(x, y, tri, ux, 16, linestyles='-',
               colors='black', linewidths=0.5)
    minorticks_on()
    gca().set_aspect('equal')
    gca().tick_params(direction='out', which='both')
    gca().set_xticklabels([])
    gca().set_yticklabels([])

    name, _ = os.path.splitext(filename)
    name = os.path.basename(name)

    savefig('{0}.png'.format(name), dpi=300, bbox_inches='tight')
    savefig('{0}.pdf'.format(name), bbox_inches='tight')


if __name__ == '__main__':
    import sys

    if len(sys.argv) < 2:
        print 'usage: {0} [FILENAME]'.format(sys.argv[0])
        sys.exit(-1)
    sys.exit(plot(sys.argv[1]))
