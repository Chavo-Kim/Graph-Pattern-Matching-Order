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
using namespace std;

class Backtrack {
 public:
    Backtrack();
    ~Backtrack();

   void PrintAllMatches(const Graph &data, const Graph &query,
                     const CandidateSet &cs);

   void BuildDAG(const Graph &query, const CandidateSet &cs, Vertex &root);
   void Track(const Graph &data, const CandidateSet &cs, vector<pair<Vertex, Vertex>> M, const Vertex root);
   void UpdateExtendable(const Graph &data, const CandidateSet &cs, Vertex added, Vertex candidate);
   void Debug(const Graph &data, const Graph &query,
            const CandidateSet &cs);

 private:
   vector<vector<Vertex>> adj_list;
   bool check_vertex[10001];

   vector<int32_t> parentCount; // Stores the number of parents of each vertex
   vector<int32_t> matchedParentCount; // Tracks the number of parents matched

   vector<vector<int32_t>> candidateMatchedParentCount;
   vector<vector<bool>> availableCandidates;
   vector<int32_t> cmuCount;

   set<Vertex> extendable;
   vector<bool> visited;
};

#endif  // BACKTRACK_H_
