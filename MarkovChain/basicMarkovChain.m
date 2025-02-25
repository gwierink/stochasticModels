%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% File: basicMarkovChain.m
%
% Description:
% This is a basic Octave script to simulate a Markov chain using 3 states and
% a 3x3 transition matrix.

% Date: 22 February 2025

%------------------------------------------------------------------------------

% Define the transition matrix P (3x3 matrix for 3 states)
P = [0.5, 0.3, 0.2;
     0.1, 0.8, 0.1;
     0.3, 0.4, 0.3];

states = {'A', 'B', 'C'};  % Labels for the states

current_state = 1;  % Start at state A (index 1)
num_steps = 10;  % Number of steps to simulate

% Initialize the list to store the sequence of states
state_sequence = states(current_state);

for step = 1:num_steps
    % Get the current state's row in the transition matrix
    transition_probabilities = P(current_state, :);
    
    % Generate a random number to choose the next state based on the
    % probabilities. This is the cumulative probability, i.e. when the
    % probabilities are 0.5, 0.3, and 0.2 as in the first row of P, then
    % the cumulative probabilities for states A, B, and C are 0.5, 0.8, and 1.0,
    % respectively.
    % Then, define the next state as a random number ("rand") smaller than or
    % equal to the cumulative transition probability. Here, the "find" function
    % returns the indices of the elements in the array where the condition
    % (rand <= cumsum(transition_probabilities)) is true.
    % The "1" as the second argument tells "find" to return only the first
    % match. So, for example, if rand = 0.6 and
    % cumsum(transition_probabilities) = [0.5, 0.8, 1.0], the condition
    % rand <= cumsum(transition_probabilities) would be:
    %   [0.6 <= 0.5, 0.6 <= 0.8, 0.6 <= 1.0]
    % This results in:
    %   [false, true, true]
    next_state = find(rand <= cumsum(transition_probabilities), 1);
    
    % Append the new state to the state sequence
    state_sequence = [state_sequence, states{next_state}];
    
    % Update the current state
    current_state = next_state;
end

% Display the sequence of states
disp('State sequence:');
disp(state_sequence);


% ----------------------------------------------------------------- End-of-file
