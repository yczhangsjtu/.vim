function! ExpandStatefulWidget()
    let widgetname = expand("<cword>")
    let statename = "_" . widgetname . "State"
    execute(":normal! ciwpublic class " . widgetname . " : StatefulWidget {\<cr>"
    \ ."public override State createState() {\<cr>"
    \ ."return new " . statename . "();\<cr>"
    \ ."}\<cr>"
    \ ."}\<cr>\<cr>"
    \ ."class " . statename . " : State<" . widgetname . "> {\<cr>"
    \ ."public override Widget build(BuildContext context) {\<cr>"
    \ ."return new Container();\<cr>"
    \ ."}\<cr>"
    \ ."}\<esc>")
endfunction

nnoremap <leader>ust :call ExpandStatefulWidget()
