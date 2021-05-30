/**
 * @file backtrack.cc
 *
 */

#include "backtrack.h"

Backtrack::Backtrack() {}
Backtrack::~Backtrack() {}

void Backtrack::PrintAllMatches(const Graph &data, const Graph &query,
                                const CandidateSet &cs) {
  std::cout << "t " << query.GetNumVertices() << "\n";

  adj_list.resize(query.GetNumVertices());

  // implement your code here.
  BuildDAG(query, cs);

  Debug(data, query, cs);
}

void Backtrack::BuildDAG(const Graph &query, const CandidateSet &cs) {
    int32_t min = INT_MAX;
    Vertex root_vertex = -1;

    for(Vertex v = 0; v < query.GetNumVertices(); v++) {
        int32_t ret = cs.GetCandidateSize(v) / query.GetDegree(v);
        if(ret < min){
            min = ret;
            root_vertex = v;
        }
    }

    std::queue<int32_t> q;
    std::set<int> check_edge;
    q.push(root_vertex);

    //Init
    for(Vertex v = 0; v < query.GetNumVertices(); v++){
        check_vertex[v] = false;
    }

    while(!q.empty()){
        Vertex v = q.front();
        q.pop();
        if(check_vertex[v])
            continue;
        check_vertex[v] = true;

        for(size_t offset = query.GetNeighborStartOffset(v); offset < query.GetNeighborEndOffset(v); offset++){
            Vertex u = query.GetNeighbor(offset);

            if(check_edge.find(u * 10000 + v) == check_edge.end()){
                check_edge.insert(v * 10000 + u);
                q.push(u);
                adj_list[v].push_back(u);
            }
        }
    }
}

void Backtrack::Debug(const Graph &data, const Graph &query,
                      const CandidateSet &cs) {
    for(Vertex v = 0; v < query.GetNumVertices(); v++){
        std::cout << "v " << v;
        for(unsigned int i = 0 ; i < adj_list[v].size(); i++){
            std::cout  << "->" << adj_list[v][i];
        }
        std::cout << "\n";
    }
}
