subroutine init
   use solidsolve
   implicit none
   integer   :: i,j,k 
   real(8)   :: xmin, ymin, zmin

   a = h*ah
   b = a*ab

   xmin = 0.0d0
   ymin = 0.0d0
   zmin = 0.0d0

   dx = (xmin + a)/(nx-1)
   dy = (ymin + b)/(ny-1)
   dz = (zmin + h)/(nz-1)

   do k=1,nz
      do j=1,ny
         do i=1, nx
            x(i,j,k) = xmin + (i-1)*dx
            y(i,j,k) = ymin + (j-1)*dy
            z(i,j,k) = zmin + (k-1)*dz
         enddo
      enddo
    enddo

   do k=1,nz-1
      do j=1,ny-1
         do i=1,nx-1
            ddsp(3,i,j,k) = 0.0d0
            dv(3,i,j,k)   = 0.0d0
            accwn(i,j,k)  = 0.0d0
            accwo(i,j,k)  = 0.0d0
         enddo
      enddo
    enddo
  
end subroutine init

subroutine forceftn
   use solidsolve
   implicit none
   real(8)  :: q0, omega, p, area
   integer  :: i,j

   q0 = 10.0d0
   omega = 8.0*pi
   area = dx*dy

   p = q0 !*cos(omega*time)

   do j=1,ny
      do i=1,nx
         szz(i,j,1) = p/area
         szx(i,j,1) = 0.0d0 
         szy(i,j,1) = 0.0d0 
      enddo
   enddo

end subroutine forceftn
