Return-Path: <a0756824@ares-ubuntu>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 0FD0052A55
	for <meta-arago@arago-project.org>;
	Thu, 14 Feb 2013 22:28:45 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1EMSiH7019995
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 16:28:44 -0600
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1EMSiAk014813
	for <meta-arago@arago-project.org>; Thu, 14 Feb 2013 16:28:44 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 14 Feb 2013 16:28:44 -0600
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r1EMSirm002756;	Thu, 14 Feb 2013 16:28:44 -0600
Received: from a0756824 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0756824@ares-ubuntu>)	id 1U67IJ-0006U2-Uk;
	Thu, 14 Feb 2013 17:28:44 -0500
From: Sajesh Kumar Saran <sajesh@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Feb 2013 17:28:40 -0500
Message-ID: <1360880920-24652-1-git-send-email-sajesh@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] Added ti-multiproc manager recipe for KeyStone2 devices
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
X-List-Received-Date: Thu, 14 Feb 2013 22:28:46 -0000
Content-Type: text/plain


Signed-off-by: Sajesh Kumar Saran <sajesh@ti.com>
---
 .../multiprocmgr/ti-multiprocmgr_git.bb            |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb

diff --git a/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb b/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb
new file mode 100644
index 0000000..c72bc7d
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/multiprocmgr/ti-multiprocmgr_git.bb
@@ -0,0 +1,19 @@
+DESCRIPTION = "TI Multiproc Manager for KeyStone II"
+HOMEPAGE = "http://gtgit01.gt.design.ti.com/git/?p=projects/multiprocmgr.git;a=summary"
+LICENSE = "BSD & MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=fce208c498eb9669223724dc9c1d8fe4"
+SECTION = "console"
+
+PR = "r2"
+
+BRANCH ?= "master"
+SRCREV = "${AUTOREV}"
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


