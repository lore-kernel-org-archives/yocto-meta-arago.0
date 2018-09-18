Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 7B4B6529E6
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2018 20:13:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IKDkim062685
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537301626;
	bh=FfMuwCqV53Bcxje/FR+L7cGz9KOp4JfirrAu6FVfp90=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TNJ8/YxISmfchDN6i/o988M6d66iHXa9TX5l8trc5oOlVO2l7hvyOw1hi48yNADoS
	w7l0R92yMOVM2Wsr1wdT8Lh5xJSJ07bvxhU3CjOQATHW4HfO9v4znhlQLWXxirpBuK
	qdOwWgV7ak19332VTsPJ5e19CVS0G5NJTlAeQzp8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDkHg028247
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:46 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 15:13:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 15:13:46 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDitB002786;
	Tue, 18 Sep 2018 15:13:45 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Sep 2018 16:13:41 -0400
Message-ID: <1537301622-8988-7-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537301622-8988-1-git-send-email-a0271529@ti.com>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 6/7] mmwave-ros-autonomous-robotics: added for ROS navigation demo with obstacle avoidance
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2018 20:13:55 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ...-turtlebot-bringup-description-launch-xml.patch |  12 ++
 ...e-launchers-navigation-visualization-rviz.patch | 151 +++++++++++++++++++++
 ...-turtlebot-navigation-costmap-params-yaml.patch |  22 +++
 .../0002-turtlebot-bringup-minimal-launch.patch    |  26 ++++
 .../mmwave-ros-autonomous-robotics_2.5.1.bb        |  55 ++++++++
 5 files changed, 266 insertions(+)
 create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-bringup-description-launch-xml.patch
 create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch
 create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-costmap-params-yaml.patch
 create mode 100644 recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch
 create mode 100644 recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb

diff --git a/recipes-ros/ros-mmwave/files/0001-turtlebot-bringup-description-launch-xml.patch b/recipes-ros/ros-mmwave/files/0001-turtlebot-bringup-description-launch-xml.patch
new file mode 100644
index 0000000..cc4a794
--- /dev/null
+++ b/recipes-ros/ros-mmwave/files/0001-turtlebot-bringup-description-launch-xml.patch
@@ -0,0 +1,12 @@
+--- a/launch/includes/description.launch.xml
++++ b/launch/includes/description.launch.xml
+@@ -6,7 +6,9 @@
+   <arg name="stacks"/>
+   <arg name="3d_sensor"/>
+   
++<!--
+   <arg name="urdf_file" default="$(find xacro)/xacro.py '$(find turtlebot_description)/robots/$(arg base)_$(arg stacks)_$(arg 3d_sensor).urdf.xacro'" />
+   <param name="robot_description" command="$(arg urdf_file)" />
++ -->
+ 
+ </launch>
diff --git a/recipes-ros/ros-mmwave/files/0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch b/recipes-ros/ros-mmwave/files/0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch
new file mode 100644
index 0000000..3956c52
--- /dev/null
+++ b/recipes-ros/ros-mmwave/files/0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch
@@ -0,0 +1,151 @@
+--- a/launch/navigation_visualization.rviz
++++ b/launch/navigation_visualization.rviz
+@@ -250,36 +250,6 @@
+       Value: true
+       Visual Enabled: true
+     - Alpha: 1
+-      Axes Length: 1
+-      Axes Radius: 0.100000001
+-      Class: rviz/PoseWithCovariance
+-      Color: 255; 25; 0
+-      Covariance:
+-        Orientation:
+-          Alpha: 0.5
+-          Color: 255; 255; 127
+-          Color Style: Unique
+-          Frame: Local
+-          Offset: 1
+-          Scale: 1
+-          Value: true
+-        Position:
+-          Alpha: 0.300000012
+-          Color: 204; 51; 204
+-          Scale: 1
+-          Value: true
+-        Value: true
+-      Enabled: true
+-      Head Length: 0.300000012
+-      Head Radius: 0.100000001
+-      Name: PoseWithCovariance
+-      Shaft Length: 1
+-      Shaft Radius: 0.0500000007
+-      Shape: Arrow
+-      Topic: /initialpose
+-      Unreliable: false
+-      Value: true
+-    - Alpha: 1
+       Buffer Length: 1
+       Class: rviz/Path
+       Color: 255; 0; 0
+@@ -343,6 +313,36 @@
+       Unreliable: false
+       Use Timestamp: false
+       Value: true
++    - Alpha: 1
++      Axes Length: 1
++      Axes Radius: 0.1
++      Class: rviz_plugin_covariance/PoseWithCovariance
++      Color: 255; 25; 0
++      Covariance:
++        Orientation:
++          Alpha: 0.5
++          Color: 255; 255; 127
++          Color Style: Unique
++          Frame: Local
++          Offset: 1
++          Scale: 1
++          Value: true
++        Position:
++          Alpha: 0.3
++          Color: 204; 51; 204
++          Scale: 1
++          Value: true
++        Value: true
++      Enabled: true
++      Head Length: 0.3
++      Head Radius: 0.1
++      Name: PoseWithCovariance
++      Shaft Length: 1
++      Shaft Radius: 0.05
++      Shape: Arrow
++      Topic: /initialpose
++      Unreliable: false
++      Value: true
+   Enabled: true
+   Global Options:
+     Background Color: 48; 48; 48
+--- a/launch/navigation_visualization_2.rviz
++++ b/launch/navigation_visualization_2.rviz
+@@ -251,35 +251,6 @@
+       Visual Enabled: true
+     - Alpha: 1
+       Axes Length: 1
+-      Axes Radius: 0.100000001
+-      Class: rviz/PoseWithCovariance
+-      Color: 255; 25; 0
+-      Covariance:
+-        Orientation:
+-          Alpha: 0.5
+-          Color: 255; 255; 127
+-          Color Style: Unique
+-          Frame: Local
+-          Offset: 1
+-          Scale: 1
+-          Value: true
+-        Position:
+-          Alpha: 0.300000012
+-          Color: 204; 51; 204
+-          Scale: 1
+-          Value: true
+-        Value: true
+-      Enabled: false
+-      Head Length: 0.300000012
+-      Head Radius: 0.100000001
+-      Name: PoseWithCovariance
+-      Shaft Length: 1
+-      Shaft Radius: 0.0500000007
+-      Shape: Arrow
+-      Topic: /initialpose
+-      Unreliable: false
+-      Value: false
+-    - Alpha: 1
+       Buffer Length: 1
+       Class: rviz/Path
+       Color: 255; 0; 0
+@@ -373,6 +344,36 @@
+       Unreliable: false
+       Use Timestamp: false
+       Value: true
++    - Alpha: 1
++      Axes Length: 1
++      Axes Radius: 0.1
++      Class: rviz_plugin_covariance/PoseWithCovariance
++      Color: 255; 25; 0
++      Covariance:
++        Orientation:
++          Alpha: 0.5
++          Color: 255; 255; 127
++          Color Style: Unique
++          Frame: Local
++          Offset: 1
++          Scale: 1
++          Value: true
++        Position:
++          Alpha: 0.3
++          Color: 204; 51; 204
++          Scale: 1
++          Value: true
++        Value: true
++      Enabled: true
++      Head Length: 0.3
++      Head Radius: 0.1
++      Name: PoseWithCovariance
++      Shaft Length: 1
++      Shaft Radius: 0.05
++      Shape: Arrow
++      Topic: /initialpose
++      Unreliable: false
++      Value: true
+   Enabled: true
+   Global Options:
+     Background Color: 48; 48; 48
diff --git a/recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-costmap-params-yaml.patch b/recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-costmap-params-yaml.patch
new file mode 100644
index 0000000..7fba277
--- /dev/null
+++ b/recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-costmap-params-yaml.patch
@@ -0,0 +1,22 @@
+--- a/param/global_costmap_params.yaml
++++ b/param/global_costmap_params.yaml
+@@ -1,7 +1,7 @@
+ global_costmap:
+    global_frame: /map
+    robot_base_frame: /base_footprint
+-   update_frequency: 15
++   update_frequency: 8 
+    publish_frequency: 5
+    static_map: false
+    rolling_window: true
+--- a/param/local_costmap_params.yaml
++++ b/param/local_costmap_params.yaml
+@@ -1,7 +1,7 @@
+ local_costmap:
+    global_frame: /odom
+    robot_base_frame: /base_footprint
+-   update_frequency: 20
++   update_frequency: 15
+    publish_frequency: 10
+    static_map: false
+    rolling_window: true
diff --git a/recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch b/recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch
new file mode 100644
index 0000000..e09f750
--- /dev/null
+++ b/recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch
@@ -0,0 +1,26 @@
+--- a/launch/minimal.launch
++++ b/launch/minimal.launch
+@@ -1,11 +1,10 @@
+ <launch>
+   <!-- Turtlebot -->
+   <arg name="base"              default="kobuki"         doc="mobile base type [create, roomba]"/>
+-  <arg name="battery"           default="$(env TURTLEBOT_BATTERY)"      doc="kernel provided locatio for battery info, use /proc/acpi/battery/BAT0 in 2.6 or earlier kernels." />
+-  <arg name="stacks"            default="$(env TURTLEBOT_STACKS)"       doc="stack type displayed in visualisation/simulation [circles, hexagons]"/>
+-  <arg name="3d_sensor"         default="radar"    doc="3d sensor types [kinect, asux_xtion_pro, radar]"/>
+-  <arg name="simulation"        default="$(env TURTLEBOT_SIMULATION)"   doc="set flags to indicate this turtle is run in simulation mode."/>
+-  <arg name="serialport"        default="$(env TURTLEBOT_SERIAL_PORT)"  doc="used by create to configure the port it is connected on [/dev/ttyUSB0, /dev/ttyS0]"/>
++  <arg name="stacks"            default="hexagons"       doc="stack type displayed in visualisation/simulation [circles, hexagons]"/>
++  <arg name="3d_sensor"         default="radar"          doc="3d sensor types [kinect, asux_xtion_pro, radar]"/>
++  <arg name="simulation"        default="false"          doc="set flags to indicate this turtle is run in simulation mode."/>
++  <arg name="serialport"        default="/dev/kobuki"    doc="used by create to configure the port it is connected on [/dev/ttyUSB0, /dev/ttyS0]"/>
+ 
+   <param name="/use_sim_time" value="$(arg simulation)"/>
+ 
+@@ -18,7 +17,4 @@
+     <arg name="base" value="$(arg base)" />
+     <arg name="serialport" value="$(arg serialport)" />
+   </include>
+-  <include unless="$(eval arg('battery') == 'None')" file="$(find turtlebot_bringup)/launch/includes/netbook.launch.xml">
+-    <arg name="battery" value="$(arg battery)" />
+-  </include>
+ </launch>
diff --git a/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
new file mode 100644
index 0000000..1c391e2
--- /dev/null
+++ b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
@@ -0,0 +1,55 @@
+DESCRIPTION = "This package contains mmwave autonomous robotics demos"
+SECTION = "devel"
+LICENSE = "BSD"
+
+LIC_FILES_CHKSUM = "file://docs/Autonomous_Robotics_with_ROS_for_mmWave_manifest.pdf;md5=052cbb2cc0847a82abb159996f974c35"
+SRC_URI[base.md5sum] = "561921297c73a7ead40bf7486ee8f4f9"
+SRC_URI[base.sha256sum] = "768661b88bd31f083660287045dc49a9441d15cf10b0c48e7d29377a23864191"
+SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_5_1/labs/lab0008-autonomous-robotics-ros/lab0008_autonomous_robotics_ros/ti_mmwave_ros_map_nav_v1p1.gz;name=base;subdir=${P}"
+
+SRC_URI += "file://0001-turtlebot-bringup-description-launch-xml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
+            file://0002-turtlebot-bringup-minimal-launch.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
+            file://0001-turtlebot-navigation-costmap-params-yaml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation \
+            file://0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch;patchdir=${S} \
+"
+
+S = "${WORKDIR}/${P}/turtlebot_mmwave_launchers"
+
+PR = "r1"
+
+inherit catkin
+
+RDEPENDS_${PN} += "bash"
+
+tar_xf() {
+    tar xf ${WORKDIR}/ti_mmwave_ros_map_nav_v1p1 -C ${WORKDIR}/${P}
+}
+
+do_unpack[postfuncs] += "tar_xf"
+
+do_install_append() {
+    install -d ${D}${ros_datadir}/turtlebot_mmwave_launchers
+    cp -r ${S}/launch ${D}${ros_datadir}/turtlebot_mmwave_launchers
+    cp -r ${S}/scripts ${D}${ros_datadir}/turtlebot_mmwave_launchers
+
+    install -d ${D}${ros_datadir}/ti_mmwave_rospkg
+    cp -r ${WORKDIR}/${P}/ti_mmwave_rospkg/cfg ${D}${ros_datadir}/ti_mmwave_rospkg
+
+    install -d ${D}${ros_datadir}/turtlebot_bringup
+    install -d ${D}${ros_datadir}/turtlebot_description
+    cp -r ${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup/* ${D}${ros_datadir}/turtlebot_bringup
+    cp -r ${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_description/* ${D}${ros_datadir}/turtlebot_description 
+    rm -rf ${D}${ros_datadir}/turtlebot_bringup/patches
+
+    install -d ${D}${ros_datadir}/turtlebot_navigation
+    cp -r ${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation/* ${D}${ros_datadir}/turtlebot_navigation
+    rm -rf ${D}${ros_datadir}/turtlebot_navigation/patches
+}
+
+FILES_${PN} += "${ros_datadir}/turtlebot_mmwave_launchers"
+FILES_${PN} += "${ros_datadir}/ti_mmwave_rospkg"
+FILES_${PN} += "${ros_datadir}/turtlebot_bringup"
+FILES_${PN} += "${ros_datadir}/turtlebot_description"
+FILES_${PN} += "${ros_datadir}/turtlebot_navigation"
+
+ROS_SPN = "turtlebot_mmwave_launchers"
-- 
1.9.1


