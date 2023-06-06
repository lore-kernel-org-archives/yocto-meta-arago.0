Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE07FC7EE37
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 21:51:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1700.1686088281252695449
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 14:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=zKkj3imB;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 356LpHig066652;
	Tue, 6 Jun 2023 16:51:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686088277;
	bh=AcTa6HXNJVsBOWhmWvSeYwQ5jN+px+L+KixoqsxpYKU=;
	h=From:To:CC:Subject:Date;
	b=zKkj3imBkQtoDKliK1qFMJbCK6Q3nbkEb4yBjPPDhacWrZBJkcDbTDkFP0tftX7sG
	 0bTuOCLFZM42E87tAI2AwFqiZRiGwz4kBBFzHX5ZTIoTmrR8nZcnmxQCfeRzU4pRip
	 029DEVs19gi4lwEtPFWHM7JRTCIvfAk04IGsROko=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 356LpHQK017271
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 6 Jun 2023 16:51:17 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 6
 Jun 2023 16:51:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 6 Jun 2023 16:51:16 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 356LpGK0025844;
	Tue, 6 Jun 2023 16:51:16 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>, <afd@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] kexec-tools: drop the bbappend
Date: Tue, 6 Jun 2023 16:51:08 -0500
Message-ID: <20230606215108.2655321-1-rs@ti.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 06 Jun 2023 21:51:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14503

From: Randolph Sapp <rs@ti.com>

This is a do-nothing bbappend. On top of that, it always expects the
sysvinit script to be present, which is not supposed to be true in our
default config. Drop the append entirely.

Signed-off-by: Randolph Sapp <rs@ti.com>
---

This is a prereq for the following patch apparently:
https://lists.yoctoproject.org/g/meta-arago/message/14498

I tested that patch against core build targets not expecting us to do
something this weird in meta-arago.

 .../recipes-kernel/kexec/kexec-tools_%.bbappend            | 7 -------
 1 file changed, 7 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend

diff --git a/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend b/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
deleted file mode 100644
index 88786124..00000000
--- a/meta-arago-distro/recipes-kernel/kexec/kexec-tools_%.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-PR:append = ".arago2"
-
-do_install:append() {
-	chmod -x ${D}${sysconfdir}/init.d/kdump
-}
-- 
2.40.1


