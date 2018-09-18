Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 92C5852A02
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2018 20:13:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IKDkq0064584
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537301626;
	bh=dqkPRkmD0c3u4uxoRyW4bpX/zPWRS17Onh0+dqcjW5A=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ntZTShEaIY8tckZ9ZpiL0O82duBpNgg+a5uJ8qMVTFtxW0XBtYm6qtnA8eoUbqwdN
	W7qkmDW9dyXNNwjyUpjReUE8pNhmKBVYmxRCpK9VOFCRVdYA+36V2Q7h02f2lWZIIr
	alXXd8jYgxCtJARSA4iHfWMzAzFGhVddEz3oF3ao=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDkCg028230
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:46 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 15:13:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 15:13:45 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDitA002786;
	Tue, 18 Sep 2018 15:13:45 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Sep 2018 16:13:40 -0400
Message-ID: <1537301622-8988-6-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537301622-8988-1-git-send-email-a0271529@ti.com>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 5/7] move-base: add patch for ROS navigation demo
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
X-List-Received-Date: Tue, 18 Sep 2018 20:13:56 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../0002-navigation-move-base-mmwave-changes.patch | 22 ++++++++++++++++++++++
 recipes-ros/navigation/move-base_1.12.14.bbappend  |  5 +++++
 2 files changed, 27 insertions(+)
 create mode 100644 recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch
 create mode 100644 recipes-ros/navigation/move-base_1.12.14.bbappend

diff --git a/recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch b/recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch
new file mode 100644
index 0000000..0ab97b1
--- /dev/null
+++ b/recipes-ros/navigation/files/0002-navigation-move-base-mmwave-changes.patch
@@ -0,0 +1,22 @@
+diff --git a/move_base/src/move_base.cpp b/move_base/src/move_base.cpp
+index c608d37..43e0e8c 100644
+--- a/move_base/src/move_base.cpp
++++ b/move_base/src/move_base.cpp
+@@ -3,6 +3,7 @@
+ * Software License Agreement (BSD License)
+ *
+ *  Copyright (c) 2008, Willow Garage, Inc.
++*  Copyright (c) 2017, Texas Instruments Incorporated
+ *  All rights reserved.
+ *
+ *  Redistribution and use in source and binary forms, with or without
+@@ -662,6 +663,9 @@ namespace move_base {
+       controller_costmap_ros_->start();
+     }
+ 
++    // Perform initial rotation
++    recovery_behaviors_[recovery_index_]->runBehavior();
++
+     //we want to make sure that we reset the last time we had a valid plan and control
+     last_valid_control_ = ros::Time::now();
+     last_valid_plan_ = ros::Time::now();
diff --git a/recipes-ros/navigation/move-base_1.12.14.bbappend b/recipes-ros/navigation/move-base_1.12.14.bbappend
new file mode 100644
index 0000000..fd3ef69
--- /dev/null
+++ b/recipes-ros/navigation/move-base_1.12.14.bbappend
@@ -0,0 +1,5 @@
+PR_append = ".tisdk0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI += "file://0002-navigation-move-base-mmwave-changes.patch;patchdir=.."
-- 
1.9.1


