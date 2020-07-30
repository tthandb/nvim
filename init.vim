"for f in split(glob('~/AppData/Local/nvim/configs/*.vim'), '\n')
for f in split(glob('~/.config/nvim/configs/*.vim'),'\n')
	exe 'source' f
endfor
