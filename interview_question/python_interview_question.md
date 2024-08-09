Python 
1.	What is init keyword ?
> In Python, the "*__ __init__ __*" method is a special method of a class. It's often referred to as a constructor in object-oriented terminology. This method is automatically called when a new instance (object) of a class is created. It is typically used to initialize the attributes of the new object. 

2.	What is self keyword ?
> In Python, the *__self__* keyword is used in object-oriented programming to refer to the instance of the class. It is used within methods to access variables that belong to the class. It’s not a reserved keyword in Python, but it’s a strong convention to use it as the first parameter in methods within a class. 

> Here's what self does:
>- Represents the Instance: self is a reference to the current instance of the class, and it is used to access variables and methods associated with the current object.
>- Accessing Attributes and Methods: Use self to access or modify the class state in other methods of the class.
>- Distinguishing between Instance Variables and Method Arguments: self clarifies which variables are instance variables and which are method parameters.

3.	What is lambda functon?

> A lambda function in Python is a small anonymous function defined with the keyword *__lambda__*. Lambda functions can have any number of arguments but only one expression, which is evaluated and returned. They are syntactically restricted to a single expression. Using lambda functions can make your code more concise and can be useful for short, simple functions that are easier to define in one line.


4.	Difference between lambda and normal function?
- Syntax:

  - Lambda Function: Defined using the lambda keyword, lambda functions are written in a single line. Syntax: lambda arguments: expression.
  - Normal Function: Defined using the def keyword and can comprise multiple expressions over multiple lines.

- Expression Limitations
  - Lambda Function: Limited to a single expression. This expression is automatically returned.
  - Normal Function: Can have multiple expressions and statements, including loops, multiple return statements, etc.

- Return Statement:
  - Lambda Function: Automatically returns the result of the expression; no explicit return statement is needed.
  - Normal Function: Can explicitly return values with the return statement; can also return multiple values, return complex objects, or not return anything at all (None is returned implicitly).

- Use Case:
  - Lambda Function: Ideal for simple functionalities that are easily expressed in one line, often used where functions are used temporarily or for a short duration, especially with functions like map(), filter(), and sorted().
  - Normal Function: Used for more complex operations, including procedures involving multiple steps, loops, conditionals, and more extensive logic.

- Anonymity:
  - Lambda Function: Anonymous by nature, meaning that the function does not need to be named (although it can be assigned to a variable).
  - Normal Function: Typically defined with a name (although it can be anonymous with the use of def in specific constructs).

- Debugging:
  - Lambda Function: Can be more difficult to debug because of its compact form; errors or issues might be harder to trace.
  - Normal Function: Easier to debug, especially with complex logic, since you can place multiple breakpoints and inspect different parts of the function.

5.	What are generators? When to use ? share one example

> Generators in Python are a special type of iterator that generate values on the fly, meaning they yield a sequence of values over time rather than storing them all in memory at once. This makes them particularly useful when working with large datasets or streams of data where you want to minimize memory consumption.

- Characteristics of Generators:
  1. Lazy Evaluation: Generators produce items only one at a time and only when requested, which is known as lazy evaluation. This is efficient because it only produces the items as needed.

  2. Memory Efficient: Since they yield one item at a time, they don't hold the entire list of items in memory. This can lead to significant memory savings when dealing with large datasets.

  3. Stateful: Generators maintain state between yields. They remember where they left off including variable values, which allows them to produce the next value when the generator is resumed.

  4. Iterate Once: A generator can only be iterated over once. After all values have been yielded and the generator exits, it is considered exhausted and cannot be reused.

- When to Use Generators:
  - Handling Large Datasets: When processing large datasets that don’t fit into memory, such as logs or large arrays of data.

  - Stream Processing: When dealing with real-time data streams, where you want to process data as it comes in without waiting for the complete dataset.

  - Performance Optimization: When performance matters and you want to keep memory overhead low or when generating a sequence of results that might not all be needed, thus saving computation time.

  - Pipelining Operations: Generators can be easily pipelined, meaning you can chain them together. For example, you can have a pipeline of filters and transformations for data processing that are efficiently executed.


6.	Python is compiled or interpreted language ? what does it mean?
7.	What is the difference between list and tuples in Python?
8.	What is the difference between list and set in Python?
9.	When to use dictionary?
10.	What are decorators? When to use ? share one example
11.	What are Iterators?
12.	What is slicing?
13.	What is mutable and immutable?
14.	Python is single thread or multithread?
15.	What is GIL
16.	What you don’t like about python?
17.	What is list Comprehension?
18.	What are Dunder methods? Give examples
19.	What does _init_ method do?
20.	Difference between array and numpy library.