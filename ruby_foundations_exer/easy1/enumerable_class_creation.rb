# Assume we have a Tree class that implements a binary tree.
# A binary tree is one of many forms of collections, such as Arrays, Hashes, Stacks, Sets, and more.
# All of these classes include the Enumerable module, which means they have access to an #each method,
# as well as many other iterative methods such as map, reduce, select and more.
# Modify the Tree class to support the methods of Enumerable. You do not have to actually implement
# any methods, just show the methods you must provide.

class Tree
  include Enumerable

  def each
    ...
  end
end

# (peeked)
# LS Solution: To provide most of the functionality of Enumerable module, all you need to do is
# include Enumerable in your class, and define an each method that yields each member of the
# collection, one at a time.

# (me) Also: in Docs, If #max, min or sort is used, the objects in the collection must also implement
# a meaningful <=> operator, as these methods rely on an ordering between members of the collection.

