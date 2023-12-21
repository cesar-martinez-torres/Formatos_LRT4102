#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from turtlesim.msg import Pose

current_x = 0

def pose_callback(pose):
    # Función que se ejecuta cada vez que llega una actualización de la posición de la tortuga
    global current_x
    current_x = pose.x


if __name__ == '__main__':
    rospy.init_node('control_tortuga_x')
    
    # Suscribirse al topic de la posición de la tortuga
    rospy.Subscriber('/turtle1/pose', Pose, pose_callback)
    
    # Publicar en el topic de comandos de movimiento de la tortuga
    pub = rospy.Publisher('/turtle1/cmd_vel', Twist, queue_size=10)
    
    # Tasa de publicación de mensajes (10 Hz)
    rate = rospy.Rate(10)
    
    # Posición deseada en el eje x
    desired_x = 5
    
    # Constante de proporcionalidad del controlador (ajustable)
    Kp = 1
    
    # Constante de derivación del controlador (ajustable)
    Kd = 0.5
    
    # Error de posición anterior
    prev_error_x = 0
    
    # Tiempo de la iteración anterior
    prev_time = rospy.Time.now()
    
    # Loop principal del nodo
    while not rospy.is_shutdown():
        # Calcular el error de posición
        error_x = desired_x - current_x
        
        # Calcular la derivada del error de posición con respecto al tiempo
        curr_time = rospy.Time.now()
        dt = (curr_time - prev_time).to_sec()
        d_error_x = (error_x - prev_error_x) / dt if dt > 0 else 0

        # Calcular la velocidad lineal del movimiento
        vel_x = Kp * error_x + Kd * d_error_x
        
        # Crear un mensaje de Twist para enviar el comando de movimiento
        msg = Twist()
        msg.linear.x = vel_x
        
        # Publicar el mensaje
        pub.publish(msg)
        
        # Guardar el error de posición y tiempo actual como los anteriores para la siguiente iteración
        prev_error_x = error_x
        prev_time = curr_time
        
        # Esperar hasta la siguiente iteración
        rate.sleep()

