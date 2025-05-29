from django.db import models

class User(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    cpf = models.CharField(max_length=14, unique=True)
    password = models.CharField(max_length=45)

    def __str__(self):
        return self.name
    
class Account(models.Model):
    agency = models.CharField(max_length=45)
    balance = models.DecimalField(max_digits=12, decimal_places=2)
    accountnumber = models.CharField(max_length=9, unique=True)
    accounttype = models.CharField(max_length=20)
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='accounts')

    def __str__(self):
        return f"{self.agency} - {self.accountnumber} ({self.user.name})"
    
class Transaction(models.Model):
    amount = models.DecimalField(max_digits=12, decimal_places=2)
    transactiondate = models.DateTimeField(auto_now_add=True)
    transactiontype = models.CharField(max_length=10)
    description = models.CharField(max_length=255, blank=True, null=True)
    account = models.ForeignKey(Account, on_delete=models.CASCADE, related_name='transactions')

    def __str__(self):
        return f"{self.transactiontype} - {self.amount} ({self.account.accountnumber})"
    
class Loan(models.Model):
    amount = models.DecimalField(max_digits=12, decimal_places=2)
    interestrate = models.DecimalField(max_digits=5, decimal_places=2)
    duedate = models.DateField()
    account = models.ForeignKey(Account, on_delete=models.CASCADE, related_name='loans')

    def __str__(self):
        return f"Loan {self.id} - {self.amount} ({self.account.accountnumber})"
    
class Card(models.Model):
    cvv = models.CharField(max_length=3)
    cardnumber = models.CharField(max_length=12, unique=True)
    expirationdate = models.DateField()
    cardtype = models.CharField(max_length=10)
    account = models.ForeignKey(Account, on_delete=models.CASCADE, related_name='cards')

    def __str__(self):
        return f"{self.cardtype} Card - {self.cardnumber} ({self.account.accountnumber})"
    
