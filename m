Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3B5D652093
	for <meta-arago@arago-project.org>;
	Sat,  7 Feb 2015 23:53:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t17Nr6Mm004121
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t17Nr5M6015417
	for <meta-arago@arago-project.org>; Sat, 7 Feb 2015 17:53:05 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Sat, 7 Feb 2015 17:53:05 -0600
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t17Nr4r4028513;	Sat, 7 Feb 2015 17:53:05 -0600
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id t17NqxIc010769;	Sun, 8 Feb 2015 05:23:03 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 7 Feb 2015 17:52:51 -0600
Message-ID: <1423353177-8325-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1423353177-8325-1-git-send-email-fcooper@ti.com>
References: <1423353177-8325-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/9] packagegroup-arago-tisdk-amsdk: Add gadget-init to am437x
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
X-List-Received-Date: Sat, 07 Feb 2015 23:53:07 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Gadget-init is usefully for boards like AM335x SK and Beaglebone.
* Since AM437x now has a SK board then it makes to add it for that soc also.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-amsdk.bb              |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
index c2eb72b..bfb5935 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-amsdk.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 inherit packagegroup
 
@@ -15,6 +15,7 @@ OOBE_ti33x += "\
 "
 
 OOBE_ti43x += "\
+    gadget-init \
     parse-ip \
 "
 
-- 
1.7.9.5


