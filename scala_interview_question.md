# Scala
### 1.	What is a trait ? when to use ?  example
> Traits cannot be instantiated but it can be interited by other traits or classes.  Also, one trait can inherit from one class but multiple traits. If multiple traits have the same method, when we call the method, we will call the method from the last trait. With trait we can avoid diamond error.

### 2.	Difference between trait and sealed trait?
> A sealed trait can only be extended in the same file where it was defined.

3.	What is an abstract class? 
> An abstract class is a class whose variables or methods are declared but not specified or implemented. Thus an abstract class cannot be initiated. Usually an abstract class should be inherited, can specification or implmentation of the variables and methods are given in the subclasses.

4.	What is the difference between  java interface and a scala trait?
>  Methods in Scala traits can be either abstract or non-abstract, but in Java, it has to be abstract. Scala traits admit constructor parameters, but Java interfaces don't. 

5.	What is a singleton?
> In Scala a singleton is a class that has at most one instance. It's defined with keyword __object__. The instance is created lazily only when being referenced somewhere else. Singletons don't have constructors.

6.	What is a higher order function?

> A function in scala is called higher order if it meets at least one of the following:
>- Some parameters of it are functions.
>- The function returns a function

7.	What is a closure function?
> In Scala, a closure is a function whose return value depends on some variable(s) defined outside the function.

8.	What is a companion object? What are the advantages ? example
>

9.	Nil vs Null vs null vs Nothing vs None vs Unit 
> __*null*__ represents the absent value of a reference that is not referring to any object.

> __*Null*__ is the type of **null**, which extends all traits and classes, which allows us to use **null** value for any reference type. **Null** is a _final_ abstract class, which cannot be extended or instatiated, and **null** the one and the only one instance of **Null** 

> __*Nil*__ is the an empty singleton object that extends _List_ type. It's often used to initialize empty lists.

>__*None*__ is a subtype of _option_ type.

>__*Unit*__ is the return type of functions returning nothing.

>__*final class*__

>__*option type*__

10.	What is pure function?
11.	What is SBT and how have you used it? 
12.	What is currying?
13.	Difference between currying and higher-order functions
14.	Difference between var and val?
15.	What is case class?
16.	Why/when to use case class? Example
17.	Difference between case class and normal class?
18.	Scala type hierarchy?
19.	What are partially applied functions?
20.	What is tail recursion.