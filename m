Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id F2452520E2
	for <meta-arago@arago-project.org>;
	Mon, 23 Mar 2020 23:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A018A40CAB;
	Mon, 23 Mar 2020 23:39:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Cgns_8vxF8KX; Mon, 23 Mar 2020 23:39:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8E80840CD0;
	Mon, 23 Mar 2020 23:39:26 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 779881712AC;
	Mon, 23 Mar 2020 19:39:25 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Mar 2020 19:39:23 -0400
Message-Id: <1585006764-20750-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [zeus/master][PATCH 1/2] chromium-ozone-wayland: fix building against linux 5.2+ headers
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
X-List-Received-Date: Mon, 23 Mar 2020 23:41:37 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../chromium-75.0.3770.80-SIOCGSTAMP.patch                | 15 +++++++++++++++
 .../chromium/chromium-ozone-wayland_%.bbappend            |  2 ++
 2 files changed, 17 insertions(+)
 create mode 100644 meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch

diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch b/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
new file mode 100644
index 0000000..0ef1e7f
--- /dev/null
+++ b/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
@@ -0,0 +1,15 @@
+diff -up chromium-75.0.3770.80/third_party/webrtc/rtc_base/physical_socket_server.h.SIOCGSTAMP chromium-75.0.3770.80/third_party/webrtc/rtc_base/physical_socket_server.h
+--- chromium-75.0.3770.80/third_party/webrtc/rtc_base/physical_socket_server.h.SIOCGSTAMP	2019-06-06 10:04:57.050403639 -0400
++++ chromium-75.0.3770.80/third_party/webrtc/rtc_base/physical_socket_server.h	2019-06-06 10:06:03.975121688 -0400
+@@ -16,6 +16,11 @@
+ #define WEBRTC_USE_EPOLL 1
+ #endif
+ 
++// for SIOCGSTAMP in Linux 5.2
++#if defined(WEBRTC_LINUX)
++#include <linux/sockios.h>
++#endif
++
+ #include <memory>
+ #include <set>
+ #include <vector>
diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend b/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
index 4c21576..5548b2c 100644
--- a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
+++ b/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
@@ -3,3 +3,5 @@ PR_append = ".arago0"
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
 DEPENDS_remove = "virtual/libgl"
+
+SRC_URI += "file://chromium-75.0.3770.80-SIOCGSTAMP.patch"
-- 
2.7.4


