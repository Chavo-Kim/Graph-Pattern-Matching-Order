/**
 * @file backtrack.h
 *
 */

#ifndef BACKTRACK_H_
#define BACKTRACK_H_

#include "candidate_set.h"
#include "common.h"
#include "graph.h"
#include "limits.h"
#include <queue>
#include <vector>
#include <set>
#include <chrono>
#include <functional>
using namespace std;

#define MAX_CNT 100000

bool compare(const Vertex &lhs, const Vertex &rhs);

class Backtrack {
 public:
    Backtrack();
    ~Backtrack();

   void PrintAllMatches(const Graph &data, const Graph &query,
                     const CandidateSet &cs);

   void BuildDAG(const Graph &query, const CandidateSet &cs, Vertex &root);
   void Track(const Graph &data, const Graph &query, const CandidateSet &cs, vector<pair<Vertex, Vertex>> M, const Vertex root);
   void AddExtendable(const Graph &data, const CandidateSet &cs, Vertex added, Vertex candidate);
   void RemoveExtendable(const Graph &data, const CandidateSet &cs, Vertex added, Vertex candidate);
   bool CompareCmuCount(const Vertex &lhs, const Vertex &rhs);
   void Debug(const Graph &data, const Graph &query, const CandidateSet &cs);
   int Check(const Graph &data, const Graph &query, const vector<pair<Vertex, Vertex>> &result);

 private:
   vector<vector<Vertex>> adj_list;
   bool check_vertex[10001];
   int subgraphCnt;

   vector<int32_t> parentCount; // Stores the number of parents of each vertex
   vector<int32_t> matchedParentCount; // Tracks the number of parents matched

   vector<vector<int32_t>> candidateMatchedParentCount;
   vector<vector<bool>> cmu;
   vector<int32_t> cmuCount;
   set<Vertex> extendable;
    bool visited[10001];
};

#endif  // BACKTRACK_H_
