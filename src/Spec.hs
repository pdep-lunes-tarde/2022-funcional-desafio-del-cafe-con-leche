module Spec where

import PdePreludat hiding (foldr, sum, elem, all, any, Number(..), ($))
import Prelude (foldr, sum, elem, all, any)
import qualified Prelude as P
import Library
import Test.Hspec
import Control.Exception (evaluate)

correrTests = hspec P.$ do
  it "$ aplica un parametro a una funcion" P.$ do
    length $ "hola" `shouldBe` 4
    (3 *) $ 9 `shouldBe` 27
    
  describe "foldr" P.$ do
    it "cuando el arbol tiene solo la raiz opera la semilla con la raiz" P.$ do
      foldr (+) 2 (hoja 5) `shouldBe` 7
    it "cuando el arbol tiene hijos los foldea segun la funcion dada" P.$ do
      foldr (*) 2 (ArbolBinario 5 (hoja 5) (hoja 3)) `shouldBe` 150
    it "cuando el arbol tiene subarboles los foldea segun la funcion dada" P.$ do
      foldr (++) "." (ArbolBinario "hola" (ArbolBinario "," (hoja " ") (ArbolBinario "como" (hoja "va") (hoja "?")))
                                          (ArbolBinario " " (ArbolBinario "yo" (hoja " ") (hoja "todo")) (ArbolBinario " " (hoja "bien") Vacio))) `shouldBe` "hola, como va? yo todo bien."
    it "las funciones basadas en el foldr tambien funcionan correctamente" P.$ do
      sum (ArbolBinario 5 (hoja 5) (hoja 3)) `shouldBe` 13
      elem "todo" (ArbolBinario "hola" (ArbolBinario "," (hoja " ") (ArbolBinario "como" (hoja "va") (hoja "?")))
                                          (ArbolBinario " " (ArbolBinario "yo" (hoja " ") (hoja "todo")) (ArbolBinario " " (hoja "bien") Vacio))) `shouldBe` True
      all ((> 2).length) (ArbolBinario "hola" (ArbolBinario "," (hoja " ") (ArbolBinario "como" (hoja "va") (hoja "?")))
                                          (ArbolBinario " " (ArbolBinario "yo" (hoja " ") (hoja "todo")) (ArbolBinario " " (hoja "bien") Vacio))) `shouldBe` False
