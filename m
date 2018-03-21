Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3793E529A2
	for <meta-arago@arago-project.org>;
	Wed, 21 Mar 2018 13:10:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2LD9xgD006890
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 08:09:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521637799;
	bh=mnntBD5yoS0Dmshuw8xwIC8EAprPbgwBiWT1gUVIMtw=;
	h=From:To:Subject:Date;
	b=b9csoX7NBQKWzrK9+4JVaadGG5zvkCagC5BXhepc6QKw7hmJkoLhd257ijza4cXPU
	iWgYiHl/4PldZpzIa3uYAnc4PsGoapad/Yt7qA3uGwJbGyUUBhuU1ZwlbkYzE5+s75
	eK3jPbHEF0J9Ng7oFXNkuAgs4Vv/YVQ62nBfnRLU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LD9xgM032446
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 08:09:59 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 08:09:59 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 08:09:59 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2LD9xuK005868
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 08:09:59 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 21 Mar 2018 09:09:52 -0400
Message-ID: <1521637792-32939-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH v2] posix-smp-demo: Updating to version 01.01.00.00
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
X-List-Received-Date: Wed, 21 Mar 2018 13:10:00 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 v2 - Excluding the rtos bbappend from the v1 patch

 recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc | 5 +++++
 recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend    | 1 +
 2 files changed, 6 insertions(+)
 create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
 create mode 100644 recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend

diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc b/recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
new file mode 100644
index 0000000..2058ada
--- /dev/null
+++ b/recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.POSIX-SMP.01.01.00.00"
+POSIX_SMP_SRCREV = "139fe7ec58939dc2743355e5fede0735f8693ebd"
+
+PV = "01.01.00.00"
+INC_PR = "r0"
diff --git a/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
new file mode 100644
index 0000000..e7b3dce
--- /dev/null
+++ b/recipes-apps/posix-smp-demo/posix-smp-demo_git.bbappend
@@ -0,0 +1 @@
+require recipes-apps/posix-smp-demo/posix-smp-demo-01.01.00.00.inc
-- 
1.9.1


