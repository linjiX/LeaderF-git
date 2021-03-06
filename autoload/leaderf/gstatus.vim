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

function s:ParserLine(line) abort
    if get(g:, 'Lf_ShowDevIcons', 1)
        let s:offset = 10
    else
        let s:offset = 3
    endif
    return a:line[s:offset :]
endfunction

function s:ParserStatus(line) abort
    return a:line[1]
endfunction

function leaderf#gstatus#Command(args) abort
    let l:keys = filter(keys(a:args), 'v:val =~# "^-"')
    let l:arguments = map(l:keys, 'empty(a:args[v:val]) ? v:val : v:val ."=". a:args[v:val][0]')
    let l:cmd = 'git status -s --untracked-files=no ' . join(l:arguments, ' ')
    return leaderf#utility#Command(l:cmd)
endfunction

function leaderf#gstatus#FormatLine(line, args) abort
    if !get(g:, 'Lf_ShowDevIcons', 1)
        return a:line
    endif
    let l:offset = 3
    let l:file = a:line[l:offset :]
    let l:devicon = leaderf#gfile#GetDevIcon(l:file)
    return a:line[: l:offset - 1] . '  ' . l:devicon . l:file
endfunction

function s:Accept(line) abort
    let l:file = s:ParserLine(a:line)
    execute 'edit ' . l:file
endfunction

function leaderf#gstatus#Accept(line, args) abort
    call leaderf#utility#Wrap(function('s:Accept'), a:line)
endfunction

function s:Preview(line) abort
    let l:file = s:ParserLine(a:line)
    let l:status = s:ParserStatus(a:line)
    if l:status ==# '?'
        let l:bufname = l:file
    else
        let l:bufname = tempname()
        let l:cmds = ['git diff', l:file, '>', l:bufname]
        call system(join(l:cmds, ' '))
    endif
    let l:bufnr = bufadd(l:bufname)
    return [l:bufnr, 0, '']
endfunction

function leaderf#gstatus#Preview(orig_bufnr, orig_cursor, line, args) abort
    return leaderf#utility#Wrap(function('s:Preview'), a:line)
endfunction

function leaderf#gstatus#GetDigest(line, mode) abort
    let l:file = s:ParserLine(a:line)
    return leaderf#gfile#GetDigestInternal(l:file, s:offset, a:mode)
endfunction
