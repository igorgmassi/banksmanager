from rest_framework import viewsets
from banking.models import Account, Transaction, Loan, Card, User
from django_filters.rest_framework import DjangoFilterBackend
from banking.api.serializers import UserSerializer, AccountSerializer, TransactionSerializer, LoanSerializer, CardSerializer

class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = '__all__'  

class AccountViewSet(viewsets.ModelViewSet):
    queryset = Account.objects.all()
    serializer_class = AccountSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = '__all__'  

class TransactionViewSet(viewsets.ModelViewSet):
    queryset = Transaction.objects.all()
    serializer_class = TransactionSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = '__all__'  

class LoanViewSet(viewsets.ModelViewSet):
    queryset = Loan.objects.all()
    serializer_class = LoanSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = '__all__'  

class CardViewSet(viewsets.ModelViewSet):
    queryset = Card.objects.all()
    serializer_class = CardSerializer
    filter_backends = [DjangoFilterBackend]
    filterset_fields = '__all__'  