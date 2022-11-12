import numpy as np

class Satellite:
    '''
    :self.angle: angle of the satellite making with equator
    :self.r: radius of orbit
    :self.a_r: radial unit vector 
    :self.position: position of the satellite in cartesian coordinate
    '''
    def __init__(self, angle = 0, r = 6871):
        '''
        initialize a satellite object
        :param angle: initial postion of the satellite wrt the equator
        :param r: radius of the orbit
        '''
        self.angle = angle
        self.r = r
        self.a_r = np.transpose(np.array([np.cos(self.angle),np.sin(self.angle)]))
        self.position = self.r * self.a_r
    
    def __str__(self):
        return f"Angle with respect to equator: {self.angle}\nOrbit Radius: {self.r} km\n{self.a_r}\nCurrent position: {self.position}"
    
    def rotate(self, phi = np.pi/6):
        '''
        update the position of the satellite via euler rotation wrt the origin
        '''
        self.angle = self.angle + phi
        if self.angle >= 2*np.pi:
            self.angle -= 2*np.pi
        self.a_r = np.transpose(np.array([np.cos(self.angle),np.sin(self.angle)]))
        self.position = self.r * self.a_r

class Ground:
    def __init__(self, angle = 0, r = 6371):
        self.angle = angle
        self.r = r
        self.a_r = np.transpose(np.array([np.cos(self.angle),np.sin(self.angle)]))
        self.position = self.r*self.a_r

    def __str__(self):
        return f"Current location of observation point: {self.position}"
    
    def rotate(self, phi = np.pi/60):
        self.angle = self.angle + phi
        if self.angle >= 2*np.pi:
            self.angle -= 2*np.pi
        self.a_r = np.transpose(np.array([np.cos(self.angle),np.sin(self.angle)]))
        self.position = self.r * self.a_r