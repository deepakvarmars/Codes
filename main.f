program main
   use solidsolve
   implicit none
   !Local variables
   integer :: i, j, it
   real(8) :: time 
  
   call readinput()

   call allocator()

   call init()
  
   call normalisedmstress()

   !Start simulation
   it = 0
   time = 0.0d0
   do while(time < final_time .and. it < itmax)
   
      call timestep()
      if(time + dt > final_time) then
         dt = final_time - time
      endif

      time = time + dt

      !Call time-dependent external stress
      call forceftn()

      !Set boundary conditions
      call bc(bcno)
      
      !Create the displacement matrix
      
   enddo
    
end program main
