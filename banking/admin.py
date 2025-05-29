from django.contrib import admin
from banking.models import User, Account, Transaction, Loan, Card

# Register your models here.
class UserAdmin(admin.ModelAdmin):
    list_display = ('name', 'email', 'cpf', 'password', 'id')
  

class AccountAdmin(admin.ModelAdmin):
    list_display = ('agency', 'balance', 'accountnumber', 'accounttype', 'user', 'id')
  

class TransactionAdmin(admin.ModelAdmin):
    list_display = ('amount', 'transactiondate', 'transactiontype', 'description', 'account', 'id')

class LoansAdmin(admin.ModelAdmin):
    list_display = ('amount', 'interestrate', 'duedate', 'account', 'id')

class CardsAdmin(admin.ModelAdmin):
    list_display = ('cvv', 'cardnumber', 'expirationdate', 'cardtype', 'account', 'id')

admin.site.register(User, UserAdmin)
admin.site.register(Account, AccountAdmin)
admin.site.register(Transaction, TransactionAdmin)
admin.site.register(Loan, LoansAdmin)
admin.site.register(Card, CardsAdmin)