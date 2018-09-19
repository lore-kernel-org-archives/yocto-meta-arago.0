Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id CFEFB52079
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 22:11:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JMBATf031177
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 17:11:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537395070;
	bh=B3ZKsl4IniLfThGGvJqLEWjk+t6HfIaRnqGxnsDG2lU=;
	h=From:To:CC:Subject:Date;
	b=jcTxQn/ZPJ3WMuMJaVuHhBVy+jFIXJa0hB8HuYSoVDGkGT8RvIpN+/QCZVSDdTvWB
	M8cEFj+xuANoSRYbve+DTgSXLdmHRThgxmH/Hnkc4mwo5zcMIp7OhTepItb3IoYk8Y
	I/9mce1Bflskjs7kMmGPxky7bAuXtm9MSLqaIZIM=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JMBAlL013351
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 17:11:10 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 17:11:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 17:11:10 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JMB9nr010165;
	Wed, 19 Sep 2018 17:11:10 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Sep 2018 18:11:08 -0400
Message-ID: <1537395068-2415-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] mmwave-ros-autonomous-robotics: add launch file for robot description
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
X-List-Received-Date: Wed, 19 Sep 2018 22:11:19 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../ros-mmwave/files/0003-turtlebot-bringup-description.launch        | 4 ++++
 recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb        | 4 +++-
 2 files changed, 7 insertions(+), 1 deletion(-)
 create mode 100644 recipes-ros/ros-mmwave/files/0003-turtlebot-bringup-description.launch

diff --git a/recipes-ros/ros-mmwave/files/0003-turtlebot-bringup-description.launch b/recipes-ros/ros-mmwave/files/0003-turtlebot-bringup-description.launch
new file mode 100644
index 0000000..8e37309
--- /dev/null
+++ b/recipes-ros/ros-mmwave/files/0003-turtlebot-bringup-description.launch
@@ -0,0 +1,4 @@
+<launch>
+  <arg name="urdf_file" default="$(find xacro)/xacro --inorder '$(find turtlebot_description)/robots/kobuki_hexagons_radar.urdf.xacro'"/>
+  <param name="robot_description" command="$(arg urdf_file)"/>
+</launch>
diff --git a/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
index 2bce70f..010002f 100644
--- a/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
+++ b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
@@ -11,11 +11,12 @@ SRC_URI += "file://0001-turtlebot-bringup-description-launch-xml.patch;patchdir=
             file://0002-turtlebot-bringup-minimal-launch.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
             file://0001-turtlebot-navigation-params-yaml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation \
             file://0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch;patchdir=${S} \
+            file://0003-turtlebot-bringup-description.launch \
 "
 
 S = "${WORKDIR}/${P}/turtlebot_mmwave_launchers"
 
-PR = "r2"
+PR = "r3"
 
 inherit catkin
 
@@ -39,6 +40,7 @@ do_install_append() {
     install -d ${D}${ros_datadir}/turtlebot_description
     cp -r ${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup/* ${D}${ros_datadir}/turtlebot_bringup
     cp -r ${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_description/* ${D}${ros_datadir}/turtlebot_description 
+    cp ${WORKDIR}/0003-turtlebot-bringup-description.launch ${D}${ros_datadir}/turtlebot_bringup/launch/description.launch
     rm -rf ${D}${ros_datadir}/turtlebot_bringup/patches
 
     install -d ${D}${ros_datadir}/turtlebot_navigation
-- 
1.9.1


