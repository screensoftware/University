function [Y] = lle(X, d, K)

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
   
    % X = Input data as D x N matrix (D = Dimensionality, N = #Samples)
    % K = Number of neighbors considered
    % d = Embedding dimension
    % Y = Final Embedding as d x N matrix
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % HANDLING ARGUMENTS AND SETTING DEFAULT VALUES
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        if ~exist('d', 'var')
            d = 2;
        end
        if ~exist('K', 'var')
            K = 12;
        end

        % EXTRACTING FREQUENTLY USED PARAMETERS
        [D, N] = size(X);

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % STEP 1: COMPUTING EUCLIDEAN DISTANCES & FINDING K-NEAREST NEIGHBORS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        SQ = sum(X.^2,1);
        ED = repmat(SQ,N,1) + repmat(SQ',1,N) - 2*(X')*X;

        [~, INDXS] = sort(ED);
        NGHBS = INDXS(2:(1+K), :);

    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % STEP 2: COMPUTING OPTIMAL RECOSTRUCTION WEIGHTS
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        % CHECKING IF REGULARIZATION IS NEEDED
        if(K > D)
            DELTA = 10e-5;
        else
            DELTA = 0;
        end

        W = spalloc(N, N, K * N);
        
        for i = 1 : N
            XN = repmat(X(:, i), 1, K) - X(:, NGHBS(:, i));
            G = XN' * XN;
            G = G + eye(K, K) * DELTA * trace(G);
            w = G\ones(K, 1);
            W(i, NGHBS(:, i)) = w/sum(w);
        end
  
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % STEP 3: COMPUTING OPTIMAL EMBEDDING
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        IW = spdiags(ones(N, 1), 0, N, N) - W;
        M = (IW)' * (IW);
        
        [YT, ~] = eigs(M, d+1, 0, 'Display', 0, 'StartVector', ones(size(M, 1), 1));
        Y = YT(:, 2:d+1)' * sqrt(N);
end

