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
	?h1<-(padre ?j ?i)
	?h2<-(madre ?k ?i)
	(test (= ?j ?x))
	(test (= ?k ?y))
	(not(test (= ?z ?i)))
	(test (eq ?u h))
	=>
	(assert (hermano ?z ?i)))

(defrule hermana
	(dd ?x ?y ?z ?u)
	?h1<-(padre ?j ?i)
	?h2<-(madre ?k ?i)
	(test (= ?j ?x))
	(test (= ?k ?y))
	(not (test (= ?z ?i)))
	(test (eq ?u m))
	=>
	(assert (hermana ?z ?i)))
	
(defrule abuelo
	(padre ?u ?v)
	(padre ?v ?y)
	=>
	(assert(abuelo ?u ?y))
)

(defrule abuela
	(madre ?u ?v)
	(madre ?v ?y)
	=>
	(assert(abuela ?u ?y))
)
	


(defrule primo
	/* 
	 dd juan maria rosa m 
	*/
	(dd ?x ?y ?z ?u) ;; Coger de la memoria de trabajo

	(padre ?a ?z) ;; coger el padre de la hija
	(madre ?b ?z) ;; coger la madre de la hija

	?hermanosPadre<-(hermano ?c ?a)
	?hermanosMadre<-(hermano ?d ?b)
	
	?hijoHermanoPadre<-(hijo ?x ?c)
	?hijoHermanoMadre<-(hijo ?y ?d)

	=> 
	(assert(primo ?x ?z))
	(assert(primo ?y ?z))
)
	
(reset)
(run)
(facts)
(rules)
