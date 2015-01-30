Return-Path: <sam.nelson@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 5C35E529EB
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 23:19:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UNJbDF032032
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 17:19:37 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UNJabL028669
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 17:19:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 17:19:36 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0UNJZlQ017443;	Fri, 30 Jan 2015 17:19:35 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 30 Jan 2015 18:19:33 -0500
Message-ID: <1422659974-29180-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 1/2] libnl: Add append recipe to expose private files
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
X-List-Received-Date: Fri, 30 Jan 2015 23:19:39 -0000
Content-Type: text/plain

- Private files installed are needed to allow xfrm extension of libnl
- Version 3.2.24 already have this patch

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
This is needed temporarily to patch 3.2.22 as the arago preferred version is 3.2.22
---
---
 .../recipes-support/libnl/libnl_3.2.22.bbappend    |    8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbappend

diff --git a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbappend b/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbappend
new file mode 100644
index 0000000..4885c7d
--- /dev/null
+++ b/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bbappend
@@ -0,0 +1,8 @@
+PR_append = "-arago0"
+
+do_install_append() {
+#   Install private files to allow libnl extensions
+    install -d ${D}${includedir}/netlink-private
+    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/netlink-private/
+    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/netlink-private/
+}
-- 
1.7.9.5


