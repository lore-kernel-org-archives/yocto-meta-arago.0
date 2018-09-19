Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 45A08529E6
	for <meta-arago@arago-project.org>;
	Wed, 19 Sep 2018 13:10:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JDAESL032811
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 08:10:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537362614;
	bh=lvV2U6h34DHcr4t9TJkQGkwtbuERsM44i7KYvgWzTyc=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=KY5LX5quyLiszwWRl2yHuDMOR2o57ODxg4qvMHGbvnBqpA7xaJb5aCdX++H/0AW9/
	5t5+xV3TYTSACtg068FrPKFix0RpmyC2f/BYUAe4EJnA95yOMLRB0fknuOoOQrQMyf
	Dl40Nu6iJmbe4UrhhoLLU/Ck9TNTmWnLVD7ILs6M=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JDADiv008660
	for <meta-arago@arago-project.org>; Wed, 19 Sep 2018 08:10:14 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 08:10:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 08:10:13 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JDADU0011476;
	Wed, 19 Sep 2018 08:10:13 -0500
To: Hongmei Gou <a0271529@ti.com>, <meta-arago@arago-project.org>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
	<1537301622-8988-5-git-send-email-a0271529@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <1675d123-f3c8-fdbf-8483-65f31933f54a@ti.com>
Date: Wed, 19 Sep 2018 09:10:13 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1537301622-8988-5-git-send-email-a0271529@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [meta-processor-sdk 4/7] rotate-recovery: add patch for ROS navigation demo
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
X-List-Received-Date: Wed, 19 Sep 2018 13:10:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/18/2018 4:13 PM, Hongmei Gou wrote:
> Signed-off-by: Hongmei Gou <a0271529@ti.com>
> ---
>   ...navigation-rotate-recovery-mmwave-changes.patch | 88 ++++++++++++++++++++++
>   .../navigation/rotate-recovery_1.12.14.bbappend    |  5 ++
>   2 files changed, 93 insertions(+)
>   create mode 100644 recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch
>   create mode 100644 recipes-ros/navigation/rotate-recovery_1.12.14.bbappend
>
> diff --git a/recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch b/recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch
> new file mode 100644
> index 0000000..089ac34
> --- /dev/null
> +++ b/recipes-ros/navigation/files/0001-navigation-rotate-recovery-mmwave-changes.patch
> @@ -0,0 +1,88 @@
> +diff --git a/rotate_recovery/src/rotate_recovery.cpp b/rotate_recovery/src/rotate_recovery.cpp

Patches should have an "Upstream-Status".

https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status

> +index 64e9999..65959e8 100644
> +--- a/rotate_recovery/src/rotate_recovery.cpp
> ++++ b/rotate_recovery/src/rotate_recovery.cpp
> +@@ -3,6 +3,7 @@
> + * Software License Agreement (BSD License)
> + *
> + *  Copyright (c) 2009, Willow Garage, Inc.
> ++*  Copyright (c) 2017, Texas Instruments Incorporated
> + *  All rights reserved.
> + *
> + *  Redistribution and use in source and binary forms, with or without
> +@@ -38,7 +39,7 @@
> + #include <pluginlib/class_list_macros.h>
> +
> + //register this planner as a RecoveryBehavior plugin
> +-PLUGINLIB_DECLARE_CLASS(rotate_recovery, RotateRecovery, rotate_recovery::RotateRecovery, nav_core::RecoveryBehavior)
> ++PLUGINLIB_EXPORT_CLASS(rotate_recovery::RotateRecovery, nav_core::RecoveryBehavior)
> +
> + namespace rotate_recovery {
> + RotateRecovery::RotateRecovery(): global_costmap_(NULL), local_costmap_(NULL),
> +@@ -54,7 +55,7 @@ void RotateRecovery::initialize(std::string name, tf::TransformListener* tf,
> +
> +     //get some parameters from the parameter server
> +     ros::NodeHandle private_nh("~/" + name_);
> +-    ros::NodeHandle blp_nh("~/TrajectoryPlannerROS");
> ++    ros::NodeHandle blp_nh("~/DWAPlannerROS");
> +
> +     //we'll simulate every degree by default
> +     private_nh.param("sim_granularity", sim_granularity_, 0.017);
> +@@ -88,8 +89,13 @@ void RotateRecovery::runBehavior(){
> +     ROS_ERROR("The costmaps passed to the RotateRecovery object cannot be NULL. Doing nothing.");
> +     return;
> +   }
> +-  ROS_WARN("Rotate recovery behavior started.");
> ++  ROS_WARN("mmWave customized rotate recovery behavior started.");
> +
> ++  ROS_WARN("Clearing costmaps...");
> ++  global_costmap_->resetLayers();
> ++  local_costmap_->resetLayers();
> ++
> ++  ROS_WARN("Performing rotation...");
> +   ros::Rate r(frequency_);
> +   ros::NodeHandle n;
> +   ros::Publisher vel_pub = n.advertise<geometry_msgs::Twist>("cmd_vel", 10);
> +@@ -101,15 +107,15 @@ void RotateRecovery::runBehavior(){
> +
> +   bool got_180 = false;
> +
> +-  double start_offset = 0 - angles::normalize_angle(tf::getYaw(global_pose.getRotation()));
> ++  double start_offset = angles::normalize_angle_positive(tf::getYaw(global_pose.getRotation()));
> +   while(n.ok()){
> +     local_costmap_->getRobotPose(global_pose);
> +
> +-    double norm_angle = angles::normalize_angle(tf::getYaw(global_pose.getRotation()));
> +-    current_angle = angles::normalize_angle(norm_angle + start_offset);
> ++    double norm_angle = angles::normalize_angle_positive(tf::getYaw(global_pose.getRotation()));
> ++    current_angle = angles::normalize_angle_positive(norm_angle - start_offset);
> +
> +     //compute the distance left to rotate
> +-    double dist_left = M_PI - current_angle;
> ++    double dist_left = (2 * M_PI) - current_angle;
> +
> +     double x = global_pose.getOrigin().x(), y = global_pose.getOrigin().y();
> +
> +@@ -142,12 +148,20 @@ void RotateRecovery::runBehavior(){
> +     vel_pub.publish(cmd_vel);
> +
> +     //makes sure that we won't decide we're done right after we start
> +-    if(current_angle < 0.0)
> ++    if ((fabs(current_angle - M_PI) < M_PI/2) && (got_180 == false))
> ++    {
> +       got_180 = true;
> ++    }
> +
> +     //if we're done with our in-place rotation... then return
> +-    if(got_180 && current_angle >= (0.0 - tolerance_))
> ++    if(got_180 && ((current_angle >= (2*M_PI - tolerance_)) || (current_angle <= (M_PI/2))))
> ++    {
> ++      cmd_vel.angular.z = 0;
> ++      vel_pub.publish(cmd_vel);
> ++
> ++      ROS_WARN("Completed rotation...");
> +       return;
> ++    }
> +
> +     r.sleep();
> +   }
> diff --git a/recipes-ros/navigation/rotate-recovery_1.12.14.bbappend b/recipes-ros/navigation/rotate-recovery_1.12.14.bbappend
> new file mode 100644
> index 0000000..435a3d6
> --- /dev/null
> +++ b/recipes-ros/navigation/rotate-recovery_1.12.14.bbappend
> @@ -0,0 +1,5 @@
> +PR_append = ".tisdk0"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
> +
> +SRC_URI += "file://0001-navigation-rotate-recovery-mmwave-changes.patch;patchdir=.."


