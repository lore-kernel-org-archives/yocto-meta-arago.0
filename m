Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 76AD452968
	for <meta-arago@arago-project.org>;
	Wed, 16 Jan 2019 23:15:17 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x0GNF49s121183
	for <meta-arago@arago-project.org>; Wed, 16 Jan 2019 17:15:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1547680504;
	bh=4mgN4xUWH4l3ZMRiyxoAFZqC82UyLyFUP3Xy1chIDBQ=;
	h=From:To:CC:Subject:Date;
	b=QOxKW907L2GQIeX8/yBJdFHPPFr0ABylXXfaP4OWVYK6tOKPnaJEIMtzeQzrLo+6D
	K0+QB/mudvXknWvk8jjkCL3FlrALmHC4S3U6p2LGlEUKjLkWPYry6Y2ldGXOdpoHoF
	AQCEVX/VRPNNtE/CfGhg5PMcnisnhkamWw3Ow0X8=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x0GNF4Yt009525
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 16 Jan 2019 17:15:04 -0600
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 16 Jan 2019 17:15:04 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 16 Jan 2019 17:15:04 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x0GNF3WR014772;
	Wed, 16 Jan 2019 17:15:03 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 16 Jan 2019 18:15:02 -0500
Message-ID: <1547680502-24553-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] move-base: update the patch to match with lab0008-autonomous-robotics-ros
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
X-List-Received-Date: Wed, 16 Jan 2019 23:15:18 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../0002-navigation-move-base-mmwave-changes.patch | 280 ++++++++++++++++++++-
 recipes-ros/navigation/move-base_1.12.14.bbappend  |   2 +-
 2 files changed, 280 insertions(+), 2 deletions(-)

diff --git a/recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch b/recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch
index 0ab97b1..4ff191f 100644
--- a/recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch
+++ b/recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch
@@ -10,7 +10,285 @@ index c608d37..43e0e8c 100644
  *  All rights reserved.
  *
  *  Redistribution and use in source and binary forms, with or without
-@@ -662,6 +663,9 @@ namespace move_base {
+@@ -114,24 +115,9 @@
+ 
+     //initialize the global planner
+     try {
+-      //check if a non fully qualified name has potentially been passed in
+-      if(!bgp_loader_.isClassAvailable(global_planner)){
+-        std::vector<std::string> classes = bgp_loader_.getDeclaredClasses();
+-        for(unsigned int i = 0; i < classes.size(); ++i){
+-          if(global_planner == bgp_loader_.getName(classes[i])){
+-            //if we've found a match... we'll get the fully qualified name and break out of the loop
+-            ROS_WARN("Planner specifications should now include the package name. You are using a deprecated API. Please switch from %s to %s in your yaml file.",
+-                global_planner.c_str(), classes[i].c_str());
+-            global_planner = classes[i];
+-            break;
+-          }
+-        }
+-      }
+-
+       planner_ = bgp_loader_.createInstance(global_planner);
+       planner_->initialize(bgp_loader_.getName(global_planner), planner_costmap_ros_);
+-    } catch (const pluginlib::PluginlibException& ex)
+-    {
++    } catch (const pluginlib::PluginlibException& ex) {
+       ROS_FATAL("Failed to create the %s planner, are you sure it is properly registered and that the containing library is built? Exception: %s", global_planner.c_str(), ex.what());
+       exit(1);
+     }
+@@ -142,25 +128,10 @@
+ 
+     //create a local planner
+     try {
+-      //check if a non fully qualified name has potentially been passed in
+-      if(!blp_loader_.isClassAvailable(local_planner)){
+-        std::vector<std::string> classes = blp_loader_.getDeclaredClasses();
+-        for(unsigned int i = 0; i < classes.size(); ++i){
+-          if(local_planner == blp_loader_.getName(classes[i])){
+-            //if we've found a match... we'll get the fully qualified name and break out of the loop
+-            ROS_WARN("Planner specifications should now include the package name. You are using a deprecated API. Please switch from %s to %s in your yaml file.",
+-                local_planner.c_str(), classes[i].c_str());
+-            local_planner = classes[i];
+-            break;
+-          }
+-        }
+-      }
+-
+       tc_ = blp_loader_.createInstance(local_planner);
+       ROS_INFO("Created local_planner %s", local_planner.c_str());
+       tc_->initialize(blp_loader_.getName(local_planner), &tf_, controller_costmap_ros_);
+-    } catch (const pluginlib::PluginlibException& ex)
+-    {
++    } catch (const pluginlib::PluginlibException& ex) {
+       ROS_FATAL("Failed to create the %s planner, are you sure it is properly registered and that the containing library is built? Exception: %s", local_planner.c_str(), ex.what());
+       exit(1);
+     }
+@@ -248,20 +219,6 @@
+       //initialize the global planner
+       ROS_INFO("Loading global planner %s", config.base_global_planner.c_str());
+       try {
+-        //check if a non fully qualified name has potentially been passed in
+-        if(!bgp_loader_.isClassAvailable(config.base_global_planner)){
+-          std::vector<std::string> classes = bgp_loader_.getDeclaredClasses();
+-          for(unsigned int i = 0; i < classes.size(); ++i){
+-            if(config.base_global_planner == bgp_loader_.getName(classes[i])){
+-              //if we've found a match... we'll get the fully qualified name and break out of the loop
+-              ROS_WARN("Planner specifications should now include the package name. You are using a deprecated API. Please switch from %s to %s in your yaml file.",
+-                  config.base_global_planner.c_str(), classes[i].c_str());
+-              config.base_global_planner = classes[i];
+-              break;
+-            }
+-          }
+-        }
+-
+         planner_ = bgp_loader_.createInstance(config.base_global_planner);
+ 
+         // wait for the current planner to finish planning
+@@ -275,9 +232,9 @@
+         planner_->initialize(bgp_loader_.getName(config.base_global_planner), planner_costmap_ros_);
+ 
+         lock.unlock();
+-      } catch (const pluginlib::PluginlibException& ex)
+-      {
+-        ROS_FATAL("Failed to create the %s planner, are you sure it is properly registered and that the containing library is built? Exception: %s", config.base_global_planner.c_str(), ex.what());
++      } catch (const pluginlib::PluginlibException& ex) {
++        ROS_FATAL("Failed to create the %s planner, are you sure it is properly registered and that the \
++                   containing library is built? Exception: %s", config.base_global_planner.c_str(), ex.what());
+         planner_ = old_planner;
+         config.base_global_planner = last_config_.base_global_planner;
+       }
+@@ -287,20 +244,6 @@
+       boost::shared_ptr<nav_core::BaseLocalPlanner> old_planner = tc_;
+       //create a local planner
+       try {
+-        //check if a non fully qualified name has potentially been passed in
+-        ROS_INFO("Loading local planner: %s", config.base_local_planner.c_str());
+-        if(!blp_loader_.isClassAvailable(config.base_local_planner)){
+-          std::vector<std::string> classes = blp_loader_.getDeclaredClasses();
+-          for(unsigned int i = 0; i < classes.size(); ++i){
+-            if(config.base_local_planner == blp_loader_.getName(classes[i])){
+-              //if we've found a match... we'll get the fully qualified name and break out of the loop
+-              ROS_WARN("Planner specifications should now include the package name. You are using a deprecated API. Please switch from %s to %s in your yaml file.",
+-                  config.base_local_planner.c_str(), classes[i].c_str());
+-              config.base_local_planner = classes[i];
+-              break;
+-            }
+-          }
+-        }
+         tc_ = blp_loader_.createInstance(config.base_local_planner);
+         // Clean up before initializing the new planner
+         planner_plan_->clear();
+@@ -308,9 +251,9 @@
+         controller_plan_->clear();
+         resetState();
+         tc_->initialize(blp_loader_.getName(config.base_local_planner), &tf_, controller_costmap_ros_);
+-      } catch (const pluginlib::PluginlibException& ex)
+-      {
+-        ROS_FATAL("Failed to create the %s planner, are you sure it is properly registered and that the containing library is built? Exception: %s", config.base_local_planner.c_str(), ex.what());
++      } catch (const pluginlib::PluginlibException& ex) {
++        ROS_FATAL("Failed to create the %s planner, are you sure it is properly registered and that the \
++                   containing library is built? Exception: %s", config.base_local_planner.c_str(), ex.what());
+         tc_ = old_planner;
+         config.base_local_planner = last_config_.base_local_planner;
+       }
+@@ -340,19 +283,19 @@
+     geometry_msgs::Point pt;
+ 
+     pt.x = x - size_x / 2;
+-    pt.y = y - size_x / 2;
++    pt.y = y - size_y / 2;
+     clear_poly.push_back(pt);
+ 
+     pt.x = x + size_x / 2;
+-    pt.y = y - size_x / 2;
++    pt.y = y - size_y / 2;
+     clear_poly.push_back(pt);
+ 
+     pt.x = x + size_x / 2;
+-    pt.y = y + size_x / 2;
++    pt.y = y + size_y / 2;
+     clear_poly.push_back(pt);
+ 
+     pt.x = x - size_x / 2;
+-    pt.y = y + size_x / 2;
++    pt.y = y + size_y / 2;
+     clear_poly.push_back(pt);
+ 
+     planner_costmap_ros_->getCostmap()->setConvexPolygonCost(clear_poly, costmap_2d::FREE_SPACE);
+@@ -365,19 +308,19 @@
+     y = global_pose.getOrigin().y();
+ 
+     pt.x = x - size_x / 2;
+-    pt.y = y - size_x / 2;
++    pt.y = y - size_y / 2;
+     clear_poly.push_back(pt);
+ 
+     pt.x = x + size_x / 2;
+-    pt.y = y - size_x / 2;
++    pt.y = y - size_y / 2;
+     clear_poly.push_back(pt);
+ 
+     pt.x = x + size_x / 2;
+-    pt.y = y + size_x / 2;
++    pt.y = y + size_y / 2;
+     clear_poly.push_back(pt);
+ 
+     pt.x = x - size_x / 2;
+-    pt.y = y + size_x / 2;
++    pt.y = y + size_y / 2;
+     clear_poly.push_back(pt);
+ 
+     controller_costmap_ros_->getCostmap()->setConvexPolygonCost(clear_poly, costmap_2d::FREE_SPACE);
+@@ -625,62 +568,55 @@
+       }
+       ros::Time start_time = ros::Time::now();
+ 
+-      if(state_==PLANNING){
+-        //time to plan! get a copy of the goal and unlock the mutex
+-        geometry_msgs::PoseStamped temp_goal = planner_goal_;
++      //time to plan! get a copy of the goal and unlock the mutex
++      geometry_msgs::PoseStamped temp_goal = planner_goal_;
++      lock.unlock();
++      ROS_DEBUG_NAMED("move_base_plan_thread","Planning...");
++
++      //run planner
++      planner_plan_->clear();
++      bool gotPlan = n.ok() && makePlan(temp_goal, *planner_plan_);
++
++      if(gotPlan){
++        ROS_DEBUG_NAMED("move_base_plan_thread","Got Plan with %zu points!", planner_plan_->size());
++        //pointer swap the plans under mutex (the controller will pull from latest_plan_)
++        std::vector<geometry_msgs::PoseStamped>* temp_plan = planner_plan_;
++
++        lock.lock();
++        planner_plan_ = latest_plan_;
++        latest_plan_ = temp_plan;
++        last_valid_plan_ = ros::Time::now();
++        planning_retries_ = 0;
++        new_global_plan_ = true;
++
++        ROS_DEBUG_NAMED("move_base_plan_thread","Generated a plan from the base_global_planner");
++
++        //make sure we only start the controller if we still haven't reached the goal
++        if(runPlanner_)
++          state_ = CONTROLLING;
++        if(planner_frequency_ <= 0)
++          runPlanner_ = false;
+         lock.unlock();
+-        ROS_DEBUG_NAMED("move_base_plan_thread","Planning...");
+-
+-        //run planner
+-        planner_plan_->clear();
+-        bool gotPlan = n.ok() && makePlan(temp_goal, *planner_plan_);
+-
+-        if(gotPlan){
+-          ROS_DEBUG_NAMED("move_base_plan_thread","Got Plan with %zu points!", planner_plan_->size());
+-          //pointer swap the plans under mutex (the controller will pull from latest_plan_)
+-          std::vector<geometry_msgs::PoseStamped>* temp_plan = planner_plan_;
+-
+-          lock.lock();
+-          planner_plan_ = latest_plan_;
+-          latest_plan_ = temp_plan;
+-          last_valid_plan_ = ros::Time::now();
+-          planning_retries_ = 0;
+-          new_global_plan_ = true;
+-
+-          ROS_DEBUG_NAMED("move_base_plan_thread","Generated a plan from the base_global_planner");
+-
+-          //make sure we only start the controller if we still haven't reached the goal
+-          if(runPlanner_)
+-            state_ = CONTROLLING;
+-          if(planner_frequency_ <= 0)
+-            runPlanner_ = false;
+-          lock.unlock();
++      }
++      //if we didn't get a plan and we are in the planning state (the robot isn't moving)
++      else if(state_==PLANNING){
++        ROS_DEBUG_NAMED("move_base_plan_thread","No Plan...");
++        ros::Time attempt_end = last_valid_plan_ + ros::Duration(planner_patience_);
++
++        //check if we've tried to make a plan for over our time limit or our maximum number of retries
++        //issue #496: we stop planning when one of the conditions is true, but if max_planning_retries_
++        //is negative (the default), it is just ignored and we have the same behavior as ever
++        lock.lock();
++        planning_retries_++;
++        if(runPlanner_ &&
++           (ros::Time::now() > attempt_end || planning_retries_ > uint32_t(max_planning_retries_))){
++          //we'll move into our obstacle clearing mode
++          state_ = CLEARING;
++          runPlanner_ = false;  // proper solution for issue #523
++          publishZeroVelocity();
++          recovery_trigger_ = PLANNING_R;
+         }
+-        //if we didn't get a plan and we are in the planning state (the robot isn't moving)
+-        else{
+-          ROS_DEBUG_NAMED("move_base_plan_thread","No Plan...");
+-          ros::Time attempt_end = last_valid_plan_ + ros::Duration(planner_patience_);
+-
+-          //check if we've tried to make a plan for over our time limit or our maximum number of retries
+-          //issue #496: we stop planning when one of the conditions is true, but if max_planning_retries_
+-          //is negative (the default), it is just ignored and we have the same behavior as ever
+-          lock.lock();
+-          planning_retries_++;
+-          if(runPlanner_ &&
+-             (ros::Time::now() > attempt_end || planning_retries_ > uint32_t(max_planning_retries_))){
+-            //we'll move into our obstacle clearing mode
+-            state_ = CLEARING;
+-            wait_for_wake = true;
+-            publishZeroVelocity();
+-            recovery_trigger_ = PLANNING_R;
+-          }
+ 
+-          lock.unlock();
+-        }
+-      }
+-      else
+-      {
+-        //not planning, so just unlock the mutex
+         lock.unlock();
+       }
+ 
+@@ -724,6 +660,9 @@
        controller_costmap_ros_->start();
      }
  
diff --git a/recipes-ros/navigation/move-base_1.12.14.bbappend b/recipes-ros/navigation/move-base_1.12.14.bbappend
index fd3ef69..b231e17 100644
--- a/recipes-ros/navigation/move-base_1.12.14.bbappend
+++ b/recipes-ros/navigation/move-base_1.12.14.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
-- 
1.9.1


