/**
 * @file backtrack.cc
 *
 */

#include "backtrack.h"

Backtrack::Backtrack() {}
Backtrack::~Backtrack() {}

vector<int32_t> *cmuCount_global;
bool compare(const Vertex &lhs, const Vertex &rhs)
{
    return cmuCount_global->at(lhs) < cmuCount_global->at(rhs);
}

void Backtrack::PrintAllMatches(const Graph &data, const Graph &query, const CandidateSet &cs)
{
    //Fast I/O
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);

#ifdef DEBUG
    auto start = chrono::steady_clock::now();
#endif

    size_t queryCount = query.GetNumVertices();
    cout << "t " << queryCount << "\n";

    //Initialize Vector Size
    adj_list.resize(queryCount);
    parentCount.resize(queryCount);
    matchedParentCount.resize(queryCount);
    candidateMatchedParentCount.resize(queryCount);
    cmu.resize(queryCount);
    for (size_t i = 0; i < queryCount; ++i)
    {
        size_t candidateSize = cs.GetCandidateSize(i);
        candidateMatchedParentCount[i].resize(candidateSize);
        cmu[i].resize(candidateSize);
    }
    cmuCount.resize(queryCount);
    cmuCount_global = &cmuCount;

    //Init
    for (size_t v = 0; v < data.GetNumVertices(); v++)
    {
        visited[v] = false;
    }

    Vertex DAGRoot = -1;
    BuildDAG(query, cs, DAGRoot);

    vector<pair<Vertex, Vertex>> initialM;
    Track(data, query, cs, initialM, DAGRoot);

#ifdef DEBUG
    auto end = chrono::steady_clock::now();
    cout << "Elapsed(ms): " << chrono::duration_cast<chrono::milliseconds>(end - start).count() << endl;
#endif
}

void Backtrack::BuildDAG(const Graph &query, const CandidateSet &cs, Vertex &root)
{
    int32_t min = INT_MAX; // initialize min value
    Vertex root_vertex = -1;  // initialize root vertex

    for (size_t v = 0; v < query.GetNumVertices(); v++)
    {
        int32_t ret = cs.GetCandidateSize(v) / query.GetDegree(v); // = |C(u)| / deg(u)
        if (ret < min) //update min value and root vertex
        {
            min = ret;
            root_vertex = v;
        }
    }

    std::queue<int32_t> q; // queue for BFS
    std::set<int> check_edge; // check edge is added
    q.push(root_vertex); // push root vertex
    root = root_vertex; // pass root vertex info

    //check vertex is searched
    for (size_t v = 0; v < query.GetNumVertices(); v++)
    {
        check_vertex[v] = false;
    }

    while (!q.empty())
    {
        Vertex v = q.front();
        q.pop();
        if (check_vertex[v]) // If already search neighbor vertexes, we dont need to check this vertex
            continue;
        check_vertex[v] = true; //Mark as checked

        //Iterate all neighbors
        for (size_t offset = query.GetNeighborStartOffset(v); offset < query.GetNeighborEndOffset(v); offset++)
        {
            Vertex u = query.GetNeighbor(offset);

            //if edge is unvisited
            if (check_edge.find(u * 10000 + v) == check_edge.end())
            {
                //add edge to set
                check_edge.insert(v * 10000 + u);
                //push other vertex in queue
                q.push(u);
                adj_list[v].push_back(u);
                ++parentCount[u];
            }
        }
    }
}

void Backtrack::Track(const Graph &data, const Graph &query, const CandidateSet &cs, vector<pair<Vertex, Vertex>> M, const Vertex root)
{
    size_t MSize = M.size();
    if (MSize == adj_list.size())
    {
        size_t MSize = M.size();
        cout << "a ";
        for (size_t i = 0; i < MSize; ++i)
        {
            cout << M[i].second << " ";
        }
        cout << "\n";

#ifdef DEBUG
        Check(data, query, M);
        cout << "========================================" << endl;
#endif

        return;
    }
    else if (MSize == 0)
    {
        size_t candSize = cs.GetCandidateSize(root);
        for (size_t i = 0; i < candSize; ++i)
        {
            Vertex v = cs.GetCandidate(root, i); // v belongs to C(root)
            AddExtendable(data, cs, root, v);
            M = {{root, v}};
            visited[v] = true;
            Track(data, query, cs, M, root);
            visited[v] = false;
            RemoveExtendable(data, cs, root, v);
        }
    }
    else
    {
        if (extendable.size() == 0)
        {
            return;
        }

        auto minCmu = min_element(extendable.begin(), extendable.end(), compare);
        Vertex u = *minCmu; // u = u with minimum C_m(u)
        extendable.erase(minCmu);

        size_t candSize = cs.GetCandidateSize(u);
        for (size_t i = 0; i < candSize; ++i)
        {
            Vertex v = cs.GetCandidate(u, i); // v belongs to C(u)
            if (!visited[v])
            {
                AddExtendable(data, cs, u, v);
                if (cmu[u][i])
                {
                    vector<pair<Vertex, Vertex>> M_p = M;
                    M_p.push_back({u, v}); // Add v to the partial embedding
                    visited[v] = true;
                    Track(data, query, cs, M_p, root);
                    visited[v] = false;
                }
                RemoveExtendable(data, cs, u, v);
            }
        }
        extendable.insert(u); // Restore the previous extendable set
    }
}

// Get the next extendable set when 'added' is matched
void Backtrack::AddExtendable(const Graph &data, const CandidateSet &cs, Vertex added, Vertex candidate) // added: extended query vertex, candidate: extended candidate vertex
{
    vector<Vertex> &children = adj_list[added]; // Children adjacent to the newly added
    size_t childNum = children.size();
    for (size_t i = 0; i < childNum; ++i)
    {
        // Update DAG count
        Vertex child = children[i]; // i'th child of added
        ++matchedParentCount[child]; // child now has one more matched parent
        if (matchedParentCount[child] == parentCount[child]) // If all parents are matched
        {
            extendable.insert(child); // child now belongs to an extendable
        }

        // Update candidate count
        vector<int32_t> &childCandidatesParentCount = candidateMatchedParentCount[child]; // matched parent counts of C(child)
        size_t candidateSize = childCandidatesParentCount.size();
        for (size_t j = 0; j < candidateSize; ++j) 
        {
            Vertex childCandidate = cs.GetCandidate(child, j); // j'th candidate of C(child)
            if (data.IsNeighbor(candidate, childCandidate))
            {
                ++childCandidatesParentCount[j];
                if (childCandidatesParentCount[j] == parentCount[child])
                {
                    cmu[child][j] = true; // j'th candidate of C(child) can now be included
                    ++cmuCount[child];
                }
            }
        }
    }
}

// Remove the extendable set when 'removed' is removed
void Backtrack::RemoveExtendable(const Graph &data, const CandidateSet &cs, Vertex removed, Vertex candidate) // added: extended query vertex, candidate: extended candidate vertex
{
    vector<Vertex> &children = adj_list[removed]; // Children adjacent to the newly added
    size_t childNum = children.size();
    for (size_t i = 0; i < childNum; ++i)
    {
        // Update DAG count
        Vertex child = children[i]; // i'th child of removed
        --matchedParentCount[child];
        if (matchedParentCount[child] < parentCount[child])
        {
            extendable.erase(child);
        }

        // Update candidate count
        vector<int32_t> &childCandidatesParentCount = candidateMatchedParentCount[child]; // matched parent counts of C(child)
        size_t candidateSize = childCandidatesParentCount.size();
        for (size_t j = 0; j < candidateSize; ++j) 
        {
            Vertex childCandidate = cs.GetCandidate(child, j); // j'th candidate of C(child)
            if (data.IsNeighbor(candidate, childCandidate))
            {
                --childCandidatesParentCount[j];
                if (childCandidatesParentCount[j] < parentCount[child])
                {
                    cmu[child][j] = false; // j'th candidate of C(child) cannot be included from now on
                    if (cmuCount[child] > 0) --cmuCount[child];
                }
            }
        }
    }
}

void Backtrack::Debug(const Graph &data, const Graph &query, const CandidateSet &cs)
{
    for (size_t v = 0; v < query.GetNumVertices(); v++)
    {
        cout << "v " << v;
        for (unsigned int i = 0; i < adj_list[v].size(); i++)
        {
            cout << "->" << adj_list[v][i];
        }
        cout << "\n";
    }
}

void Backtrack::Check(const Graph &data, const Graph &query, const vector<pair<Vertex, Vertex>> &result)
{
    vector<Vertex> queryVertices;
    vector<Vertex> dataVertices;
    for (auto pr : result)
    {
        queryVertices.push_back(pr.first);
        dataVertices.push_back(pr.second);
    }

    bool correctness = true;
    for (size_t i = 0; i < queryVertices.size(); ++i)
    {
        for (size_t j = i + 1; j < queryVertices.size(); ++j)
        {
            if (query.IsNeighbor(queryVertices[i], queryVertices[j]))
            {
                correctness &= data.IsNeighbor(dataVertices[i], dataVertices[j]);
            }
        }
    }

    if (correctness)
    {
        cout << "Success" << endl;
    }
    else
    {
        cout << "Fail" << endl;
        exit(1);
    }
}
