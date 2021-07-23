subroutine timestep()
   use solidsolve
   implicit none
   real(8)  ::  dtcr, t_vib

   t_vib = dt_fix
   
   if((beta - 0.25d0) < 1.0e-13) then 
      dtcr = dt_fix
   else
      dtcr = t_vib/(2.0d0*pi*sqrt(0.25d0 - beta))
   endif

   dt = dtcr

end subroutine timestep
