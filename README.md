# SuperImposed [Window] Frames - si_frames

This mod provides a small assortment of window frames that can be added to any xpane-like
glass surface. The object itself is shifted relatively to the placing position, so the result
is both objects sharing the same space, as if the glass is inside the frame. While this isn't
particularly useful with obsidian glass, regular and stained glass types produce the desired
effect.

So far only wooden frames have been added. Supported mods: default, ethereal, maple.

![Aspen and acacia frames](https://github.com/h-v-smacker/si_frames/blob/master/screenshot.jpg)

How to use:
Stand in front of the glass pane and place the frame on it. To remove, use the hitbox
that will appear in front of the glass. It is slightly smaller than a regular node box to
make it easier to tell apart.

Regular square frame (▢):

```
stick,   stick,            stick
stick,   %wood_planks%,    stick
stick,   stick,            stick
```

Quartered square frame (▢ + ✛):

```
"",      stick,            ""
stick,   %wood_planks%,    stick
"",      stick,            ""
```

Diagonally quartered frame (▢ + ✕):

```
stick,   "",               stick
"",      %wood_planks%,    ""
stick,   "",               stick
```

Rhombus frame (▢ + ◇):

```
"",      stick,            stick
"",      %wood_planks%,    ""
stick,   stick,            ""
```