subroutine bc(bno)
   use solidsolve
   implicit none
   integer, intent(in) :: bno(4)
   integer   :: i, j

   ! bno = 1 : Clamped boundary
   ! bno = 2 : Pinned boundary

   !Dirichlet conditions
   !Boundary points
   ddsp(:,1,:,:)  = 0.0d0
   ddsp(:,:,1,:)  = 0.0d0
   ddsp(:,:,:,1)  = 0.0d0
   ddsp(:,nx,:,:) = 0.0d0
   ddsp(:,:,ny,:) = 0.0d0
   ddsp(:,:,:,nz) = 0.0d0

   !Neumann BC
   !Left and right boundary
   if(bno(1) == 1) then         !left boundary
      ddsp(3,0,:,:) =  ddsp(3,2,:,:)
   else if(bno(1) == 2) then
      ddsp(3,0,:,:) = -ddsp(3,2,:,:)
   else if(bno(3) == 1) then    !Right boundary
      ddsp(3,nx+1,:,:) = ddsp(3,nx-1,:,:)
   else if(bno(3) == 2) then    
      ddsp(3,nx+1,:,:) = -ddsp(3,nx-1,:,:)
   endif

   !Top and bottom boundary
   if(bno(2) == 1) then         !Bottom boundary
      ddsp(3,:,0,:) =  ddsp(3,:,2,:)
   else if(bno(2) == 2) then
      ddsp(3,:,0,:) = -ddsp(3,:,2,:)
   else if(bno(4) == 1) then    !Top boundary
      ddsp(3,:,ny+1,:) = ddsp(3,:,ny-1,:)
   else if(bno(3) == 2) then    
      ddsp(3,:,ny+1,:) = -ddsp(3,:,ny-1,:)
   endif
  
end subroutine bc
