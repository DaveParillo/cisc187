.pl 8.0i
.nr FM 25000

.defcolor blue rgb 0.05f 0.25f 0.75f
.defcolor red rgb 0.75f 0.15f 0.05f
.defcolor green rgb 0.15f 0.6f 0.05f
.defcolor grey rgb 0.6f 0.6f 0.6f

.nh

.ds RF %
.fp 1 R H
.fp 2 I HI
.fp 3 B HB
.fp 4 BI HX


.nr PO 1.0i
.nr LL 10i
.nr LT 10i
.nr PS 24
.nr VS 24p
.nr PD 12p

.ds CH "

.de PA
.ds CH "
.bp
\&
.sp 1.4i
.LP
\s+8\fB\\$1\fP\s-8
.na
..

.de SS
.ds LH \m[blue]\s+(16\f3\\$*\fP\s-(16\m[]
.bp
.LP
.na
..

.de code
\fC\m[blue]\\$*\m[]\fR
..


.ds c \fC\m[blue]
.ds r \m[]\fR


.de IT
.ds i0 \s-4\(bu\s+4
.IP \\*(i0
\\$*
..

.de i1s
.RS
.sp -.5
.IP -
\s-4
..


.de i1e
\s+4
.RE
..

.de i1
.i1s
\\$*
.i1e
..

.de i2s
.RS
.RS
.sp -.65
.IP \s-(10\[u25CB]\s+(10
\s-8
..

.de i2e
\s+8
.RE
.RE
..

.de i2
.i2s
\\$*
.i2e
..

.de i3s
.RS
.RS
.RS
.sp -.65
.IP \s-(10\[u002B]\s+(10
\s-(10
..

.de i3e
\s+(10
.RE
.RE
.RE
..

.de i3
.i3s
\\$*
.i3e
..

.am TL
.sp 1.4i
.ps +8
..

.am AU
.sp 1.0i
.ps -8
..

.\" .nr PO 0.5i  \" page offset = left margin
.\" .nr HM 1.5i \" header margin
.\" .nr PS 12
.\" .nr VS 14p
.\" .nr PD 6p
.\" .nr LL 10i
.\" .pl 15c
.\" .ds RF "
