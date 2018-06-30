# SuperImposed [Window] Frames - siframes

This mod provides a small assortment of window frames that can be added to any xpane-like
glass surface. The object itself is shifted relatively to the placing position, so the result
is both objects sharing the same space, as if the glass is inside the frame. While this isn't
particularly useful with obsidian glass, regular and stained glass types produce the desired
effect.

So far only wooden frames have been added. Supported mods: default, ethereal, maple.

Regular square frame (□):

```
stick, stick, stick
stick, %wood_planks%, stick
stick, stick, stick
```

Quartered square frame (□ + ➕):

```
"", stick, ""
stick, %wood_planks%, stick
"", stick, ""
```

Diagonally quartered frame (□ + ✕):

```
stick, "", stick
"", %wood_planks%, ""
stick, "", stick
```