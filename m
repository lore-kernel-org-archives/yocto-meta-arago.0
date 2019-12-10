Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id C2A1352A10
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2019 18:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5457440BFB;
	Tue, 10 Dec 2019 18:51:07 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id yA2eMkqdvM_L; Tue, 10 Dec 2019 18:51:07 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 337CD4006B;
	Tue, 10 Dec 2019 18:51:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 8735417434B;
	Tue, 10 Dec 2019 13:51:04 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 10 Dec 2019 13:50:58 -0500
Message-Id: <1576003858-13746-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: Andreas Dannenberg <dannenberg@ti.com>
Subject: [tisdk-setup-scripts][PATCH] setup-targetfs-nfs: fix cases when group != username
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
X-List-Received-Date: Tue, 10 Dec 2019 18:52:42 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Suggested-by: Andreas Dannenberg <dannenberg@ti.com>
---
 setup-targetfs-nfs.sh | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
index 60817ca..b6f679f 100644
--- a/setup-targetfs-nfs.sh
+++ b/setup-targetfs-nfs.sh
@@ -80,19 +80,20 @@ extract_fs() {
     done
 
     me=`whoami`
+    my_group=`id -gn $me`
     sudo mkdir -p $1
     check_status
     sudo tar xJf $cwd/../filesystem/$fstar -C $1
     check_status
-    sudo chown $me:$me $1
+    sudo chown $me:$my_group $1
     check_status
-    sudo chown -R $me:$me $1/home $1/usr $1/etc $1/lib $1/boot
+    sudo chown -R $me:$my_group $1/home $1/usr $1/etc $1/lib $1/boot
     check_status
 
     # Opt isn't a standard Linux directory. First make sure it exist.
     if [ -d $1/opt ];
     then
-            sudo chown -R $me:$me $1/opt
+            sudo chown -R $me:$my_group $1/opt
             check_status
     fi
 
-- 
2.7.4


