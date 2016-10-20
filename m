Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id A8FE752AA4
	for <meta-arago@arago-project.org>;
	Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 69F3920992;
	Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cpQsrvjf0nf1; Thu, 20 Oct 2016 02:48:04 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-106-107.washdc.fios.verizon.net
	[100.15.106.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3E7CF209A1;
	Thu, 20 Oct 2016 02:48:03 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 4AFF9162178;
	Wed, 19 Oct 2016 22:48:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 19 Oct 2016 22:47:55 -0400
Message-Id: <1476931679-4689-4-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1476931679-4689-1-git-send-email-denis@denix.org>
References: <1476931679-4689-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 4/8] wayland: update bbappends to match latest upstream master
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
 .../wayland/wayland-protocols_1.5.bb                 | 20 --------------------
 .../{weston-conf_1.9.0.bb => weston-conf_1.11.0.bb}  |  0
 ...{weston_1.9.0.bbappend => weston_1.11.0.bbappend} |  0
 3 files changed, 20 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb
 rename meta-arago-distro/recipes-graphics/wayland/{weston-conf_1.9.0.bb => weston-conf_1.11.0.bb} (100%)
 rename meta-arago-distro/recipes-graphics/wayland/{weston_1.9.0.bbappend => weston_1.11.0.bbappend} (100%)

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb
deleted file mode 100644
index 3a40fb2..0000000
--- a/meta-arago-distro/recipes-graphics/wayland/wayland-protocols_1.5.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-SUMMARY = "Collection of additional Wayland protocols"
-DESCRIPTION = "Wayland protocols that add functionality not \
-available in the Wayland core protocol. Such protocols either add \
-completely new functionality, or extend the functionality of some other \
-protocol either in Wayland core, or some other protocol in \
-wayland-protocols."
-HOMEPAGE = "http://wayland.freedesktop.org"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c7b12b6702da38ca028ace54aae3d484 \
-                    file://stable/presentation-time/presentation-time.xml;endline=26;md5=4646cd7d9edc9fa55db941f2d3a7dc53"
-
-SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
-           "
-SRC_URI[md5sum] = "e4279fec1283067706373d4d975be333"
-SRC_URI[sha256sum] = "7d0b426ccaeafc084fc579bb2a139f8ad4ea3492d54b7b0210d124c61fbeb2bf"
-
-inherit allarch autotools pkgconfig
-
-PACKAGES = "${PN}"
-FILES_${PN} += "${datadir}/pkgconfig/wayland-protocols.pc"
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb b/meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.0.bb
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston-conf_1.9.0.bb
rename to meta-arago-distro/recipes-graphics/wayland/weston-conf_1.11.0.bb
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
similarity index 100%
rename from meta-arago-distro/recipes-graphics/wayland/weston_1.9.0.bbappend
rename to meta-arago-distro/recipes-graphics/wayland/weston_1.11.0.bbappend
-- 
2.7.4


