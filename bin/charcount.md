move space to rthumb2
move sym to rthumb1

set up these two
setup space equal space on alt equal
move sym mod to lefy hand side command
._

 

- 236691
_ 173612
. 139074
" 74593
, 73465
) 67640
( 67635
= 66367
# 41056
: 37895
] 12529
` 10511
/ 9718
} 5515
> 3232
* 3079
' 2463
@ 2131
+ 1339
; 1329
< 890
! 354
& 258
% 240
| 239
~ 127
? 86
^ 7
$ 2


), 4943
._ 4286
": 2390
() 2358
") 1936
(" 1795
", 1496
], 1079
): 809
," 608
=" 300
"] 279
,) 239
}, 212
); 194
', 173
)} 135
:" 130
=* 104
_( 103


( ) , . _ " :


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

{:des "sym lhand" :rules [:sym
            ;; [:q :q]
            [:w :curly_bracket_open]
            [:e :square_bracket_open]
            ;; [:r :square_bracket_open]
            ;; [:t :t]

            ;; [:a :a]
            [:s :dash]
            [:d :parenthesis_open]
            [:f :hash]
            ;; [:g :g]

            ;; [:z :z]
            ;; [:x :curly_bracket_open]
            ;; [:c :curly_bracket_open]
            [:v :single_quote]
            ;; [:b :b]
        ]}
        
        {:des "sym rhand" :rules [:sym
            ;; [:y :y]
            ;; [:u :curly_backet_close]
            [:i :square_bracket_close]
            [:o :curly_bracket_close]
            ;; [:p :curly_bracket_close]
            
            ;; [:h :h]
            [:j :colon]
            [:k :parenthesis_close]
            [:l :plus]
            [:semicolon :semicolon]
            [:quote :slash]
            
            ;; [:n :n]
            [:m :equal]
            [:comma :less_than]
            [:period :greater_than]
            [:slash :single_quote]

        ]}
        {:des "sym normal remap" :rules [
            [:semicolon :underscore]
            [:slash :double_quote]
            ;; [:!Sslash :double_quote]
        ]}

), 4943 difficult, k to comma
": 2390 not easy
() 2358 fine d and k alternative hand
") 1936 not easy
(" 1795 not easy
", 1496 easy
], 1079 difficult, i to comma
): 809 easy
," 608 easy
=" 300 not easy
"] 279 not easy
,) 239
}, 212
); 194
', 173
)} 135
:" 130
=* 104
_( 103


--------------------------------------------------------------------

{:des "sym lhand" :rules [:sym
    ;; [:q :q]
    [:w :curly_bracket_open]
    [:e :comma]
    ;; [:r :square_bracket_open]
    ;; [:t :t]

    ;; [:a :a]
    [:s :comma]
    [:d :parenthesis_open]
    [:f :double_quote]
    ;; [:g :g]

    ;; [:z :z]
    ;; [:x :curly_bracket_open]
    ;; [:c :curly_bracket_open]
    [:v :single_quote]
    ;; [:b :b]
]}

{:des "sym rhand" :rules [:sym
    ;; [:y :y]
    ;; [:u :curly_backet_close]
    [:i :comma]
    [:o :square_bracket_close]
    ;; [:p :curly_bracket_close]
    
    ;; [:h :h]
    [:j :colon]
    [:k :parenthesis_close]
    [:l :double_quote]
    [:semicolon :semicolon]
    [:quote :slash]
    
    ;; [:n :n]
    [:m :comma]
    [:comma :square_bracket_close]
    [:period :greater_than]
    [:slash :single_quote]

]}
{:des "sym normal remap" :rules [
    [:semicolon :underscore]
    [:slash :double_quote]
    ;; [:!Sslash :double_quote]
]}

--------------------------------------------------------------------

{:des "sym lhand" :rules [:sym
            ;; [:q :q]
            ;; [:w :curly_bracket_open]
            ;; [:e :comma]
            ;; [:r :square_bracket_open]
            ;; [:t :t]

            ;; [:a :a]
            ;; [:s :comma]
            [:d :parenthesis_open]
            [:f :double_quote]
            ;; [:g :g]

            ;; [:z :z]
            ;; [:x :curly_bracket_open]
            ;; [:c :curly_bracket_open]
            ;; [:v :single_quote]
            ;; [:b :b]
        ]}
        
        {:des "sym rhand" :rules [:sym
            ;; [:y :y]
            ;; [:u :curly_backet_close]
            ;; [:i :comma]
            ;; [:o :square_bracket_close]
            ;; [:p :curly_bracket_close]
            
            ;; [:h :h]
            [:j :colon]
            [:k :parenthesis_close]
            [:l :double_quote]
            [:semicolon :semicolon]
            [:quote :slash]
            
            ;; [:n :n]
            [:m :comma]
            [:comma :square_bracket_close]
            [:period :curly_bracket_close]
            [:slash :single_quote]

        ]}
        {:des "sym normal remap" :rules [
            [:semicolon :underscore]
            [:slash :double_quote]
            ;; [:!Sslash :double_quote]
        ]}

), 4943 easy
": 2390 easy
() 2358 easy
") 1936 easy
(" 1795 easy on left hand
", 1496 easy
], 1079 easy
): 809 easy
," 608 easy
=" 300 
"] 279 easy
,) 239 easy
}, 212 easy
); 194 easy
', 173 easy
)} 135 fine
:" 130 easy
=* 104 
_( 103 fine

>= 
+=
<=

--------------------------------------------------------------------

), 4943 easy in
": 2390 easy out
() 2358 c
") 1936 
(" 1795
", 1496
], 1079
): 809
," 608
=" 300
"] 279
,) 239
}, 212
); 194
', 173
)} 135
:" 130
=* 104
_( 103

>= 
+=
<=