from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from .models import User

class LoginView(APIView):
    def post(self, request):
        email = request.data.get('email')
        password = request.data.get('password')

        try:
            user = User.objects.get(email=email)
            if user.password == password:
                return Response({'message': 'Login bem-sucedido', 'user_id': user.id})
            else:
                return Response({'error': 'Senha incorreta'}, status=status.HTTP_401_UNAUTHORIZED)
        except User.DoesNotExist:
            return Response({'error': 'Usuário não encontrado'}, status=status.HTTP_404_NOT_FOUND)

