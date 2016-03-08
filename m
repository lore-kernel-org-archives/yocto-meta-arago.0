Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 1C83252A87
	for <meta-arago@arago-project.org>;
	Tue,  8 Mar 2016 00:02:24 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2802NWP022017
	for <meta-arago@arago-project.org>; Mon, 7 Mar 2016 18:02:23 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2802Nt4013397
	for <meta-arago@arago-project.org>; Mon, 7 Mar 2016 18:02:23 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 7 Mar 2016 18:02:22 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2802McW019648;	Mon, 7 Mar 2016 18:02:22 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 7 Mar 2016 19:02:20 -0500
Message-ID: <1457395340-11832-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] libnl-xfrm: under {includedir}, create symbolic link at netlink which references to folder libnl3/netlink
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
X-List-Received-Date: Tue, 08 Mar 2016 00:02:24 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
v2 changes: modify the commit message

 meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
index 74733f0..526ad0a 100644
--- a/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
+++ b/meta-arago-extras/recipes-support/libnl-xfrm/libnl-xfrm_git.bb
@@ -14,6 +14,8 @@ BRANCH="hawking_dev"
 SRCREV = "2a5ee7c4f41398c07c593e81af7b71c7720e6de8"
 SRC_URI = "git://arago-project.org/git/projects/libnl-xfrm.git;protocol=git;branch=${BRANCH}"
 
+PR = "r1"
+
 S = "${WORKDIR}/git"
 
 LIBNL_XFRM_LIB = "lib/libnl-xfrm.a"
@@ -34,6 +36,8 @@ do_install_append() {
 	install -c -m 755 ${S}/${LIBNL_XFRM_LIB} ${D}${libdir}/
 	install -c -m 755 ${S}/include/netlink/xfrm/*.h ${D}${includedir}/libnl3/netlink/xfrm/
 	install -c -m 755 ${S}/lib/libnl-xfrm.so ${D}${libdir}/libnl-xfrm.so.1.0.0
+	cd ${D}${includedir}/
+	ln -s libnl3/netlink netlink
 	cd ${D}${libdir}/
 	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so.1
 	ln -s libnl-xfrm.so.1.0.0 libnl-xfrm.so
-- 
1.9.1


