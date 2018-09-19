Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 87CC252079
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 21:46:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JLkA8n024100
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 16:46:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537393570;
	bh=CL/t3rwqmgigQL+53TwISb65+yO/cAzAnkNNRrGrS+Y=;
	h=From:To:CC:Subject:Date;
	b=hKtYVjrr+vWPRb4JvX7oW87NrV7Op190pEka7sSDwi3Db/+C78XWr2ovKyRYxMFpf
	I/xUkRtWWaPeiqNTfaAPq7lnkitR0eMemr3iKO1f+A9F5v+byamC7zj9Kup7AmzWuB
	u95hFzkipFzarSX5NLmozg92M/d039jmWMuajMQE=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JLkA0R003468
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 16:46:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 16:46:09 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 16:46:09 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JLk9Uc031617;
	Wed, 19 Sep 2018 16:46:09 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Sep 2018 17:46:08 -0400
Message-ID: <1537393568-17648-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] mmwave-ros-autonomous-robotics: update patch for navigation params
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
X-List-Received-Date: Wed, 19 Sep 2018 21:46:19 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 ....patch => 0001-turtlebot-navigation-params-yaml.patch} | 15 +++++++++++++--
 .../ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb    |  4 ++--
 2 files changed, 15 insertions(+), 4 deletions(-)
 rename recipes-ros/ros-mmwave/files/{0001-turtlebot-navigation-costmap-params-yaml.patch => 0001-turtlebot-navigation-params-yaml.patch} (63%)

diff --git a/recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-costmap-params-yaml.patch b/recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-params-yaml.patch
similarity index 63%
rename from recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-costmap-params-yaml.patch
rename to recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-params-yaml.patch
index 7fba277..91b6f14 100644
--- a/recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-costmap-params-yaml.patch
+++ b/recipes-ros/ros-mmwave/files/0001-turtlebot-navigation-params-yaml.patch
@@ -5,7 +5,7 @@
     global_frame: /map
     robot_base_frame: /base_footprint
 -   update_frequency: 15
-+   update_frequency: 8 
++   update_frequency: 7
     publish_frequency: 5
     static_map: false
     rolling_window: true
@@ -16,7 +16,18 @@
     global_frame: /odom
     robot_base_frame: /base_footprint
 -   update_frequency: 20
-+   update_frequency: 15
++   update_frequency: 12
     publish_frequency: 10
     static_map: false
     rolling_window: true
+--- a/param/move_base_params.yaml
++++ b/param/move_base_params.yaml
+@@ -11,7 +11,7 @@
+ planner_frequency: 1.0
+ planner_patience: 5.0
+
+-oscillation_timeout: 0.0
++oscillation_timeout: 10.0
+ oscillation_distance: 0.2
+
+ # local planner - default is trajectory rollout
diff --git a/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
index 1c391e2..2bce70f 100644
--- a/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
+++ b/recipes-ros/ros-mmwave/mmwave-ros-autonomous-robotics_2.5.1.bb
@@ -9,13 +9,13 @@ SRC_URI = "http://dev.ti.com/tirex/content/mmwave_industrial_toolbox_2_5_1/labs/
 
 SRC_URI += "file://0001-turtlebot-bringup-description-launch-xml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
             file://0002-turtlebot-bringup-minimal-launch.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot/turtlebot_bringup \
-            file://0001-turtlebot-navigation-costmap-params-yaml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation \
+            file://0001-turtlebot-navigation-params-yaml.patch;patchdir=${WORKDIR}/${P}/turtlebot/turtlebot_apps/turtlebot_navigation \
             file://0001-turtlebot-mmwave-launchers-navigation-visualization-rviz.patch;patchdir=${S} \
 "
 
 S = "${WORKDIR}/${P}/turtlebot_mmwave_launchers"
 
-PR = "r1"
+PR = "r2"
 
 inherit catkin
 
-- 
1.9.1


