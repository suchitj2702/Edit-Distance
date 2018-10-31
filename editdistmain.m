clear all;
close all;
%%
prompt = 'Enter the first string: ';
str1 = upper(input(prompt, 's'));

prompt = 'Enter the second string: ';
str2 = upper(input(prompt, 's'));

% computing length of each string
M = length(str1);
N = length(str2);

% initialing the edit distance matrix with indexes in the first row and column
D = zeros(M + 1,N + 1);
for i = 2:M + 1
    D(i, 1) = i - 1;
end
for j = 2:N + 1
    D(1, j) = j - 1;
end

% initilizing another matrix to keep a track of the decisions on minima taken for each entry
I = zeros(M + 1, N + 1);

% computing the edit distance matrix iteratively
for i = 2:M + 1
    for j = 2:N + 1
        % deletion operation
        deletion = D(i - 1, j) + 1;
        
        % insertion operation
        insertion = D(i, j - 1) + 1;
        
        % substitution operation
        if str1(i - 1) ~= str2(j - 1)
            substitution = D(i - 1, j - 1) + 2;
        else
            substitution = D(i - 1, j - 1) + 0;
        end
        
        % finding minima of deletion, insertion and substitution operation,
        % while also storing our choice in another matrix I
        [D(i, j), I(i, j)] = min([deletion insertion substitution]);
        
        % giving substitution the highest order of precedence in case we
        % get equal minima for multiple operations
        if deletion == insertion && insertion == substitution || insertion == substitution && insertion < deletion || deletion == substitution && deletion < substitution
            I(i, j) = 3;
        end
    end
end

fprintf('Edit Distance = %d\n', D(M + 1, N + 1));

% backtracing from the last stored entry in I matrix to back trace the
% operations(deletion/insertion/substitution) we took to reach it
while i >= 1 && j >= 1
    % checking for substitution
    if I(i, j) == 3
        if i - 1 == 0 || j - 1 == 0
            break;
        end
        if str1(i-1) == str2(j - 1)
            fprintf('%s -> unchanged -> %s\n', str1(i-1), str2(j - 1));
        else
            fprintf('%s -> substitute -> %s\n', str1(i-1), str2(j - 1));
        end
        i = i - 1;
        j = j - 1;
    % checking for insertion
    elseif I(i, j) == 2
        if j - 1 == 0
            break;
        end
        fprintf('* -> insertion -> %s\n', str2(j - 1));
        j = j - 1;
    % if not the above 2 then definitely deletion
    else
        if i - 1 == 0
            break;
        end
        fprintf('%s -> deletion -> *\n', str1(i - 1));
        i = i - 1;
    end
end

