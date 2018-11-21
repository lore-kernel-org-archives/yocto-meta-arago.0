Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A8E7352977
	for <meta-arago@arago-project.org>;
	Wed, 21 Nov 2018 21:44:55 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wALLijp5123845
	for <meta-arago@arago-project.org>; Wed, 21 Nov 2018 15:44:45 -0600
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wALLijCA003352
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 21 Nov 2018 15:44:45 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 21 Nov 2018 15:44:45 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 21 Nov 2018 15:44:45 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wALLiiX8002873;
	Wed, 21 Nov 2018 15:44:44 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Nov 2018 16:44:42 -0500
Message-ID: <1542836682-14068-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1542836682-14068-1-git-send-email-a0271529@ti.com>
References: <1542836682-14068-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH 2/2] mmwave-ros-autonomous-robotics: add turtlebot-teleop
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
 .../files/0001-turtlebot-teleop-scripts.patch      | 34 ++++++++++++++++++++++
 .../mmwave-ros-autonomous-robotics_3.1.0.bb        |  8 ++++-
 2 files changed, 41 insertions(+), 1 deletion(-)
 create mode 100644 recipes-ros/ros-mmwave/files/0001-turtlebot-teleop-scripts.patch

diff --git a/recipes-ros/ros-mmwave/files/0001-turtlebot-teleop-scripts.patch b/recipes-ros/ros-mmwave/files/0001-turtlebot-teleop-scripts.patch
new file mode 100644
index 0000000..b2270a6
--- /dev/null
+++ b/recipes-ros/ros-mmwave/files/0001-turtlebot-teleop-scripts.patch
@@ -0,0 +1,34 @@
+--- a/scripts/turtlebot_teleop_key
++++ b/scripts/turtlebot_teleop_key
+@@ -103,8 +103,8 @@
+     control_speed = 0
+     control_turn = 0
+     try:
+-        print msg
+-        print vels(speed,turn)
++        print (msg)
++        print (vels(speed,turn))
+         while(1):
+             key = getKey()
+             if key in moveBindings.keys():
+@@ -116,9 +116,9 @@
+                 turn = turn * speedBindings[key][1]
+                 count = 0
+ 
+-                print vels(speed,turn)
++                print (vels(speed,turn))
+                 if (status == 14):
+-                    print msg
++                    print (msg)
+                 status = (status + 1) % 15
+             elif key == ' ' or key == 'k' :
+                 x = 0
+@@ -160,7 +160,7 @@
+             #print("publihsed: vx: {0}, wz: {1}".format(twist.linear.x, twist.angular.z))
+ 
+     except:
+-        print e
++        print (e)
+ 
+     finally:
+         twist = Twist()
diff --git a/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_3.1.0.bb b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_3.1.0.bb
index bfbfaa5..47243db 100644
--- a/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_3.1.0.bb
+++ b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_3.1.0.bb
@@ -12,11 +12,12 @@ SRC_URI += "file://0001-turtlebot-bringup-description-launch-xml.patch;patchdir=
             file://0001-turtlebot-navigation-params-yaml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation \
             file://0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch;patchdir=${S} \
             file://0003-turtlebot-bringup-description.launch \
+            file://0001-turtlebot-teleop-scripts.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_teleop \
 "
 
 S = "${WORKDIR}/${P}/turtlebot_mmwave_launchers"
 
-PR = "r0"
+PR = "r1"
 
 inherit catkin
 
@@ -37,6 +38,10 @@ do_install_append() {
     cp ${WORKDIR}/0003-turtlebot-bringup-description.launch ${D}${ros_datadir}/turtlebot_bringup/launch/description.launch
     rm -rf ${D}${ros_datadir}/turtlebot_bringup/patches
 
+    install -d ${D}${ros_datadir}/turtlebot_teleop
+    cp -r ${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_teleop/* ${D}${ros_datadir}/turtlebot_teleop
+    rm -rf ${D}${ros_datadir}/turtlebot_teleop/patches
+
     install -d ${D}${ros_datadir}/turtlebot_navigation
     cp -r ${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation/* ${D}${ros_datadir}/turtlebot_navigation
     rm -rf ${D}${ros_datadir}/turtlebot_navigation/patches
@@ -46,6 +51,7 @@ FILES_${PN} += "${ros_datadir}/turtlebot_mmwave_launchers"
 FILES_${PN} += "${ros_datadir}/ti_mmwave_rospkg"
 FILES_${PN} += "${ros_datadir}/turtlebot_bringup"
 FILES_${PN} += "${ros_datadir}/turtlebot_description"
+FILES_${PN} += "${ros_datadir}/turtlebot_teleop"
 FILES_${PN} += "${ros_datadir}/turtlebot_navigation"
 
 ROS_SPN = "turtlebot_mmwave_launchers"
-- 
1.9.1


