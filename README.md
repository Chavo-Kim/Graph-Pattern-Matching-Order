# Graph Pattern Matching Challenge
>2014-13114 김재휘, 2015-12986 박창휘

## Matching Order
We try to follow adaptive matching order suggested by Myoungi Han et al(2019).

Using candidate-size order, we choose extendable vertex that has minimum candidate-size.

###Pseudo Code

####Backtrack Function

```
BACKTRACK(q, q_d, CS, M) do
    if |M| = |V(q)| then
        report M;
    else if |M| = 0 then
        for each v in C(r) do # Choose one vertex root's candidate set
            M <- {(r, v)};
            Mark v as visited;
            BACKTRACK(q, q_d, CS, M);
            Mark v as unvisited;       
    else
        u <- extendable vertex with minimum extendable candidate size
        for each v in C_M(u) do # Choose one vertex u's extendable candidate set
            if v is unvisited then
                M' <- M.push({(u, v)});
                Mark v as visited;
                BACKTRACK(q, q_d, CS, M);
                Mark v as unvisited;

    return; 
```

####Correctness checker Function

```
CORRECTNESS_CHECKER(M) do
    for each {(u1, v1)} in M do
        for each {(u2, v2)} in M except {(u1, v1)} do
            if u1.isNeighbor(u2) and !v1.isNeighbor(v2) then
                return false
            else if !u1.isNeighbor(u2) and v1.isNeighbor(v2) then
                return false

    return true

```

### References
[1] Myoungji Han, Hyunjoon Kim, Geonmo Gu, Kunsoo Park, and Wook-Shin Han. 2019. Efficient Subgraph Matching: Harmonizing Dynamic Programming, Adaptive Matching Order, and Failing Set Together. In Proceedings of the 2019 International Conference on Management of Data (SIGMOD '19). Association for Computing Machinery, New York, NY, USA, 1429–1446. DOI:https://doi.org/10.1145/3299869.3319880
