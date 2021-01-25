#x = 1
#below_11 = True
#while below_11:
#    print(x)
#    x = x + 1
#    if x == 11:
#        below_11 = False
#    else:
#        continue
    
#a = 1
#while a < 11:
#  print(a)
#  a = a + 1
  
#for number in range(-10, 0):
#    print(number)
    
# user should enter a number, and this will be turned into an integer
user_number = int(input('Please, enter an integer:'))
#print the numbers between 1 and that of the user
for number in range (2, user_number) or range (user_number +1, 1):
    print(number)
