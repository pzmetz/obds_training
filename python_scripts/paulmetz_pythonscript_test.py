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
y = 0
user_number = int(input('Please, enter an integer:'))
#print the numbers between 1 and that of the user
for number in range (0, user_number):
    y = y + number
    x = user_number -1
    if number == x:
        print("SUM of first", user_number, "number is: ", y)
    
    
#    sum = 0.
#for num in range(0, n+1, 1):
#sum = sum+num.
#print("SUM of first ", n, "numbers is: ", sum )