module solidsolve

   real(8)   ::   a, b, h !Height, width and thickness of plate 
   
   integer   ::   nx, ny, nz !Grid dimensions
   integer   ::   itmax
   integer   ::   bcno(4)
   real(8), allocatable, dimension(:,:,:,:)  ::  dv
   real(8), allocatable, dimension(:,:,:,:)  ::  ddsp
   real(8), allocatable, dimension(:,:,:)  ::  velwo, velwn
   real(8), allocatable, dimension(:,:,:)  ::  accwo, accwn
   real(8), allocatable, dimension(:,:,:)  ::  x, y, z
   real(8), allocatable, dimension(:,:,:)  ::  szx, szy, szz
   real(8), allocatable, dimension(:,:,:)  ::  nddx, nddy, nddxy
   real(8)   :: masrto, posrto, rho_s
   real(8)   :: beta
   real(8)   :: dx, dy, dz 
   real(8)   :: dt, dt_fix,final_time
   real(8)   :: ab, ah
   real(8)   :: pi = 4.0d0*atan(1.0d0)
   real(8)   :: lambda, mu_s

   !Fluid properties
   real(8)   :: rho_inf, u_inf

end module solidsolve 
