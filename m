Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 821B9CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 18:31:17 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.4825.1759343475485000097
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 01 Oct 2025 11:31:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cZrE6Y5x;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: rs@ti.com)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 591IVCXk3134071;
	Wed, 1 Oct 2025 13:31:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1759343472;
	bh=qQaX7T5w17dcZYSHUspg3Vd6X+jtlHMPsLWlNjZ7ULg=;
	h=From:To:CC:Subject:Date;
	b=cZrE6Y5xDfqmZW8yLyQEq0clqjNlnGbgNX76V9Jm4Gxbed2M9jLbvgbOtQhWqc+E4
	 e2yjiYnhXX5WtlNbfpv5zeYRk/jzdxaN7gMFKo1Tjc94/4VBy7ApEdO+obkGVWM7lD
	 f+PplMb3w9JBf8NlLeDDFFzcdbyuQP+vr2iyUOsM=
Received: from DFLE215.ent.ti.com (dfle215.ent.ti.com [10.64.6.73])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 591IVCsD3620302
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Oct 2025 13:31:12 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 1 Oct
 2025 13:31:12 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 1 Oct 2025 13:31:12 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 591IVCFX971353;
	Wed, 1 Oct 2025 13:31:12 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, <praneeth@ti.com>, <s-jain1@ti.com>
Subject: [meta-arago][scarthgap][PATCH 1/2] emptty: backport fix for signal handeling
Date: Wed, 1 Oct 2025 13:31:01 -0500
Message-ID: <20251001183102.357345-1-rs@ti.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 01 Oct 2025 18:31:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16659

From: Randolph Sapp <rs@ti.com>

To quote the upstream patch:

	Emptty cannot currently exit via an external signal if the
	session process exits abnormally. This conflicts with the
	expected behavior of systemd, which expects that the service
	will always respect signals.

	This has the added benefit of allowing users to use ^C to
	restart the login process at any point in the menu system.

Backporting this since it hasn't hit a tagged release yet.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 .../recipes-graphics/emptty/emptty.inc        |  1 +
 ...Interrupt-handle-unruly-applications.patch | 52 +++++++++++++++++++
 2 files changed, 53 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/emptty/emptty/0001-handleInterrupt-handle-unruly-applications.patch

diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty.inc b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
index b452d403..4f23cf79 100644
--- a/meta-arago-distro/recipes-graphics/emptty/emptty.inc
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty.inc
@@ -19,6 +19,7 @@ SRC_URI = "\
     git://${GO_IMPORT_pam}.git;protocol=https;branch=master;name=pam;destsuffix=src/${GO_IMPORT_pam} \
     file://pamconf \
     file://emptty.tab \
+    file://0001-handleInterrupt-handle-unruly-applications.patch;patchdir=src/${GO_IMPORT} \
     "
 SRCREV = "d162bef75fadc8ae1d8e33dbb3de5e2795a196e0"
 SRCREV_pam = "50ded1b0e7864b9bf75005eb945a8ec826bcf69d"
diff --git a/meta-arago-distro/recipes-graphics/emptty/emptty/0001-handleInterrupt-handle-unruly-applications.patch b/meta-arago-distro/recipes-graphics/emptty/emptty/0001-handleInterrupt-handle-unruly-applications.patch
new file mode 100644
index 00000000..ecd190e5
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/emptty/emptty/0001-handleInterrupt-handle-unruly-applications.patch
@@ -0,0 +1,52 @@
+From cce0e23719f30a362dc5de69eb92d9a1c0859403 Mon Sep 17 00:00:00 2001
+From: Randolph Sapp <rs@ti.com>
+Date: Tue, 30 Sep 2025 20:05:05 -0500
+Subject: [PATCH] handleInterrupt: handle unruly applications
+
+Emptty cannot currently exit via an external signal if the session
+process exits abnormally. This conflicts with the expected behavior of
+systemd, which expects that the service will always respect signals.
+
+This has the added benefit of allowing users to use ^C to restart the
+login process at any point in the menu system.
+
+
+Upstream-Status: Backport [https://github.com/tvrzna/emptty/commit/d875bac9ce22c2739dfd4644880371b6e16a1cb6]
+Signed-off-by: Randolph Sapp <rs@ti.com>
+---
+ src/emptty.go | 17 +++++++++++------
+ 1 file changed, 11 insertions(+), 6 deletions(-)
+
+diff --git a/src/emptty.go b/src/emptty.go
+index b5bc735..97d00f0 100644
+--- a/src/emptty.go
++++ b/src/emptty.go
+@@ -61,14 +61,19 @@ func handleInterrupt(c chan os.Signal, h *sessionHandle) {
+ 	setTerminalEcho(os.Stdout.Fd(), true)
+ 	if h.session != nil && h.session.cmd != nil {
+ 		h.session.interrupted = true
+-		h.session.cmd.Process.Signal(os.Interrupt)
+-		h.session.cmd.Wait()
+-	} else {
+-		if h.auth != nil {
+-			h.auth.closeAuth()
++		if err := h.session.cmd.Process.Signal(os.Interrupt); err != nil {
++			logPrint("Application not responding to signal")
++		} else {
++			// Only attempt clean shutdown if cmd is still
++			// responsive
++			h.session.cmd.Wait()
+ 		}
+-		os.Exit(1)
+ 	}
++	// Always attempt to close active auth instances before exit
++	if h.auth != nil {
++		h.auth.closeAuth()
++	}
++	os.Exit(1)
+ }
+ 
+ // Process core arguments for help and version, because they don't require any further application run
+-- 
+2.51.0
+
-- 
2.51.0


