subroutine normalisedmstress
   use solidsolve
   implicit none
   
   !local variables
   real(8) :: dwcd1  !1st ord CD method
   real(8) :: dudx, dudy 
   real(8) :: dvdx, dvdy 
   real(8) :: dwdx, dwdy
   integer :: i,j,k

   do k=1,nz
      do j=1,nz
         do i=1,nx
            dudx = dwcd1(1, ddsp(1,i-1,j,k), ddsp(1,i,j,k),ddsp(1,i+1,j,k))
            dvdx = dwcd1(1, ddsp(2,i-1,j,k), ddsp(2,i,j,k),ddsp(2,i+1,j,k))
            dwdx = dwcd1(1, ddsp(3,i-1,j,k), ddsp(3,i,j,k),ddsp(3,i+1,j,k))
            dudy = dwcd1(2, ddsp(1,i,j-1,k), ddsp(1,i,j,k),ddsp(1,i,j+1,k))
            dvdy = dwcd1(2, ddsp(2,i,j-1,k), ddsp(2,i,j,k),ddsp(2,i,j+1,k))
            dwdy = dwcd1(2, ddsp(3,i,j-1,k), ddsp(3,i,j,k),ddsp(3,i,j+1,k))
            nddx(i,j,k) = 12.0d0*(dudx + posrto*dvdy + 0.5d0*(dwdx**2 + posrto*dwdy**2))
            nddy(i,j,k) = 12.0d0*(dvdy + posrto*dudx + 0.5d0*(dwdy**2 + posrto*dwdx**2))
            nddxy(i,j,k) = 6.0d0*(1.0d0 - posrto)*(dudy + dvdx + dwdx*dwdy)
         enddo
       enddo
    enddo
    
    return
end subroutine normalisedmstress
