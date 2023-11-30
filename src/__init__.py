"""
This file registers the model with the Python SDK.
"""
# usage of camera type is arbitrary; refactor to your desired component/service
from viam.components.camera import Camera
from viam.resource.registry import Registry, ResourceCreatorRegistration

from src.module import MyModule

Registry.register_resource_creator(
    Camera.SUBTYPE,
    MyModule.MODEL,
    ResourceCreatorRegistration(MyModule.new, MyModule.validate),
)
