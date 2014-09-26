Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 9B85E52007
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 15:41:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCI005PGM833060@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Sep 2014 10:41:04 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 74CB8200AC; Fri,
	26 Sep 2014 11:40:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Sep 2014 11:40:33 -0400
Message-id: <1411746038-21612-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
In-reply-to: <1411746038-21612-1-git-send-email-denis@denix.org>
References: <1411746038-21612-1-git-send-email-denis@denix.org>
Subject: [PATCH 2/7] wayland: update to version 1.6.0
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
X-List-Received-Date: Fri, 26 Sep 2014 15:41:19 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{wayland_1.5.0.bb => wayland_1.6.0.bb}            | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)
 rename meta-arago-extras/recipes-graphics/wayland/{wayland_1.5.0.bb => wayland_1.6.0.bb} (88%)

diff --git a/meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb b/meta-arago-extras/recipes-graphics/wayland/wayland_1.6.0.bb
similarity index 88%
rename from meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb
rename to meta-arago-extras/recipes-graphics/wayland/wayland_1.6.0.bb
index 800ba7a..cf3c094 100644
--- a/meta-arago-extras/recipes-graphics/wayland/wayland_1.5.0.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/wayland_1.6.0.bb
@@ -10,17 +10,12 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
                     file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
 
-BRANCH = "master"
-SRCREV = "3ac62cd6b6012f40e37b1bd7fc1e8178585905ca"
-
-SRC_URI = "git://anongit.freedesktop.org/wayland/wayland;protocol=git;branch=${BRANCH}"
-
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "d34c141c975084e4fb668e77b38f840e"
+SRC_URI[sha256sum] = "a7d5102dcf53d08c059d24bc62de491d7cd482070abeb6737a20d0d86ba6fc7f"
 SRC_URI_append_class-native = " \
     file://disable-macro-checks-not-used-for-scanner.patch \
     "
-
-S = "${WORKDIR}/git"
-
 EXTRA_OECONF_class-native = "--disable-documentation --enable-scanner"
 
 inherit autotools pkgconfig
-- 
2.0.4


