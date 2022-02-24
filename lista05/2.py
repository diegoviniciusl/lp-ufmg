class Node:
  def __init__(self):
    self.n = 0
    self.e = ''

class Stack:
  def __init__(self):
    self.first = 0

  def add(self, value):
    node = Node()
    node.e = value
    if self.first != 0:
      node.n = self.first
    self.first = node

  def remove(self):
    node = self.first
    self.first = node.n
    return node.e
  
  def isNotEmpty(self):
    return self.first != 0

s = Stack()
s.add(" Baltimore ")
s.add(" Lord ")
s.add(" Sir")
s.isNotEmpty()

while(s.isNotEmpty()) :
  print(s.remove())