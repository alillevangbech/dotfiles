" Plugins

" ALE
let g:ale_linters = { 'cs' : ['OmniSharp'] }
let g:ale_sign_column_always = 1
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" OmniSharp
let g:omnicomplete_fetch_full_documentation = 1
let g:OmniSharp_autoselect_existing_sln = 1
let g:OmniSharp_popup_position = 'peek'
let g:OmniSharp_highlighting = 3
let g:OmniSharp_diagnostic_exclude_paths = [ 'Temp[/\\]', 'obj[/\\]', '\.nuget[/\\]' ]
let g:OmniSharp_fzf_options = { 'down': '10' }

nmap gd <Plug>(omnisharp_go_to_definition)
nmap gi <Plug>(omnisharp_find_implementations)
nmap gr <Plug>(omnisharp_find_usages)
nmap ga <Plug>(omnisharp_code_actions)

"autocmd BufWritePre *.cs :OmniSharpCodeFormat
