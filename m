Return-Path: <jake@udc0866934>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7580252AF9
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 14:25:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBMEPawj004649
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZOS012483
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZU0027101;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cK4JK-00043z-Uy; Thu, 22 Dec 2016 09:25:35 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Dec 2016 09:25:23 -0500
Message-ID: <1482416729-15556-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
References: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 2/8] setup-uboot-env-keystone.sh: enhance do_expect function
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
X-List-Received-Date: Thu, 22 Dec 2016 14:25:41 -0000
Content-Type: text/plain

* allow writing minicom runscript commands to multiple files

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-keystone.sh | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/setup-uboot-env-keystone.sh b/setup-uboot-env-keystone.sh
index fdd131a..356e9c7 100755
--- a/setup-uboot-env-keystone.sh
+++ b/setup-uboot-env-keystone.sh
@@ -34,16 +34,26 @@ cwd=`dirname $0`
 . $cwd/common.sh
 
 do_expect() {
-    echo "expect {" >> $3
-    check_status
-    echo "    $1" >> $3
-    check_status
-    echo "    timeout 600 goto end" >> $3
-    echo "}" >> $3
-    check_status
-    echo $2 >> $3
-    check_status
-    echo >> $3
+    local expect_str="$1"
+    local command="$2"
+
+    shift; shift
+
+    while [ $# -gt 0 ]
+    do
+        echo "expect {" >> "$1"
+        check_status
+        echo "    $expect_str" >> "$1"
+        check_status
+        echo "    timeout 600 goto end" >> "$1"
+        echo "}" >> "$1"
+        check_status
+        echo $command >> "$1"
+        check_status
+        echo >> "$1"
+
+        shift
+    done
 }
 
 prompt_feedback() {
-- 
1.9.1


