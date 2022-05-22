module Spec where

import PdePreludat hiding (foldr, sum, elem, all, any, Number(..), ($))
import Prelude (foldr, sum, elem, all, any)
import Library
import Test.Hspec
import Control.Exception (evaluate)

hoja :: a -> ArbolBinario a
hoja valor = ArbolBinario valor Vacio Vacio

correrTests = hspec $ do
  describe "$ aplica un parametro a una funcion" $ do
    length $ "hola" `shouldBe` 4
    (3 *) $ 9 `shouldBe` 27
    
  describe "foldr" $ do
    it "cuando el arbol tiene solo la raiz opera la semilla con la raiz" $ do
      foldr (+) 2 (hoja 5) `shouldBe` 7
    it "cuando el arbol tiene hijos los foldea segun la funcion dada" $ do
      foldr (*) 2 (ArbolBinario 5 (hoja 5) (hoja 3)) `shouldBe` 150
    it "cuando el arbol tiene subarboles los foldea segun la funcion dada" $ do
      foldr (++) "." (ArbolBinario "hola" (ArbolBinario "," (ArbolBinario " " (hoja "como") (ArbolBinario (hoja "va") (hoja "?"))
                                          (ArbolBinario " " (ArbolBinario "yo" (hoja " ") (hoja "todo")) (ArbolBinario " " (hoja "bien") Vacio) `shouldBe` "hola, como va? yo todo bien."
    it "las funciones basadas en el foldr tambien funcionan correctamente" $ do
      sum (ArbolBinario 5 (hoja 5) (hoja 3)) `shouldBe` 13
      elem "todo" (ArbolBinario "hola" (ArbolBinario "," (ArbolBinario " " (hoja "como") (ArbolBinario (hoja "va") (hoja "?"))
                                          (ArbolBinario " " (ArbolBinario "yo" (hoja " ") (hoja "todo")) (ArbolBinario " " (hoja "bien") Vacio) `shouldBe` True
      all ((> 2).length) (ArbolBinario "hola" (ArbolBinario "," (ArbolBinario " " (hoja "como") (ArbolBinario (hoja "va") (hoja "?"))
                                          (ArbolBinario " " (ArbolBinario "yo" (hoja " ") (hoja "todo")) (ArbolBinario " " (hoja "bien") Vacio) `shouldBe` False
