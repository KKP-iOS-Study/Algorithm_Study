//
//  boj14500.cpp
//  Algorithms
//
//  Created by hoseung Lee on 2022/01/12.
//

#include "boj14500.hpp"
#include <iostream>
using namespace std;
int map[505][505] = { 0 };
int max(int a, int b) {
  return a > b ? a : b; }
int Check(int cur_x, int cur_y) {
  int max_value = 0;
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x][cur_y + 1] + map[cur_x][cur_y + 2] + map[cur_x][cur_y + 3]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x + 1][cur_y] + map[cur_x + 2][cur_y] + map[cur_x + 3][cur_y]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x + 1][cur_y] + map[cur_x][cur_y + 1] + map[cur_x + 1][cur_y + 1]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x + 1][cur_y] + map[cur_x][cur_y + 1] + map[cur_x][cur_y + 2]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x][cur_y + 1] + map[cur_x][cur_y + 2] + map[cur_x - 1][cur_y + 2]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x + 1][cur_y] + map[cur_x + 2][cur_y] + map[cur_x + 2][cur_y + 1]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x][cur_y + 1] + map[cur_x + 1][cur_y + 1] + map[cur_x + 2][cur_y + 1]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x][cur_y + 1] + map[cur_x][cur_y + 2] + map[cur_x + 1][cur_y + 2]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x + 1][cur_y] + map[cur_x + 2][cur_y] + map[cur_x + 2][cur_y - 1]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x + 1][cur_y] + map[cur_x + 1][cur_y + 1] + map[cur_x + 1][cur_y + 2]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x][cur_y + 1] + map[cur_x + 1][cur_y] + map[cur_x + 2][cur_y]);
  
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x][cur_y + 1] + map[cur_x + 1][cur_y] + map[cur_x + 1][cur_y - 1]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x + 1][cur_y] + map[cur_x + 1][cur_y + 1] + map[cur_x + 2][cur_y + 1]);
  
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x][cur_y + 1] + map[cur_x + 1][cur_y + 1] + map[cur_x + 1][cur_y + 2]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x + 1][cur_y] + map[cur_x + 1][cur_y - 1] + map[cur_x + 2][cur_y - 1]);
  
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x - 1][cur_y] + map[cur_x][cur_y - 1] + map[cur_x][cur_y + 1]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x - 1][cur_y] + map[cur_x + 1][cur_y] + map[cur_x][cur_y + 1]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x][cur_y + 1] + map[cur_x][cur_y - 1] + map[cur_x + 1][cur_y]);
  max_value = max(max_value, map[cur_x][cur_y] + map[cur_x - 1][cur_y] + map[cur_x + 1][cur_y] + map[cur_x][cur_y - 1]);
  return max_value; }
int main() {
  int N, M;
  int Answer = 0;
  cin >> N >> M;
  for (int i = 1; i <= N; i++)
    for (int j = 1; j <= M; j++)
      cin >> map[i][j];
  for (int i = 1; i <= N; i++)
    for (int j = 1; j <= M; j++)
      Answer = max(Answer, Check(i, j));
  cout << Answer << endl;
  return 0;
}
