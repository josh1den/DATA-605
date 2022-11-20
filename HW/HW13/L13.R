### FUNCTIONS IN R AND NON-FUNCTIONS

par(mfrow=c(2,2)) #set up graphs in 2x2 matrix

fx = function(x){3*(x+1)*(x-4)*(x+5)}
s = seq(-10,10,by=0.1)
a = fx(s)
plot(a~s, type="l")

### EVALUATING LIMITS NUMERICALLY 

library(rootSolve)

fx = function(x){3*(x+1)*(x-4)*(x+5)}
s = seq(-10,10,by=0.1)
a = fx(s)
plot(a~s, type="l")
# find the y-intercept
yint = fx(0)
# find the x-intercept
xint = uniroot(fx,c(-100,100))
points(xint$root,yint,col="red",pch=21)
xint$root
yint

### DERIVATIVES

library(Deriv)

# take the symbolic deriv of log(x)
myf1 = function(x)sin(x)
Deriv(myf1)

# take the symbolic deriv of 1/x
myf2 = function(x)1/x
ans = Deriv(myf2)
ans
# evaluate the deriv of 1/x at x=3
ans(3)

### MAX AND MIN OF FUNCTIONS
### 1st and 2nd Derivatives

# f(x) - x^3 - 3*x^2 - 9*x + 5 for -2 <= x <= 6

library(mosaic)

fx = function(x){x^3-3*x^2-9*x + 5}
s = seq(-2,4,by=.1)
a = fx(s)
data =cbind(s,a)
plot(data,type="l",main="Solve for Max between -2 and 4")
min(a)
max(a)
first=Deriv(fx)
a = uniroot.all(first,c(-2,4))
a

### INTEGRATION

fx = function(x)-2
integrate(Vectorize(fx),1,4) # some basic functions need vectorize

fx = function(x)exp(x^2+x)
integrate(fx,1,2)

### INDEFINITE INTEGRALS

# Constant Multiple Rule int(k*f)=K*int(f) + C
library(mosaicCalc)

antiD(5~x)

# Sum Rule (separable)
antiD(x-2+x^2~x)

# Power Rule, x^n -> (x^(n+1)/(n+1))
antiD(x^3~x)

# Exp(x) => exp(x) + C
antiD(exp(x)~x)

# 1/x => ln|x| + C
antiD(1/x~x)

# Two (or more) Variable Problems
library(cubature)

fxyz = function(x) {(x[1]-2)^2+(x[2]+3)^2 +
    (x[3]-4)^2-9}
adaptIntegrate(fxyz,lower=c(-10,-10,-10),upper=c(10,10,10))
