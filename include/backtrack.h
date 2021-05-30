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

class Backtrack {
 public:
  Backtrack();
  ~Backtrack();

  void PrintAllMatches(const Graph &data, const Graph &query,
                       const CandidateSet &cs);

  void BuildDAG(const Graph &query, const CandidateSet &cs);

  void Track(const Graph &query, const CandidateSet &cs);

  void GetNext(const CandidateSet &cs, size_t curr);

  void Debug(const Graph &data, const Graph &query,
             const CandidateSet &cs);

 private:
    std::vector<std::vector<Vertex>> adj_list;
    bool check_vertex[10001];
};

#endif  // BACKTRACK_H_
