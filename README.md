# lapack-debug
Setting up a LAPACK source debug environment on linux.

## Requirements
1. **gfortran**
	```shell
	sudo apt install gfortran
	```
2. **GDB**
	```shell
	sudo apt install gdb
	```
3. [**VSCode**](https://code.visualstudio.com/)

4. [**Git**](https://git-scm.com/)

## Steps to debug
1. Clone LAPACK repo to some directory on your computer. I'll be cloning it to **`/home/pat/src/lapack`**
	```shell
	cd /home/pat # change this to your user directory
	mkdir src
	cd src
	git clone https://github.com/Reference-LAPACK/lapack.git
	```

2. Run a couple commands to build LAPACK (compile it basically). This may take a while...
	```shell
	cd /home/pat/src/lapack # make sure to use your directory
	cp ./INSTALL/make.inc.gfortran_debug ./make.inc # build lapack with debugging symbols
	make
	```
	| The `cp` command copies `make.inc.gfortran_debug` in the INSTALL directory to the base directory and renames it `make.inc`. The command `make` then makes use of `make.inc` |
	|---------|

3. Clone the contents of this repo anywhere on your computer and open it in Visual Studio Code.
	```shell
	git clone https://github.com/soypat/lapack-debug.git
	code lapack-debug # this opens visual studio code in this folder
	```

4. Install VSCode extensions:
	* Install **C/C++** extension by Microsoft (go to rubiks cube icon in VSCode)
	* Install **Fortran Breakpoint Support** by _ekibun_

5. Place a breakpoint somewhere in [`main.f90`](./main.f90). Press F5. This will run the **Run GDB** launch configuration in [`launch.json`](.vscode/launch.json), which includes linking and compiling your program. You may now debug. See [this youtube video](https://www.youtube.com/watch?v=XuNjA230e3k) for more guidance on debugging fortran.

## What program does
This program solves the following system of equations using LAPACK's single-precision solver `SGESV`:

```
2x + y + z  =   8
3x - y + 2z = -11
-2x + y + 2z = -3
```

The output of the program is 
```
2.0000,  
3.0000,  
-1.0000,
```

which is the solution.

## Running program
If you wish to simply run the program, follow above steps until 3 (including step 3) and run the following commands in this folder:

```
make
./a.out
```

Output:
```
2.0000,  
3.0000,  
-1.0000,
```