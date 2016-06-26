.pl 7.5i

.defcolor blue rgb 0.05 0.25 0.6f


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
.ds LH \m[blue]\s+(16\f3\\$1\fP\s-(16\m[]
.bp
.LP
.na
..

.de IT
.if !"\\$1"" .ds i0 \\$1
.if "\\$1"" .ds i0 \s-4\(bu\s+4
.IP \\*(i0
..

.de i1
.RS
.sp -.5
.IP -
\s-4
..

.de i1e
\s+4
.RE
..

.de i2
.RS
.RS
.sp -.65
.IP \s-8\N'187'\s+8
\s-8
..

.de i2e
\s+8
.RE
.RE
..

.de i3
.RS
.RS
.RS
.sp -.5
.IP \s-(10\(bu\s+(10
\s-(10
..

.de i3e
\s+(10
.RE
.RE
.RE
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
