// Dieses Dokument ist nicht ganz vollständig und kann Fehler enthalten.
// Für Fehlerkorrektur oder andere Verbesserungen bitte in GitHub oder IServ melden.

#set text(lang: "de")
#set document(title: [Mathematik Leistungskurs-Stern -- Q1])
#let repo = "https://github.com/TaraszowIrmakli/MaS"
#let redd(x) = text(fill: red, x)
#let blu(x) = text(fill: blue, x)
#let dark = sys.inputs.at("theme", default: "light") == "dark"
#set page(fill: if dark { rgb(9, 9, 9) } else { white })
#set text(fill: if dark { rgb(246, 246, 246) } else { black })

[#link(repo, blu[Repository]) #sym.bullet #link(repo + "/tree/main/main.typ", blu[Quelltext]) #sym.bullet #link(repo + "/tree/main/LICENSE.md", blu[Lizenz])]

Dieses Dokument darf nicht für kommerzielle Zwecke oder für künstliche Intelligenz verwendet werden.

#title()

_2023-09-10 (W36 Donnerstag)_
= #underline[Kapitel 1 -- Differenzierbarkeit]
= 1.1 -- Das Tangentenproblem
Wir wollen das Tangentenproblem von Leibniz (1646 - 1716) nachvollziehen.
Bisher kann man nur *Sekanten* an Graphen bestimmen.
// Graph: arcsin mäßige Funktion f, Sekante s eingezeichnet, x1 und x2 schneiden f und s. Später wird die Tangente t noch eingezeichnet (schneidet x1).
$ s(x) = (f(x_2) - f(x_1)) / (x_2 - x_1) (x - x_1) + f(x_1) $
Ziel ist es, die *Tangente $t$* zu bestimmen. \
Problem ist, wenn $x_2 - x_1$ immer kleiner wird und irgendwann $x_2 - x_1 = 0$ gilt, teilen wir durch Null:
$ t(x) &= (f(x_2) - f(x_1)) / (x_2 - x_1) (x - x_1) + f(x_1) \
       &= #redd($(0 / 0)$) (x - x_1) + f(x_1)
$
Der Differenzenquotient $(f(x_2) - f(x_1)) / (x_2 - x_1)$ muss anders untersucht werden, wenn $x_2 -> x_1$.

Die Idee ist, dass wir untersuchen, ob der Differenzenquotient einen *Grenzwert* für $x_2 -> x_1$ besitzt.

== Beispiel:
Sei $f(x) = x^2$ und $x_1 = 1/2$.
// Graph: x^2 (bis 1.5, 1.5) mit Tangente an x=0.5
$ t(x) &= lim_(x_2 -> 1/2) (f(x_2) - f(x_1)) / (x_2 - x_1)\
&= lim_(x_2 -> 1/2) ((x_2)^2 - (1/2)^2) / (x_2 - 1/2)\
&= lim_(x_2 -> 1/2) ((x_2 - 1/2)(x_2 + 1/2)) / (x_2 - 1/2)\
&= lim_(x_2 -> 1/2) x_2 - 1/2\
&= 1/2 + 1/2\
&= 1 $
Die Tangente an dem Graphen von $x^2$ an der Stelle $x_1 = 1/2$ hat die Steigung 1.\
Allgemeiner: $x_1$ ist beliebig, aber fest.

== Aufgabe:
Bestimmen Sie den Grenzwert vom Differenzquotienten für $f(x) = |x|$ an der Stelle $x_1 = 0$.

=== Lösung:
$ lim_(x_2 -> 0) (f(x_2) - f(x_1)) / (x_2 - x_1)\
= lim_(x_2 -> 0) (|x_2| - 0) / (x_2 - 0)\
= lim_(x_2 -> 0) (|x_2|) / x_2\
= cases(
  lim_(x_2 -> 0) x_2/x_2 "wenn" x_2 > 0,
  lim_(x_2 -> 0) 0/0 "wenn" x_2 = 0,
  lim_(x_2 -> 0) -x_2/x_2 "wenn" x_2 < 0,
)\
= cases(
  1 "wenn" x_2 > 0,
  "undefiniert" "wenn" x_2 = 0,
  -1 "wenn" x_2 < 0,
)\
$

= 1.2 -- Begriff der Ableitung
== Definition 1.1 (Ableitung)
Die Funktion $f$ ist in $x_0$ *differenzierbar* genau dann, wenn
+ $f$ ist in einer Umgebung $U(x_0)$ definiert: $U(x_0) subset.eq D_f$
+ für #underline[jede] Folge $(x_n)$ mit $x_n in U(x_0)$ und $x_n != x_0$ für alle $n$ mit $x_n ->^(n -> oo) x_0$ existiert $ lim_(n -> oo) (f(x_n) - f(x_0)) / (x_n - x_0) $ als eigentlicher und einheitlicher Grenzwert.

=== Bemerkungen:
- Der Grenzwert aus 1.1 heißt auch *Ableitung* von $f$ an $x_0$.
- Für die Umgebung $U(x_0)$ gibt es nur die Bedingung, dass sie nicht einseitig ist.

== Definition 1.2 ($h$-Methode)
Die Funktion $f$ ist in $x_0$ differenzierbar genau dann, wenn
+ $f$ ist in einer Umgebung $U(x_0)$ definiert
+ für jede Folge $h_n$ ($h_n := x_n - x_0$) mit $x_0+h_n in U(x_0)$  und $h_n != 0$ existiert $ lim_(n->oo) (f(x_0 + h_n) - f(x_0)) / h_n $ als eigentlicher und einheitlicher Grenzwert.

=== Aufgaben:
Berechnen Sie, sofern sie existiert, die Ableitung an der Stelle $x_0$ von
+ $2x^2$
+ $x^3$
+ $sqrt(x), x in RR^+, x_0 > 0$
+ $1/x, x in RR without {0}; x_0 != 0$

_2026-09-11 (W37 Freitag)_

=== Lösungen:
+ Sei $x_0 in D_f = RR$ und $(x_n)$ eine beliebige Folge mit $x_n != x_0$ für alle $n, x_n ->^(n->oo) x_0, x_n in D_f$. Mit der Definition 1.2 folgt:
$ lim_(n -> oo) (2(x_n)^2 - 2(x_0)^2) / (x_n - x_0)\
= lim_(n -> oo) 2((x_n)^2 - (x_0)^2) / (x_n - x_0)\
= lim_(n -> oo) 2((x_n+x_0)(x_n-x_0)) / (x_n - x_0)\
= lim_(n -> oo) 2(x_n+x_0)\
=^"GWEA" 2(x_0+x_0)\
= 4x_0 $
Die Ableitung von $2x^2$ an $x_0$ ist $4x_0$.

_Alternativ_:
Sei $x_0 in D_f = RR$ und $(h_n)$ eine beliebige Folge mit $h_n != 0$ für alle $n, h_n ->^(n->oo) 0, h_n+x_0 in D_f$. Mit der Definition 1.2 folgt:
$ lim_(n -> oo) (2 (x_0+h_n)^2 - 2(x_0)^2) / h_n\
= lim_(n -> oo) 2 ((x_0+h_n)^2 - (x_0)^2) / h_n\
= lim_(n -> oo) 2 ((x_0)^2 + 2 x_0 h_n + (h_n)^2 - (x_0)^2) / h_n\
= lim_(n -> oo) 2 ((2 x_0 h_n + (h_n)^2) / h_n\
= lim_(n -> oo) 2 (2 x_0 + h_n)\
= lim_(n -> oo) 4x_0 + 2h_n\
=^"GWEA" lim_(n -> oo) 4x_0 + lim_(n -> oo) 2h_n\
= 4x_0 + 2 dot 0\
= 4x_0\
$

+ $(2x^2)' = 4x$
+ $(x^3)' = 3x^2$
+ $(sqrt(x))' = 1/(2 sqrt(x))$
+ $(1/x)' = -1/(x^(2))$

_2026-09-17 (W38 Donnerstag)_
= 1.3 -- Ableitung trigonometrischer Funktionen

== 1.3.2 Kosinus
$ lim_(h->0) (cos(x_0 + h) - cos(x_0)) / h\
= lim_(h->0) (cos(x_0) cos(h) - sin(x_0)sin(h) - cos(x_0)) / h\
= lim_(h->0) (cos(x_0) (cos(h) - 1) - sin(x_0)sin(h)) / h\
=^"GWEA" cos(x_0) lim_(h->0) (cos(h) - 1)/h - lim_(h->0) sin(x_0)sin(h) / h\
= cos(x_0) dot 0 - sin(x_0) dot 1\
= -sin(x_0) $

== 1.3.3 Tangens
$ lim_(h->0) (tan(x_0 + h) - tan(x_0)) / h\
= lim_(h->0) ( sin(x_0+h)/cos(x_0+h) - sin(x_0)/cos(x_0) )/h\
= lim_(h->0) ( sin(x_0+h) cos(x_0) - sin(x_0) cos(x_0+h) )/(h cos(x_0+h) cos(x_0))\
= lim_(h->0) ( sin(x_0+h-x_0) )/(h cos(x_0+h) cos(x_0))\
= lim_(h->0) sin(h)/h 1/(cos(x_0+h) cos(x_0))\
=^"GWEA" 1 dot 1/cos(x_0)^2\
= 1/cos(x_0)^2 $

== 1.3.4 Zusammenfassung
=== Satz 1.1 (Ableitung trigonometrischer Funktionen)
Die Funktionen $sin$ und $cos$ sind auf ganz $RR$ differenzierbar mit
$ (sin(x))'|_(x=x_0) = cos(x_0) $
und
$ (cos(x))'|_(x=x_0) = -sin(x_0) $

Die Funktion $tan$ ist auf $RR without {x in RR | x = pi/2 + k pi, k in ZZ}$ differenzierbar mit
$ (tan(x))'|_(x=x_0) = 1/(cos^2(x_0)) = 1 + tan^2(x_0) $

Beweis: siehe oben. $qed$

= 1.4 Ableitungsregeln
In diesem Abschnitt wollen wir uns Hilfsmittel zur Bestimmung von Ableitungen erarbeiten.

== Satz 1.2 (elementare Ableitungsregeln)
Seien $f$ und $g$ an $x_0$ differenzierbar und $c in RR$ konstant.
Dann sind auch die folgenden Funktion an $x_0$ differenzierbar mit: $
(c)'|_(x=x_0) &= 0 & "Konstantenregel"\
(c dot f(x))'|_(x=x_0) &= c dot f'(x) & "Faktorregel"\
(f(x) + g(x))'|_(x=x_0) &= f'(x) + g'(x) & "Summenregel"\
(f(x) dot g(x))'|_(x=x_0) &= f'(x) dot g(x) + f(x_0) g'(x_0) & "Produktregel"\
(f(x) / g(x) )'|_(x=x_0) &= (f'(x_0) dot g(x_0) - f(x_0) dot g'(x_0) ) / (g^2(x_0)) & "Quotientenregel"\
$

=== Aufgabe:
Eine dieser Regeln beweisen (außer Konstantenregel).

Beweis für die Summenregel:
$ (f(x) + g(x))'|_(x=x_0)
&= lim_(h->0) ((f(x_0 + h) + g(x_0 + h)) - (f(x_0) + g(x_0))) / h\
&= lim_(h->0) (f(x_0 + h) - f(x_0) + g(x_0 + h) - g(x_0)) / h\
&= lim_(h->0) (f(x_0 + h) - f(x_0))/h + (g(x_0 + h) - g(x_0)) / h\
&=^"GWEA" lim_(h->0) (f(x_0 + h) - f(x_0))/h + lim_(h->0) (g(x_0 + h) - g(x_0)) / h\
&= f'(x_0) + g'(x_0)\
$

_2026-09-18 (W38 Freitag); unvollständig_

== Definition (logarithmische Ableitung)
Unter der Voraussetzung vom Korollar 1.4 mit der Bedingung $f_1(x_0) != f_2(x_0) != ... != f_n(x_0) = 0$ nennt man den Ausdruck $L(f) = (f'(x))/f(x)$ *logarithmische Ableitung* von $f$.

== Lemma 1.5 (Ableitung von $x$)
Sei $f(x) = x$, so ist $f$ in $x_0$ differenzierbar. Es ist: $f'(x)|_(x = x_0) = 1$.
=== Beweis:
$ lim_(h->0) (f(x_0+h) - f(x_0)) / h = lim_(h->0) (x_0 + h - x_0) / h = lim_(h->0) h/h = 1 space qed $

== Satz 1.6 (Potenzregel)
Sei $f(x) = x^n$ mit $n in NN$. So ist $f$ in $x_0$ differenzierbar mit $f'(x)|_(x=x_0) = n dot x_0^(n-1)$.

=== Beweis:
Es ist $ f(x) = x^n = underbrace(x dot ... dot x, n"-Faktoren") $
Also ist $ f_1(x) = f_2(x) = ... = f_n(x) = x $
Mit der logarithmischen Ableitung folgt:

_2026-09-22 (W39 Dienstag)_

$ L(f) = underbrace((f_1'(x))/(f_1(x)) + (f_2'(x))/(f_2(x)) + ... + (f_n'(x))/(f_n(x)), n "Summanden") $
Mit Lemma 1.5 folgt:
$ = 1/x + 1/x + ... + 1/x = n dot 1/x $
Mit $L(f) = (f'(x))/f(x) <=> f'(x) = L(f) dot f(x)$ folgt:
$ f'(x) = n dot 1/x dot x^n = n dot x^(n-1) space space qed $

*Bemerkung:* Bei der Herleitung muss $x_0 != 0$ gelten. Für $x_0 = 0$ muss wieder die Ableitung über den Grenzwert bestimmt werden.

=== Beispiel:
$ f(x) = 8x^7 + 5x^6 - 3x^4 +1/2x^2 - x $
Bestimmen Sie die Ableitung von $f$ an der Stelle $x_0 = -1$.

Mit den elementaren Ableitungsregeln folgt: $
f'(x)|_(x_0 = -1) &= (8x^7 + 5x^6 - 3x^4 + 1/2x^2 - x)'|_(x_0 = -1) \
&=^"Summenregel" (8x^7)' + (5x^6)' + (-3x^4)' + (1/2x^2)' + (-x)')|_(x_0 = -1) \
&=^"Faktorenregel" 8(x^7)' + 5(x^6)' - 3(x^4)' + 1/2(x^2)' - x'|_(x_0 = -1) \
&=^"Potenzregel" 8 dot 7x^6 + 5 dot 6 x^5 - 3 dot 4 x^3 + 1/2 dot 2 x - 1|_(x_0 = -1) \
&= 56x^6 + 30x^5 - 12x^3 + x - 1|_(x_0 = -1) \
&= 56 - 30 + 12 - 1 - 1 \
&= 36 $
// TODO: align equals sign, not start of equals sign with supertext

In Klausur sind diese Umformungsschritte für Polynome nicht nötig, da sie "einfache Funkionen" sind.

Neben "einfachen" Funktionen, wie Polynome oder trigonometrische Funktionen, gibt es auch verkettete Funktionen, die man abbilden möchte. *Beispiel:* $g(x) = sin(x^2)$. \
Wir wissen dass $(x^2)' = 2x$ und $(sin(x))' = cos(x)$, aber ja...
//== Exkurs (Verkettung von Funktionen)

== Satz 1.7 (Kettenregel)
Seien $f: D_f -> W_f$ mit $y = f(x)$ in $x_0$ und $g: D_g -> W_g$ mit $z = g(y)$ in $y_0 = f(x_0)$ differenzierbar und es ist $W_f subset.eq D_g$. Dann ist die verkettete Funktion $h(x) = g(f(x))$ in $x_0$ differenzierbar und es gilt $ h'(x) = g'(f(x)) dot f'(x) $

=== Beweis:
Sei $(x_n)$ eine Folge mit $x_n != x_0$ für alle $n in NN$ und $x_n in U(x_0)$ und $limits(lim)_(n->oo) x_n = x_0$.
Mit Definition 1.1 folgt: $ h'(x)|_(x=x_0)
&= lim_(x->x_0) (h(x)-h(x_0))/(x-x_0) \
&= lim_(x->x_0) (g(f(x)) - g(f(x_0))) / (x-x_0) \
&= lim_(x->x_0) (g(f(x)) - g(f(x_0))) / (x-x_0) dot (f(x) - f(x_0)) / (f(x) - f(x_0)) \
&= lim_(x->x_0) (g(f(x)) - g(f(x_0))) / (f(x) - f(x_0)) dot (f(x) - f(x_0)) / (x-x_0) \
&"Da" y_0 = f(x_0) "ist:" \
&= lim_(x->x_0) ((g(y) - g(y_0)) / (y - y_0)) dot (f(x) - f(x_0)) / (x-x_0) \
&=^"GWEA" lim_(redd(x->x_0)) ((g(redd(y)) - g(redd(y_0))) / (redd(y - y_0))) dot lim_(x->x_0) (f(x) - f(x_0)) / (x-x_0) \
&"Da" x->x_0 "und" y_0 = f(x_0) "ist, können wir eine Folge"\
&(y_n) "mit" lim_(n->oo) y_n = y_0 "erzeugen. Damit folgt:"\
// TODO: better comments in big equations??
&= lim_(y->y_0) ((g(y) - g(y_0)) / (y - y_0)) dot lim_(x->x_0) (f(x) - f(x_0)) / (x-x_0) \
&"Mit" y_0 = f(x_0) "folgt:"\
&= g'(f(x)) dot f'(x) space qed\
$

=== Beispiel:
$ h(x) = sin(x^2) $
Es ist $f: RR -> RR^+_0$ mit $y = x^2$ und $g: RR -> [-1; 1]$ mit $z = g(y) = sin(y)$.
Es gilt $RR^+_0 subset.eq RR$ und $f$ ist in $x_0$ und $g$ in $y_0$ differenzierbar.
Mit der Kettenregel folgt: $ h'(x)|_(x=x_0)
&= (sin(x^2))' |_(x=x_0) \
&= (cos(x^2)) dot 2x |_(x=x_0) \
&= (cos(x_0^2)) dot 2x_0 $
Hier heißt $sin$ die _äußere Funktion_ und $x^2$ die _innere Funktion_.

_2026-09-29 (W40 Dienstag)_
== Definition 1.6 (Tangenten- und Normalgleichung)
Ist die Funktion $f$ an $x_0$ differenzierbar, so heißt die Gerade $t$ mit
$ t: y = f'(x_0) dot (x-x_0) + f(x_0) $
*Tangente* am Graphen von $f$ an der Stelle $x_0$ bzw. im Punkt $(x_0|f(x_0))$.
// Graph: kurvige Funktion mit Tangente t an einem x_0. Gestrichelte Vertikale fuer x_0

Die zur Tangente senkrechte Gerade im Punkt $(x_0|f(x_0))$ heißt *Normale* $n$ mit
$ n: y = - 1/(f'(x_0)) dot (x-x_0) + f(x_0) $
und $f'(x_0) != 0$.
// Graph: oberer Graph mit Normale eingezeichnet (90deg zur Tangente)

=== Beispiel:
$ k(x) = 50x^50 + sin(x); x_0 = 80 $
Bestimmen Sie die Tangente an dem Graphen von $f$ an der Stelle $x_0$.
Die Funktion $k$ ist als Summe von differenzierbaren Funktion selbst differenzierbar und es folgt mit den elementaren Ableitungsregeln: $ k'(x_0)
&= 50 dot 50x^49 + cos(x_0) |_(x_0=80) \
&= 50^7 dot 80^49 + cos(80) \
&approx 4.46 dot 10^96 $
Die Tangentengleichung ist mit $k(80) approx 7.14 dot 10^96$:
$ t(x) = 4.96 dot 10^96 dot (x-80) + 7.14 dot 10^06 $

== Schnittwinkel
Mithilfe der geometrischen Bedeutung können wir nun *Schnittwinkel* zwischen Graphen von Funktionen berechnen.
// Graph: f (steigend) und g (fallend). eventuell sin und cos.
//  Tangenten t_f und t_g (schneiden sich).
//  alpha_f an (0, 0) zu t_f, alpha_g an (idk, 0) (spitz), delta zw. t_f und t_g.
//  Vertikale x_0 gestrichelt, Horizontale an Schneidepunkt gestrichelt.
//  Stufenwinkel alpha_f ist zw. t_f und Horizontale. Stufenwinkel alpha_g zw. t_g und Horizontale.

Wir wissen, sofern $f$ und $g$ differenzierbar sind:
$ tan(alpha_f) = f'(x_0), space tan(alpha_g) = g'(x_0) $
Der Schnittwinkel $delta$ ist somit:
$ delta = |alpha_f - alpha_g| \
<=> tan(delta) = tan(|alpha_f - alpha_g|) \
<=> tan(delta) = |(tan(alpha_f) - tan(alpha_g)) / (1 + tan(alpha_f) dot tan_(alpha_g))| \
<=> tan(delta) = |(f'(x_0) - g'(x_0)) / (1 + f'(x_0) dot g'(x_0))| $
//$ delta = |arctan(f'(x_0)) - arctan(g'(x_0))| $

=== Bemerkungen:
- Wenn $delta > pi/2$, dann wird meist der kleinere Winkel $delta_2 = pi - delta$ als Schnittwinkel gewählt.
- Für $f perp g$ gilt: $1 + f'(x_0) g'(x_0) = 0 <=> f'(x_0) = -1/(g'(x_0))$.

_2026-10-08 (W41 Donnerstag)_
Mit der Ableitungsfunktion $f'$ lassen sich Eigenschaften von der Funktion $f$ teilweise bestimmen. Ein Beispiel dafür ist die Monotonie, da das Vorzeichen von $f'$ teilweise Aussagen über die Monotonie von $f$ macht.

== Definition 1.7 (Monotonie)
Sei $f$ eine Funktion und $G_f$ der Graph der Funktion $f$. Genau dann, wenn für alle $x_1 < x_2$  die jeweilige Bedingung gilt, heißt der Graph:
$ cases(
  "streng monoton wachsend" & f(x_1) < f(x_2),
  "monoton wachsend" & f(x_1) <= f(x_2),
  "monoton falled" & f(x_1) >= f(x_2),
  "streng monoton falled" & f(x_1) > f(x_2),
) $
// TODO: nicer alignment

== Definition 1.8 (Krümmung)
Eine Funktion $f$ sei in einem Intervall differenzierbar. Genau dann, wenn in jedem Punkt des Intervalls die Tangentensteigung sich in gewisser Weise verändert, heißt der Graph $G_f$ von $f$
$ cases(
  "streng rechtsgekrümmt " & "zunimmt",
  "rechtsgekrümmt" & "zunimmt oder gleichbleibt",
  "linksgekrümmt" & "abnimmt oder gleichbleibt",
  "streng linksgekrümmt" & "abnimmt",
) $

= 1.6 -- Ableitung der Umkehrfunktion
Für die Umkehrfunktion sind drei Eigenschaften von Abbildungen wichtig:

#set enum(numbering: "i)")
== Definition 1.9 (Injektivität / Surjektivität)
Seien $M_1$ und $M_2$ zwei nicht-leere Mengen. Eine Abbildung $f: M_1 -> M_2$ heißt
+ *injektiv*, wenn für alle $x_1, x_2 in M_1$ gilt: $f(x_1) = f(x_2) => x_1 = x_2$
+ *surjektiv*: wenn es für jeden Wert $y$ aus $M_2$ ein $x in M_2$ gibt mit $y = f(x)$. Kurz: $f(M_1) = M_2$
+ *bijektiv*, wenn sie injektiv und surjektiv ist.

=== Bemerkung:
Jede Funktion kann surjektiv gemacht werden, indem man einfach alle Werte, die nicht angenommen werden, von der Wertemenge ausschließt.

=== Beispiele:
- $f: RR -> RR, x |-> x^2$ ist *nicht injektiv*, weil $x^2 = (-x)^2$. Sie ist auch *nicht surjektiv*, weil nie negative Werte angenommen werden.
- $f: RR -> R_0^+, x |-> x^2$ ist *nicht injektiv*. Sie ist aber *surjektiv*, weil negative Werte von der Wertemenge ausgeschlossen wurden, wodurch nun alle Werte in der Wertemenge angenommen werden.
- $f: RR_0^+ -> RR_0^+, x |-> x^2$ ist *injektiv*, weil negative Werte von der Definitionsmenge ausgeschlossen wurden. Sie ist auch *surjektiv*.
- $f: RR_0^+ -> RR, x |-> x^2$ ist *injektiv*, aber *nicht surjektiv*.

== Definition 1.10 (Umkehrfunktion)
#let fquer = $overline(f)$
Sei $f: D_f -> W_f$ bijektiv, so gibt es eine Funktion $fquer$, sodass $f(fquer(x)) = x$ und $fquer(f(x)) = x$. $fquer$ heißt *Umkehrfunktion* von $f$.

...

_2026-10-13 (W43 Dienstag)_

Wir haben noch zu zeigen, dass $fquer$ stetig ist.
$ f "stetig" <=> forall_(epsilon > 0) exists_(delta = delta(epsilon)) : |x_2 - x_1| < epsilon => |f(x_2) - f(x_1)| < delta $
// Graphen für dieses Zeug
$ f "stetig" <=> lim_(x->x_0) f(x) = f(x_0) $

Sei $(y_n)$ eine Folge aus $D_fquer = W_f$ mit $y_n -> y_0$ für $n -> oo$.
Wir bezeichnen $y_0 = f(x_0)$ und damit $y_n = f(x_n)$.
Somit ist $(x_n)$ eine Folge aus $D_f = W_fquer$ mit $x_n -> x_0$ für $n -> oo$.
Es gilt, da $f$ stetig ist $ lim_(x_n -> x_0) f(x_n) = f(x_0) = y_0 $
Wir wollen zeigen:
$ lim_(y_n -> y_0) fquer(y_n) = lim_(x_n -> x_0) x_n = x_0 = fquer(y_0) $
Somit ist $fquer$ stetig.

== Satz 1.9 (Ableitung der Umkehrfunktion)
Sei $f$ eine stetige und streng monotone Funktion und $x_0 in D_f$ beliebig, aber fest.
Wenn $f$ in $x_0$ differenzierbar und $f'x(x_0) != 0$, dann ist $fquer$ in $y_0 = f(x_0)$ differenzierbar mit $ fquer'(y)|_(y=y_0) = 1/(f'(x_0)) = 1/(f'(fquer(y_0))) $

=== Beweis:
Sei $(y_n)$ eine Folge aus $D_f$ mit $y_n -> y_0$ für $n -> oo$ und es sei entsprechend $(x_n)$ eine Folge aus $D_f$ mit $y_n = f(x_n)$.
Nach der Definition 1.1 folgt nun: $ lim_(y_n -> y_0) (fquer(y_0) - fquer(y_n)) / (y_0 - y_n) = lim_(x_n -> x_0) (x_0 - x_n) / (f(x_0) - f(x_n)) = lim_(x_n -> x_0) 1 / ((f(x_0) - f(x_n)) / (x_0 - x_n)) $
Da $f$ in $x_0$ differenzierbar:
$ = 1 / (f'(x_0)) = 1 / (f'(fquer(y_0))) $

=== Beispiel:
Satz 1.9 kann genutzt werden, um die Ableitung von Funktionen zu finden, wenn die Ableitung der Umkehrfunktion bekannt ist.

Wir suchen die Ableitung der Umkehrfunktion vom Sinus:
$ f: [-1; 1] -> [-pi/2; pi/2] : x |-> arcsin(x) $
und die Umkehrfunktion ist:
$ fquer: [-pi/2; pi/2] -> [-1; 1]: y |-> sin(y) $
// Graph: sin(x), arcsin(x)
Für ein $x_0 in (-1; 1)$ $ f'(x_0) = 1 / (fquer'(x_0)) = 1 / (cos(y_0)) = 1 / sqrt(1 - sin^2(y_0)) = 1 / sqrt(1 - x_0^2) $

== Satz 1.10 (Ableitung trigonometrischer Umkehrfunktionen)
Es gilt:
+ $(arcsin(x))' = 1 / sqrt(1 - x^2)$
+ $(arccos(x))' = 1 / sqrt(1 - x^2)$
+ $(arctan(x))' = 1 / (1 + x^2)$
+ $("arccot"(x))' = -1 / (1 + x^2)$

= 1.8 -- Potenzregel für rationale Exponenten
Zum Abschluss wollen wir die Potenzregel $(x_n) = n dot x^(n-1), n in NN$ auf rationale zahlen erweitern.
Der Trick ist, den rationalen Exponenten aufzuteilen:
$ x^(m/n) = x^(m dot 1/n) = (x ^ (1/n))^m $
Das ist eine verkettete Funktion.
Unbekannt ist die Ableitung einer $n$-ten Wurzelfunktion.

== Satz 1.11 (Ableitung $n$-ter Wurzelfunktion)
Die Funktion $f : [0; oo] -> [0; oo] : x |-> x^(1/n)$ mit $n in NN without {0; 1}$ ist in $x_0 in D_f$ differenzierbar mit:
$ f'(x_0) = 1/n dot x_0^(1/n - 1) $


_2026-10-15 (W42 Donnerstag)_

=== Beweis:
- $f(x) = x^(1/n) =: y$
- $fquer(x) = y^n$
- $fquer'(x) = n dot y^(n-1)$

Die Funktion $f$ ist als Wurzelfunktion auf dem Definitionsbereich $D_f$ stetig und streng monoton steigend.
Also ist $f$ nach Satz 1.8 umkehrbar. Mit Satz 1.9 folgt:
$ (f(x))'
&= 1/(fquer'(y)) \
&= 1/(fquer'(f(x))) \
&= 1/(n dot (f(x))^(n-1)) \
&= 1/(n dot x^(1/n dot (n - 1))) \
&= 1/(n dot x^(1 - 1/n)) \
&= 1/n x^(-(1 - 1/n)) \
&= 1/n x^(1/n - 1) $

== Satz 1.12 (Potenzregel für rationale Exponenten)
Sei $f$ eine Funktion mit $x |-> x^r, r in QQ$. Dann ist $f$ differenzierbar mit $f'(x) = r dot x^(r - 1)$

=== Beweis:
Da $r in QQ$, existiert $r = m/n$ mit $n in NN without {0}, m in ZZ$. Also:
$ (x^r)' = (x^(m/n))'
&= ((x^(1/n))^m)' \
&= m dot (x^(1/n))^(m-1) dot 1/n x^(1/n - 1) \
&= m/n x^((m - 1)/n) dot x^(1/n - 1) \
&= m/n x^((m - 1)/n + 1/n - 1) \
&= m/n x^((m - 1 + 1)/n - 1) \
&= m/n x^(m/n - 1) = r x^(r - 1) $


= #underline[Kapitel 2 -- Sätze über differenzierbare Funktionen]
Über differenzierbare Funktion lassen sich allgemeine Aussagen finden.

== Satz 2.1 (differenzierbare Funktionen sind stetig)
Wenn $f$ auf $[a; b]$ differenzierbar ist, so ist $f$ auf $[a; b]$ stetig.

== Beweis:

$ & lim_(x->x_0) (f(x_0) - f(x)) / (x_0 - x) = f'(x_0) \
<=>& lim_(x->x_0) ((f(x_0) - f(x)) / (x_0 - x) - f'(x_0)) = 0 \
$

Da $f'(x_0)$ nicht von $x$ abhängt. Da $x_0 - x != 0$ ist, folgt: $
<=>& lim_(x->x_0) ((f(x_0) - f(x) - f'(x_0) (x_0 - x)) = 0 dot (x_0 - x) \
<=>^"GWEA"& lim_(x->x_0) ((f(x_0) - f(x))) - lim_(x->x_0) (f'(x_0) (x_0 - x)) = 0 \
<=>& f(x_0) - lim_(x->x_0) f(x) - 0 = 0 \
<=>& lim_(x->x_0) f(x) = f(x_0) $
Also ist $f$ stetig.

...

Im folgendem benötigen wir diese zwei Sätze:

== Satz 2.2 (stetige Funktion auf $[a; b]$)
Ist $f$ auf $[a; b]$ stetig, so ist $f$ dort beschränkt.

=== Beweis:
Nein.

== Satz 2.3 (Satz von Weierstraß)
Ist $f$ auf $[a; b]$ stetig, so nimmt $f$ auf $[a; b]$ Maximum und Minimum an.
// Graph: ...

=== Beweis:
Nein.
