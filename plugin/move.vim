" Patterns --------------- {{{
let s:typenamePattern = '[0-9a-zA-Z_<>,]\+'
let s:assignmentPattern = '= [0-9a-zA-Z_.(),]\+'
let s:functionParamDeclPattern = '\(' . s:typenamePattern . ' \|this.\)\w\+'
let s:functionParamPattern = s:functionParamDeclPattern . '\( ' . s:assignmentPattern . '\)\?'
let s:functionParamListPattern = '\(\(\s*' . s:functionParamPattern . ',\n\?\)*\(\s*' . s:functionParamPattern . '\n\?\)\)\?'
let s:functionModifierPattern = '\(public \|private \|protected \|static \|override \)*'
let s:functionHeaderPattern = '^\s*' . s:functionModifierPattern . s:typenamePattern . '\s\+\w\+(\n\?' . s:functionParamListPattern . '\s*)\s*{'
let s:functionHeaderWithOpenBrace = '^\s*' . s:functionModifierPattern . s:typenamePattern . '\s\+\w\+(\zs{\ze\n\?' . s:functionParamListPattern . '\s*}\?)\s*{'
let s:functionHeaderWithCloseBrace = '^\s*' . s:functionModifierPattern . s:typenamePattern . '\s\+\w\+({\?\n\?' . s:functionParamListPattern . '\s*\zs}\ze)\s*{'
let s:constructorHeaderWithOpenBrace = '^\s*' . s:functionModifierPattern . '\s*\w\+(\zs{\ze\n\?' . s:functionParamListPattern . '\s*}\?)\s*\(:\s*base(.*)\s*\)\?{'
let s:constructorHeaderWithCloseBrace = '^\s*' . s:functionModifierPattern . '\s*\w\+({\?\n\?' . s:functionParamListPattern . '\s*\zs}\ze)\s*\(:\s*base(.*)\s*\)\?{'
" }}}

" Replace() ------------------ {{{
function! Replace()
    execute(':silent! %s/\<super\>/base/g')
    execute(':silent! %s/[^.]\zs\<assert\>\ze/D.assert/g')
    execute(':silent! %s/\<toList\>/ToList/g')
    execute(':silent! %s/\<String\>/string/g')
    execute(':silent! %s/\<toString\>/ToString/g')
    execute(':silent! %s/\<toStringAsFixed(1)/ToString("0.0")/g')
    execute(':silent! %s/\<toStringAsFixed(2)/ToString("0.00")/g')
    execute(':silent! %s/\<extends\>/:/')
    execute(':silent! %s/\<checked\>/isChecked/')
    execute(':silent! %s/\<double\>/float/g')
    execute(':silent! %s/\<DoubleProperty\>/FloatProperty/g')
    execute(':silent! %s/\<lerpDouble\>/MathUtils.lerpFloat/g')
    execute(':silent! %s/\<Matrix4\>/Matrix3/g')
    execute(':silent! %s/\<math\.max\>/Mathf.Max/g')
    execute(':silent! %s/\<math\.min\>/Mathf.Min/g')
    execute(':silent! %s/\<math\.asin\>/Mathf.Asin/g')
    execute(':silent! %s/\<math\.acos\>/Mathf.Acos/g')
    execute(':silent! %s/\<math\.sqrt\>/Mathf.Sqrt/g')
    execute(':silent! %s/\<math\.pow\>/Mathf.Pow/g')
    execute(':silent! %s/\<math\.pi\>/Mathf.PI/g')
    execute(':silent! %s/\<Duration\>/TimeSpan/g')
    execute(':silent! %s/\<Map\>/Dictionary/g')
    execute(':silent! %s/\<Set\>/HashSet/g')
    execute(':silent! %s/\<Future\>/Promise/g')
    execute(':silent! %s/\<Iterable\>/IEnumerable/g')
    execute(':silent! %s/\<EdgeInsetsGeometry\>/EdgeInsets/g')
    execute(':silent! %s/\<static const\>/const/g')
    execute(':silent! %s/^\s*@immutable\s*$\n//')
    execute(':silent! %s/^\s*typedef \(\w\+\) = \(' . s:typenamePattern . '\) Function\ze(/public delegate \2 \1/')
    execute(':silent! %s/\<TextAlign.start\>/TextAlign.left/g')
    execute(':silent! %s/\([(:=]\|^\s*\)\s*(\w\+ \w\+\(\s*,\s*\w\+ \w\+\)*)\zs\ze {/ =>/g')
    execute(':silent! %s/\<float.infinity\>/float\.PositiveInfinity/g')
    execute(':silent! %s/([^.]\zs\ze\(debugCheckHasMaterialLocalizations\|debugCheckHasMaterial\)\>/MaterialD./g')
    execute(':silent! %s/\.isNotEmpty\zs\ze[^(])/()/g')
    execute(':silent! %s/\.isEmpty\zs\ze[^(])/()/g')
    execute(':silent! %s/\.isFinite\zs\ze[^(])/()/g')
    execute(':silent! %s/\.\<Keys\.Contains\>/.ContainsKey/g')
    execute(':silent! %s/\.\<Values\.Contains\>/.ContainsValue/g')
    execute(':silent! %s/\.\zscontainsKey\ze(/ContainsKey/g')
    execute(':silent! %s/\<runtimeType\>/GetType()/g')
    execute(':silent! %s/\.\zssubstring\ze(/Substring/g')
    execute(':silent! %s/\.\zscontains\ze(/Contains/g')
    execute(':silent! %s/\(properties\|description\)\@<!\.\zsadd\ze(/Add/g')
    execute(':silent! %s/\.\zsremove\ze(/Remove/g')
    execute(':silent! %s/\.\zsaddAll\ze(/AddRange/g')
    execute(':silent! %s/\.\zsany\ze(/Any/g')
    execute(':silent! %s/\.\zstoUpperCase\ze()/ToUpper/g')
    execute(':silent! %s/([^.]\zs\zedebugCheckHasDirectionality\>/WidgetsD./g')
    execute(':silent! %s/\<\(EdgeInsets\|Alignment\)Directional\>/\1/g')
    execute(':silent! %s/\<centerStart\>/centerLeft/g')
    execute(':silent! %s/\<inMilliseconds\>/Milliseconds/g')
    execute(':silent! %s/\<Tween<float>/FloatTween/g')
    execute(':silent! %s/\<Tween<Offset>/OffsetTween/g')
    execute(':silent! %s/\<TimeSpan(milliseconds: \(\d\+\))/TimeSpan(0, 0, 0, 0, \1)/g')
    execute(':silent! %s/\<TimeSpan(seconds: \(\d\+\))/TimeSpan(0, 0, 0, \1)/g')
    execute(':silent! %s/^\s*\zsclass \(\a\+\)\ze\>/public class \1')
    execute(':silent! %s/^\s*\zs\zeabstract class \a\+\>/public ')
    execute(':silent! %s/@override\n\s*/public override /')
    execute(':silent! %s/^\s*\zsstatic final\ze/public static')
    execute(':silent! %s/^\s*\zsfinal \(\S\+\) \(\w\+\)\ze;$/public readonly \1 \2')
    execute(':silent! %s/^\s*\zs\<final\> \ze//')
    execute(':silent! %s/^\s*\<public override\zs final\ze\>//')
    execute(':silent! %s/^\s*\/\/.*$\n//')
    execute(':silent! %s/\(\d\+\.\d\+\)\>\ze[^"]/\1f/g')
    execute(':silent! %s/const \(\w\+\)({/public \1(')
    execute(':silent! %s/}) : /) : ')
    execute(':silent! %s/\zsconst \ze\w\+\.\w\+(//')
    execute(':silent! %s/: \zsconst\ze \w\+(/new')
    execute(':silent! %s/\(child:\|body:\|content:\|icon:\|return\) \zs\ze\(Equals\)\@!_\?[A-Z]\w*\(<\w\+>\)\?(/new /')
    execute(':silent! %s/<\(\w\+\)>\[/new List<\1>[')
    execute(':silent! %s/\zs\[\ze[^\]]*$/{')
    execute(':silent! %s/^[^\[]*\zs\]\ze/}')
    execute(':silent! %s/''/"/g')
    execute(':silent! %s/\zs,\ze\n\(\s*\)}/')
    execute(':silent! %s/\zs,\ze\n\(\s*\))/')
    execute(':silent! %s/\zs,\ze\n\(\s*\)\]/')
    execute(':silent! %s/\(setState(\|onPressed: \|onTap:\)()\zs \ze{/ => /')
    execute(':silent! %s/\S\+ createState() => \(\S\+\)();$/State createState() => new \1();/')
    execute(':silent! %s/public \w\+(\([^)]\|\n\)*\zs}\ze);//')
    execute(':silent! %s/public \w\+(\([^)]\|\n\)*)\zs;\ze/ {}/')
    execute(':silent! %s/new List<\(\w\+\)>\[\([^]]*\)\]/new List<\1>{\2}/')
    execute(':silent! %s/^\s*\(@required\)\? \zsthis\.\zechild,$/Widget /')
    execute(':silent! %s/^\s*\(@required\)\? \zsthis\.\ze\(color\|backgroundColor\),$/Color /')
    execute(':silent! %s/^\s*\(@required\)\? \zsthis\.\ze\(axisDirection\),$/AxisDirection /')
    execute(':silent! %s/^\s*\(@required\)\? \zsthis\.\ze\(alignment\),$/Alignment /')
    execute(':silent! %s/^\s*D.assert(.*)\zs,\ze$/;/')
    execute(':silent! %s/[:=(] \?\zs\ze\(_\?[A-Z]\w\+\)\(<[^>]*>\)\?(/new /g')
    " execute(':silent! %s/\([:=(]\|^\s*\) \?\zs\ze\(FloatTween\|AnimationController\|ColorTween\|CurveTween\|NotificationListener\|TimeSpan\|EnumProperty\|MessageProperty\|DiagnosticsProperty\|CurvedAnimation\|LayoutId\|CustomMultiChildLayout\|InkWell\|FloatProperty\|SliverGeometry\)\(<[^>]*>\)\?(/new /g')
    " execute(':silent! %s/\([:=(]\|^\s*\) \?\zs\ze\(Offset\|Alignment\|BoxDecoration\|LinearGradient\|Container\|AppBar\|TextStyle\|Border\|BorderSide\|FloatingActionButton\|Icon\|TabController\)\(<[^>]*>\)\?(/new /g')
    " execute(':silent! %s/\([:=(]\|^\s*\) \?\zs\ze\(Wrap\|Text\|ShapeDecoration\|DefaultTextStyle\|AnimatedSwitcher\|Center\|DecorationImage\|BoxConstraints\|Color\)\(<[^>]*>\)\?(/new /g')
    execute(':silent! %s/: (.*)\zs\ze {$/ =>')
    execute(':silent! %s/State<\(\w\+\)> with SingleTickerProviderStateMixin/SingleTickerProviderStateMixin<\1>/')
    execute(':silent! %s/^\s*public override \zs\w\+\ze createRenderObject(BuildContext context) {/RenderObject')
    execute(':silent! %s/^\s*\zspublic\ze override void performLayout() {$/protected/')
    execute(':silent! %s/^\s*\zsconst\ze \(Color\|TimeSpan\|Icon\|Curve\|Dictionary<[a-zA-Z_<>]\+,\s*[a-zA-Z_<>]\+>\|Set<[a-zA-Z_<>]*>\|List<[a-zA-Z_<>]*>\) \w\+ = /static readonly/')
    execute(':silent! %s/= GlobalKey<\w\+>\zs\ze()/.key')
    execute(':silent! %s/= \zs\ze<[a-zA-Z_<>]\+, [a-zA-Z_<>]\+>\s*{/new Dictionary')
    execute(':silent! %s/^\s*[a-zA-Z_<>]\+ \zsget \(\w\+\);\ze$/\1 { get; }')
    execute(':silent! %s/^\s*\zsfor\ze\s*(\s*' . s:typenamePattern . '\s*\w\+\s*in\s*\w\+\s*)/foreach')
endfunction
" }}}

" AddUtil() ------------------ {{{
function! AddUtil()
    let classname = substitute(expand('%:t:r'), '\(\<\|_\)\([a-z]\)', '\u\2', 'g') . "Utils"
    execute(':normal! gg/^\s*namespace' . "\<esc>oclass " . classname . " {\<cr>}\<esc>")
endfunction
" }}}

" ClearBraces() ------------------ {{{
function! ClearBraces()
    let pattern = s:functionHeaderWithOpenBrace
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>x")
    endwhile
    let pattern = s:functionHeaderWithCloseBrace
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>x")
    endwhile
    let pattern = s:constructorHeaderWithOpenBrace
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>x")
    endwhile
    let pattern = s:constructorHeaderWithCloseBrace
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>x")
    endwhile
    " let pattern = '\(^\s*public \w\+({\n\([^)]\+\n\)*\s*})\)\|\(^\s*public \w\+(\n\([^)]\+\n\)*\s*})\)\|\(^\s*public \w\+({\n\([^)]\+\n\)*\s*)\)'
    " while search(pattern) != 0
    "     execute(":normal! gg/" . pattern . "\<cr>")
    "     execute(":s/{//")
    "     execute(":normal! %")
    "     execute(":s/}//")
    " endwhile
endfunction
" }}}

" ClearBase() ------------------ {{{
function! ClearBase()
    let pattern = ':\(\s*\(D.assert(.*)\|\w\+ = .\+\)\(,\|;\)\n\)\+\s*base(.*);$'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>/base(.*);\<cr>dt;mq?:\<cr>a \<esc>pla{\<cr>\<esc>`qs}\<esc>")
    endwhile
endfunction
" }}}

" AddBrace() ------------------ {{{
function! AddBrace()
    let pattern = ':\(\s*\(D.assert(.*)\|\w\+ = \w\+\)\(,\|;\)\n\)\+$'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "/e\<cr>o}\<esc>?:\<esc>xs{\<cr>\<esc>")
    endwhile
    let pattern = 'public \w\+(\n\([^:;{}]\+\n\)*\s*);'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "/e\<cr>s {\<cr>}\<esc>")
    endwhile
    let pattern = 'public \w\+([^:;{}]*);'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "/e\<cr>s {\<cr>}\<esc>")
    endwhile
    let pattern = ') : base(.*);$'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "/e\<cr>s {\<cr>}\<esc>")
    endwhile
endfunction
" }}}

" PublicConstructor() ------------------ {{{
function! PublicConstructor()
    let pattern = '^\s*\(public\s*\)\?class.*{\n\s*\w\+('
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>jwipublic \<esc>")
    endwhile
endfunction
" }}}

" BreakLongConstructor() ------------------ {{{
function! BreakLongConstructor()
    let pattern = '^\s*\(public\s*\)\?class.*{\n\s*\(public\s*\)\?\w\+(\zs\ze.*)\(;\| {\)$'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>i\<cr>\<esc>$F)i\<cr>\<esc>k")
        execute(':silent! s/,\zs \zethis/\r/g')
    endwhile
endfunction
" }}}

" Getters() ------------------ {{{
function! Getters()
    let pattern = '^\s*\(public\s*\)\?\(override\s*\)\?\w\+ get \w\+ => .\+;'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>")
        execute(':silent! s/^\s*\zspublic\ze//')
        execute(":normal! ipublic \<esc>/" . '\<get' . "\<cr>dwwxxxi{\<cr>get {\<cr>return \<esc>o}\<cr>}\<esc>")
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
" }}}

" Setters() ------------------ {{{
function! Setters()
    let pattern = '^\s*set \w\+(.\+) {$'
    while search(pattern) != 0
        execute(":normal! gg/" . pattern . "\<cr>wwmp#$%kmq`pdt{V$%d`qp")
    endwhile
endfunction
" }}}

" ClearRequired() ------------------ {{{
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
            execute(":silent! s/@required //")
        else
            execute(":normal! " . location . "gg")
            execute(":silent! s/@required /required /")
        endif
        execute(":normal! gg")
        let location = search(pattern)
    endwhile
endfunction
" }}}

" InterpolateString() ----------------- {{{
function! InterpolateString()
    let pattern = '[^$]"[^\\"]*\zs\$\ze{[^\\"]*"'
    while  search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>xF\"i$\<esc>")
    endwhile
    let pattern = '\$"[^\\"]*\zs\$\ze{[^\\"]*"'
    while  search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>x")
    endwhile
endfunction
" }}}

" ClearComma() ------------------ {{{
function! ClearComma()
    try
        execute(':silent! %s/^\s*D\.assert(.*)\zs,\ze$/;/')
        execute(':silent! %s/^\s*\w\+ = \w\+\zs,\ze$/;/')
    catch /.*/
        echom "Cannot find comma to clear"
    endtry
endfunction
" }}}

" ClearDoubleDots() ------------------ {{{
function! ClearDoubleDots()
    let pattern = '^\s*\w\+\n\?\(\s*\.\.\w\+ = [0-9a-zA-Z_.(),]\+\n\?\)\+;'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>")
        let word = expand("<cword>")
        execute(":normal! dd")
        while 1
            execute(':silent! s/\.\./' . word . "./")
            if getline(line('.'))[-1:] ==# ';'
                break
            endif
            execute(":normal! A;\<esc>j")
        endwhile
    endwhile
endfunction
" }}}

" ClearThis() ------------------ {{{
function! ClearThis()
    let pattern = '^\s*public \w\+({\?\n\([^:;{}]*\n\)*\s*this.\zs\w\+\ze\( = .*\)\?,\?\n\([^:;{}]*\n\)*\s*}\?)'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>")
        let word = expand("<cword>")
        let newpattern = '^\s*public \(readonly \)\?\zs\S\+\ze ' . word . ';'
        execute(":normal! gg/" . newpattern . "\<cr>")
        let type = expand("<cWORD>")
        execute(":normal! gg/" . pattern . "\<cr>")
        execute(':silent! s/\<this\>\./' . type . " ")
    endwhile
endfunction
" }}}

" RenderObject() ------------------ {{{
function! RenderObject()
    let pattern = '^\s*public override void updateRenderObject(BuildContext context, \zs_\w\+\ze renderObject) {$'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>")
        let word = expand("<cword>")
        execute(':silent! s/\<' . word . ' renderObject/RenderObject _renderObject/')
        execute(":normal! o" . word . " renderObject = _renderObject as " . word . ";\<esc>")
    endwhile
endfunction
" }}}

" ReplaceWithBaseClass() ------------------ {{{
function! ReplaceWithBaseClass()
    let type = expand("<cword>")
    execute(":normal! mqw")
    let word = expand("<cword>")
    execute(":normal! i_\<esc>o" . type . " " . word . " = _" . word . " as " . type . ";\<esc>`q")
endfunction
" }}}

" GetHashCode() ------------------ {{{
function! GetHashCode()
    let pattern = '^\s*public override int \zsget\ze hashCode => .*;$'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>dwsGetH\<esc>whxxs() {\<cr>return \<esc>o}")
    endwhile
    let pattern = '^\s*public override int \zsget\ze hashCode {$'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>dwsGetH\<esc>whi()\<esc>}")
    endwhile
    let pattern = '^\s*return hashValues(\n\(\s*\w\+,\n\)*\s*\w\+\n\s*);'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>ddivar hashCode = this.\<esc>$")
        let c = matchstr(getline('.'), '\%'.col('.').'c.')
        if c ==# ','
            execute(":normal! r;i.GetHashCode()\<esc>j$")
        else
            execute(":normal! a.GetHashCode();\<esc>j$")
        endif
        while 1
            let c = matchstr(getline('.'), '\%'.col('.').'c.')
            if c ==# ';'
                break
            elseif c ==# ','
                execute(":normal! bihashCode = (hashCode * 397) ^ this.\<esc>$i.GetHashCode()\<esc>lr;j$")
            else
                execute(":normal! bihashCode = (hashCode * 397) ^ this.\<esc>$a.GetHashCode();\<esc>j$")
            endif
        endwhile
        execute(":normal! ddOreturn hashCode;\<esc>")
    endwhile
endfunction
" }}}

" ClearConcatString() ------------------ {{{
function! ClearConcatString()
    let pattern = '"[^"]*"\n\s*"[^"]*"'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>A +\<esc>")
    endwhile
endfunction
" }}}

" AddSet() ------------------ {{{
function! AddSet()
    let pattern = '[:=]\s*\zs\ze<[a-zA-Z_<>]\+>\s*{'
    while search(pattern) !=# 0
        execute(":normal! gg/" . pattern . "\<cr>inew HashSet(new List\<esc>wvf{F>yf{%a)\<esc>%P")
    endwhile
endfunction
" }}}

    

" CorrectDictionaryPair() ------------------ {{{
function! CorrectDictionaryPair()
    execute(':silent! s/:/,')
    execute(":normal! 0wi{\<esc>$")
    let c = matchstr(getline('.'), '\%'.col('.').'c.')
    if c ==# ','
        execute(":normal! i}\<esc>")
    else
        execute(":normal! a}\<esc>")
    endif
endfunction
" }}}

" AddNull() ------------------ {{{
function! AddNull()
    execute(':normal! $')
    let c = matchstr(getline('.'), '\%'.col('.').'c.')
    if c ==# ','
        execute(":normal! i = null\<esc>")
    else
        execute(":normal! a = null\<esc>")
    endif
endfunction
" }}}

" DeleteParensisPair() ------------------ {{{
function! DeleteParensisPair()
    execute(":normal! hf(bdwmq%x`qx")
endfunction
" }}}

" ToGet() ------------------ {{{
function! ToGet()
    execute(":normal! $b")
    let word = expand('<cword>')
    let line = getline('.')
    execute(":normal! yy$s {\<cr>get { return this._" . word . "; }\<cr>}\<cr>" . line . "\<esc>")
    execute(':silent! s/\<' . word . '\>/_' . word . '/')
    execute(':silent! s/public //')
endfunction
" }}}

" Initialize() ------------------ {{{
function! Initialize()
    execute(":normal! g'<yg'>/}\<cr>kpV/}\<cr>k\<esc>")
    execute(":'<,'>" . 's/^\s*\zs\S\+\s\+\(\w\+\)\s*\(=.*\)\?,\?\ze/this.\1 = \1;')
endfunction
" }}}

" ClearInitializer() ------------------ {{{
function! ClearInitializer()
    execute(":normal! yymp/}\<cr>kp")
    execute(':silent! s/^\s*\zs\S\+\s\+\(\w\+\)\s*=\s*\(.*[^,]\),\?\ze/this.\1 = \1 ?? \2;')
    execute("normal! `p$")
    let c = matchstr(getline('.'), '\%'.col('.').'c.')
    if c ==# ','
        execute("normal! dT=i null")
    else
        execute("normal! F=lDa null")
    endif
endfunction
" }}}

" Move() ------------------ {{{
function! Move()
    call ClearBase()
    call PublicConstructor()
    call BreakLongConstructor()
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
    call InterpolateString()
endfunction
" }}}

" Maps ---------------- {{{
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
" }}}
