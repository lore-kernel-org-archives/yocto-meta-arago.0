Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7FC3B52A98
	for <meta-arago@arago-project.org>;
	Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5381120A3E;
	Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BiaHWHi8TlhG; Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3763120992;
	Thu, 20 Oct 2016 02:48:03 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 586B6162179;
	Wed, 19 Oct 2016 22:48:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Oct 2016 22:47:56 -0400
Message-Id: <1476931679-4689-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476931679-4689-1-git-send-email-denis@denix.org>
References: <1476931679-4689-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 5/8] FIXME: weston: disable custom patches until ported from 1.9 to 1.11
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
X-List-Received-Date: Thu, 20 Oct 2016 02:48:06 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston_1.11.0.bbappend      | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
index 6b00ae0..c96e6d1 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
@@ -8,11 +8,11 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 RDEPENDS_${PN} += "weston-conf"
 
-SRC_URI += " \
-	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
-	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
-	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
-	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
-	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
-	file://0001-Add-soc-performance-monitor-utilites.patch \
-"
+#SRC_URI += " \
+#	file://0001-weston1.9.0-Enabling-DRM-backend-with-multiple-displ.patch \
+#	file://0002-Weston1.9.0-Allow-visual_id-to-be-0.patch \
+#	file://0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch \
+#	file://0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch \
+#	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
+#	file://0001-Add-soc-performance-monitor-utilites.patch \
+#"
-- 
2.7.4


