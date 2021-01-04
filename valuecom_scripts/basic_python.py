#Print command
"""
print ("\nDouble Quotes")
print ('\nSingle Quotes')

"""

#main function
"""
def raj():
	print("\nHello UK!")
if __name__== "__main__":
  raj()
print("\nNo, I'm London")

"""

# # Declare a variable and Concatenate Variables
"""
jb = 7
print(jb)
# re-declaring the variable works
jb = 'jb007'
print(jb)

a = "j"
_b = "0"
c_ = 7
d = 'b0'
print(a+str(d)+str(_b)+str(c_))
#import keyword
#print(keyword.kwlist)
a = 2
print(type(a))
b = 9223372036854775807
print(type(b))
pi = 3.14
print(type(pi))
c = 'A'print(type(c))
name = 'John Doe'
print(type(name))
q = Trueprint(type(q))

"""
# Global vs. local variables in functions

"""
f = "Global"
print(f)

def astonMartin():
# global f
	f = 'Local'
	print(f)
astonMartin()
print(f)

"""
# delete Declared a variable
"""
f = 33;
print(f)
del f
print(f)

"""
# Bring the word from Declared a variable
"""
var1 = "James!"
var2 = "DevOps Engineer"
print ("var1[5]:",var1[5])
print ("var2[0:7]:",var2[0:7])
print (var1[5])
print (var2[0:20])

"""

# Upper, Lower case, Reverse letters
"""
x = "bond"
y = "james" 

print(x[:4]) 
print(y +' '+x[0:4])

oldstring = 'I Love You' 
print('oldstring:',oldstring)
newstring = oldstring.replace('Love', 'like')
print('newstring:',newstring)
u="raju Manikala"
l="rAJU MANIKALA"
print(u.upper())
print(l.upper())
print(u.capitalize())
print(l.lower())
print("\n".join(reversed("James")))
rev="123456789"
print(':'.join(reversed(rev)))		
print(''.join(reversed(rev)))
print(u.split(' '))
u=u.replace("raju","RAJ")
print(u)

"""

"""
x = ('Brosnan', 'DC','1995','Die Another Day 1995', 'Actor', 'Florida');
y = (1,2,3,7,5,6,9);
print(x[0])
print(y[1:4])
"""

"""
x = ("Brosnan", 20, "Education")    # tuple packing
(name, age, profile) = x    # tuple unpacking
print(name)
print(age)
print(profile)

a=(5,6)
b=(5,8)
if (a>b):
	print("a is bigger")
else:
	print("b is bigger")
"""
	

"""
a = {'x':100, 'y':200}
b = list(a.items())
print(b)

# Create initialized dictionary
d1 = {5:"number","to":"string"}
print ("Dictionary contents")
print ("Key",' : ',"Value")
for x in d1.keys():print(x),' : ',d1[x]

print ("b")# Print blank line

#Listing 1
a = 2
print(a)
# Output: 2
a = "New value"
print(a)

"""

"""
Dict = {'Tim': 18,'Charlie':12,'Ram':22,'ram':25}	
Boys = {'Tim': 18,'Charlie':12,'Robert':25}
Girls = {'Eve':22}	
q = Boys.copy()
q = Girls.copy()
print (q)
Girls.update({"ven":22})
print (Girls)
del Girls ['ven']
print(Girls)

Dict = {'Tim': 18,'Charlie':12,'Tiffany':22,'Robert':25}	
print("Students Name: %s" % list(Dict.items()))

"""


"""
Dict = {'Tim': 18,'Charlie':12,'Tiffany':22,'Robert':25, 'Jio':99}
Boys = {'Tim': 18,'Charlie':12,'Robert':25,'Ram':25}
Girls = {'Tiffany':22}
	
print("Length : %d" % len(Dict))
print("variable Type: %s" % type(Dict))
print("printable string: %s" % str(Dict))

Students = list(Dict.keys())
Students.sort()
for S in Students:
      print(":".join((S,str(Dict[S]))))

for key in list(Boys.keys()):
    if key in list(Dict.keys()):
        print(True)
    else:       
        print(False)

"""


"""
x= 4	
y= 9
print(x + y)
print(x - y)
print(x / y)
print(x % y)
print(x ** y)
print(('x > y  is',x>y))
print(('x < y  is',x<y))
print(('x == y  is',x==y))
print(('x != y  is',x!=y))
x= 4	
y= 9
res = x + y
res += x
print("Result is ", res)
a = True
b = False
print(('one of the a and b is',a and b))
print(('a or b is',a or b))
print(('a is not',not a))

"""

"""

x = 4
y = 8
list = [1, 2, 3, 4, 5 ];
if ( x in list ):
   print("Line 1 - x is available in the given list")
else:
   print("Line 1 - x is not available in the given list")
if ( y not in list ):
   print("Line 2 - y is not available in the given list")
else:
   print("Line 2 - y is available in the given list")

"""

"""
x = 20
y = 20
if ( x is y ): 
	print("x & y are having SAME identity")
y=30
if ( x is not y ):
	print("x & y have DIFFERENT identity")

v = 0
w = 9
x = 8
y = 2
z = 0
a = x / y
b = (v%w)
z = b * a;
print("Value of x / y is ",  a)
print("Value of v%w is ",  b)
print("Value of b * a is ",  z)
"""
"""
a = [1, 2, 3]
b = ['a', 1, 'python', (1, 2), [1, 2]]
b[2] = 'something else'
print(a)
print(b)

i=7;
i='raju';
if isinstance(i, int):
	i += 1
	print('from if statement ', i)
elif isinstance(i, str):
	i = int(i)
	i += 1
	print('from elif statement ', i)
"""
"""
#Converting between datatypes
a = '123.456'
s = 123.456
b = float(a)
c = int(s)
d = int(b)
print(a)
print(b)
print(c)
print(d)
"""

#Collection Types
int_list = [1, 2, 3]
string_list = ['abc', 'defghi']
empty_list = []
mixed_list = [1, 'abc', True, 2.34, None]
nested_list = [['abc'],[123]]
names = ['Alice', 'Bob', 'Craig', 'Diana', 'Eric']
names.append("James")
names.insert(6, "Nikki")
print(names[0])
print(names[2])
print(names[-1])
print(names[-4])
names[0] = 'Ann'
names.remove("Bob")
a=names.index("Craig")
print(a)
print(names)
b=len(names)
print(b)
one_member_tuple = ('Only member','')
print(one_member_tuple[0])
for element in names:
	print (element)
	
state_capitals = {
 'Arkansas': 'Little Rock',
 'Colorado': 'Denver',
 'California': 'Sacramento',
 'Georgia': 'Atlanta'
}
print(state_capitals)
ca_capital = state_capitals['California']
print(ca_capital)

for k in state_capitals.keys():
	print('{} is the capital of {}'.format(state_capitals[k], k))
