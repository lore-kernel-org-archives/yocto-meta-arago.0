Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D989D52A0E
	for <meta-arago@arago-project.org>;
	Tue, 18 Sep 2018 20:13:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8IKDjEO062678
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537301625;
	bh=GhSu8J5wcSi4qTUU0KIdD3riCC7vV+LjTtqY1D8WyCw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=LEUcxJ2FqFWxKlDDA3xTOij02o+Grfd3iHVkI6rhcuKo7JDeusfxn8yd6ovkMuQxH
	f+Hkt3yKpkIDbT3oqjjr9xIC5tok6QNuYUML0cHJMPmktO7jrwTQIODDEXFhFVaYWX
	iVE9rOlcSEHVvlbz7bYv3NA8LagU6T9WKknfcD18=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDjfP003550
	for <meta-arago@arago-project.org>; Tue, 18 Sep 2018 15:13:45 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 18 Sep 2018 15:13:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 18 Sep 2018 15:13:45 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8IKDit7002786;
	Tue, 18 Sep 2018 15:13:44 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 18 Sep 2018 16:13:37 -0400
Message-ID: <1537301622-8988-3-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1537301622-8988-1-git-send-email-a0271529@ti.com>
References: <1537301622-8988-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 2/7] hector*: add hector-trajectory-server and its dependent packages
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
 recipes-ros/hector-slam/hector-map-tools_0.3.5.bb         | 8 ++++++++
 recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb          | 8 ++++++++
 recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb | 9 +++++++++
 3 files changed, 25 insertions(+)
 create mode 100644 recipes-ros/hector-slam/hector-map-tools_0.3.5.bb
 create mode 100644 recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb
 create mode 100644 recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb

diff --git a/recipes-ros/hector-slam/hector-map-tools_0.3.5.bb b/recipes-ros/hector-slam/hector-map-tools_0.3.5.bb
new file mode 100644
index 0000000..4ac5a0c
--- /dev/null
+++ b/recipes-ros/hector-slam/hector-map-tools_0.3.5.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "hector_map_tools contains some functions related to accessing information from OccupancyGridMap maps."
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://package.xml;beginline=17;endline=17;md5=d566ef916e9dedc494f5f793a6690ba5"
+
+DEPENDS = "nav-msgs libeigen"
+
+require recipes-ros/hector-slam/hector-slam.inc
diff --git a/recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb b/recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb
new file mode 100644
index 0000000..e8c82c4
--- /dev/null
+++ b/recipes-ros/hector-slam/hector-nav-msgs_0.3.5.bb
@@ -0,0 +1,8 @@
+DESCRIPTION = "hector_nav_msgs contains messages and services used in the hector_slam stack."
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://package.xml;beginline=16;endline=16;md5=d566ef916e9dedc494f5f793a6690ba5"
+
+DEPENDS = "cmake-modules nav-msgs geometry-msgs message-generation"
+
+require recipes-ros/hector-slam/hector-slam.inc
diff --git a/recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb b/recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb
new file mode 100644
index 0000000..f6afe95
--- /dev/null
+++ b/recipes-ros/hector-slam/hector-trajectory-server_0.3.5.bb
@@ -0,0 +1,9 @@
+DESCRIPTION = "hector_trajectory_server  keeps track of tf trajectories extracted from tf data and \
+               makes this data accessible via a service and topic"
+SECTION = "devel"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://package.xml;beginline=16;endline=16;md5=d566ef916e9dedc494f5f793a6690ba5"
+
+DEPENDS = "cmake-modules tf roscpp hector-nav-msgs nav-msgs hector-map-tools"
+
+require recipes-ros/hector-slam/hector-slam.inc
-- 
1.9.1


