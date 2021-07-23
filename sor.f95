subroutine sor(phi1, A, b, phires)
   use comvar
   implicit none
   
   real, dimension(:,:), intent(in)      ::  A(npoin, npoin)
   real, dimension(:), intent(in)        ::  b(npoin)
   real, dimension(:), intent(in)        ::  phi1(npoin)
   real, dimension(:), intent(out)       ::  phires(npoin)
   real, dimension(:)                    ::  phiold(npoin), phinew(npoin)
   real     :: omega
   integer  :: i, j, k
   real     :: tol, err1
   real     :: tmp1, tmp2, tmp3
   integer  :: itmax, it

   omega = 1.5
   open(unit=22, file="convergence.dat")
   write(22,*) "Iteration Number      Error"
   itmax = 100000
   it = 0
   tol  = 1.0e-10
   err1 = 1.0
   phinew(:) = phi1(:)
   !find the result for phi
   do while(err1 > tol.and. it < itmax)
      err1 = 0.0
      phiold = phinew
      phinew = 0.0
      do k=1,npoin
         tmp2 = 0.0
         tmp3 = 0.0
         tmp1  = omega/A(k,k)
         do j = 1, k-1
            tmp2 = tmp2 + A(k,j)*phinew(j)
         enddo
         do i = k+1, npoin
            tmp3 = tmp3 + A(k,i)*phiold(i)
         enddo
         phinew(k) = (1.0 - omega)*phiold(k) + tmp1*(b(k) - tmp2 - tmp3)
         err1 = max(err1, phinew(k) - phiold(k))
      enddo
      it = it + 1
      write(22,*) it, err1
   enddo
   
   phires = phinew
 
   close(22)
   return
     
end subroutine sor
