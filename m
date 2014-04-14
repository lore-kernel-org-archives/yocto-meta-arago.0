Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 850A252972
	for <meta-arago@arago-project.org>;
	Mon, 14 Apr 2014 20:22:13 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4100DO2F7VBUB0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 14 Apr 2014 15:21:41 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 418DE20120; Mon,
	14 Apr 2014 16:21:31 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 14 Apr 2014 16:21:30 -0400
Message-id: <1397506890-2148-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] sourceipk: swap data and control sections, as dpkg-deb is stricter now
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
X-List-Received-Date: Mon, 14 Apr 2014 20:22:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/classes/sourceipk.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/sourceipk.bbclass b/meta-arago-distro/classes/sourceipk.bbclass
index b6ab37d..20dda76 100644
--- a/meta-arago-distro/classes/sourceipk.bbclass
+++ b/meta-arago-distro/classes/sourceipk.bbclass
@@ -186,7 +186,7 @@ sourceipk_do_create_srcipk() {
         mkdir -p ${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}
         pkg_file=${DEPLOY_DIR_IPK}/${SRCIPK_PACKAGE_ARCH}/${PN}-src_${PV}-${PR}_${SRCIPK_PACKAGE_ARCH}.ipk
         rm -f $pkg_file
-        ( cd $srcipk_dir && ar -crf $pkg_file ./debian-binary ./data.tar.gz ./control.tar.gz )
+        ( cd $srcipk_dir && ar -crf $pkg_file ./debian-binary ./control.tar.gz ./data.tar.gz )
 
         # Remove the temporary directory
         rm -rf $tmp_dir
-- 
1.9.2


