Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 8302B52AB0
	for <meta-arago@arago-project.org>;
	Thu, 23 Jun 2016 13:04:56 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5ND4u9X004399
	for <meta-arago@arago-project.org>; Thu, 23 Jun 2016 08:04:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5ND4tN8021230
	for <meta-arago@arago-project.org>; Thu, 23 Jun 2016 08:04:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 23 Jun 2016 08:04:55 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5ND4tfb027499;
	Thu, 23 Jun 2016 08:04:55 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1bG4JS-0003t0-Df; Thu, 23 Jun 2016 09:04:54 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Jun 2016 09:04:52 -0400
Message-ID: <1466687092-14905-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env-am57xx-evm: Add detection of am572x IDK
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
X-List-Received-Date: Thu, 23 Jun 2016 13:04:56 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am57xx-evm.sh | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index e1628b7..4988b96 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -130,6 +130,13 @@ check_for_board() {
     then
         board="x15"
     fi
+
+    lsusb -vv -d 0403:6010 > /dev/null 2>&1
+
+    if [ "$?" = "0" ]
+    then
+        board="am5-idk"
+    fi
 }
 
 echo "timeout 300" > $cwd/setupBoard.minicom
@@ -205,7 +212,7 @@ if [ "$minicom" = "y" ]; then
     do
         check_for_board
 
-        if [ "$board" = "x15" ]
+        if [ "$board" != "unknown" ]
         then
             break
         else
-- 
1.9.1


