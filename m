Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3C3DB52A12
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2018 20:13:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IKDjA8059455
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537301625;
	bh=ahKgseINce3jUYNcErQn4mme9MtMIMPD+VV4auAAQTg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=blApg0D0DsNPyZqxAaZi2XLjNtUN6DHnG8/1THHRmucpJ/sEJXU2oKTKglpU2TCbR
	Ac33mCWjnf4W034qCrHXasNyCv4DhMCK2OmIhqeQBSyFuvzHnrShbjlSY+6s7704dw
	lhsVvo21xNkRRNd0K7xBLXFHaKp8WiqdC51cpojE=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDja4003565
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 15:13:46 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 15:13:45 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDit9002786;
	Tue, 18 Sep 2018 15:13:45 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Sep 2018 16:13:39 -0400
Message-ID: <1537301622-8988-5-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537301622-8988-1-git-send-email-a0271529@ti.com>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 4/7] rotate-recovery: add patch for ROS navigation demo
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
 ...navigation-rotate-recovery-mmwave-changes.patch | 88 ++++++++++++++++++++++
 .../navigation/rotate-recovery_1.12.14.bbappend    |  5 ++
 2 files changed, 93 insertions(+)
 create mode 100644 recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch
 create mode 100644 recipes-ros/navigation/rotate-recovery_1.12.14.bbappend

diff --git a/recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch b/recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch
new file mode 100644
index 0000000..089ac34
--- /dev/null
+++ b/recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch
@@ -0,0 +1,88 @@
+diff --git a/rotate_recovery/src/rotate_recovery.cpp b/rotate_recovery/src/rotate_recovery.cpp
+index 64e9999..65959e8 100644
+--- a/rotate_recovery/src/rotate_recovery.cpp
++++ b/rotate_recovery/src/rotate_recovery.cpp
+@@ -3,6 +3,7 @@
+ * Software License Agreement (BSD License)
+ *
+ *  Copyright (c) 2009, Willow Garage, Inc.
++*  Copyright (c) 2017, Texas Instruments Incorporated
+ *  All rights reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+@@ -38,7 +39,7 @@
+ #include <pluginlib/class_list_macros.h>
+ 
+ //register this planner as a RecoveryBehavior plugin
+-PLUGINLIB_DECLARE_CLASS(rotate_recovery, RotateRecovery, rotate_recovery::RotateRecovery, nav_core::RecoveryBehavior)
++PLUGINLIB_EXPORT_CLASS(rotate_recovery::RotateRecovery, nav_core::RecoveryBehavior)
+ 
+ namespace rotate_recovery {
+ RotateRecovery::RotateRecovery(): global_costmap_(NULL), local_costmap_(NULL), 
+@@ -54,7 +55,7 @@ void RotateRecovery::initialize(std::string name, tf::TransformListener* tf,
+ 
+     //get some parameters from the parameter server
+     ros::NodeHandle private_nh("~/" + name_);
+-    ros::NodeHandle blp_nh("~/TrajectoryPlannerROS");
++    ros::NodeHandle blp_nh("~/DWAPlannerROS");
+ 
+     //we'll simulate every degree by default
+     private_nh.param("sim_granularity", sim_granularity_, 0.017);
+@@ -88,8 +89,13 @@ void RotateRecovery::runBehavior(){
+     ROS_ERROR("The costmaps passed to the RotateRecovery object cannot be NULL. Doing nothing.");
+     return;
+   }
+-  ROS_WARN("Rotate recovery behavior started.");
++  ROS_WARN("mmWave customized rotate recovery behavior started.");
+ 
++  ROS_WARN("Clearing costmaps...");
++  global_costmap_->resetLayers();
++  local_costmap_->resetLayers();
++
++  ROS_WARN("Performing rotation...");
+   ros::Rate r(frequency_);
+   ros::NodeHandle n;
+   ros::Publisher vel_pub = n.advertise<geometry_msgs::Twist>("cmd_vel", 10);
+@@ -101,15 +107,15 @@ void RotateRecovery::runBehavior(){
+ 
+   bool got_180 = false;
+ 
+-  double start_offset = 0 - angles::normalize_angle(tf::getYaw(global_pose.getRotation()));
++  double start_offset = angles::normalize_angle_positive(tf::getYaw(global_pose.getRotation()));
+   while(n.ok()){
+     local_costmap_->getRobotPose(global_pose);
+ 
+-    double norm_angle = angles::normalize_angle(tf::getYaw(global_pose.getRotation()));
+-    current_angle = angles::normalize_angle(norm_angle + start_offset);
++    double norm_angle = angles::normalize_angle_positive(tf::getYaw(global_pose.getRotation()));
++    current_angle = angles::normalize_angle_positive(norm_angle - start_offset);
+ 
+     //compute the distance left to rotate
+-    double dist_left = M_PI - current_angle;
++    double dist_left = (2 * M_PI) - current_angle;
+ 
+     double x = global_pose.getOrigin().x(), y = global_pose.getOrigin().y();
+ 
+@@ -142,12 +148,20 @@ void RotateRecovery::runBehavior(){
+     vel_pub.publish(cmd_vel);
+ 
+     //makes sure that we won't decide we're done right after we start
+-    if(current_angle < 0.0)
++    if ((fabs(current_angle - M_PI) < M_PI/2) && (got_180 == false))
++    {
+       got_180 = true;
++    }
+ 
+     //if we're done with our in-place rotation... then return
+-    if(got_180 && current_angle >= (0.0 - tolerance_))
++    if(got_180 && ((current_angle >= (2*M_PI - tolerance_)) || (current_angle <= (M_PI/2))))
++    {
++      cmd_vel.angular.z = 0;
++      vel_pub.publish(cmd_vel);
++
++      ROS_WARN("Completed rotation...");
+       return;
++    }
+ 
+     r.sleep();
+   }
diff --git a/recipes-ros/navigation/rotate-recovery_1.12.14.bbappend b/recipes-ros/navigation/rotate-recovery_1.12.14.bbappend
new file mode 100644
index 0000000..435a3d6
--- /dev/null
+++ b/recipes-ros/navigation/rotate-recovery_1.12.14.bbappend
@@ -0,0 +1,5 @@
+PR_append = ".tisdk0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://0001-navigation-rotate-recovery-mmwave-changes.patch;patchdir=.."
-- 
1.9.1


