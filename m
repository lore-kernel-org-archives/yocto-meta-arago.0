Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.4166.1643317882950367448
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 27 Jan 2022 13:11:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=aOW1LJkp;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 20RLBLom127278;
	Thu, 27 Jan 2022 15:11:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1643317881;
	bh=hQHbFz4KcJR/QpzS/Z1vSn7RAZRijwuBiG/WxaKDRZ0=;
	h=From:To:Subject:Date;
	b=aOW1LJkpAHw0v3jgoFHiUM5DQUPCDijJKv5hOSKV7K0UXgYdU+zYJ4N1V9bydeMyW
	 FHFKWyusQgFpvMLILmIC8Trd1pimpQfcnoHyFmITzjrWRsU6FO13spZHmnlbvZEGDo
	 BF6OjNTuY6W50iz0NRAhxnOyqO4H4iqAb21p5g64=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 20RLBLe7044190
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 27 Jan 2022 15:11:21 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 27
 Jan 2022 15:11:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 27 Jan 2022 15:11:20 -0600
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 20RLBKZY101277;
	Thu, 27 Jan 2022 15:11:20 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nDC36-0006C7-M8; Thu, 27 Jan 2022 15:11:20 -0600
From: "Ryan Eatmon" <reatmon@ti.com>
To: Yogesh Siraswar <yogeshs@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] Add git_retry.sh wrapper around git
Date: Thu, 27 Jan 2022 15:11:20 -0600
Message-ID: <20220127211120.23772-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

We are seeing a sporadic failure in our nightly builds
due to the git clone/fetch calls timing out and erroring.
These events are usually resolved by just trying the git
call again, but in a scripted flow it causes a failure
in that run.  The git_retry.sh script solves that by
allowing the git command to be retried a few times while
sleeping in between.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 git_retry.sh          | 29 +++++++++++++++++++++++++++++
 oe-layertool-setup.sh |  4 ++--
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100755 git_retry.sh

diff --git a/git_retry.sh b/git_retry.sh
new file mode 100755
index 0000000..e5ed5bb
--- /dev/null
+++ b/git_retry.sh
@@ -0,0 +1,29 @@
+#!/bin/bash
+
+let glRetries=5
+let glDelay=15
+let glExitCode=0
+
+while [ $glRetries -gt 0 ]; do
+
+    git "$@"
+
+    glExitCode=$?
+
+    if [ $glExitCode -eq 0 ]; then
+        exit
+    fi
+
+    let glRetries=$glRetries-1
+
+    if [ $glRetries -gt 0 ]; then
+        echo "git failed... remaining attempts: $glRetries"
+        sleep $glDelay
+    fi
+
+done
+
+echo "git failed... giving up..."
+
+exit $glExitCode
+
diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index df1523f..932ec49 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -336,9 +336,9 @@ clone_repo() {
     if [ -d $sourcedir/$name ]
     then
         cd $sourcedir/$name
-        git fetch --all
+        $oebase/git_retry.sh fetch --all
     else
-        git clone $uri $sourcedir/$name
+        $oebase/git_retry.sh clone $uri $sourcedir/$name
         if [ "$?" != "0" ]
         then
             echo "ERROR: Could not clone repository at $uri"
-- 
2.17.1

