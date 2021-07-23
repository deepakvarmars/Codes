subroutine allocator
   use solidsolve
   implicit none
   
   allocate(ddsp(3,-1:nx+1,-1:ny+1,-1:nz+1))
   allocate(x(-1:nx+1,-1:ny+1,-1:nz+1))
   allocate(y(-1:nx+1,-1:ny+1,-1:nz+1))
   allocate(z(-1:nx+1,-1:ny+1,-1:nz+1))
   allocate(dv(3,nx,ny,nz))
   allocate(accwo(nx,ny,nz), accwn(nx,ny,nz))
   allocate(velwo(nx,ny,nz), velwn(nx,ny,nz))

   allocate(szz(nx,ny,nz), szx(nx,ny,nz), szy(nx,ny,nz))
   allocate(nddx(nx,ny,nz), nddy(nx,ny,nz), nddxy(nx,ny,nz))

end subroutine allocator
