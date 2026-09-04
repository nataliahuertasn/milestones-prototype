# Milestones — Scopes, Type of Scope, Budget y Phase Weight

Maqueta navegable y análisis técnico para el rediseño de la vista **Milestones**
de Project Agenda.

## Contenido

| Archivo | Qué es |
| --- | --- |
| `milestones-prototype.html` | Maqueta navegable. Se abre directamente en el navegador, sin servidor ni dependencias. |
| `milestones-analysis.html` | Análisis técnico previo a la implementación: arquitectura actual reconstruida, fórmulas de progreso recuperadas, modelo de datos propuesto, riesgos y plan por etapas. |

Ambos son HTML autocontenidos. Ábrelos con doble clic.

## Qué cubre la maqueta

**Vista Milestones del proyecto** (icono ▤)

- Arranca vacía: ya no carga items automáticamente.
- Alerta de items pendientes de asignación, calculada en vivo, con acción *Review*.
- Scopes creados por el Project Manager, con nombre, Type of Scope e items.
- Estructura de dos niveles con expandir/contraer; los scopes abren recogidos.
- Columna **Budget** con el desglose de Engineering & Design (Calculations,
  Design, Project Manager) por item y consolidado.
- Todas las celdas de avance nacen en `+`: el avance siempre lo diligencia el usuario.

**Settings › Quotes** (icono ⚙)

- Pestaña *Milestones*: catálogo de fases con la nueva columna **Weight (%)**,
  edición en línea y total corrido con aviso cuando no suma 100.
- Pestaña *Product Types*: catálogo que alimenta el desplegable Type of Scope.

**Barra superior oscura** (solo maqueta, no es parte del producto)

- `Notas de spec` — muestra las reglas de negocio de cada pantalla.
- `Celda: %` — alterna entre mostrar porcentaje o fecha en la celda.
- `Reiniciar datos` · `Ver estado vacío`.

## Fórmulas implementadas

Recuperadas de los mockups de julio y verificadas aritméticamente:

```
progress(item)   = Σ(porcentaje × peso_fase) ÷ Σ(pesos)
scope.fase%      = Σ(porcentaje × precio_item) ÷ Σ(precio_item)
```

El consolidado del scope es un promedio **ponderado por precio**, no simple.
Los items con precio ≤ 0 quedan fuera del denominador.

## Decisiones pendientes de confirmación

1. Confirmar que `PRODUCT TYPES` es el catálogo que el brief llama *Type of Scope*.
2. Celda de avance: ¿muestra porcentaje o fecha?
3. ¿Un item puede pertenecer a más de un scope? (la maqueta asume que no)
4. Avance a nivel de scope: ¿carga masiva hacia los items, o valor propio?
5. Tratamiento de items cancelados con precio negativo.
6. Validación de la suma de weights.
7. Nombre definitivo de las entidades en el modelo de datos tras el renombre
   Group → Scope y Scope → Item.

El detalle de cada una está en `milestones-analysis.html`.

## Aviso

El análisis se hizo **sin acceso al código fuente**. La arquitectura actual está
reconstruida a partir de capturas de la aplicación, así que todo lo descrito
como "actual" debe verificarse contra el repositorio real antes de implementar.
