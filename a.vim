let lines = readfile(expand('template/footer.tpl'))
if exists("*strftime")
    echo g:vimwiki_timestamp_format
    if !exists('g:vimwiki_timestamp_format')
        let g:vimwiki_timestamp_format = '%Y-%m-%d %H:%M:%S'
    endif
    call map(lines, 'substitute(v:val, "%time_stamp%", "'. strftime(g:vimwiki_timestamp_format) .'", "g")')
endif
echo lines


substitute(v:val, "%time_stamp%", "'. strftime(g:vimwiki_timestamp_format) .'", "g")
