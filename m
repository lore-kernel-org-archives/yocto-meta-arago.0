Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id D58AE52090
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 02:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F27AA208E3;
	Mon, 27 Mar 2017 02:10:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XsWuto8eTmmj; Mon, 27 Mar 2017 02:10:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D867220BC5;
	Mon, 27 Mar 2017 02:10:56 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id D262716242F;
	Sun, 26 Mar 2017 22:10:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Sun, 26 Mar 2017 22:10:51 -0400
Message-Id: <1490580653-40192-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490580653-40192-1-git-send-email-denis@denix.org>
References: <1490580653-40192-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 6/8] weston: disable local patches - no longer apply to 2.x
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
X-List-Received-Date: Mon, 27 Mar 2017 02:10:58 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston_2.0.0.bbappend          | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
index f8329c8..4a6c580 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_2.0.0.bbappend
@@ -10,10 +10,11 @@ RDEPENDS_${PN} += "weston-conf"
 
 
 SRC_URI += " \
-	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
-	file://0002-Weston-Allow-visual_id-to-be-0.patch \
-	file://0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
-	file://0004-Weston-Fix-touch-screen-crash-issue.patch \
-	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch \
-	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch \
 "
+
+#	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch
+#	file://0002-Weston-Allow-visual_id-to-be-0.patch
+#	file://0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
+#	file://0004-Weston-Fix-touch-screen-crash-issue.patch
+#	file://0001-compositor-drm-fix-hotplug-weston-termination-proble.patch
+#	file://0001-compositor-drm-support-RGB565-with-pixman-renderer.patch
-- 
2.7.4


