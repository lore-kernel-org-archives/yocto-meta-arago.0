Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id ACD7852AAD
	for <meta-arago@arago-project.org>;
	Wed,  8 Apr 2020 00:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 79FEB40A6E;
	Wed,  8 Apr 2020 00:45:15 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id nf5HZj_j5dfg; Wed,  8 Apr 2020 00:45:15 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E85C40C37;
	Wed,  8 Apr 2020 00:45:10 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F2541171906;
	Tue,  7 Apr 2020 20:45:08 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue,  7 Apr 2020 20:44:48 -0400
Message-Id: <1586306702-7953-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586306702-7953-1-git-send-email-denis@denix.org>
References: <1586306702-7953-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 10/24] gstreamer1.0-plugins-hevc: skip texrel QA check, cleanup
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
X-List-Received-Date: Wed, 08 Apr 2020 00:47:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb            | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
index 7a95a06..1f9796c 100644
--- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
+++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "GStreamer plugin for ARM HEVC decoder"
+SUMMARY = "GStreamer plugin for ARM HEVC decoder"
 HOMEPAGE = "https://git.ti.com/processor-sdk/gst-plugin-hevc"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2827f94fc0a1adeff4d9702e97ce2979"
@@ -18,9 +18,9 @@ inherit autotools-brokensep pkgconfig gettext
 PR = "r5"
 
 do_configure() {
-        cd ${S}
-        chmod +x autogen.sh
-        ./autogen.sh --host=arm-linux --with-libtool-sysroot=${STAGING_DIR_TARGET} --prefix=/usr
+    cd ${S}
+    chmod +x autogen.sh
+    ./autogen.sh --host=arm-linux --with-libtool-sysroot=${STAGING_DIR_TARGET} --prefix=/usr
 }
 
 EXTRA_OECONF += "--enable-maintainer-mode"
@@ -29,3 +29,5 @@ EXTRA_OEMAKE += "'ERROR_CFLAGS=-Wno-deprecated-declarations'"
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dbg += "${libdir}/gstreamer-1.0/.debug"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
+
+INSANE_SKIP_${PN} = "textrel"
-- 
2.7.4


