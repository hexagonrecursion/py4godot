from pluginscript_api.utils.annotations import  *
from utils.Wrapper import *
from enums.enums import *
from classes.generated import *
print(PropertyHint)
print(PropertyHint.GODOT_PROPERTY_HINT_RANGE.value)

@gdclass
class Ball(Spatial):

	@gdproperty(int, 5, hint=PropertyHint.GODOT_PROPERTY_HINT_RANGE.value, hint_string="1,100,5,slider")
	def vel(self):
		return 1

	@vel.setter
	def vel(self, value):
		print("set_value", value)

	@gdproperty(bool, False)
	def grounded(self):
		return False

	@grounded.setter
	def grounded(self, value):
		print("set_grounded")

	def __init__(self):
		super().__init__()
		self.velocity = 0

	@gdmethod
	def _init(self):
		print("_init")

	@gdmethod
	def _process(self, delta):
		print(delta)
		#print(self.get_transform())
		#print(self.transform)

	@gdmethod
	def move(self):
		print("method")
		
	@gdmethod
	def jump(self):
		print("jump")

		
