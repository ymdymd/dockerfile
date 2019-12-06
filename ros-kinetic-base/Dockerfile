FROM ubuntu:16.04

#----------------------

# Set the ARG to non-interactive
ARG DEBIAN_FRONTEND=noninteractive
ARG DEBIAN_PRIORITY=critical
ARG USER_NAME

# point to mirror server
RUN sed -i.org -e 's|ports.ubuntu.com|jp.archive.ubuntu.com|g' /etc/apt/sources.list

# base 
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    sudo apt-utils

ENV USER=${USER_NAME:-ros} \
    HOME=/home/${USER_NAME}

# add sudo user
RUN groupadd -g 1000 ${USER} && \
    useradd  -g      ${USER} -G sudo -m -s /bin/bash ${USER} && \
    echo "${USER}:${USER}" | chpasswd

RUN echo "Defaults visiblepw"             >> /etc/sudoers
RUN echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER ${USER}
WORKDIR ${HOME}

#----------------------

# installing ROS from source
# http://wiki.ros.org/kinetic/Installation/Source

# dependencies for ros install from source
RUN sudo apt-get update && \
    sudo apt-get install -y \
    python-rosdep python-rosinstall-generator python-wstool python-rosinstall build-essential \
    python-catkin-pkg python-rosdistro python-rospkg python-vcstools

# Initializing rosdep
RUN sudo rosdep init && rosdep update

# Building the catkin Packages
RUN mkdir ~/ros_catkin_ws && cd ~/ros_catkin_ws

# ros-base Install: ROS
RUN rosinstall_generator \
    ros ros_comm \
    --rosdistro kinetic --deps --wet-only --tar > kinetic-base-wet.rosinstall

# Workround for "Unable to handle package.xml format version '3'...."
# pickup package from https://www.ros.org/reps/rep-0131.html#variants
# remove ignored below:
#    rqt_robot_plugins rqt_common_plugins robot_model robot_model_visualization
#    ros_tutorials common_tutorials geometry_tutorials visualization_tutorials ros_tutorials \



# RUN rosinstall_generator \
#     ros ros_comm documentation\
#     bond_core common_msgs common diagnostics driver_common eigen filters bullet geometry nodelet_core orocos_kinematics_dynamics pluginlib assimp executive_smach xacro \
#     navigation slam_gmapping laser_pipeline perception_pcl \
#     mage_common image_transport_plugins image_pipeline laser_pipeline perception_pcl vision_opencv \
#     arm_navigation octomap_mapping kinematics motion_planners motion_planning_common physics_ode trajectory_filters perception_pcl pr2_controllers control pr2_mechanism, pr2_common \
#     simulator_stage simulator_gazebo stage physics_ode visualization_common image_common perception_pcl \
#     visualization_common visualization rx image_common laser_pipeline executive_smach_visualization diagnostics_monitors geometry_visualization geometry_experimental \
#     --rosdistro kinetic --deps --wet-only --tar > kinetic-base-wet.rosinstall

RUN wstool init -j8 src kinetic-base-wet.rosinstall

# Resolving Dependencies
RUN rosdep install --from-paths src --ignore-src --os ubuntu:xenial --rosdistro kinetic -y

# Building the catkin Workspace
RUN  ./src/catkin/bin/catkin_make_isolated --install-space /opt/ros/kinetic --install -DCMAKE_BUILD_TYPE=Release

# ENTRYPOINT ["/bin/bash", "-c"]
