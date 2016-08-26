Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id BF5955296F
	for <meta-arago@arago-project.org>;
	Fri, 26 Aug 2016 16:20:46 +0000 (UTC)
Received: from vz-proxy-l001.mx.aol.com ([64.236.82.153])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OCI002CKYQLKH10@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Aug 2016 11:20:46 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=FJ1kTJ0/xm5uTekQe8vMdQ==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=0oAGuvO23ehYHWU7PssA:9
Received: by 100.15.86.14 with SMTP id 67a4c8d3; Fri, 26 Aug 2016 16:20:46 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 8EE14162043;	Fri, 26 Aug 2016 12:20:45 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Aug 2016 12:20:45 -0400
Message-id: <1472228445-1344-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] thermal-init: exit if no thermal control is available
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
X-List-Received-Date: Fri, 26 Aug 2016 16:20:47 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/thermal-init/thermal-init.bb   | 2 +-
 meta-arago-distro/recipes-core/thermal-init/thermal-init/init | 4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
index e564b1e..0bc76e0 100644
--- a/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
+++ b/meta-arago-distro/recipes-core/thermal-init/thermal-init.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Init script to enable cpu_thermal zones"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690"
 
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "file://init"
 
diff --git a/meta-arago-distro/recipes-core/thermal-init/thermal-init/init b/meta-arago-distro/recipes-core/thermal-init/thermal-init/init
index 15fdeac..b7e8a36 100644
--- a/meta-arago-distro/recipes-core/thermal-init/thermal-init/init
+++ b/meta-arago-distro/recipes-core/thermal-init/thermal-init/init
@@ -1,5 +1,9 @@
 #!/bin/sh
 
+if [ ! -d /sys/class/thermal ]; then
+    exit 0
+fi
+
 case "$1" in
     start )
         echo "Enabling thermal zones..."
-- 
2.7.4


