from django.db import models


from django.contrib.auth.base_user import BaseUserManager
class MyUserManager(BaseUserManager):
    def create_user(self, identifier, password=None):
        user = self.model(
            identifier=identifier,
        )
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, identifier, password):
        user = self.create_user(
            identifier,
            password=password,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user

from django.contrib.auth.base_user import AbstractBaseUser

class MyUser(AbstractBaseUser):
    identifier = models.CharField(max_length=40, unique=True)
    USERNAME_FIELD = 'identifier'
    objects = MyUserManager()

    def get_full_name(self):
        return self.identifier

    def get_short_name(self):
        return self.identifier

    def has_perm(self, perm, obj=None):
        return True

    def has_module_perms(self, app_label):
        return True

    @property
    def is_staff(self):
        return True
