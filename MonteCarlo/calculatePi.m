%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% File: calculatePi.m
%
% Description:
% This is a basic Octave script to calculate the value of pi using Monte Carlo
% simulation.
%
% This code generates N random points within a square with sides of length 1.
% Inside the square, we can think of a 1/4 section of the unit circle. The code
% then generates random nubers and checks which points are inside the unit
% circle centered at the origin and with radius 1. The ratio of the number of
% points inside the circle to the total number of points is an estimate of the
% area of the circle.
% The area of the entire circle is pi*r^2 and the area of the circumscribing
% (2*r)^2 = 4*r^2. The ratio of the areas is pi*r^2 / 4*r^2 = pi/4. For a very
% large number of points we can write the number of points in the circle
% divided by the number of points in the square equals pi/4, so pi is four
% times the above ratio. We can check whether a number is inside the circle
% or not by checking whether x^2 + y^2 <= 1.
% See https://www.geeksforgeeks.org/estimating-value-pi-using-monte-carlo/
% for further explanation.

% Date: 8 March 2023

%------------------------------------------------------------------------------

% Take a large number of points
N = 100000;

% Generate random x and y coordinates
% The rand(N, 1) generates a Nx1 matrix of random numbers between 0 and 1. 
x = rand(N, 1);
y = rand(N, 1);

% Check whether points are inside the unit circle
inside_circle = (x.^2 + y.^2) <= 1;

% Estimate pi
pi_estimate = 4 * sum(inside_circle) / N;

% Show the results (only number)
%disp(pi_estimate);

% Show the result in a bit more verbose way
fprintf('The estimated value of pi is: %.4f\n', pi_estimate);


% ----------------------------------------------------------------- End-of-file
