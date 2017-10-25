# Sourcery

## Overview

Let's talk about generating Swift code from Swift code. Yes, we can.  
![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRPJzc7eFrCUZk8NaVDxR6LIJ8ht-_BuJf-KJeEcqB8sDfWhCfA)

### Why

  - Prevents typing errors
  - Constants
  - No more maintenance
  - Dev time goes down
  - Productivity goes up
  - Completely avoid boiler plate code

### What

  - JSON serialization
  - Mocks, Stubs
  - AutoEquatable
  - White labelling
  - Too many to list here...
  - Anything else you can think of that works for you...

Oh, I almost forgot... Converting Swift code into Java/Kotlin code XD  
![](http://troll-face.org/troll.jpg)

## Inner Workings

### SourceKitten

Everything starts with [SourceKitten](https://github.com/jpsim/SourceKitten). What is [SourceKitten](https://github.com/jpsim/SourceKitten), you ask?

> An adorable little framework and command line tool for interacting with `SourceKit`.
> SourceKitten links and communicates with `sourcekitd.framework` to parse the Swift AST, extract comment docs for Swift or Objective-C projects, get syntax data for a Swift file and lots more!

What is [AST](https://en.wikipedia.org/wiki/Abstract_syntax_tree)?

> In computer science, an abstract syntax tree (AST), or just syntax tree, is a tree representation of the abstract syntactic structure of source code written in a programming language. Each node of the tree denotes a construct occurring in the source code. The syntax is "abstract" in not representing every detail appearing in the real syntax. 

![](http://www.eclipse.org/articles/Article-JavaCodeManipulation_AST/images/java-model-overview.png)

Consdier this example:

```swift
struct Cube {

    let color: UIColor
    var segmentLength: Double

    func scale(to length: Double) {
        segmentLength = length
    }

}
```

In this case, the AST is what tells you the following (pseudo result, just an example):

- `struct` keyword found at location `line 0 : column 0`
  - name of `struct` found at location `line 0 : column 7`
  - name of `struct` is `Cube`
  - properties of `struct`
    - `property` of `struct` found at location `line 2 : column 4`
      - name of `property` is `color`
      - type of `property` is `UIColor`
      - modifier acces is `constant`
    - `property` of `struct` found at location `line 3 : column 4`
      - name of `property` is `segmentLength`
      - type of `property` is `Double`
      - modifier acces is `variable`
  - functions of `struct`
    - `function` of `struct` found at location `line 5: column 4`
      - name of `function` is `scale(to:)`
      - `return` value of `function` is `Void`
      - parameters of `function`
        - `parameter` of `function` is named `to`
        - `parameter` of `function` is of type `Double`

In essence, the AST is what helps you identified what is where. What (v)

### Stencil

We can't be talking about code generation without talking about templates. The templating system being used by [Sourcery](https://github.com/krzysztofzablocki/Sourcery) is [Stencil](https://github.com/kylef/Stencil).

You can find details docs on how to write templates [here](http://stencil.fuller.li/en/latest/). A few quick examples:

```stencil
{{variable}} // outputs variable
  e.g. CocoaHeads Ottawa gets together every {{frequence}} weeks.
    // CocoaHeads Ottawa gets together every 4 weeks.

{% if condition %} TRUE {% else %} FALSE {% endif %}
  e.g. {% if true %} iOS is better than Android {% else %} Did you really think this would be executed? {% endif %}

{% for item in items %} // do something with item {% endfor %}
  e.g. {% for item in items %} {{item.name}} {% endfor %}

{# My comment is completely hidden #}

{{ "stencil"|capitalize }}          // e.g. Stencil
{{ "stencil"|uppercase }}           // e.g. STENCIL
{{ "STENCIL"|capitalize }}          // e.g. stencil
{{ ""|default:"Hello, World!"}}     // e.g. Hello, World!
```

### StencilSwiftKit

[StencilSwiftKit](https://github.com/SwiftGen/StencilSwiftKit) builds on top of [Stencil](https://github.com/kylef/Stencil) by adding extra functionality such as:

```stencil
-- Macros --
Very useful in loops and self contained if checks:
  {% macro YouRock name %} You rock, {{name}}! {% endmacro %}
  {% call "Apple" %}

-- Set --
Very useful in loops and capturing the result of an if check:
  {% set optionalMarker %}
    {% if variable.isNil %}?{% endif %} // e.g. var myString: String?
  {% endset %}
  {{variable.name}}{{optionalMarker}} // e.g. myString?
```

There many other things that are added to [Stencil](https://github.com/kylef/Stencil), check out the StencilSwiftKit [docs](https://github.com/SwiftGen/StencilSwiftKit/tree/master/Documentation).

# Demo

Enough talking, nothing explains it better than seeing it in action.

# Other Sourcery Projects

- SwiftGen
