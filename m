Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 7F514529E8
	for <meta-arago@arago-project.org>;
	Mon, 15 Aug 2016 16:56:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u7FGuQFb003446
	for <meta-arago@arago-project.org>; Mon, 15 Aug 2016 11:56:26 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7FGuPkt015504
	for <meta-arago@arago-project.org>; Mon, 15 Aug 2016 11:56:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 15 Aug 2016 11:56:24 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u7FGuOx9031063;
	Mon, 15 Aug 2016 11:56:24 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1bZLBY-000491-Cu; Mon, 15 Aug 2016 12:56:24 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 15 Aug 2016 12:56:21 -0400
Message-ID: <1471280181-15895-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1471280181-15895-1-git-send-email-j-stiffler@ti.com>
References: <1471280181-15895-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 2/2] setup-target-nfs: update for switch to tar.xz image formats
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
X-List-Received-Date: Mon, 15 Aug 2016 16:56:26 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-targetfs-nfs.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
index b27f7c4..4531a6c 100644
--- a/setup-targetfs-nfs.sh
+++ b/setup-targetfs-nfs.sh
@@ -56,11 +56,11 @@ echo "on your host."
 read -p "Press return to continue" REPLY
 
 extract_fs() {
-    fstar=`ls -1 $cwd/../filesystem/??sdk*rootfs*.tar.gz`
+    fstar=`ls -1 $cwd/../filesystem/??sdk*rootfs*.tar.xz`
     me=`whoami`
     sudo mkdir -p $1
     check_status
-    for i in $fstar; do sudo tar xzf $i -C $1;done
+    for i in $fstar; do sudo tar xJf $i -C $1;done
     check_status
     sudo chown $me:$me $1
     check_status
-- 
1.9.1


