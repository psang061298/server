from rest_framework import serializers
import json
from rest_framework.fields import ListField

class JSONSerializerSpecField(serializers.Field):

    def to_internal_value(self, data):
        return data
    def to_representation(self, value):
        return value