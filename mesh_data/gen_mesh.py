import os
import numpy as np


def genMesh():
    if os.system("gmsh mesh_data/backflow_mesh.geo -3 -o backflow.msh -format msh2 > /dev/null") != 0:
        print("error during mesh creation!")
        return(-1)

    if os.system("gmshToFoam backflow.msh > /dev/null") != 0:
        print("error during conversion to OpenFoam mesh!")
        return(-1)

    with open(os.path.join(
        os.path.dirname(os.path.dirname(__file__)),
        "constant", "polyMesh", "boundary"), "rt") as inFile:
        with open(os.path.join(
            os.path.dirname(os.path.dirname(__file__)),
            "constant", "polyMesh", "boundaryTemp"), "wt") as outFile:
            inBlock = False
            inTopBottom = False
            for line in inFile:
                if "front" in line or "back" in line:
                    inBlock = True
                elif "top" in line or "bottom" in line:
                    inTopBottom = True
                if inBlock and "type" in line:
                    line = line.replace("patch", "empty")
                    inBlock = False
                if inTopBottom and "type" in line:
                    line = line.replace("patch", "wall")
                    inTopBottom = False
                outFile.write(line)
    os.rename("constant/polyMesh/boundaryTemp","constant/polyMesh/boundary")
    print("done")
    return(0)

if __name__ == "__main__":
    genMesh()
