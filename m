Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A051052968
	for <meta-arago@arago-project.org>;
	Wed, 21 Nov 2018 21:44:55 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wALLijJT060416
	for <meta-arago@arago-project.org>; Wed, 21 Nov 2018 15:44:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542836685;
	bh=CV2/uqI7AaFHFQ3y5Px7Xfiku+jJfoCPsGiuXTDKrE0=;
	h=From:To:CC:Subject:Date;
	b=enCin8ub6NvzZcXFknKXnG/yyuogHOLX0zCwryWa2kL00LYJYA1o1Ys8CJ1NnKwTh
	+inUi/s5gjNV7GuEpTogte7rkqRnWUacYKpYH63RpmnR0z3psvR7w+qESqJ+JnuXYQ
	UqSHFfGZd2b4nTLDA4Ht7ws0t3en2BBUEpUrX4lU=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wALLijwr038311
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Nov 2018 15:44:45 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 21 Nov 2018 15:44:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 21 Nov 2018 15:44:44 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wALLiiX7002873;
	Wed, 21 Nov 2018 15:44:44 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Nov 2018 16:44:41 -0500
Message-ID: <1542836682-14068-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH 1/2] mmwave-ros-pkg-master: remove local launch and map files
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
X-List-Received-Date: Wed, 21 Nov 2018 21:44:56 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../files/0001-ti-mmwave-rospkg-launch-rviz.patch  |  50 +++++++++++++++++++++
 .../append_cfg/map_4ft_by_6ft_border_large.bt      | Bin 1062 -> 0 bytes
 .../files/append_launch/plsdk_rviz_1443_3d.launch  |  26 -----------
 .../files/append_launch/plsdk_rviz_1642_2d.launch  |  26 -----------
 .../ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb      |   7 +--
 5 files changed, 52 insertions(+), 57 deletions(-)
 create mode 100644 recipes-ros/ros-mmwave/files/0001-ti-mmwave-rospkg-launch-rviz.patch
 delete mode 100644 recipes-ros/ros-mmwave/files/append_cfg/map_4ft_by_6ft_border_large.bt
 delete mode 100644 recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1443_3d.launch
 delete mode 100644 recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1642_2d.launch

diff --git a/recipes-ros/ros-mmwave/files/0001-ti-mmwave-rospkg-launch-rviz.patch b/recipes-ros/ros-mmwave/files/0001-ti-mmwave-rospkg-launch-rviz.patch
new file mode 100644
index 0000000..65bdf02
--- /dev/null
+++ b/recipes-ros/ros-mmwave/files/0001-ti-mmwave-rospkg-launch-rviz.patch
@@ -0,0 +1,50 @@
+--- a/launch/rviz_1443_2d.launch
++++ b/launch/rviz_1443_2d.launch
+@@ -15,7 +15,4 @@
+   <!-- Static transform from map to base_radar_link for visualization of stand-alone mmWave sensor using Rviz -->
+   <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_base_radar_link" args="0 0 0 0 0 0 map base_radar_link 100"/>
+ 
+-  <!-- Launch Rviz with pre-defined configuration to view mmWave sensor detected object data (color by intensity) -->
+-  <node pkg="rviz" type="rviz" name="rviz" args="-d $(find ti_mmwave_rospkg)/launch/radar_det_obj_color_by_intensity.rviz"/>
+-
+ </launch>
+--- a/launch/rviz_1443_3d.launch
++++ b/launch/rviz_1443_3d.launch
+@@ -15,7 +15,4 @@
+   <!-- Static transform from map to base_radar_link for visualization of stand-alone mmWave sensor using Rviz -->
+   <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_base_radar_link" args="0 0 0 0 0 0 map base_radar_link 100"/>
+
+-  <!-- Launch Rviz with pre-defined configuration to view mmWave sensor detected object data (color by elevation) -->
+-  <node pkg="rviz" type="rviz" name="rviz" args="-d $(find ti_mmwave_rospkg)/launch/radar_det_obj_color_by_elev.rviz"/>
+-
+ </launch>
+--- a/launch/rviz_1642_2d.launch
++++ b/launch/rviz_1642_2d.launch
+@@ -15,7 +15,4 @@
+   <!-- Static transform from map to base_radar_link for visualization of stand-alone mmWave sensor using Rviz -->
+   <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_base_radar_link" args="0 0 0 0 0 0 map base_radar_link 100"/>
+
+-  <!-- Launch Rviz with pre-defined configuration to view mmWave sensor detected object data (color by intensity) -->
+-  <node pkg="rviz" type="rviz" name="rviz" args="-d $(find ti_mmwave_rospkg)/launch/radar_det_obj_color_by_intensity.rviz"/>
+-
+ </launch>
+--- a/launch/rviz_6843_2d.launch
++++ b/launch/rviz_6843_2d.launch
+@@ -15,7 +15,4 @@
+   <!-- Static transform from map to base_radar_link for visualization of stand-alone mmWave sensor using Rviz -->
+   <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_base_radar_link" args="0 0 0 0 0 0 map base_radar_link 100"/>
+
+-  <!-- Launch Rviz with pre-defined configuration to view mmWave sensor detected object data (color by intensity) -->
+-  <node pkg="rviz" type="rviz" name="rviz" args="-d $(find ti_mmwave_rospkg)/launch/radar_det_obj_color_by_intensity.rviz"/>
+-
+ </launch>
+--- a/launch/rviz_6843_3d.launch
++++ b/launch/rviz_6843_3d.launch
+@@ -15,7 +15,4 @@
+   <!-- Static transform from map to base_radar_link for visualization of stand-alone mmWave sensor using Rviz -->
+   <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_base_radar_link" args="0 0 0 0 0 0 map base_radar_link 100"/>
+
+-  <!-- Launch Rviz with pre-defined configuration to view mmWave sensor detected object data (color by elevation) -->
+-  <node pkg="rviz" type="rviz" name="rviz" args="-d $(find ti_mmwave_rospkg)/launch/radar_det_obj_color_by_elev.rviz"/>
+-
+ </launch>
diff --git a/recipes-ros/ros-mmwave/files/append_cfg/map_4ft_by_6ft_border_large.bt b/recipes-ros/ros-mmwave/files/append_cfg/map_4ft_by_6ft_border_large.bt
deleted file mode 100644
index 7c13bde542ea671eb36c61e3d655f864a33c45eb..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 1062
zcma)3u};G<5Ixjp@zQ2sKj;DoK_CLLm4Tfi)k`<GacHDAMM*${KPh{W_!mAV5(5iT
zI6DbWQlRK`_Px93_pWIVuP4c3F7D_aMpEK92u1XWelU})hkL%1GxXIUS)lMdJjTgX
zgtrnWi}_rJNqmUo`vhlFJP>Cp>17lX4nm0{#vs8U-q~k87I=jPi-RYLC+8QZERr!g
zN6s1ZL?RfxInaz0ibw~1zz={ysw<|dYF+J8A2@K$F;%l`GZ<;V6d)Z@4bC&P)}jMh
z9xk^@lya9MQwBP+-})8KN6sBqUQuUzNXbcED_Gp(Mp>cEEi8(DiPS#ITXX2XAuh4O
z%uS`Z2K`-Cn99JW>|WB*rmW09%UL<8%r<x#X1`G3a8*<9E9Wk7)y*gB`w-BPf1eU{
zGO)n%398IdL8N_+m#ONU1_J23z>3Zlot@&&ky0}%rfMkYeSX^DJ^#aO^^4kTyK0rK
e@?G7zj$Cln9$Co+cL~ciyqWPIm2c<PD|`V*jRP_O

diff --git a/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1443_3d.launch b/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1443_3d.launch
deleted file mode 100644
index df81d9a..0000000
--- a/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1443_3d.launch
+++ /dev/null
@@ -1,26 +0,0 @@
-<!--
-  This file will launch rViz along with the mmWave sensor node and configure a TI mmWave 1443 sensor using a 3D config
- -->
-
-<launch>
-
-  <!-- Call mmWave sensor launch file -->
-  <include file="$(find ti_mmwave_rospkg)/launch/ti_mmwave_sensor.launch">
-    <arg name="device" value="1443" doc="TI mmWave sensor device type [1443, 1642]"/>
-    <arg name="config" value="3d" doc="TI mmWave sensor device configuration [3d (not supported by 1642 EVM), 2d]"/>
-    <arg name="max_allowed_elevation_angle_deg" value="90" doc="Maximum allowed elevation angle in degrees for detected object data [0 > value >= 90]}"/>
-    <arg name="max_allowed_azimuth_angle_deg" value="90" doc="Maximum allowed azimuth angle in degrees for detected object data [0 > value >= 90]}"/>
-  </include>
-
-  <!-- Static transform from map to base_radar_link for visualization of stand-alone mmWave sensor using Rviz -->
-  <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_odom" args="0 0 0 0 0 0 map odom 100"/>
-  <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_base_radar_link" args="0 0 0 0 0 0 base_footprint base_radar_link 100"/>
-
-  <!-- Map server -->
-  <node name="octomap_server" pkg="octomap_server" type="octomap_server_node" args="$(find ti_mmwave_rospkg)/cfg/map_4ft_by_6ft_border_large.bt projected_map:=map cloud_in:=no_input" />
-  <node pkg="fake_localization" type="fake_localization" name="fake_localization">
-    <param name="use_map_topic" value="true"/>
-    <remap from="base_pose_ground_truth" to="odom"/>
-  </node>
-
-</launch>
diff --git a/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1642_2d.launch b/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1642_2d.launch
deleted file mode 100644
index 7e4ff78..0000000
--- a/recipes-ros/ros-mmwave/files/append_launch/plsdk_rviz_1642_2d.launch
+++ /dev/null
@@ -1,26 +0,0 @@
-<!--
-  This file will launch rViz along with the mmWave sensor node and configure a TI mmWave 1642 sensor using a 2D config
- -->
-
-<launch>
-
-  <!-- Call mmWave sensor launch file -->
-  <include file="$(find ti_mmwave_rospkg)/launch/ti_mmwave_sensor.launch">
-    <arg name="device" value="1642" doc="TI mmWave sensor device type [1443, 1642]"/>
-    <arg name="config" value="2d" doc="TI mmWave sensor device configuration [3d (not supported by 1642 EVM), 2d]"/>
-    <arg name="max_allowed_elevation_angle_deg" value="90" doc="Maximum allowed elevation angle in degrees for detected object data [0 > value >= 90]}"/>
-    <arg name="max_allowed_azimuth_angle_deg" value="90" doc="Maximum allowed azimuth angle in degrees for detected object data [0 > value >= 90]}"/>
-  </include>
-
-  <!-- Static transform from map to base_radar_link for visualization of stand-alone mmWave sensor using Rviz -->
-  <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_odom" args="0 0 0 0 0 0 map odom 100"/>
-  <node pkg="tf" type="static_transform_publisher" name="static_tf_map_to_base_radar_link" args="0 0 0 0 0 0 base_footprint base_radar_link 100"/>
-
-  <!-- Map server -->
-  <node name="octomap_server" pkg="octomap_server" type="octomap_server_node" args="$(find ti_mmwave_rospkg)/cfg/map_4ft_by_6ft_border_large.bt projected_map:=map cloud_in:=no_
-  <node pkg="fake_localization" type="fake_localization" name="fake_localization">
-    <param name="use_map_topic" value="true"/>
-    <remap from="base_pose_ground_truth" to="odom"/>
-  </node>
-
-</launch>
diff --git a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb
index f92b82c..179651e 100644
--- a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb
+++ b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb
@@ -6,12 +6,11 @@ LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=1f2c3f5697
 SRC_URI[base.md5sum] = "822e5f91acbcfc2b68ba2d440ec9be82"
 SRC_URI[base.sha256sum] = "d4c8d7c204972656096d458938c19d6b3277ef435bbdbb735076d9597d7a880c"
 SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_3_1_0/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p5.zip;name=base;subdir=${P}"
-SRC_URI += "file://append_launch \
-            file://append_cfg \
+SRC_URI += "file://0001-ti-mmwave-rospkg-launch-rviz.patch \
             file://setup.bash \
 "
 
-PR = "r0"
+PR = "r1"
 
 # do not use rpath
 EXTRA_OECMAKE_append = " -DCMAKE_SKIP_RPATH=ON"
@@ -29,8 +28,6 @@ do_install_append() {
      cp ${S}/mmWave_nodelets.xml ${D}${ros_datadir}/ti_mmwave_rospkg/
      cp -r ${S}/cfg ${D}${ros_datadir}/ti_mmwave_rospkg/
      cp -r ${S}/launch ${D}${ros_datadir}/ti_mmwave_rospkg/
-     cp  ${WORKDIR}/append_launch/*.launch  ${D}${ros_datadir}/ti_mmwave_rospkg/launch/.
-     cp  ${WORKDIR}/append_cfg/*.bt  ${D}${ros_datadir}/ti_mmwave_rospkg/cfg/.
      cp ${WORKDIR}/setup.bash ${D}${ros_prefix}
 }
 
-- 
1.9.1


