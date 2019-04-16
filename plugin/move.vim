" Replace() ------------------ {{{
function! Replace()
    execute(':%s/\<super\>/base/g')
    execute(':%s/\<assert\>/D.assert/g')
    execute(':%s/\<toList\>/ToList/g')
    execute(':%s/\<String\>/string/g')
    execute(':%s/\<toString\>/ToString/g')
    execute(':%s/\<extends\>/:/')
    execute(':%s/\<double\>/float/g')
    execute(':%s/\<DoubleProperty\>/FloatProperty/g')
    execute(':%s/\<math\.max\>/Mathf.Max/g')
    execute(':%s/\<math\.min\>/Mathf.Min/g')
    execute(':%s/\<math\.asin\>/Mathf.Asin/g')
    execute(':%s/\<math\.acos\>/Mathf.Acos/g')
    execute(':%s/\<math\.sqrt\>/Mathf.Sqrt/g')
    execute(':%s/\<math\.pow\>/Mathf.Pow/g')
    execute(':%s/\<math\.pi\>/Mathf.PI/g')
    execute(':%s/\<Duration\>/TimeSpan/g')
    execute(':%s/\<Map\>/Dictionary/g')
    execute(':%s/\<Future\>/Promise/g')
    execute(':%s/\<Iterable\>/IEnumerable/g')
    execute(':%s/\<static const\>/const/g')
    execute(':%s/\<float.infinity\>/float\.PositiveInfinity/g')
    execute(':%s/(\zs\ze\(debugCheckHasMaterialLocalizations\|debugCheckHasMaterial\)\>/MaterialD./g')
    execute(':%s/(\zs\zedebugCheckHasDirectionality\>/WidgetsD./g')
    execute(':%s/\<\(EdgeInsets\|Alignment\)Directional\>/\1/g')
    execute(':%s/\<centerStart\>/centerLeft/g')
    execute(':%s/\<Tween<float>/FloatTween/g')
    execute(':%s/\<Tween<Offset>/OffsetTween/g')
    execute(':%s/\<TimeSpan(milliseconds: \(\d\+\))/TimeSpan(0, 0, 0, 0, \1)/g')
    execute(':%s/\<TimeSpan(seconds: \(\d\+\))/TimeSpan(0, 0, 0, \1)/g')
    execute(':%s/^\s*\zsclass \(\a\+\)\ze\>/public class \1')
    execute(':%s/^\s*\zsfinal \(\S\+\) \(\w\+\)\ze;$/public readonly \1 \2')
    execute(':%s/^\s*\zs\<final\> \ze//')
    execute(':%s/^\s*\/\/.*$\n//')
    execute(':%s/@override\n\s*/public override /')
    execute(':%s/\(\d\+\.\d\+\)\>/\1f/g')
    execute(':%s/const _\(\w\+\)({/public _\1(')
    execute(':%s/const \(\w\+\)({/public \1(')
    execute(':%s/}) : /) : ')
    execute(':%s/\zsconst \ze\w\+\.\w\+(//')
    execute(':%s/: \zsconst\ze \w\+(/new')
    execute(':%s/\(child:\|body:\|content:\|icon:\|return\) \zs\ze\w\+\(<\w\+>\)\?(/new /')
    execute(':%s/<\(\w\+\)>\[/new List<\1>[')
    execute(':%s/\zs\[\ze[^\]]*$/{')
    execute(':%s/^[^\[]*\zs\]\ze/}')
    execute(':%s/''/"/g')
    execute(':%s/\zs,\ze\n\(\s*\)}/')
    execute(':%s/\zs,\ze\n\(\s*\))/')
    execute(':%s/\zs,\ze\n\(\s*\)\]/')
    execute(':%s/\(setState(\|onPressed: \|onTap:\)()\zs \ze{/ => /')
    execute(':%s/\S\+ createState() => \(\S\+\)();$/State createState() => new \1();/')
    execute(':%s/public \w\+(\([^)]\|\n\)*\zs}\ze);//')
    execute(':%s/public \w\+(\([^)]\|\n\)*)\zs;\ze/ {}/')
    execute(':%s/color: \zsColor\ze(/new Color/g')
    execute(':%s/= \zs\(Color\|TextStyle\)\ze(/new \1/g')
    execute(':%s/new List<\(\w\+\)>\[\([^]]*\)\]/new List<\1>{\2}/')
    execute(':%s/^\s*\(@required\)\? \zsthis\.\zechild,$/Widget /')
    execute(':%s/^\s*\(@required\)\? \zsthis\.\ze\(color\|backgroundColor\),$/Color /')
    execute(':%s/^\s*\(@required\)\? \zsthis\.\ze\(axisDirection\),$/AxisDirection /')
    execute(':%s/^\s*\(@required\)\? \zsthis\.\ze\(alignment\),$/Alignment /')
    execute(':%s/^\s*D.assert(.*)\zs,\ze$/;/')
    execute(':%s/\([:=(]\|^\s*\) \?\zs\ze\(FloatTween\|AnimationController\|ColorTween\|CurveTween\|NotificationListener\|TimeSpan\|EnumProperty\|MessageProperty\|DiagnosticsProperty\|CurvedAnimation\|LayoutId\|CustomMultiChildLayout\|InkWell\|FloatProperty\|SliverGeometry\)\(<[^>]*>\)\?(/new /g')
    execute(':%s/\([:=(]\|^\s*\) \?\zs\ze\(Offset\|Alignment\|BoxDecoration\|LinearGradient\|Container\|AppBar\|TextStyle\|Border\|BorderSide\|FloatingActionButton\|Icon\|TabController\)\(<[^>]*>\)\?(/new /g')
    execute(':%s/: (.*)\zs\ze {$/ =>')
    execute(':%s/State<\(\w\+\)> with SingleTickerProviderStateMixin/SingleTickerProviderStateMixin<\1>/')
    execute(':%s/^\s*public override \zs\w\+\ze createRenderObject(BuildContext context) {/RenderObject')
    execute(':%s/^\s*\zspublic\ze override void performLayout() {$/protected/')
    execute(':%s/^\s*\zsconst\ze \(Color\|TimeSpan\|Curve\) \w\+ = /static readonly/')
    execute(':%s/= GlobalKey<\w\+>\zs\ze()/.key')
endfunction
" }}}

function! AddUtil()
    let classname = substitute(expand('%:t:r'), '\(\<\|_\)\([a-z]\)', '\u\2', 'g') . "Utils"
    execute(':normal! gg/^\s*namespace' . "\<esc>oclass " . classname . " {\<cr>}\<esc>")
endfunction

function! ClearBraces()
    let pattern = '\(^\s*public \w\+({\n\([^)]\+\n\)*\s*})\)\|\(^\s*public \w\+(\n\([^)]\+\n\)*\s*})\)\|\(^\s*public \w\+({\n\([^)]\+\n\)*\s*)\)'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>")
        execute(":s/{//")
        execute(":normal! %")
        execute(":s/}//")
    endwhile
endfunction

function! ClearBase()
    let pattern = ':\(\s*\(D.assert(.*)\|\w\+ = \w\+\)\(,\|;\)\n\)\+\s*base(.*);$'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>/base(.*);\<cr>dt;mq?:\<cr>a \<esc>pla{\<cr>\<esc>`qs}\<esc>")
    endwhile
endfunction

function! AddBrace()
    let pattern = ':\(\s*\(D.assert(.*)\|\w\+ = \w\+\)\(,\|;\)\n\)\+$'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "/e\<cr>o}\<esc>?:\<esc>xs{\<cr>\<esc>")
    endwhile
    let pattern = 'public \w\+(\n\([^()]\+\n\)*\s*);'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "/e\<cr>s {\<cr>}\<esc>")
    endwhile
endfunction

function! PublicConstructor()
    let pattern = '^\s*class.*{\n\s*\w\+('
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>jwipublic \<esc>")
    endwhile
endfunction

function! Getters()
    let pattern = '^\s*\w\+ get \w\+ => .\+;'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>ipublic \<esc>/get\<cr>dwwxxxi{\<cr>get {\<cr>return \<esc>o}\<cr>}\<esc>")
    endwhile
    let pattern = '^\s*@override \w\+ get \w\+ => .\+;'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>wdWipublic override \<esc>/get\<cr>dwwxxxi{\<cr>get {\<cr>return \<esc>o}\<cr>}\<esc>")
    endwhile
endfunction

function! Setters()
    let pattern = '^\s*set \w\+(.\+) {$'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>wwmp#$%kmq`pdt{V$%d`qp")
    endwhile
endfunction

function! ClearRequired()
    let pattern = '@required.*\zs\<\(\w\+\)\ze,\?\n'
    execute(":normal! gg")
    let location = search(pattern)
    while location !=# 0
        execute(":normal! gg/" . pattern . "/e\<cr>")
        let word = expand("<cword>")
        let newpattern = pattern . '\(^[^()]\+\n\)*\s*).*{\n\([^{}]\+\n\)*\s*D\.assert(' . word . " != null"
        execute(":normal! gg")
        let newlocation = search(newpattern)
        if newlocation ==# location
            execute(":normal! " . location . "gg")
            execute(":s/@required //")
        else
            execute(":normal! " . location . "gg")
            execute(":s/@required /required /")
        endif
        execute(":normal! gg")
        let location = search(pattern)
    endwhile
endfunction

function! ClearComma()
    try
        execute(':%s/^\s*D\.assert(.*)\zs,\ze$/;/')
        execute(':%s/^\s*\w\+ = \w\+\zs,\ze$/;/')
    endtry
endfunction

function! ClearDoubleDots()
    let pattern = '^\s*\w\+\n\?\(\s*\.\.\w\+ = \w\+\n\?\)\+;'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>")
        let word = expand("<cword>")
        execute(":normal! dd")
        while 1
            execute(':s/\.\./' . word . "./")
            if getline(line('.'))[-1:] ==# ';'
                break
            endif
            execute(":normal! A;\<esc>j")
        endwhile
    endwhile
endfunction

function! ClearThis()
    let pattern = '^\s*public \w\+(\n\([^()]*\n\)*\s*this.\zs\w\+\ze\( = .*\)\?,\?\n\([^()]*\n\)*\s*)'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>")
        let word = expand("<cword>")
        let newpattern = '^\s*public readonly \zs\S\+\ze ' . word . ';'
        execute(":normal! gg/" . newpattern . "\<cr>")
        let type = expand("<cWORD>")
        execute(":normal! gg/" . pattern . "\<cr>")
        execute(':s/\<this\>\./' . type . " ")
    endwhile
endfunction

function! RenderObject()
    let pattern = '^\s*public override void updateRenderObject(BuildContext context, \zs_\w\+\ze renderObject) {$'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>")
        let word = expand("<cword>")
        execute(':s/\<' . word . ' renderObject/RenderObject _renderObject/')
        execute(":normal! o" . word . " renderObject = _renderObject as " . word . ";\<esc>")
    endwhile
endfunction

function! ReplaceWithBaseClass()
    let type = expand("<cword>")
    execute(":normal! mqw")
    let word = expand("<cword>")
    execute(":normal! i_\<esc>o" . type . " " . word . " = _" . word . " as " . type . ";\<esc>`q")
endfunction

function! GetHashCode()
    let pattern = '^\s*public override int \zsget\ze hashCode => .*;$'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>dwsGetH\<esc>whxxs() {\<cr>return \<esc>o}")
    endwhile
endfunction

function! ClearConcatString()
    let pattern = '"[^"]*"\n\s*"[^"]*"'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>A +\<esc>")
    endwhile
endfunction

function! Move()
    call ClearBase()
    call PublicConstructor()
    call ClearBraces()
    call Getters()
    call Setters()
    call AddBrace()
    call ClearRequired()
    call ClearComma()
    call ClearDoubleDots()
    call ClearThis()
    call GetHashCode()
    call ClearConcatString()
endfunction

nnoremap <leader>move :call Move()<cr>
nnoremap <leader>o :call ReplaceWithBaseClass()<cr>
nnoremap <leader>r :call Replace()<cr>
nnoremap <leader>a :call AddUtil()<cr>
