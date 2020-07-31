let g:python3_host_prog='/home/haojiedong/tools/anaconda3/bin/python'
for f in split(glob('~/.config/nvim/configs/*.vim'),'\n')
	exe 'source' f
endfor
