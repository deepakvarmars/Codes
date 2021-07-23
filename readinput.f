subroutine readinput
   use solidsolve
   implicit none

   open(unit=21, file = "solidinput.inp", status="old")   
   read(21,*)
   read(21,*)
   read(21,*) nx, ny, nz
   read(21,*) 
   read(21,*) 
   read(21,*) 
   read(21,*) h, masrto, posrto, rho_s
   read(21,*) 
   read(21,*) 
   read(21,*) 
   read(21,*) ah, ab, beta 
   read(21,*) 
   read(21,*) 
   read(21,*) 
   read(21,*) bcno(1:4) !bc - 1 : pinned, 2: clamped 
   read(21,*) 
   read(21,*) 
   read(21,*) 
   read(21,*) dt_fix 



end subroutine readinput
