% ----------------------------------------------------------------------- %
% Each information is stored here
% ----------------------------------------------------------------------- %
p_messages = [0.26, 0.23, 0.20, 0.17, 0.14];
p_messages_conditional = zeros(1,5);

% ----------------------------------------------------------------------- %
% There are four possibilities that the first two bits could be.
% Layout: Given 11: [CORRECT CORRECT, WRONG CORRECT, CORRECT WRONG, WRONG
% WRONG]
% ----------------------------------------------------------------------- %
p_11_combos = [0.9^2,0.1*0.9,0.9*0.1,0.1^2];

% ----------------------------------------------------------------------- %
% Law of total probability.
% ----------------------------------------------------------------------- %
p_11_eachMssg = [p_messages(1) * p_11_combos(3), p_messages(2) * ...
p_11_combos(4), p_messages(3) * p_11_combos(2), p_messages(4) * ...
p_11_combos(1), p_messages(5) * p_11_combos(1)];
p_11 = sum(p_11_eachMssg);

% ----------------------------------------------------------------------- %
% Using Bayes' rule in a for loop
% ----------------------------------------------------------------------- %
for i = 1:length(p_messages)
    p_messages_conditional(i) = p_11_eachMssg(i) * p_messages(i)/p_11;
end
