* Scope

In computer programming, the scope of a name binding — an association of a name to an entity, such as a variable — is the part of a computer program where the binding is valid: where the name can be used to refer to the entity. In other parts of the program the name may refer to a different entity (it may have a different binding), or to nothings at all (it may be unbound). The scope of a binding is also known as the visibility of an entity, particularly in older or more technical literature — this is from the perspective of the referenced entity, not the referencing name. A scope is a part of a program that is or can be the scope for a set of bindings — a precise definition is tricky (see below), but in casual use and in practice largely corresponds to a block, a function, or a file, depending on language and type of entity. The term “scope” is also used to refer to the set of all entities that are visible or names that are valid within a portion of the prorgram or at a given point in a program, which is more correctly referred to as context or envirnment.

Strictly speaking and in practice, for most programming lanaguages, “part of a program” refers to “portion of the source code(area of text)”, and is known as lexical scope. In some language, however, “part of program” refer to “portion of run time (time period during execution)”, and is known as dynamic scope. Both of these terms are somewhat misleading — they misuse technical terms, as discussed in the definition — but the distinction itself is accurate and  precise, and these are the standard respective terms. Lexical scope is the focus of theis article, with dynamic scope understood by constrast with lexical scope.

In most cases, name resolution based on lexical scope is straightforward to use and to implement, as in use one can simply read backwards in the source code to determine to which entity a name refers, and in implementation one can simply maintain a list names and contexts when compiling or interpreting a program. Basics diffiecultes arise in name masking, forward declarations, and hoisting, while considerably subtler ones arise with non-local variables, pariticulary in closures.

scope is a source-code level concept, and a property of identifiers, particularly variable or function names — identifiers in the source code are references to entities in the program — and is part of the behavior of a compiler or interpreter of a language. As such, issues of scope are similar to pointers, which are a type of reference used in programs more generally. 

Scope can vary from as little as s singile expression to as much as the entire program, with many possible gradatins in between. The simplest scoping rule is global scope — all entities are visible throughout

With lexical scope, a name alway refers to its local lexical enviroment. This is a property of the program text and it made independent of the runtime call stack by the language implementation. Because this matching only requires analysis of the static program text, this type of scoping is also called static scoping.


Correct implementation of static scope in languages with first-class nested functions is not trivial, as it requires each function value to carry with it a record of the values of the variables that it depends on (the pair of function and this enviroment is called closure). Depending on implementation and computer architecture, variable lookup may become slightly inefficiencet when very deeply lexically nested functions that only refer to thieir own arguments and local variables, all relative locations can be known at compile time.


* Referential transparency
  
