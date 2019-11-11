from rest_framework import serializers
from .models import Member
from cart.models import Cart


class UserListSerializer(serializers.ModelSerializer): #HyperlinkedModelSerializer
    created_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at  = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    password    = serializers.CharField(style={'input_type': 'password'})
    class Meta:
        model = Member
        extra_kwargs = {'password': {'write_only': True}}
        fields = ['id', 'email', 'password', 'fullname', 'gender', 'avatar', 'addresses', 'active', 'created_at', 'updated_at']
        # fields = '__all__'
        read_only_fields = ('active', 'created_at', 'updated_at')
        depth = 1

    def create(self, validated_data):
        member = super(UserListSerializer, self).create(validated_data)
        member.set_password(validated_data['password'])
        member.save()
        cart = Cart(customer=member)
        cart.save()
        return member

class UserDetailSerializer(serializers.ModelSerializer): #HyperlinkedModelSerializer
    created_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    password   = serializers.CharField(style={'input_type': 'password'})
    class Meta:
        model = Member
        fields = ['id', 'email', 'password', 'fullname' ,'gender', 'avatar', 'active', 'created_at', 'updated_at']
        read_only_fields = ('email',)

    def update(self, instance, validated_data):
        instance.email      = validated_data.get('email', instance.email)
        instance.avatar     = validated_data.get('avatar', instance.avatar)
        instance.fullname   = validated_data.get('fullname', instance.fullname)
        instance.gender     = validated_data.get('gender', instance.gender)
        instance.active     = validated_data.get('active', instance.active)
        instance.set_password(validated_data.get('password'))
        instance.save()
        return instance

class UserProfilePuttingSerializer(serializers.ModelSerializer):
    created_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    updated_at = serializers.DateTimeField(format="%H:%M:%S %d-%m-%Y", read_only=True)
    password   = serializers.CharField(style={'input_type': 'password'}, read_only=True)
    class Meta:
        model = Member
        fields = ['id', 'email', 'password', 'fullname' ,'gender', 'avatar', 'active', 'created_at', 'updated_at']
        read_only_fields = ('email', 'password', 'active')