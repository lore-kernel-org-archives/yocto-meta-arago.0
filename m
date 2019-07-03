Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 358115299F
	for <meta-arago@arago-project.org>;
	Wed,  3 Jul 2019 19:01:46 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x63J103G115574
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2019 14:01:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562180460;
	bh=XoeTvHAZ88acs5VVboAfskh5sqNfRvtJV/Y49C/Su+s=;
	h=From:To:CC:Subject:Date;
	b=yG5e1CGB3O8VgItJzNauZLGo8WZfR7aPYABAj1NXRrTc8js9etORaVJaiuIovELwz
	Ok9xL9AsFiqzVLeCQG+Lce5XLtNB2z7/RPOPryzcRX14Q5Nzm0kbV/13vkPnAeDFeK
	ZZINncvmUoGkDkClAMVOjcqL+H6QY7MYwWvfTjQQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x63J10KK089320
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 3 Jul 2019 14:01:00 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 3 Jul 2019 14:01:00 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 3 Jul 2019 14:01:00 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x63J10Yn003652;
	Wed, 3 Jul 2019 14:01:00 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1hikV1-0003fl-OA; Wed, 03 Jul 2019 15:00:59 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Jul 2019 15:00:54 -0400
Message-ID: <1562180454-14075-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] setup-targetfs-nfs: allow user to select rootfs
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
X-List-Received-Date: Wed, 03 Jul 2019 19:01:46 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-targetfs-nfs.sh | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
index 4531a6c..60817ca 100644
--- a/setup-targetfs-nfs.sh
+++ b/setup-targetfs-nfs.sh
@@ -56,11 +56,33 @@ echo "on your host."
 read -p "Press return to continue" REPLY
 
 extract_fs() {
-    fstar=`ls -1 $cwd/../filesystem/??sdk*rootfs*.tar.xz`
+    fstar=""
+    while [ -z "$fstar" ]
+    do
+        numfs=`ls $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
+        if [ -n "$numfs" ]
+        then
+            echo
+            echo "Multiple filesystems found."
+            ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "       " , $1'}
+            echo
+            read -p "Enter Number of rootfs Tarball: [1] " fsnum
+            [ -n "$fsnum" ] || fsnum=1
+            echo
+            fstar=`ls --sort=size $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep "^$fsnum:" | cut -c3- | awk {'print$1'}`
+        else
+            fstar=`ls  $cwd/../filesystem | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
+        fi
+        if [ -z "$fstar" ]
+        then
+            echo "Could not find rootfs. Trying again."
+        fi
+    done
+
     me=`whoami`
     sudo mkdir -p $1
     check_status
-    for i in $fstar; do sudo tar xJf $i -C $1;done
+    sudo tar xJf $cwd/../filesystem/$fstar -C $1
     check_status
     sudo chown $me:$me $1
     check_status
-- 
1.9.1


