#Requires AutoHotkey v2.0

; =============================================================================
;  LaTeX Keyboard — AutoHotkey v2
;  Toggle LaTeX mode ON/OFF with F12
;
;  SHIFT layer  → Greek letters & math symbols   (e.g. Shift+A → \alpha)
;  ALTGR layer  → LaTeX functions & operators     (e.g. Alt+A  → \abs{})
;
;  A tray tooltip shows the current mode.
; =============================================================================

LaTeXMode := false

; --- Toggle -------------------------------------------------------------------
^+Space::
{
    global LaTeXMode
    LaTeXMode := !LaTeXMode
    if LaTeXMode {
        ToolTip("LaTeX Mode ON [CTRL+SHIFT+SPACE] ")
        TrayTip("LaTeX Keyboard", "LaTeX Mode ON", 1)
    } else {
        ToolTip()
        TrayTip("LaTeX Keyboard", "LaTeX Mode OFF", 1)
    }
}

; =============================================================================
;  Helper — only fires when LaTeX mode is active
; =============================================================================
#HotIf LaTeXMode

; =============================================================================
;  SHIFT LAYER — Greek letters & math symbols
; =============================================================================

; --- Letters (Greek) ----------------------------------------------------------
+a:: SendText("\alpha")
+b:: SendText("\beta")
+c:: SendText("\chi")
+d:: SendText("\delta")
+e:: SendText("\epsilon")
+f:: SendText("\phi")
+g:: SendText("\gamma")
+h:: SendText("\eta")
+i:: SendText("\iota")
+j:: SendText("\varphi")
+k:: SendText("\kappa")
+l:: SendText("\lambda")
+m:: SendText("\mu")
+n:: SendText("\nu")
+o:: SendText("\omega")
+p:: SendText("\pi")
+q:: SendText("\theta")
+r:: SendText("\rho")
+s:: SendText("\sigma")
+t:: SendText("\tau")
+u:: SendText("\upsilon")
+v:: SendText("\varsigma")
+w:: SendText("\Omega")
+x:: SendText("\xi")
+y:: SendText("\psi")
+z:: SendText("\zeta")

; --- Number row (math symbols) -----------------------------------------------
+1:: SendText("\forall")
+2:: SendText("\exists")
+3:: SendText("\partial")
+4:: SendText("\nabla")
+5:: SendText("\infty")
+6:: SendText("\wedge")
+7:: SendText("\vee")
+8:: SendText("\times")
+9:: SendText("\in")
+0:: SendText("\emptyset")

; --- Punctuation (math relations & delimiters) --------------------------------
+-::  SendText("\setminus")
+=::  SendText("\equiv")
+[::  SendText("\{")
+]::  SendText("\}")
+`;:: SendText("\colon")
+'::  SendText("\prime")
+`:: SendText("\approx")
+\::  SendText("\mid")
+,::  SendText("\leq")
+.::  SendText("\geq")
+/::  SendText("\neq")

; =============================================================================
;  ALT LAYER — LaTeX functions & operators
;  (Use right Alt, or remap as needed. Here we use LAlt for accessibility.)
; =============================================================================

; --- Letters (LaTeX commands) ------------------------------------------------
!a:: SendText("\abs{}")
!b:: SendText("\mathbf{}")
!c:: SendText("\cdot")
!d:: SendText("\dfrac{}{}")
!e:: SendText("\exp")
!f:: SendText("\frac{}{}")
!g:: SendText("\sqrt{}")
!h:: SendText("\hat{}")
!i:: SendText("\int")
!j:: SendText("\lim_{}")
!k:: SendText("\ker")
!l:: SendText("\log")
!m:: SendText("\max")
!n:: SendText("\min")
!o:: SendText("\oplus")
!p:: SendText("\prod_{}")
!q:: SendText("\quad")
!r:: SendText("\mathrm{}")
!s:: SendText("\sum_{}")
!t:: SendText("\text{}")
!u:: SendText("\underbrace{}{}")
!v:: SendText("\vec{}")
!w:: SendText("\widetilde{}")
!x:: SendText("\times")
!y:: SendText("\otimes")
!z:: SendText("\mathbb{}")

; --- Number row (superscripts & special sets) --------------------------------
!1:: SendText("\mathbb{1}")
!2:: SendText("^{2}")
!3:: SendText("^{3}")
!4:: SendText("^{n}")
!5:: SendText("^{5}")
!6:: SendText("^{6}")
!7:: SendText("^{7}")
!8:: SendText("^{8}")
!9:: SendText("^{9}")
!0:: SendText("^{0}")

; --- Punctuation (operators & delimiters) ------------------------------------
!-::  SendText("\to")
!=::  SendText("\coloneqq")
![::  SendText("\left[")
!]::  SendText("\right]")
!`;:: SendText("\colon")
!'::  SendText("\dagger")
!`:: SendText("\sim")
!\::  SendText("\backslash")
!,::  SendText("\,")
!.::  SendText("\ldots")
!/::  SendText("\div")

#HotIf
