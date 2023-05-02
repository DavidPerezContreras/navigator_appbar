#Nested Navigator.

El código de este ejemplo muestra cómo resolver cuando queremos llamar a Navigator.push desde un padre mientras que el context sólo se propaga
de arriba a abajo en el arbol de widgets.

En el widget padre debemos crear un Globalkey que será el que le pasaremos al constructor Navigator(key:globalKey),
Y al mismo tiempo utilizaremos ese globalKey para hacer que el Navigator hijo navegue al widget o NamedRoute que queramos desde el código del Padre. (onTap del BottomNavigationBarpor ejemplo, o incluso desde el Appbar)


En este Ejemplo tenemos un Scaffold en el que el Body es un Navigator pero queremos hacer que dicho Navigator navegue hacia otras rutas desde el BottomNavigationBar,
el cual es un Widget que pertenece al padre en el árbol de Widgets.