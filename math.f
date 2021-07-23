real(8) function dwcd1(dir, dwm1, dw0, dwp1)
   use solidsolve
   implicit none
   integer, intent(in)  ::  dir
   real(8), intent(in)  ::  dwm1, dw0, dwp1
   real(8) :: dh

   if (dir == 1) then
      dh = dx
   else if(dir==2) then
      dh = dy
   endif

   dwcd1 = 0.5*(dwp1 - dwm1)/dh

   return

end function dwcd1

real(8) function dwcd2(dir, dwm1, dw0, dwp1)
   use solidsolve
   implicit none
   integer, intent(in)  ::  dir
   real(8), intent(in)  ::  dwm1, dw0, dwp1
   real(8) :: dh

   if (dir == 1) then
      dh = dx
   else if(dir == 2) then
      dh = dy
   endif

   dwcd2 = 0.5d0*(dwp1 - 2.0d0*dw0 + dwm1)/dh**2

   return
end function dwcd2


real(8) function dwcddxdy2(dwmxy1, dwmx1, dwmy1, dw0, dwpx1, dwpy1, dwpxy1)
   use solidsolve
   implicit none
   real(8), intent(in)  :: dwmxy1, dwmx1, dwmy1, dw0
   real(8), intent(in)  :: dwpx1, dwpy1, dwpxy1

   dwcddxdy2 = 0.5*(dwpxy1 - dwpx1 - dwpy1 - 2.0d0*dw0 - &
                    dwmx1 - dwmy1 + dwmxy1)/(dx*dy)

   return

end function dwcddxdy2

real(8) function dwcd4(dir, dwm2, dwm1, dw0, dwp1, dwp2)
   use solidsolve
   implicit none
   integer, intent(in)  ::  dir
   real(8), intent(in)  :: dwm2, dwm1, dw0, dwp1, dwp2
   real(8) :: dh

   if (dir == 1) then
      dh = dx
   else if(dir == 2) then
      dh = dy
   endif

   dwcd4 = (dwp2 - 4.0d0*dwp1 + 12.0d0*dw0 - 4.0d0*dwm1 + dwm2)/dh**4

   return
end function dwcd4

real(8) function avg(u1, u2)
   implicit none
   real(8), intent(in)  ::  u1, u2
   

   avg = 0.5*(u1 + u2)
   return
end function avg
