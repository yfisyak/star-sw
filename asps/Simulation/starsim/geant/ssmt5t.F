* $Id: ssmt5t.F,v 1.1.1.1 2004/01/12 23:49:41 potekhin Exp $
* $Log: ssmt5t.F,v $
* Revision 1.1.1.1  2004/01/12 23:49:41  potekhin
*
*
* Revision 1.1  2001/02/27 10:15:50  nevski
*  first working release
*
      SUBROUTINE SSMT5T(A,S,R)
C *** ------------------------------------------------------            05/07/81
C *** TRANSFORMATION OF SYMMETRIC 5X5 MATRIX S: A*S*AT -> R.
C *** A IS A GENERAL 5X5 MATRIX WHEREAS S,R ARE SYMMETRIC
C *** MATRICES STORED IN TRIANGULAR FORM. FOR:I,J=1,5
C *** R(I,J) = SUM:K=1,5(SUM:L=1,5(A(I,L)*S(L,K)*A(J,K))).
C *** NB: S AND R MAY WELL BE THE SAME MATRIX.
C
C        Author: A. Haas (Freiburg University)
C
C *** ------------------------------------------------------
      DOUBLE PRECISION A,S,R,Q,T1,T2,T3,T4,T5
      DIMENSION A(25),S(15),R(15),Q(15)
      DO 5 I=1,15
         Q(I)=S(I)
    5 CONTINUE
      K=1
      DO 15 J=1,5
         T1=A(J   )
         T2=A(J+ 5)
         T3=A(J+10)
         T4=A(J+15)
         T5=A(J+20)
         DO 10 I=J,5
            R(K)=A(I   )*(Q(1)*T1+Q(2)*T2+Q( 3)*T3+Q( 4)*T4+Q( 5)*T5)
     +          +A(I+ 5)*(Q(2)*T1+Q(6)*T2+Q( 7)*T3+Q( 8)*T4+Q( 9)*T5)
     +          +A(I+10)*(Q(3)*T1+Q(7)*T2+Q(10)*T3+Q(11)*T4+Q(12)*T5)
     +          +A(I+15)*(Q(4)*T1+Q(8)*T2+Q(11)*T3+Q(13)*T4+Q(14)*T5)
     +          +A(I+20)*(Q(5)*T1+Q(9)*T2+Q(12)*T3+Q(14)*T4+Q(15)*T5)
            K=K+1
   10    CONTINUE
   15 CONTINUE
*
      END

