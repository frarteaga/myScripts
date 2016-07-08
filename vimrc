set sw=4
set ts=4

set number
set smartindent

set incsearch

set mouse=n

ab usi using namespace std;
ab re return
ab #i #include <bits/stdc++.h>
ab ty typedef long long LL;
ab co cout <<
ab ci cin >>
ab ass assert
ab pb push_back

ab ios ios_base::sync_with_stdio(0); cin.tie(0);
ab fre freopen("", "r", stdin);

map <F2> :s/^/\/\/<Enter>
map <F3> :s/^\/\///<Enter>
map	<F4> :%s/\s\+$//<Enter>

autocmd filetype cpp nnoremap <F6> :w <bar> exec '!g++ -g -Wall -std=c++0x '.shellescape('%').' && ./a.out' <CR>
autocmd filetype cpp nnoremap <F7> :w <bar> exec '!g++ -g -Wall -std=c++0x '.shellescape('%').' && ./a.out < d.in' <CR>
