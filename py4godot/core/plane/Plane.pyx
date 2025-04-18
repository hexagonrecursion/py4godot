from py4godot.core.vector3.Vector3 cimport *
from py4godot.core.plane.plane_binding cimport *

cdef api set_api_core_plane(godot_gdnative_core_api_struct * core):
    global api_core
    api_core = core

cdef class Plane:

    def __init__(self, godot_real a, godot_real b, godot_real c, godot_real d):
        api_core.godot_plane_new_with_reals(&self._native, a,b,c,d)
        self.update_event = UpdateEvent()

    def new_with_reals(self, godot_real a, godot_real b, godot_real c, godot_real d):
        api_core.godot_plane_new_with_reals(&self._native, a,b,c,d)
        self.update_event.notify()

    def new_with_vectors(self, Vector3 v1, Vector3 v2, Vector3 v3):
        api_core.godot_plane_new_with_vectors(&self._native, &v2._native, &v2._native, &v3._native)
        self.update_event.notify()

    def new_with_normal(self, Vector3 normal, godot_real d):
        api_core.godot_plane_new_with_normal(&self._native, &normal._native, d)
        self.update_event.notify()

    def __str__(self):
        return api_core.godot_plane_as_string(&self._native)

    def normalized(self):
        Plane. new_static(api_core.godot_plane_normalized(&self._native))
        self.update_event.notify()

    def center(self):
        return Vector3. new_static(api_core.godot_plane_center(&self._native))

    def get_any_point(self):
        return Vector3. new_static(api_core.godot_plane_get_any_point(&self._native))

    def is_point_over(self, Vector3 point):
        return api_core.godot_plane_is_point_over(&self._native, &point._native)

    def distance_to(self, Vector3 point):
        return api_core.godot_plane_distance_to(&self._native, &point._native)

    def has_point(self, Vector3 point, godot_real epsilon):
        return api_core.godot_plane_has_point(&self._native, &point._native, epsilon)

    def project(self, Vector3 point):
        return Vector3. new_static(api_core.godot_plane_project(&self._native, &point._native))

    def intersect3(self, Vector3 dest, Plane b, Plane c):
        return api_core.godot_plane_intersect_3(&self._native, &dest._native, &b._native, &c._native)

    def intersects_ray(self, Vector3 dest, Vector3 from_, Vector3 dir):
        return api_core.godot_plane_intersects_ray(&self._native, &dest._native, &from_._native, &dir._native)

    def intersects_segment(self, Vector3 dest, Vector3 begin, Vector3 end):
        return api_core.godot_plane_intersects_segment(&self._native, &dest._native, &begin._native, &end._native)

    def neg(self):
        return Plane. new_static(api_core.godot_plane_operator_neg(&self._native))

    def __eq__(self, Plane other):
        return api_core.godot_plane_operator_equal(&self._native, &other._native)

    def set_normal(self, Vector3 normal):
        api_core.godot_plane_set_normal(&self._native, &normal._native)

    def get_normal(self):
        return Vector3. new_static(api_core.godot_plane_get_normal(&self._native))

    def get_d(self):
        return api_core.godot_plane_get_d(&self._native)

    def set_d(self, godot_real d):
        api_core.godot_plane_set_d(&self._native, d)
        self.update_event.notify()