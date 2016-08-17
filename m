Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 25664529F4
	for <meta-arago@arago-project.org>;
	Wed, 17 Aug 2016 20:36:03 +0000 (UTC)
Received: from vz-proxy-m002.mx.aol.com ([64.236.83.3])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OC2009HRMJ2K300@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 17 Aug 2016 15:35:41 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=yQ9kT6OsLgv7WE5tBE7I5g==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=owv-olNM7LyyFJAkniUA:9
Received: by 100.15.86.14 with SMTP id 560791ac; Wed, 17 Aug 2016 20:35:41 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id 177921620F6;	Wed, 17 Aug 2016 16:35:26 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 17 Aug 2016 16:35:24 -0400
Message-id: <1471466125-28176-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] images: move bash and udev-extraconf to base packagegroup
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
X-List-Received-Date: Wed, 17 Aug 2016 20:36:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/images/arago-image.inc                 | 2 --
 .../recipes-core/packagegroups/packagegroup-arago-base.bb             | 4 +++-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-image.inc b/meta-arago-distro/recipes-core/images/arago-image.inc
index af28cd0..1c566ae 100644
--- a/meta-arago-distro/recipes-core/images/arago-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-image.inc
@@ -12,8 +12,6 @@ ARAGO_IMAGE_EXTRA_INSTALL ?= ""
 
 IMAGE_INSTALL += " \
 	packagegroup-core-boot \
-	bash \
-	udev-extraconf \
 	${ARAGO_IMAGE_EXTRA_INSTALL} \
 "
 
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index 42f16b0..7832a89 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Basic task to get a device booting"
 LICENSE = "MIT"
-PR = "r8"
+PR = "r9"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -19,6 +19,8 @@ ARAGO_BASE = "\
     initscript-telnetd \
     ethtool \
     thermal-init \
+    bash \
+    udev-extraconf \
     "
 
 # these require meta-openembedded/meta-oe layer
-- 
2.7.4


