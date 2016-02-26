Return-Path: <h-gou@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0503352004
	for <meta-arago@arago-project.org>;
	Fri, 26 Feb 2016 16:48:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1QGm0Pm016855
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 10:48:00 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1QGm0IY031547
	for <meta-arago@arago-project.org>; Fri, 26 Feb 2016 10:48:00 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 26 Feb 2016 10:48:00 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1QGm0Yq010783;	Fri, 26 Feb 2016 10:48:00 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 26 Feb 2016 11:47:57 -0500
Message-ID: <1456505277-17729-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] tisdk-server-extra-rootfs-image: add multimedia packagegroup
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
X-List-Received-Date: Fri, 26 Feb 2016 16:48:02 -0000
Content-Type: text/plain

* This addition is to include gstreamer for keystone2

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
index 6013160..432f421 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-extra-rootfs-image.bb
@@ -3,6 +3,7 @@ require recipes-core/images/tisdk-server-rootfs-image.bb
 IMAGE_INSTALL += "\
     packagegroup-arago-test-addons \
     packagegroup-arago-tisdk-addons-extra \
+    packagegroup-arago-tisdk-multimedia \
 "
 
 export IMAGE_BASENAME = "tisdk-server-extra-rootfs-image"
-- 
1.9.1


