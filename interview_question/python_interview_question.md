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

> Python is often described as an interpreted language, but more precisely, it's both compiled and interpreted. Here's a breakdown of what this means:
>
> Compiled and Interpreted:
>
> - Compilation Step:
>
>   - Python Code Compilation: When you write Python code, the Python interpreter first compiles this code into what is known as bytecode. This is a lower-level, platform-independent representation of your source code. This compilation step is internal and automatic.
>   - Bytecode: The bytecode is not the binary machine code and cannot be directly executed by the CPU. It's a set of instructions for a virtual machine, specifically the Python Virtual Machine (PVM).
>
> - Interpretation Step:
>
>   - Running Bytecode: After compilation to bytecode, this bytecode is then interpreted by the Python interpreter. The Python interpreter reads the bytecode, which is then executed on the Python Virtual Machine.
>   - Interpreted Nature: This means that Python code is executed line by line, which can be slower compared to fully compiled languages like C or C++ where the source code is directly compiled into machine code that the CPU can execute.

- Compiled Languages
   - Definition: A compiled language is one where the source code written by the developer is translated (compiled) into machine code by a compiler before it is executed by the hardware. This machine code is specific to the target machine's architecture.

   - Process:

     - Compilation: The entire program is compiled into machine code at once, creating an executable file.
     - Execution: The executable file can then be run on any compatible machine without the need for the compiler or the original source code.

- Interpreted Languages
  - Definition: An interpreted language is one where the source code is not directly compiled into machine code ahead of time. Instead, it is either interpreted line by line or compiled into a bytecode which is then interpreted by an interpreter.

  - Process:
     - Interpretation: An interpreter reads the source code, parses it, and executes it directly.
     - Runtime: The source code can be executed immediately without an explicit compilation step.

7.	What is the difference between list and tuples in Python?
> They are both sequence data types, but lists are mutable while tuples are immutable.

8.	What is the difference between list and set in Python? 

> In Python, both lists and sets are built-in data types that are used to store collections of items. 
>
> - Order
>   - Lists maintain the order of the elements. You can access elements by their position, and the order in which elements are added is preserved.
>   - Sets do not maintain any order. The elements are unordered, and you cannot access items by an index because sets do not support indexing or slicing.
>
> - Mutability
>   - Lists are mutable, meaning that you can modify them after their creation. You can add, remove, or change items.
>   - Sets are also mutable; you can add or remove items from a set. However, you cannot change individual elements directly because sets do not support indexing.
>
> - Duplicates
>   - Lists can contain duplicate elements.
>   - Sets automatically remove duplicate elements; only unique elements are stored.

9.	When to use dictionary?

> Dictionaries in Python are extremely versatile and are often used when you need to associate keys with values. This key-value pair structure makes dictionaries ideal for specific types of tasks and data management.
>
> 1. Associative Arrays / Maps
>
>    Whenever you need a logical association between a key and a value. Keys are unique within a dictionary, making them a foundational data structure for building more complex data models.
> 2. Efficient Lookup.
>
>    Dictionaries provide very fast, efficient lookups, insertions, and deletions. If you need to frequently access elements by some identifier or key, dictionaries are the optimal choice due to their underlying hash table implementation.
>
> 3. Data Grouping
> 
>    Grouping data in a structured way, especially when each piece of data can be uniquely identified by some key.
>
> 4. Dynamic Data Storage
>
>    When you need a flexible container to store an unpredictable number of elements. Dictionaries allow adding and removing data dynamically.
>
> 5. Counter / Frequency Table
> 
>    Dictionaries can be used to count occurrences of elements, as keys can uniquely identify elements to increment their counts.
>
> 6. Configurations
> 
>    Storing settings or configurations where parameters can be fetched by key.
>
> 7. Caching Results (Memoization)
>    Storing the results of expensive function calls to avoid redundant computations, commonly used in dynamic programming.

10.	What are decorators? When to use ? share one example
> In Python, decorators are a design pattern that allows you to modify the behavior of a function or a class method with another function. Decorators are typically used to extend or alter the functionality of functions (or methods) without permanently modifying them. They achieve this by taking a function, adding some functionality to it, and returning it.
> When to Use Decorators:
> Decorators can be used in a variety of scenarios, including:
>
> 1. Logging: To add logging to functions to help with debugging.
> 2. Access Control: To enforce access control to resources or restrict function calls.
> 3. Caching/Memoization: To store results of expensive function calls and use the cached result when the same inputs occur again.
> 4. Instrumentation/Profiling: To add profiling code that measures the performance of functions.
> 5. Modification of Function Behavior: To dynamically alter the behavior of a function.
> 6. Validation: To check or sanitize the inputs to a function.

Example
```
@gfg_decorator
def hello_decorator():
    print("Gfg")
```
Above code is equivalent to -

```
def hello_decorator():
    print("Gfg")
    
hello_decorator = gfg_decorator(hello_decorator)
```
In the above code, gfg_decorator is a callable function, that will add some code on the top of some another callable function, hello_decorator function and return the wrapper function.


11.	What are Iterators?
>
> - Iterator Protocol: This is a specific set of methods (`__iter__`() and `__next__`()) that an object must implement to support iteration.
>
>   -  `__iter__`() returns the iterator object itself. This is used in for-loops and other places where a container needs to be iterated.
>   - `__next__`() returns the next item from the collection. When there are no more items to return, it raises a StopIteration exception.
>
> - Iterable: An iterable is any Python object capable of returning its members one at a time, permitting it to be iterated over in a loop. Common examples include lists, tuples, and strings. To make an object iterable, you typically define `__iter__`() in the object's class to return an iterator.
>
> - Usage: Iterators are used implicitly in a variety of contexts in Python, particularly in loops (like for-loops) or comprehensions and built-in functions like map() and filter().

Why Use Iterators?
- Memory Efficiency: They allow for the handling of data without the need to load the entire dataset into memory at once.
- Lazy Evaluation: Items are produced one at a time and only when needed, which can lead to performance increases in situations where the entire collection is not needed immediately or at all.
- Universality and Interoperability: They provide a universal way of iterating over data irrespective of the data structure.

12.	What is slicing?

> - Slicing in Python is a powerful feature that allows you to access parts of sequences such as strings, lists, tuples, and other iterable objects. It lets you create a new sublist, subtuple, or substring by specifying a range of indices.
>
> - Slicing is commonly used for:
>   - Selecting sub-parts of sequences.
>   - Reversing the order of a sequence.
>   - Skipping elements in a sequence.
>   - Trimming data to a needed subset for further processing.

13.	What is mutable and immutable?

In Python, data types are categorized into two main types based on their ability to be changed after their creation: mutable and immutable.

> - Immutable Data Types: Immutable objects cannot be changed once they are created. This means that if you try to modify an immutable object, you will not alter its contents, but rather create a new object. Common immutable types include:
>   - Integers
>   - Floats
>   - Strings
>   - Tuples
>   - Frozen Sets
>
>   When you modify an immutable object, Python actually creates a new object with the new value. For example, when you concatenate strings, Python creates a new string with the combined content because strings are immutable.
>
> - Mutable Data Types: Mutable objects, on the other hand, can be changed after they are created. This means you can modify them without creating a new object. Common mutable types include:
>
>   - Lists
>   - Dictionaries
>   - Sets
>
>    Mutable types are particularly useful when you need to change the size of the data structure or the elements contained within it without constantly creating new objects.

14.	Python is single thread or multithread?
> Python supports multithreading; however, due to the Global Interpreter Lock (GIL), Python's standard implementation, CPython, does not effectively utilize multiple cores for CPU-bound tasks. 

15.	What is GIL

> The Global Interpreter Lock (GIL) is a mechanism used in the standard implementation of Python, known as CPython, which allows only one thread to execute Python bytecode at a time. This lock is necessary because CPython's memory management is not thread-safe.

16.	What you don’t like about python?
> In python I cannot explicitly define whether a variable is a pointer or not.

17.	What is list Comprehension?
> List comprehension in Python is a concise way to create lists. It provides a syntactically more compact and readable alternative to creating lists compared to using loops and other functions. List comprehensions also tend to be more expressive and can be more efficient in terms of execution speed for creating lists.

> The basic syntax of a list comprehension is:
> 
```
 [expression for item in iterable if condition]
 ```
 - expression: An expression that produces the elements of the new list from the items in the iterable.
 - item: A variable that represents the members of the iterable.
 - iterable: A sequence (or other iterable object) that is traversed through in the comprehension.
 - condition (optional): A condition that filters items from the iterable. Only items for which the condition is true are included in the new list.


18.	What are Dunder methods? Give examples
>
> Dunder methods, short for "double underscore" methods, are special methods in Python that have names beginning and ending with double underscores (__). They are also known as magic methods or special methods. These methods are used to emulate the behavior of built-in types and to implement operator overloading, allowing objects of user-defined classes to behave like built-in types. Dunder methods let you define how operators like +, -, or * should work with your objects, among other things.
> 
> 1. `__init__(self, ...)`: Initializes a new object state.
> 2. `__str__(self)`: Returns a string representation of an object, human-readable.
> 3. `__repr__(self)`: Returns an unambiguous string representation of an object, meant for developers.
> 4. `__add__(self, other)`: Defines behavior for the addition operator +.
> 5. `__eq__(self, other)`: Defines behavior for the equality operator `==`.
> 6. `__len__(self)`: Returns the length of the container.
> 7. `__getitem__(self, key)`: Allows an object to use subscript notation (`obj[key]`).
> 8. `__setitem__`(self, key, value): Assigns a value to a key using subscript notation.

19.	What does _init_ method do?
20.	Difference between array and numpy library.
> The terms "array" and "numpy" in Python refer to different concepts and tools used for data handling and computation, especially in scientific computing contexts.
> 
> - Python Arrays
>   
>   The term "array" in Python can generally refer to any data structure that holds a sequence of elements and can be accessed by indices. Here are some specific usages:
>
>    - Python's Built-in array.array:
>
>      This module provides a way to create dense arrays of a uniform type. It is more efficient in storing numeric data than Python lists when all elements are of the same type. 
> It's less flexible and feature-rich compared to lists or numpy arrays.
Python Lists:
> 
>   - Often referred to as arrays but are technically dynamic arrays or lists.
> They can hold elements of different types and are part of Python's core functionality.
>
> - NumPy Arrays:
>
>    These are homogeneous multidimensional arrays (ndarrays) that offer fast array-oriented arithmetic operations and flexible broadcasting capabilities.
> NumPy arrays are much more memory efficient and faster for numerical operations than Python's built-in sequences.