# Tweaks performed:
  * none of the following are intended to alter the semantics of the snippet in any way.
  * some of the following are necessary to interface to Soot PPA, which cannot handle Java features introduced after 1.4
  * some of them are simply necessary to deal with oddities in snippet syntax

## Soot PPA Requirements:

### Annotations:
  sed '/@/d'

### Generics:
  * for this one it is assumed that there are max 2 instances of <.*> generic syntax per line
  sed 's/<[^<>]*>//' | sed 's/<[^<>]*>//'

## Random Oddities:

### Imports:
  * all of the actual imports are also collected to determine what extra imports should be added to heurisitc list. these are removed because with wrap technique they would otherwise be in the wrong place.
  sed '/import/d'

### Elipses:
  * these end up in quite a few snippets, here we remove the entire line containing one
  sed '/\.\.\./d'

### Packages:
  * not relevant here
  sed '/package/d'