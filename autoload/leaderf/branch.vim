""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    https://github.com/linjiX/nvim                                "
"     _  _          _  _ __  __    __             _                "
"    | |(_) _ __   (_)(_)\ \/ /   / /_ __ __   __(_) _ __ ___      "
"    | || || '_ \  | || | \  /   / /| '_ \\ \ / /| || '_ ` _ \     "
"    | || || | | | | || | /  \  / / | | | |\ V / | || | | | | |    "
"    |_||_||_| |_|_/ ||_|/_/\_\/_/  |_| |_| \_/  |_||_| |_| |_|    "
"                |__/                                              "
"                                                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let leaderf#branch#hightlight_def = {
            \   'Lf_hl_match3': '^\* \w\+',
            \   'Lf_hl_match4': '^\* \w\+\s\+\zs\w\+\ze',
            \}

function leaderf#branch#Command(args) abort
    let l:arguments = filter(keys(a:args), 'v:val =~# "^-"')
    let l:cmd = 'git branch ' . join(l:arguments, ' ')
    return leaderf#utility#Command(l:cmd)
endfunction

function leaderf#branch#Accept(line, args) abort
    let l:branch = matchstr(a:line, '^\S\+', 2)
    echo system('git switch ' . l:branch)
endfunction

function s:Preview(line)
    let l:branch = matchstr(a:line, '^\S\+', 2)
    return leaderf#commit#CommitPreview(l:branch)
endfunction

function leaderf#branch#Preview(orig_bufnr, orig_cursor, line, args) abort
    return leaderf#utility#Wrap(function('s:Preview'), a:line)
endfunction
