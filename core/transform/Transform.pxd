from core.transform.transform_binding cimport *

cdef class Transform:
    cdef godot_transform _native

    cdef inline void set_native(self, godot_transform _native):
        self._native = _native

    @staticmethod
    cdef inline Transform new_static(godot_transform _native):
        cdef Transform v = Transform.__new__(Transform)
        v.set_native(_native)
        return v