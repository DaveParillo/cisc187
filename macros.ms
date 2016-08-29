

.defcolor blue rgb 0.05f 0.25f 0.75f
.defcolor red rgb 0.75f 0.15f 0.05f
.defcolor green rgb 0.15f 0.6f 0.05f
.defcolor grey rgb 0.6f 0.6f 0.6f
.defcolor white rgb 1f 1f 1f

.nh


.de time_box
.QI 2i
.QP
.B1
Start time: 

.B2
.LP
..

.EQ
delim $$
.EN

.de h1
.SH 
\s+4\m[blue]\\$*\m[]\s-4
..


.de code
\fC\m[blue]\\$*\m[]\fR
..


.ds c \fC\m[blue]
.ds r \m[]\fR

.ds sect \[u00A7]
.ds circle \s+4\[u25CB]\0\s-4
.ds checkmark \s+4\[u2713]\0\s-4
.ds cross \s+4\[u00D7]\0\s-4

.de choice
.IP \*[circle]\\$1 .5i
..

.de right
.IP \m[green]\*[checkmark]\m[]\\$1 .5i
..
.de wrong
.IP \m[red]\*[cross]\m[]\\$1 .5i
..
