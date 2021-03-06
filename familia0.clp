(deffacts inicio
    (dd juan maria rosa m)
    (dd juan maria luis h)
    (dd jose laura pilar m)
    (dd luis pilar miguel h)
    (dd miguel isabel jaime h)
    (dd pedro rosa pepe h)
    (dd pedro rosa pura m))

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
	(padre ?j ?i)
	(madre ?k ?i)
	(test (= ?j ?x))
	(test (= ?k ?y))
	(not(test (= ?z ?i)))
	(test (eq ?u h))
	=>
	(assert (hermano ?z ?i)))

(defrule hermana
	(dd ?x ?y ?z ?u)
	(padre ?j ?i)
	(madre ?k ?i)
	(test (= ?j ?x))
	(test (= ?k ?y))
	(not (test (= ?z ?i)))
	(test (eq ?u m))
	=>
	(assert (hermana ?z ?i)))
  
(defrule abuelo
	(padre ?u ?v)
	(or (padre ?v ?y) 
	(madre ?v ?y))
	=>
	(assert(abuelo ?u ?y))
)

(defrule abuela
	(madre ?u ?v)
	(or (padre ?v ?y) 
	(madre ?v ?y))
	=>
	(assert(abuela ?u ?y))
)

(defrule primo
	(or(hijo ?x ?y) (hija  ?x ?y))
	(or (hermano ?y ?z) (hermana ?y ?z))
	(hijo ?u ?z)
	=>
	(assert (primo ?u ?x))
)

(defrule prima
	(or(hijo ?x ?y) (hija  ?x ?y))
	(or (hermano ?y ?z) (hermana ?y ?z))
	(hija ?u ?z)
	=>
	(assert (prima ?u ?x))
)

(defrule ascendiente
	(or (or (padre ?x ?y) (madre ?x ?y)) 
	(and (ascendiente ?x ?z) (or (padre ?z ?y) (madre ?z ?y))))
	=>
	(assert(ascendiente ?x ?y))
)


(reset)
(run)
(facts)
(rules)
