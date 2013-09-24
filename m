Return-Path: <chase.maupin@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 44120529CC
	for <meta-arago@arago-project.org>;
	Tue, 24 Sep 2013 20:07:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OK7WA5029474
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 15:07:32 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OK7WeQ003595
	for <meta-arago@arago-project.org>; Tue, 24 Sep 2013 15:07:32 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 24 Sep 2013 15:07:32 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OK7TTf008342;
	Tue, 24 Sep 2013 15:07:30 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 24 Sep 2013 15:50:15 -0500
Message-ID: <1380055815-19631-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCHv2] oe-layertool-setup.sh: properly set DL_DIR
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
X-List-Received-Date: Tue, 24 Sep 2013 20:07:33 -0000
Content-Type: text/plain

* This script took a parameter using -d to set the DL_DIR but
  ignored that setting.  Now if that is set make it the DL_DIR
  value in conf/local.conf
* When running this script to get updates changes that were made
  to DL_DIR were lost because local.conf was copied over.  Now
  the script will use the old DL_DIR setting.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

---
* Updated in version 2
    * Removed sh -x setting which was accidentally left over
    * Fixed typo in commit message
---
 oe-layertool-setup.sh |   17 ++++++++++++++++-
 1 files changed, 16 insertions(+), 1 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 55cd174..72e36a2 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -732,6 +732,22 @@ EOM
     threads=`cat /proc/cpuinfo | grep -c processor`
     sed -i "s/^PARALLEL_MAKE.*/PARALLEL_MAKE = \"-j ${threads}\"/" $confdir/local.conf
     sed -i "s/^BB_NUMBER_THREADS.*/BB_NUMBER_THREADS = \"${threads}\"/" $confdir/local.conf
+
+    # Find if old DL_DIR was set
+    if [ -e $confdir/local.conf.bak ]
+    then
+        old_dldir=`cat $confdir/local.conf.bak | grep -e "^DL_DIR =" | sed 's|DL_DIR = ||' | sed 's/"//g'`
+    else
+        old_dldir="$dldir"
+    fi
+
+    # If command line option was not set use the old dldir
+    if [ "x$dldir" == "x" ]
+    then
+        dldir=$old_dldir
+    fi
+
+    sed -i "s|^DL_DIR.*|DL_DIR = \"${dldir}\"|" $confdir/local.conf
 }
 
 
@@ -838,7 +854,6 @@ cd -
 sourcedir="$oebase/sources"
 builddir="$oebase/build"
 confdir="$builddir/conf"
-dldir="$oebase/downloads"
 
 check_input
 
-- 
1.7.0.4


