class Node:
  def __init__(self):
    self.n = 0
    self.e = ''

class Queue:
  def __init__(self):
    self.first = 0
    self.last = 0

  def add(self, value):
    node = Node()
    node.e = value
    if self.first != 0:
      self.last.n = node
    else:
      self.first = node
    self.last = node
  
  def remove(self):
    node = self.first
    if self.first == self.last:
      self.last = 0
    self.first = node.n
    return node.e
    
  def isNotEmpty(self):
    return self.first != 0
    
  def getSmaller(self):
    node = self.first.n if self.first.n != 0 else 0
    smaller = self.first.e
    while node != 0:
      smaller = node.e if node.e < smaller else smaller
      node = node.n
    return smaller

q = Queue()
q.add("C")
q.add("A")
q.add("B")
q.isNotEmpty()
print(q.getSmaller())