#include<bits/stdc++.h>
#define ll long long
#define endl "\n"
#define pll pair<long long,long long>
#define fi first
#define se second
#define MASK(i) (1 << (i))
#define db double
#define pii pair<int,int>
#define pxy pair<double,double>

using namespace std;
int n;
const int maxn = 16;
int dp[1 << 16][16];
int c[16][16];
const int inf = 1e9+6;

signed main(){
	#define NAME ""
	if(fopen(NAME".inp","r")){
		freopen(NAME".inp","r",stdin);
		freopen(NAME".out","w",stdout);
	}
	ios_base::sync_with_stdio(0);
	cin.tie(0);cout.tie(0);
	cin >> n;
	for(int i = 0;i<n;i++) for(int j = 0;j<n;j++) cin >> c[i][j];
	for(int mask = 0;mask < (1 << n);mask++) for(int i = 0;i<n;i++) dp[mask][i] = inf;
	for(int i = 0;i<n;i++) dp[1 << i][i] = 0;
	for(int mask = 0;mask < (1 << n);mask++){
		for(int i = 0;i<n;i++){
			if(!(mask & (1 << i))) continue;
			for(int j = 0;j<n;j++){
				if((mask >> j) & 1) continue;
				dp[mask | (1 << j)][j] = min(dp[mask | (1 << j)][j],dp[mask][i] + c[i][j]);
			}
		}
	}
	int ans = inf;
	for(int i = 0;i<n;i++) ans = min(ans,dp[(1 << n) - 1][i]);
	cout << ans;
	cerr << endl << "Time elapsed: " << 1.0 * clock() / CLOCKS_PER_SEC << " s.\n";
	return 0;
}
