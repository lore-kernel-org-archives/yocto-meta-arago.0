Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 1851B52092
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2018 16:23:07 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAFGMv3f090510
	for <meta-arago@arago-project.org>; Thu, 15 Nov 2018 10:22:57 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542298977;
	bh=lBulBg/GvgRVl6L1WQpdq2iUTK9lWHp7i3RHCteC9gg=;
	h=From:To:CC:Subject:Date;
	b=JB127QG0akPla1yfzAd+XC/meP+EZl2cgGSDJVKfBK5gDDP/iA55Fboh/wvwl+PHb
	eQvfqerR7xIxjbv7sac/HsrmJscP2iwOnDAJT1GthJGLRAjLO/DAY9Twgg0uzEOe8j
	IM11L4h8Dl4X+fd55VNsyk4Rzx030Lt9BGvFm7Rc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAFGMvaV043855
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 15 Nov 2018 10:22:57 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 15 Nov 2018 10:22:57 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 15 Nov 2018 10:22:57 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAFGMuNM015668;
	Thu, 15 Nov 2018 10:22:57 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 15 Nov 2018 11:22:52 -0500
Message-ID: <1542298972-28714-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] mmwave-ros-*: update to version 3.1.0
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
X-List-Received-Date: Thu, 15 Nov 2018 16:23:09 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../files/0002-turtlebot-bringup-minimal-launch.patch    | 15 +++++++--------
 ..._2.5.1.bb => mmwave-ros-autonomous-robotics_3.1.0.bb} | 16 +++++-----------
 ...kg-master_2.5.1.bb => mmwave-ros-pkg-master_3.1.0.bb} |  8 ++++----
 3 files changed, 16 insertions(+), 23 deletions(-)
 rename recipes-ros/ros-mmwave/{mmwave-ros-autonomous-robotics_2.5.1.bb => mmwave-ros-autonomous-robotics_3.1.0.bb} (83%)
 rename recipes-ros/ros-mmwave/{mmwave-ros-pkg-master_2.5.1.bb => mmwave-ros-pkg-master_3.1.0.bb} (82%)

diff --git a/recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch b/recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch
index e09f750..77feccd 100644
--- a/recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch
+++ b/recipes-ros/ros-mmwave/files/0002-turtlebot-bringup-minimal-launch.patch
@@ -6,17 +6,16 @@
    <arg name="base"              default="kobuki"         doc="mobile base type [create, roomba]"/>
 -  <arg name="battery"           default="$(env TURTLEBOT_BATTERY)"      doc="kernel provided locatio for battery info, use /proc/acpi/battery/BAT0 in 2.6 or earlier kernels." />
 -  <arg name="stacks"            default="$(env TURTLEBOT_STACKS)"       doc="stack type displayed in visualisation/simulation [circles, hexagons]"/>
--  <arg name="3d_sensor"         default="radar"    doc="3d sensor types [kinect, asux_xtion_pro, radar]"/>
++  <arg name="stacks"            default="hexagons"       doc="stack type displayed in visualisation/simulation [circles, hexagons]"/>
+   <arg name="3d_sensor"         default="radar"    doc="3d sensor types [kinect, asux_xtion_pro, radar]"/>
 -  <arg name="simulation"        default="$(env TURTLEBOT_SIMULATION)"   doc="set flags to indicate this turtle is run in simulation mode."/>
 -  <arg name="serialport"        default="$(env TURTLEBOT_SERIAL_PORT)"  doc="used by create to configure the port it is connected on [/dev/ttyUSB0, /dev/ttyS0]"/>
-+  <arg name="stacks"            default="hexagons"       doc="stack type displayed in visualisation/simulation [circles, hexagons]"/>
-+  <arg name="3d_sensor"         default="radar"          doc="3d sensor types [kinect, asux_xtion_pro, radar]"/>
-+  <arg name="simulation"        default="false"          doc="set flags to indicate this turtle is run in simulation mode."/>
-+  <arg name="serialport"        default="/dev/kobuki"    doc="used by create to configure the port it is connected on [/dev/ttyUSB0, /dev/ttyS0]"/>
- 
++  <arg name="simulation"        default="false"   doc="set flags to indicate this turtle is run in simulation mode."/>
++  <arg name="serialport"        default="/dev/kobuki"  doc="used by create to configure the port it is connected on [/dev/ttyUSB0, /dev/ttyS0]"/>
+   <arg name="mmwave_device"     default="1443"  doc="TI mmWave sensor device type [1443, 1642, 6843]"/>
+
    <param name="/use_sim_time" value="$(arg simulation)"/>
- 
-@@ -18,7 +17,4 @@
+@@ -20,7 +19,4 @@
      <arg name="base" value="$(arg base)" />
      <arg name="serialport" value="$(arg serialport)" />
    </include>
diff --git a/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_3.1.0.bb
similarity index 83%
rename from recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
rename to recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_3.1.0.bb
index 010002f..bfbfaa5 100644
--- a/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
+++ b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_3.1.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "This package contains mmwave autonomous robotics demos"
 SECTION = "devel"
 LICENSE = "BSD"
 
-LIC_FILES_CHKSUM = "file://docs/Autonomous_Robotics_with_ROS_for_mmWave_manifest.pdf;md5=052cbb2cc0847a82abb159996f974c35"
-SRC_URI[base.md5sum] = "561921297c73a7ead40bf7486ee8f4f9"
-SRC_URI[base.sha256sum] = "768661b88bd31f083660287045dc49a9441d15cf10b0c48e7d29377a23864191"
-SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_5_1/labs/lab0008-autonomous-robotics-ros/lab0008_autonomous_robotics_ros/ti_mmwave_ros_map_nav_v1p1.gz;name=base;subdir=${P}"
+LIC_FILES_CHKSUM = "file://docs/Autonomous_Robotics_with_ROS_for_mmWave_manifest.pdf;md5=d0fe8e43974f93eb11715ab1a9f58bea"
+SRC_URI[base.md5sum] = "eb8af8e629c365004a6eb4f70464ddc3"
+SRC_URI[base.sha256sum] = "95553c507f27bd8f68eb6a5f4d5cfa4bb3784b9d61f02d21f7c61a86d8186a1f"
+SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_3_1_0/labs/lab0008-autonomous-robotics-ros/lab0008_autonomous_robotics_ros/ti_mmwave_ros_map_nav_v1p2.tar.gz;name=base;subdir=${P}"
 
 SRC_URI += "file://0001-turtlebot-bringup-description-launch-xml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
             file://0002-turtlebot-bringup-minimal-launch.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
@@ -16,18 +16,12 @@ SRC_URI += "file://0001-turtlebot-bringup-description-launch-xml.patch;patchdir=
 
 S = "${WORKDIR}/${P}/turtlebot_mmwave_launchers"
 
-PR = "r3"
+PR = "r0"
 
 inherit catkin
 
 RDEPENDS_${PN} += "bash"
 
-tar_xf() {
-    tar xf ${WORKDIR}/ti_mmwave_ros_map_nav_v1p1 -C ${WORKDIR}/${P}
-}
-
-do_unpack[postfuncs] += "tar_xf"
-
 do_install_append() {
     install -d ${D}${ros_datadir}/turtlebot_mmwave_launchers
     cp -r ${S}/launch ${D}${ros_datadir}/turtlebot_mmwave_launchers
diff --git a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_2.5.1.bb b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb
similarity index 82%
rename from recipes-ros/ros-mmwave/mmwave-ros-pkg-master_2.5.1.bb
rename to recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb
index 143dd78..f92b82c 100644
--- a/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_2.5.1.bb
+++ b/recipes-ros/ros-mmwave/mmwave-ros-pkg-master_3.1.0.bb
@@ -2,10 +2,10 @@ DESCRIPTION = "This package contains ROS driver for mmWave TI sensor."
 SECTION = "devel"
 LICENSE = "BSD"
 
-LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=2f41c03cb07673fdbb8bc449e1d179ae"
-SRC_URI[base.md5sum] = "58594aee8e222ff7b259067ad7da0094"
-SRC_URI[base.sha256sum] = "06a93099e85ef47ad70f96db86a0601ace59512d8cc5c5ea0609285c1497dca1"
-SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_5_1/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p4.zip;name=base;subdir=${P}"
+LIC_FILES_CHKSUM = "file://docs/TI_mmWave_ROS_Driver_manifest.pdf;md5=1f2c3f56972fee1e60c320f371c34595"
+SRC_URI[base.md5sum] = "822e5f91acbcfc2b68ba2d440ec9be82"
+SRC_URI[base.sha256sum] = "d4c8d7c204972656096d458938c19d6b3277ef435bbdbb735076d9597d7a880c"
+SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_3_1_0/labs/lab0006-ros-driver/lab0006_ros_driver_pjt/ti_mmwave_rospkg_v1p5.zip;name=base;subdir=${P}"
 SRC_URI += "file://append_launch \
             file://append_cfg \
             file://setup.bash \
-- 
1.9.1


