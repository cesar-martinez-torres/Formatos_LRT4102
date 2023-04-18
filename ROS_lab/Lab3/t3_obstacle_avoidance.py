#!/usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist

class ObstacleAvoidance:
    def __init__(self):
        rospy.init_node('obstacle_avoidance')
        rospy.Subscriber('/scan', LaserScan, self.laser_callback)
        self.cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=10)
        self.linear_speed = 0.2
        self.angular_speed = 1.0
        self.safety_distance = 0.15
        self.obstacle_distance = 0

    def laser_callback(self, scan):
        # Obtener la distancia al obstáculo enfrente y centrado
        self.obstacle_distance = scan.ranges[len(scan.ranges)/2]

    def run(self):
        rospy.loginfo("Iniciando Obstacle Avoidance")

        # Configurar velocidad lineal
        twist = Twist()
        twist.linear.x = self.linear_speed

        # Avanzar en línea recta y mostrar la distancia al obstáculo
        while not rospy.is_shutdown():
            self.cmd_vel_pub.publish(twist)
            rospy.loginfo("Distancia al obstáculo: {:.2f} m".format(self.obstacle_distance))

if __name__ == '__main__':
    try:
        obstacle_avoidance = ObstacleAvoidance()
        obstacle_avoidance.run()
    except rospy.ROSInterruptException:
        pass

