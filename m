Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 24DFA52A5E
	for <meta-arago@arago-project.org>;
	Thu,  2 Feb 2012 21:01:43 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q12L1f7G023606
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2012 15:01:41 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12L1eU5000425
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2012 02:31:40 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by dbde70.ent.ti.com
	(172.24.170.148) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 3 Feb 2012 02:31:40 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12L1Yt2001215;
	Fri, 3 Feb 2012 02:31:39 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Feb 2012 15:01:30 -0600
Message-ID: <1328216492-7294-3-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1328216492-7294-1-git-send-email-Chase.Maupin@ti.com>
References: <1328216492-7294-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] task-arago-test: port from old arago
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
X-List-Received-Date: Thu, 02 Feb 2012 21:01:45 -0000
Content-Type: text/plain

* Ported from old arago overlay and updated licensing checksum

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/tasks/task-arago-test.bb          |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-test.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-test.bb b/meta-arago-distro/recipes-core/tasks/task-arago-test.bb
new file mode 100644
index 0000000..8570ebd
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-test.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Extended task to get System Test specific apps"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+ARAGO_TEST = "\
+    bonnie++ \
+    hdparm \
+    iozone3 \
+    iperf \
+    lmbench \
+    rt-tests \
+    evtest \
+    bc \
+    "
+
+ARAGO_TI_TEST = "\
+    ltp-ddt \
+    "
+
+RDEPENDS_${PN} = "\
+    ${ARAGO_TEST} \
+    ${ARAGO_TI_TEST} \
+    "
-- 
1.7.0.4


