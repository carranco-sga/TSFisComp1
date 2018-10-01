module Newton
"""
    newton(f, fprime, x0, número_iteraciones, tolerancia)

`newton` es una implementación unidimensional compleja del método de Newton para encontrar raíces de la función `f`.

# Argumentos

Para poder utilizar la función se requieren los siguientes argumentos:

* `f`, la función compleja (real) de variable compleja (real) de la que se quiere buscar una raíz (un punto \$ a \$ tales que \$ f(a) = 0 \$),
* `f_prime`, la función derivada de `f`, y,
* `x0`, una adivinanza inicial sobre la posición de la raíz.

Opcionalmente, se puede especificar lo siguiente:

* `número_iteraciones`, el número de iteraciones a realizar. (Por defecto está configurado en 1000 iteraciones.)
* `tolerancia`, la diferencia máxima entre valores sucesivos de la iteración para devolver el valor final. (Por defecto está configurada en 1e-8.)

`newton` requiere que tanto `f` como `fprime` sean funciones, que `x0` sea un número, que `número_iteraciones` sea un número entero y que `tolerancia` sea un real. `x0`, en particular, siempre es convertida a un número flotante para mejorar la estabilidad de tipo.

# Ejemplos
```julia-repl
    julia> newton(x -> x^2 - 2, x -> 2*x, 2, 5)
    1.4142135623730951

    julia> newton(x -> x^2 - 2, x -> 2*x, 1.4, 100)
    1.414213562373095

    julia> newton(x -> x^2 - 2, x -> 2*x, MathConstants.φ, 1)
    No hay convergencia con tolerancia = 1.0e-8. diferencia = 0.19098300562505255

    julia> newton(x -> x^2 - 2, x -> 2*x, MathConstants.φ, 10)
    1.414213562373095

    julia> newton(z -> z^2 + 1, z -> 2*z, -0.1*im, 5, 1e-1)
    0.0 - 1.0032578510960606im

    julia> newton(z -> z^2 + 1, z -> 2*z, -0.1*im, 10)
    0.0 - 1.0im
```
"""
function newton(f::Function, fprime::Function, x0::Number, número_iteraciones::Int = 1000, tolerancia::Real = 1e-8)
    
    punto_anterior = 0
    punto_actual = float(x0)
    
    for i in 1:número_iteraciones
        
        punto_anterior = punto_actual
        punto_actual -= f(punto_actual)/fprime(punto_actual)
    end
    
    diferencia = abs(punto_anterior - punto_actual)
    
    if diferencia < tolerancia
        
        return(punto_actual)
        
    else
        
        error("No hay convergencia con tolerancia = $tolerancia. diferencia = $diferencia")
    end
end

#Exporta la función:

export newton

end