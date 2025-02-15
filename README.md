#  🛩️ 2D Steady State Back Facing Step Flow Simulation (RANS)

This repo contains the code for numeric simulation for the State Back Facing Step Flow in a 2D context. The project was powered by the 'OpenFOAM' framework (v10).

![Visulization](https://raw.githubusercontent.com/chunyang-w/2D-Steady-State-Back-Facing-Step-Flow-Simulation-RANS-Openfoam/main/demo.png)

## Simulation detail:

+ Inlet velocity: [1m/s](https://github.com/chunyang-w/2D-Steady-State-Back-Facing-Step-Flow-Simulation-RANS-Openfoam/blob/4237294e5816c0a9672e1b643001d57fb93076ec/0/U#L25)
+ rho: 1
+ nu: 1e-5

## [Simulation domain](https://github.com/chunyang-w/2D-Steady-State-Back-Facing-Step-Flow-Simulation-RANS-Openfoam/blob/9b20ad49a3b88db4cffa777ab691e79da4add2e0/mesh_data/backflow_mesh.geo#L25-L30):
```
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
```
+ length(p4, p5) = 7
+ length(p5, p6) = 8
+ length(p6, p1) = 1
+ length(p1, p2) = 35
+ length(p2, p3) = 8

## Run this project

### Prerequisites

+ OpenFOAM 10
+ gmsh 4.8
+ Paraview 5.10.*

### Commands

run the `./Allrun` script.

Please run `./Allclean` before each run to clean the previous results.
