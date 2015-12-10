(deffacts inicio
    (dd juan maria rosa m)
    (dd juan maria luis h)
    (dd jose laura pilar m)
    (dd luis pilar miguel h)
    (dd miguel isabel jaime h))

(defrule padre
    (dd ?x ? ?y ?)
    =>
    (assert (padre ?x ?y)))

(defrule madre
 	(dd ? ?x ?y ?)
 	=>
 	(assert(madre ?x ?y)))

(defrule hijo
 	(dd ?y ?z ?x ?s)
 	(test (eq ?s h))
 	=>
 	(assert (hijo ?x ?y))
 	(assert (hijo ?x ?z)))

(defrule hija
 	(dd ?y ?z ?x ?s)
 	(test (eq ?s m))
 	=>
 	(assert (hija ?x ?y))
 	(assert (hija ?x ?z)))

(defrule hermano
 	(dd ?x ?y ?z ?u)
	;;?h1<-(padre ?j ?i) asigna el hecho (padre ?j ?i) a variable ?h1
	;;?h2<-(madre ?k ?i)
	(test(= ?j ?x))
	(test(= ?k ?y))
	(test(eq ?u h))
	=>
	(assert hermano ?z ?i))
/*
(defrule hermana
	(dd ?x ?y ?z ?u)
	?h1<-(padre ?j ?i)
	?h2<-(madre ?k ?i)
	(test(= ?j ?x))
	(test(= ?k ?y))
	(test(eq ?u m))
	=>
	(assert hermana ?z ?i))
*/

(reset)
(run)
(facts)
(rules)
