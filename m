Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 1C18952A72
	for <meta-arago@arago-project.org>;
	Fri, 26 Sep 2014 15:41:18 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NCI005SSM7ZMJ60@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 26 Sep 2014 10:41:02 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 009D02008D; Fri,
	26 Sep 2014 11:40:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 26 Sep 2014 11:40:32 -0400
Message-id: <1411746038-21612-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH 1/7] libinput: update to 0.6.0
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
X-List-Received-Date: Fri, 26 Sep 2014 15:41:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../wayland/{libinput_git.bb => libinput_0.6.0.bb}     | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)
 rename meta-arago-extras/recipes-graphics/wayland/{libinput_git.bb => libinput_0.6.0.bb} (42%)

diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb b/meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
similarity index 42%
rename from meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
rename to meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
index 6635e7d..c3bbb7b 100644
--- a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/libinput_0.6.0.bb
@@ -1,20 +1,14 @@
-DESCRIPTION = "libinput is a library to handle input devices in Wayland compositors"
+SUMMARY = "Library to handle input devices in Wayland compositors"
 HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libinput/"
+SECTION = "libs"
 
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
 
-inherit autotools pkgconfig
-
 DEPENDS = "libevdev udev mtdev"
 
-PR = "r2"
-
-BRANCH = "master"
-SRCREV = "0647574c46e5e930063ace7b35385213dca33dc1"
+SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BP}.tar.xz"
+SRC_URI[md5sum] = "3afaf9f66d8796323a79edb879c10ba3"
+SRC_URI[sha256sum] = "30b555771e7cb921ccb9430c4a86940aa3938d05506e81d2417c03e30451bfbc"
 
-PV = "0.5.0"
-
-SRC_URI = "git://anongit.freedesktop.org/wayland/libinput;protocol=git;branch=${BRANCH}"
-
-S = "${WORKDIR}/git"
+inherit autotools pkgconfig
-- 
2.0.4


