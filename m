Return-Path: <sam.nelson@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 114C452A23
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 01:55:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0U1tj5v026374
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 19:55:45 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0U1tihK007432
	for <meta-arago@arago-project.org>; Thu, 29 Jan 2015 19:55:44 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 29 Jan 2015 19:55:44 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t0U1tioK015834;	Thu, 29 Jan 2015 19:55:44 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Jan 2015 20:55:42 -0500
Message-ID: <1422582942-7233-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH v2] busybox: Update default configuration of busybox
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
X-List-Received-Date: Fri, 30 Jan 2015 01:55:47 -0000
Content-Type: text/plain

- Add ARP and ARPING to default configuration

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous version of patch
- Updated PR
---
---
 .../recipes-core/busybox/busybox/defconfig         |    4 ++--
 .../recipes-core/busybox/busybox_1.22.1.bbappend   |   11 ++++++++++-
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 69d7e5f..c3aa413 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -729,8 +729,8 @@ CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 CONFIG_FEATURE_PREFER_IPV4_ADDRESS=y
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
-# CONFIG_ARP is not set
-# CONFIG_ARPING is not set
+CONFIG_ARP=y
+CONFIG_ARPING=y
 CONFIG_BRCTL=y
 CONFIG_FEATURE_BRCTL_FANCY=y
 CONFIG_FEATURE_BRCTL_SHOW=y
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
index 0f49e64..7d89239 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.22.1.bbappend
@@ -1,9 +1,18 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago13"
+PR_append = "-arago15"
 
 SRC_URI += " \
 	file://inetd \
 	file://inetd.conf \
+	file://hwclock.sh \
+	file://hwclock \
 "
+
+do_install_append () {
+	if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
+		install -d ${D}${sysconfdir}/default
+		install -m 0755 ${WORKDIR}/hwclock ${D}${sysconfdir}/default/
+	fi
+}
-- 
1.7.9.5


