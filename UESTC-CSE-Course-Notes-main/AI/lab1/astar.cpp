#include <bits/stdc++.h>
#define pr pair<int,int>
#define LL unsigned long long

using namespace std;
#define N 3//N*N网格
vector<int> deconvert(LL state) {// 将状态压缩值(64位无符号整型)转换为数字数组
    vector<int>v;
    for (int i = 0; i < N * N; i++) {
        v.push_back(state % (N * N));
        state /= N * N;
    }
    return v;
}
LL convert(vector<int>v) {//将数字数组转换为状态压缩值

    LL ans = 0;
    for (int i = N * N - 1; i >= 0; i--) {
        ans = ans * N * N + v[i];
    }
    return ans;
}
void print(LL state) {
    vector<int>v = deconvert(state);
    for (int i = 0; i < N * N; i++) {
        printf("%d%c", v[i], i % N == N - 1 ? '\n' : ' ');
    }
}

LL read() {//读入9个数字并返回其状态的压缩值
    vector<int>v(N * N);
    for (auto& x : v)scanf("%d", &x);
    return convert(v);
}
int fx[] = { 1,-1,0,0 };//四个方向在网格上的位移(右,左,上,下)
int fy[] = { 0,0,1,-1 };
vector<LL>getnextstate(LL state) {//获取当前状态能够转移到的下一个状态
    auto v = deconvert(state);
    vector<LL>ans;
    for (int i = 0; i < N * N; i++) {
        if (v[i] == 0) {
            int x = i / N, y = i % N;//获取当前状态在3x3网格上的位置
            for (int k = 0; k < 4; k++) {
                int nx = x + fx[k];//获取在4个方向上的下一步位置
                int ny = y + fy[k];
                if (nx >= 0 && nx < N && ny >= 0 && ny < N) {//如果下一步位置没有越界
                    swap(v[i], v[nx * N + ny]);//交换相应值
                    ans.push_back(convert(v));//将当前状态的压缩值加入结果
                    swap(v[i], v[nx * N + ny]);//恢复
                }
            }
            break;
        }
    }
    return ans;

}
int target[N * N];//target[i]表示数字i应去的位置
int getval(vector<int>v) {//估值函数
    int ans = 0;
    for (int i = 0; i < N * N; i++) {
        int x = target[v[i]];
        ans += abs(x % N - i % N) + abs(x / N - i / N);
        //ans += (i != x);
    }

    return ans;
}
map<LL, pair<int, LL>>pre;//{state,{h(s)+g(s),prestate}},储存状态的价值和前驱
set<LL>use;//close_list
void init(vector<int>v) {//初始化目标状态
    for (int i = 0; i < N * N; i++) {
        target[v[i]] = i;
    }

}
void solve() {
    LL fans = 0;

    auto s = deconvert(read());//读取初始状态
    init(deconvert(read()));
    priority_queue<pair<int, LL>> q;
    if (getval(s) == 0) {//如果初始状态估值为0, 表示到达目标状态
        fans = convert(s);
        printf("input is final\n");
    }
    q.push({ -getval(s),convert(s) });//将初始状态加入open_list
    while ((!q.empty()) && (!fans)) {//如果优先队列不为空且未找到答案
        int val = -q.top().first;//当前最优价值
        auto ns = q.top().second;//当前状态的压缩值
        q.pop();
        if (use.find(ns) != use.end()) {//如果此状态已在close_list中,跳过
            continue;
        }
        use.insert(ns);//加入close_list
        for (auto x : getnextstate(ns)) {
            if (use.find(x) != use.end())continue; //如果此状态已在close_list中,跳过
            int gvx = getval(deconvert(x));//获取此状态的g
            int nv = val - getval(deconvert(ns)) + gvx + 1;//计算估值函数f
            if (pre.find(x) == pre.end() || (*pre.find(x)).second.first > nv) {//如果此状态无前驱或上一次转移时估值函数不优,覆盖转移
                q.push({ -nv,x });//加入open_list
                pre[x] = { nv,ns };//记录前驱
            }
            if (gvx == 0) {//如果g为0,已到达终点,记录答案
                fans = x;
                break;
            }
        }
    }
    if (!fans) {//未找到终点
        printf("ans not found\n");
        return;
    }
    else {
        printf("ans found: \n");
    }
    vector<LL>ans;
    ans.push_back(fans);
    while (pre.find(fans) != pre.end()) {//根据前驱找到转移路径
        fans = pre[fans].second;
        ans.push_back(fans);
        //print(fans);
    }
    for (int i = ans.size() - 1; i >= 0; i--) {//输出转移路径
        print(ans[i]);
        printf("___step %d____\n", ans.size() - i);
    }
}
int main() {

    solve();

}
