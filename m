Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 64E0352093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 19:40:48 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDJeb6x024828
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 13:40:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513194037;
	bh=vmFngWfqr7Dh+0Bcyc02xutTaD6ylij0UB6D5ZjxvJE=;
	h=From:To:Subject:Date;
	b=M8mCf1mMZlBdbIpKD1JNtzGmRCEoTRPWiwD7rNGJd5PPCmN3rVFDb6tFEo6R6C/Iz
	yxhSOQMUkSVmVl0tpcGP1+bDOhvbFlPLqIQaZ9QiYOdqTgQkvIK5XZ+xS0TJQlih/A
	HfUIdzepBkx6ss3b6dKbs7BzTpltJrTpnt+loUeM=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDJeWOc017966
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 13:40:32 -0600
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 13:40:32 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 13:40:32 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDJeWQg026188
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 13:40:32 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 14:40:30 -0500
Message-ID: <1513194030-11415-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] starterware: Update to version 2.1.1.5
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
X-List-Received-Date: Wed, 13 Dec 2017 19:40:48 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Removing the references to starterware.inc
 v1 - Initial draft

 recipes-bsp/starterware/starterware-2.1.1.5.inc       | 6 ++++++
 recipes-bsp/starterware/starterware-rtos_git.bbappend | 2 ++
 recipes-bsp/starterware/starterware_git.bbappend      | 2 ++
 3 files changed, 10 insertions(+)
 create mode 100644 recipes-bsp/starterware/starterware-2.1.1.5.inc
 create mode 100644 recipes-bsp/starterware/starterware-rtos_git.bbappend
 create mode 100644 recipes-bsp/starterware/starterware_git.bbappend

diff --git a/recipes-bsp/starterware/starterware-2.1.1.5.inc b/recipes-bsp/starterware/starterware-2.1.1.5.inc
new file mode 100644
index 0000000..110a4e8
--- /dev/null
+++ b/recipes-bsp/starterware/starterware-2.1.1.5.inc
@@ -0,0 +1,6 @@
+# Below commit ID corresponds to "DEV.STARTERWARE.PROCSDK.02.01.01.05"
+STARTERWARE_SRCREV = "58526af258ef9a10a9eec32d2a6e3a1c9e6f9e88"
+
+PV = "02.01.01.05"
+INC_PR = "r0"
+
diff --git a/recipes-bsp/starterware/starterware-rtos_git.bbappend b/recipes-bsp/starterware/starterware-rtos_git.bbappend
new file mode 100644
index 0000000..e248e3f
--- /dev/null
+++ b/recipes-bsp/starterware/starterware-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/starterware/starterware-2.1.1.5.inc
+
diff --git a/recipes-bsp/starterware/starterware_git.bbappend b/recipes-bsp/starterware/starterware_git.bbappend
new file mode 100644
index 0000000..e248e3f
--- /dev/null
+++ b/recipes-bsp/starterware/starterware_git.bbappend
@@ -0,0 +1,2 @@
+require recipes-bsp/starterware/starterware-2.1.1.5.inc
+
-- 
1.9.1


