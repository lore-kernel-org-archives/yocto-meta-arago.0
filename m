Return-Path: <a0756824@ares-ubuntu>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 5F82252A64
	for <meta-arago@arago-project.org>;
	Fri, 15 Feb 2013 02:08:53 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1F28qaa018907
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 20:08:52 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1F28q9A018285
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 20:08:52 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 14 Feb 2013 20:08:52 -0600
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1F28qnD030604;	Thu, 14 Feb 2013 20:08:52 -0600
Received: from a0756824 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0756824@ares-ubuntu>)	id 1U6AjM-0006Jd-4W;
	Thu, 14 Feb 2013 21:08:52 -0500
From: Sajesh Kumar Saran <sajesh@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Feb 2013 21:08:46 -0500
Message-ID: <1360894127-24242-1-git-send-email-sajesh@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] multiprocmgr: add initial version
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
X-List-Received-Date: Fri, 15 Feb 2013 02:08:53 -0000
Content-Type: text/plain

This is an initial version of commit of multiproc manager.
It adds support to download DSP images from ARM in KeyStone II
devices.

Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
---
 .../multiprocmgr/multiprocmgr_git.bb               |   20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb

diff --git a/meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb b/meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb
new file mode 100644
index 0000000..3f2e52c
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/multiprocmgr/multiprocmgr_git.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "TI Multiproc Manager for KeyStone II"
+HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
+SECTION = "console"
+COMPATIBLE_MACHINE = "keystone"
+
+PR = "r1"
+
+BRANCH ?= "master"
+SRCREV = "8a97fb5c2c06d5f02d30106629f27fe0ca8a4f95"
+
+SRC_URI = "git://gtgit01.gt.design.ti.com/git/projects/multiprocmgr.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	install -d ${D}${bindir}/
+	install -c -m 755 ${S}/mpmsrv ${D}${bindir}/mpmsrv
+}
-- 
1.7.9.5


