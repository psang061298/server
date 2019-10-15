from django.db import models
from django.contrib.auth.models import (
    BaseUserManager, AbstractBaseUser
)
from django.db.models.signals import post_save
# from cart.models import Cart


class UserManager(BaseUserManager):
    def create_user(self, email, password=None, address=None, phone=None, avatar=None):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValueError('Users must have an email address')

        user = self.model(
            email=self.normalize_email(email),
        )

        user.set_password(password)
        user.address = address
        user.phone = phone
        user.avatar = avatar
        user.active = True
        user.save(using=self._db)
        return user

    def create_staffuser(self, email, password, address, phone, avatar):
        """
        Creates and saves a staff user with the given email and password.
        """
        user = self.create_user(
            email,
            password=password
        )
        user.staff = True
        # user.address = address
        # user.phone = phone
        # user.avatar = avatar
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password, address, phone, avatar):
        """
        Creates and saves a superuser with the given email and password.
        """
        user = self.create_user(
            email,
            password=password,
        )
        user.staff = True
        user.admin = True
        user.save(using=self._db)
        return user

class Member(AbstractBaseUser):
    email = models.EmailField(
        verbose_name='email address',
        max_length=255,
        unique=True,
    )
    avatar      = models.CharField(max_length=255, default='', null=True, blank=True)
    created_at  = models.DateTimeField(auto_now_add=True)
    updated_at  = models.DateTimeField(auto_now=True)
    active      = models.BooleanField(default=True)
    staff       = models.BooleanField(default=False) # a admin user; non super-user
    admin       = models.BooleanField(default=False) # a superuser
    # notice the absence of a "Password field", that's built in.

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = [] # Email & Password are required by default.

    def get_full_name(self):
        # The user is identified by their email address
        return self.fullname

    def __str__(self):              # __unicode__ on Python 2
        return self.email

    def has_perm(self, perm, obj=None):
        "Does the user have a specific permission?"
        # Simplest possible answer: Yes, always
        return True

    def has_module_perms(self, app_label):
        "Does the user have permissions to view the app `app_label`?"
        # Simplest possible answer: Yes, always
        return True

    @property
    def is_staff(self):
        "Is the user a member of staff?"
        return self.staff

    @property
    def is_admin(self):
        "Is the user a admin member?"
        return self.admin

    @property
    def is_active(self):
        "Is the user active?"
        return self.active

    objects = UserManager()

# def create_cart(customer, **kwargs):
#     cart = Cart.objects.create(customer=kwargs['instance'])

# post_save.connect(create_cart(Member))