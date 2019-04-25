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
    execute(':%s/\<Set\>/HashSet/g')
    execute(':%s/\<Future\>/Promise/g')
    execute(':%s/\<Iterable\>/IEnumerable/g')
    execute(':%s/\<EdgeInsetsGeometry\>/EdgeInsets/g')
    execute(':%s/\<static const\>/const/g')
    execute(':%s/\<ValueKey<\w\+>\zs\ze(/.key/g')
    execute(':%s/\<TextAlign.start\>/TextAlign.left/g')
    execute(':%s/((\w\+ \w\+)\zs\ze { =>/g')
    execute(':%s/\<float.infinity\>/float\.PositiveInfinity/g')
    execute(':%s/(\zs\ze\(debugCheckHasMaterialLocalizations\|debugCheckHasMaterial\)\>/MaterialD./g')
    execute(':%s/\.isNotEmpty\zs\ze)/()/g')
    execute(':%s/\.isEmpty\zs\ze)/()/g')
    execute(':%s/\.isFinite\zs\ze)/()/g')
    execute(':%s/\.\<Keys\.Contains\>/.ContainsKey/g')
    execute(':%s/\.\<Values\.Contains\>/.ContainsValue/g')
    execute(':%s/\.\zssubstring\ze(/Substring/g')
    execute(':%s/\.\zscontainsKey\ze(/ContainsKey/g')
    execute(':%s/\.\zscontains\ze(/Contains/g')
    execute(':%s/\.\zsadd\ze(/Add/g')
    execute(':%s/\.\zsremove\ze(/Remove/g')
    execute(':%s/\.\zstoUpperCase\ze()/ToUpper/g')
    execute(':%s/(\zs\zedebugCheckHasDirectionality\>/WidgetsD./g')
    execute(':%s/\<\(EdgeInsets\|Alignment\)Directional\>/\1/g')
    execute(':%s/\<centerStart\>/centerLeft/g')
    execute(':%s/\<inMilliseconds\>/Milliseconds/g')
    execute(':%s/\<Tween<float>/FloatTween/g')
    execute(':%s/\<Tween<Offset>/OffsetTween/g')
    execute(':%s/\<TimeSpan(milliseconds: \(\d\+\))/TimeSpan(0, 0, 0, 0, \1)/g')
    execute(':%s/\<TimeSpan(seconds: \(\d\+\))/TimeSpan(0, 0, 0, \1)/g')
    execute(':%s/^\s*\zsclass \(\a\+\)\ze\>/public class \1')
    execute(':%s/^\s*\zs\zeabstract class \a\+\>/public ')
    execute(':%s/@override\n\s*/public override /')
    execute(':%s/^\s*\zsfinal \(\S\+\) \(\w\+\)\ze;$/public readonly \1 \2')
    execute(':%s/^\s*\zs\<final\> \ze//')
    execute(':%s/^\s*\<public override\zs final\ze\>//')
    execute(':%s/^\s*\/\/.*$\n//')
    execute(':%s/\(\d\+\.\d\+\)\>/\1f/g')
    execute(':%s/const _\(\w\+\)({/public _\1(')
    execute(':%s/const \(\w\+\)({/public \1(')
    execute(':%s/}) : /) : ')
    execute(':%s/\zsconst \ze\w\+\.\w\+(//')
    execute(':%s/: \zsconst\ze \w\+(/new')
    execute(':%s/\(child:\|body:\|content:\|icon:\|return\) \zs\ze_\?[A-Z]\w*\(<\w\+>\)\?(/new /')
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
    execute(':%s/\([:=(]\|^\s*\) \?\zs\ze\(Wrap\|Text\|ShapeDecoration\|DefaultTextStyle\|AnimatedSwitcher\|Center\|DecorationImage\|BoxConstraints\)\(<[^>]*>\)\?(/new /g')
    execute(':%s/: (.*)\zs\ze {$/ =>')
    execute(':%s/State<\(\w\+\)> with SingleTickerProviderStateMixin/SingleTickerProviderStateMixin<\1>/')
    execute(':%s/^\s*public override \zs\w\+\ze createRenderObject(BuildContext context) {/RenderObject')
    execute(':%s/^\s*\zspublic\ze override void performLayout() {$/protected/')
    execute(':%s/^\s*\zsconst\ze \(Color\|TimeSpan\|Icon\|Curve\|Dictionary<[a-zA-Z_<>]\+,\s*[a-zA-Z_<>]\+>\|Set<[a-zA-Z_<>]*>\|List<[a-zA-Z_<>]*>\) \w\+ = /static readonly/')
    execute(':%s/= GlobalKey<\w\+>\zs\ze()/.key')
    execute(':%s/= \zs\ze<[a-zA-Z_<>]\+, [a-zA-Z_<>]\+>\s*{/new Dictionary')
    execute(':%s/^\s*[a-zA-Z_<>]\+ \zsget \(\w\+\);\ze$/\1 { get; }')
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
    let pattern = 'public \w\+(\n\([^:;{}]\+\n\)*\s*);'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "/e\<cr>s {\<cr>}\<esc>")
    endwhile
    let pattern = ') : base(.*);$'
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
        execute(":normal! gg/" . pattern . "\<cr>ipublic \<esc>/" . '\<get' . "\<cr>dwwxxxi{\<cr>get {\<cr>return \<esc>o}\<cr>}\<esc>")
    endwhile
    let pattern = '^\s*@override \w\+ get \w\+ => .\+;'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>wdWipublic override \<esc>/get\<cr>dwwxxxi{\<cr>get {\<cr>return \<esc>o}\<cr>}\<esc>")
    endwhile
    let pattern = '^\s*\S\+ \zsget \w\+ {'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>dwf{%mq%oget {\<cr>\<esc>`qO}\<esc>")
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
        let newpattern = pattern . '\(^[^:;{}]\+\n\)*\s*).*{\n\([^{}]\+\n\)*\s*D\.assert(' . word . " != null"
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
    let pattern = '^\s*\w\+\n\?\(\s*\.\.\w\+ = [0-9a-zA-Z_.(),]\+\n\?\)\+;'
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
    let pattern = '^\s*public \w\+(\n\([^:;{}]*\n\)*\s*this.\zs\w\+\ze\( = .*\)\?,\?\n\([^:;{}]*\n\)*\s*)'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>")
        let word = expand("<cword>")
        let newpattern = '^\s*public \(readonly \)\?\zs\S\+\ze ' . word . ';'
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

function! AddSet()
    let pattern = '[:=]\s*\zs\ze<[a-zA-Z_<>]\+>\s*{'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>inew HashSet(new List\<esc>wvf{F>yf{%a)\<esc>%P")
    endwhile
endfunction

function! CorrectDictionaryPair()
    execute(':s/:/,')
    execute(":normal! 0wi{\<esc>$")
    let c = matchstr(getline('.'), '\%'.col('.').'c.')
    if c ==# ','
        execute(":normal! i}\<esc>")
    else
        execute(":normal! a}\<esc>")
    endif
endfunction

function! AddNull()
    execute(':normal! $')
    let c = matchstr(getline('.'), '\%'.col('.').'c.')
    if c ==# ','
        execute(":normal! i = null\<esc>")
    else
        execute(":normal! a = null\<esc>")
    endif
endfunction

function! DeleteParensisPair()
    execute(":normal! hf(bdwmq%x`qx")
endfunction

function! ToGet()
    execute(":normal! $b")
    let word = expand('<cword>')
    let line = getline('.')
    execute(":normal! yy$s {\<cr>get { return this._" . word . "; }\<cr>}\<cr>" . line . "\<esc>")
    execute(':s/\<' . word . '\>/_' . word . '/')
    execute(':s/public //')
endfunction

function! Initialize()
    execute(":normal! g'<yg'>/}\<cr>kpV/}\<cr>k\<esc>")
    execute(":'<,'>" . 's/^\s*\zs\S\+\s\+\(\w\+\)\s*=.*\ze/this.\1 = \1;')
endfunction

function! ClearInitializer()
    execute(":normal! yymp/}\<cr>kp")
    execute(':s/^\s*\zs\S\+\s\+\(\w\+\)\s*=\s*\(.*[^,]\),\?\ze/this.\1 = \1 ?? \2;')
    execute("normal! `p$")
    let c = matchstr(getline('.'), '\%'.col('.').'c.')
    if c ==# ','
        execute("normal! dT=i null")
    else
        execute("normal! F=lDa null")
    endif
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
    call AddSet()
endfunction

nnoremap <leader>move :call Move()<cr>
nnoremap <leader>o :call ReplaceWithBaseClass()<cr>
nnoremap <leader>r :call Replace()<cr>
nnoremap <leader>a :call AddUtil()<cr>
nnoremap <leader>d :call CorrectDictionaryPair()<cr>
nnoremap <leader>n :call AddNull()<cr>
nnoremap <leader>p :call DeleteParensisPair()<cr>
nnoremap <leader>g :call ToGet()<cr>
nnoremap <leader>i :call Initialize()<cr>
nnoremap <leader>ci :call ClearInitializer()<cr>
