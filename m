Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 34F9752A3A
	for <meta-arago@arago-project.org>;
	Fri, 19 Feb 2016 16:40:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1JGen9s016501
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 10:40:49 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JGenOj030889
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 10:40:49 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 10:40:49 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u1JGene0023195;	Fri, 19 Feb 2016 10:40:49 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Feb 2016 11:40:46 -0500
Message-ID: <1455900046-4338-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts] [PATCH] setup-targetfs-nfs: update extracting of filesystem tarball(s) in a for loop
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
X-List-Received-Date: Fri, 19 Feb 2016 16:40:50 -0000
Content-Type: text/plain

* keystone platforms now have tisdk-server-extra rootfs tarball in addition
  to the tisdk-server rootfs tarball, while other platforms still have a
  single tisdk-server rootfs tarball. The keystone extra rootfs tarball is
  a super set of its base rootfs tarball, and it is provided for mounting
  over NFS.

  Adding the for loop here provides a simple solution to correctly extract
  the filesystem for NFS mounting for all the platforms.

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 setup-targetfs-nfs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
index d8d6805..b27f7c4 100644
--- a/setup-targetfs-nfs.sh
+++ b/setup-targetfs-nfs.sh
@@ -60,7 +60,7 @@ extract_fs() {
     me=`whoami`
     sudo mkdir -p $1
     check_status
-    sudo tar xzf $fstar -C $1
+    for i in $fstar; do sudo tar xzf $i -C $1;done
     check_status
     sudo chown $me:$me $1
     check_status
-- 
1.9.1


