Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC06C43334
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 20:37:04 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.2349.1658349423777710369
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 20 Jul 2022 13:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Ehxq28/8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 26KKauwk011165;
	Wed, 20 Jul 2022 15:36:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1658349416;
	bh=gdwFXK0i5k+XP4gUzRzHsP3e18818MeG6v4in3ISZjg=;
	h=From:To:CC:Subject:Date;
	b=Ehxq28/8jqK+ZBqsc+xN+CjfSUDAnleYqQFKSlzX/ZcjeWL0YFPcTY5zrmjwQ0BNP
	 EtkaHy1FWxEx9kl03Mrl6o/xsls5AcTiPZlzRsb9WejShFqu1eDgFvknLqFNMGF6Yi
	 T6z1gr3goDyT0MCUDZupLC15GcUDCLPVAUCTAqsw=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 26KKauVx027214
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 20 Jul 2022 15:36:56 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 20
 Jul 2022 15:36:56 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 20 Jul 2022 15:36:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 26KKauZA101928;
	Wed, 20 Jul 2022 15:36:56 -0500
From: Nishanth Menon <nm@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: Daniel Thompson <daniel.thompson@linaro.org>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH] meta-arago-extras: recipes-devtools:
 eventdump: Fix linking against local library
Date: Wed, 20 Jul 2022 15:36:55 -0500
Message-ID: <20220720203655.17875-1-nm@ti.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 20 Jul 2022 20:37:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13955

https://github.com/TI-ECS/eventdump unfortunately is a unmaintained
project.

LDFLAGS += -L$(NFSROOT)/lib should have dependent on NFSROOT variable.
Instead this forces the eventdump to break the sandbox and attempt to
link up against the local PC's lib - which is a NO-NO for many reasons.

Reported to have failed on a Fedora system.

Bump the PR up to indicate a fix up where we have proper linkage

Reported-by: Daniel Thompson <daniel.thompson@linaro.org>
Signed-off-by: Nishanth Menon <nm@ti.com>
---

PS:
1. We should probably drop the entire recipe in Master branch if this
   is not maintained.. but we can fix it while we can.
2. Still looking to find the owner of this repo, apparently been almost
   a decade old - so probability of pending status changing for the
   patch is unlikely.

 .../eventdump/eventdump_git.bb                |  7 ++--
 ...Play_nicer_with_bitbake-OpenEmbedded.patch | 34 +++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch

diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
index 3cd0b8e3919b..831d2e047319 100644
--- a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -2,12 +2,15 @@ SUMMARY = "Utility for parsing system events"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://eventdump.c;beginline=1;endline=34;md5=23b59be24a88ddc407b553035f3fd3e9"
 
-PR = "r3"
+PR = "r4"
 PV = "1.0+git${SRCPV}"
 
 SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
 
-SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=https;branch=master"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=https;branch=master \
+	file://0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch b/meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
new file mode 100644
index 000000000000..b14d5bb34aa2
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/eventdump/files/0001-PATCH_Makefile_Play_nicer_with_bitbake-OpenEmbedded.patch
@@ -0,0 +1,34 @@
+From e8c5094e2d59fe48ad0e7234f196d04508f53727 Mon Sep 17 00:00:00 2001
+From: Daniel Thompson <daniel.thompson@linaro.org>
+Date: Wed, 20 Jul 2022 18:05:09 +0100
+Subject: [PATCH] Makefile: Play nicer with bitbake/OpenEmbedded
+
+Unconditionally adding -L$(NFSROOT)/lib to the link line risks seriously
+confusing the linker if NFSROOT is not set (which would be common when
+building OE/bitbake) because we end up trying to link against whatever
+zany things we might find in the host /lib directory). Fix this the
+obvious way.
+
+Upstream-Status: Pending
+Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
+---
+ Makefile | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/Makefile b/Makefile
+index e313e50..afb5472 100755
+--- a/Makefile
++++ b/Makefile
+@@ -1,7 +1,9 @@
+ CC = $(CROSS_COMPILE)gcc
+ CFLAGS = -O2 -Wall
+
++ifneq ($(NFSROOT),)
+ LDFLAGS += -L$(NFSROOT)/lib
++endif
+ #LIBS += -lopenobex -lbluetooth -lmisc
+
+ OBJS = eventdump.o
+--
+2.36.1
+
-- 
2.31.1


