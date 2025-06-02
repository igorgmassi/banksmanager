from django.urls import path, include
from rest_framework.routers import DefaultRouter
from banking.api.views import UserViewSet, AccountViewSet, TransactionViewSet, CardViewSet, LoanViewSet
from banking.views import LoginView

router = DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'accounts', AccountViewSet)
router.register(r'transactions', TransactionViewSet)
router.register(r'cards', CardViewSet)
router.register(r'loans', LoanViewSet)

urlpatterns = [
    path('', include(router.urls)),
      path('login/', LoginView.as_view(), name='login'),
]