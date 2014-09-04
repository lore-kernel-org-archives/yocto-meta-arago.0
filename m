Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id D29D252992
	for <meta-arago@arago-project.org>;
	Thu,  4 Sep 2014 17:43:47 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.33.160])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0NBE00IC718WCJ30@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 04 Sep 2014 12:43:45 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9B71D2011D; Thu,
	04 Sep 2014 13:43:44 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 04 Sep 2014 13:43:43 -0400
Message-id: <1409852623-8892-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [PATCH] libinput: depend on mtdev (multi-touch library)
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
X-List-Received-Date: Thu, 04 Sep 2014 17:43:48 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-graphics/wayland/libinput_git.bb | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb b/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
index d591f7d..6bb8575 100644
--- a/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
+++ b/meta-arago-extras/recipes-graphics/wayland/libinput_git.bb
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=673e626420c7f859fbe2be3a9c13632d"
 
 inherit autotools pkgconfig
 
-DEPENDS = "libevdev udev"
+DEPENDS = "libevdev udev mtdev"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH = "master"
 SRCREV = "bb10ec84d3704fc0fb40591bcbffe90f6c77966d"
@@ -18,5 +18,3 @@ PV = "0.5.0"
 SRC_URI = "git://anongit.freedesktop.org/wayland/libinput;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
-
-
-- 
2.0.4


