module Library where
import PdePreludat hiding (foldr, sum, elem, all)
import Prelude (foldr, sum, elem, all, Foldable(..))

-- Desafío, implementar la función aplicación, que recibe una función y un valor y aplica el valor como parámetro a la función.
-- El desafío es que hay que implementarlo sin escribir parámetros, ni usar lambdas ni definir funciones auxiliares.
-- Por ej., estas definiciones NO valen:
-- ($) funcion valor = funcion valor -- porque estan los parametros
-- ($) = \funcion valor -> funcion valor -- porque esta usando una lambda
-- aplicar funcion valor = funcion valor -- porque se esta definiendo una funcion auxiliar 
-- ($) = aplicar
-- Tampoco vale importarlo (ahora se está no importando al hacer hiding (($)))

($) :: (a -> b) -> a -> b
($) = implementame

--------------------------------------------------------------------

-- Desafio 2: Foldr para arbol B
--
-- En computación, un arbol binario es un árbol donde cada nodo puede tener 0, uno o dos hijos.

data ArbolBinario a = ArbolBinario a (ArbolBinario a) (ArbolBinario a) | Vacio

-- Entonces, si quisiesemos representar un arbol como este:
--            "hola"
--           /   |
--       "soy" "el"
--              /\
--        "arbol" "binario"
--                  /
--               "."
-- lo podríamos escribir como:
holaSoyElArbol :: ArbolBinario String
holaSoyElArbol = ArbolBinario "hola" (ArbolBinario "soy" Vacio Vacio)
                                     (ArbolBinario "el" (ArbolBinario "arbol" Vacio Vacio)
                                                        (ArbolBinario "binario" (ArbolBinario "." Vacio)
                                                                                Vacío))

-- Algo que no vimos durante la cursada es que foldr en realidad es parte de una typeclass,
-- Foldable, o sea que no solo las listas se pueden foldear.
--
-- Como en el PdePreludat limitamos el tipo a que solo admita listas para hacerlo más simple,
-- en este ejercicio los imports están un poco tocados para traer el foldr que viene de haskell
-- en vez del del PdePreludat.
--
-- El desafío es hacer una implementación del foldr para esta estructura que haga pasar los tests.
--
-- Y algo interesante es que al implementar el foldr algunas funciones (como sum, all, any y elem)
-- las vamos a tener "gratis" para este tipo.

-- Nota: hay 3 implementaciones validas para el foldr, cada una va a hacer que el arbol se recorra
-- de una forma diferente: prefija, infija o postfija. Cualquier forma es válida para resolver
-- el desafío.
instance Foldable ArbolBinario where
  foldr = implementame
