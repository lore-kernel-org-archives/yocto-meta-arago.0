Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id BD20052A2C
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2018 02:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 921B920C5E;
	Thu,  9 Aug 2018 02:01:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mlWchMJM1GIx; Thu,  9 Aug 2018 02:01:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id B330320C5C;
	Thu,  9 Aug 2018 02:01:00 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 8F2E7163583;
	Wed,  8 Aug 2018 22:00:58 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  8 Aug 2018 22:00:52 -0400
Message-Id: <1533780054-50159-12-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533780054-50159-1-git-send-email-denys@ti.com>
References: <1533780054-50159-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 12/14] weston: disable ivi-shell and virtual-keyboard patches
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
X-List-Received-Date: Thu, 09 Aug 2018 02:01:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston_4.0.0.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_4.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_4.0.0.bbappend
index ec8e6b0..82db6d1 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston_4.0.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston_4.0.0.bbappend
@@ -8,13 +8,13 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 RDEPENDS_${PN} += "weston-conf"
 
+#        file://0001-ivi-shell-add_screen_remove_layer-API.patch
+#        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch
 
 SRC_URI += " \
 	file://0001-udev-seat-restrict-udev-enumeration-to-card0.patch \
         file://0002-weston-Allow-visual_id-to-be-0.patch \
-        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
         file://0004-weston-Fix-touch-screen-crash-issue.patch \
-        file://0001-ivi-shell-add_screen_remove_layer-API.patch \
 "
 
 INHIBIT_PACKAGE_STRIP = "1"
-- 
2.7.4


