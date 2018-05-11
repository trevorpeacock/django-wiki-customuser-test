from django.contrib import admin

from django.contrib.auth.forms import (
    AdminPasswordChangeForm, UserChangeForm, UserCreationForm,
)
import testapp.models

class CustomUserCreationForm(UserCreationForm):

    class Meta(UserCreationForm.Meta):
        model = testapp.models.MyUser
        fields = (testapp.models.MyUser.USERNAME_FIELD,)

class CustomUserChangeForm(UserChangeForm):

    class Meta:
        model = testapp.models.MyUser
        fields = UserChangeForm.Meta.fields

@admin.register(testapp.models.MyUser)
class UserAdmin(admin.ModelAdmin):
    form = CustomUserChangeForm
    add_form = CustomUserCreationForm

