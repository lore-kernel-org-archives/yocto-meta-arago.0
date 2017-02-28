Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id F0FA252980
	for <meta-arago@arago-project.org>;
	Tue, 28 Feb 2017 02:41:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 885AE20BA5;
	Tue, 28 Feb 2017 02:41:48 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 2blpodpTIKHq; Tue, 28 Feb 2017 02:41:48 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 5E814209A4;
	Tue, 28 Feb 2017 02:41:47 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B047C162396;
	Mon, 27 Feb 2017 21:41:46 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 27 Feb 2017 21:41:46 -0500
Message-Id: <1488249706-52208-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488249706-52208-1-git-send-email-denis@denix.org>
References: <1488249706-52208-1-git-send-email-denis@denix.org>
Subject: [morty/master][PATCH 2/2] packagegroups: add kexec and kdump packages for all platforms
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
X-List-Received-Date: Tue, 28 Feb 2017 02:41:52 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb       | 4 +---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 +++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 75cb719..bc9a796 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r15"
+PR = "r16"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -162,8 +162,6 @@ RDEPENDS_${PN} = "\
     dtc \
     procps \
     dhcp-client \
-    kexec \
-    kdump \
     tzdata \
     lksctp-tools \
     lksctp-tools-utils \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 2f7250f..dfbdbde 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install additional utilities/demos for SDKs"
 LICENSE = "MIT"
-PR = "r57"
+PR = "r58"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -26,6 +26,8 @@ UTILS = " \
     ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
     stream \
     strongswan \
+    kexec \
+    kdump \
 "
 
 UTILS_UBOOT_FW = "u-boot-fw-utils"
-- 
2.7.4


