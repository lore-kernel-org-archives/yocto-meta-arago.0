Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6972AC35FF6
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:45:50 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.39071.1741790742345525307
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=U3VkOunz;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjeMU1525222
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 09:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790740;
	bh=p+19pwGdFBYYbdyywNMQ4AnrxNRKQ5ZdlAtOiD6DpCE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=U3VkOunz5F5g4Bds47XSQyjM12m5mEkP0Lz2I1BqWn6ivo2chnYv4Kk5RDXV6qQDI
	 9rDn5vCM/D2w9+FGBNsxRZ9OP1xcSjTLCEWNs+PgV/860ZXcZVIERIfC+7Ddyr6hhS
	 vm5ItbFNhN+Rs9kmJ7lGF51pWmO0oCtDQ5H0isxg=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjeQb097194
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:45:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:45:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjegR074619;
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNL2-0003nD-9B; Wed, 12 Mar 2025 09:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 02/10] pm-qa: Wrap the bbappend in a compliant manner
Date: Wed, 12 Mar 2025 09:45:32 -0500
Message-ID: <20250312144540.14210-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312144540.14210-1-reatmon@ti.com>
References: <20250312144540.14210-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15995

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../pm-qa/{pm-qa_%.bbappend => pm-qa-arago.inc}        |  5 +++--
 .../recipes-devtools/pm-qa/pm-qa_%.bbappend            | 10 +++-------
 2 files changed, 6 insertions(+), 9 deletions(-)
 copy meta-arago-distro/recipes-devtools/pm-qa/{pm-qa_%.bbappend => pm-qa-arago.inc} (62%)

diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc
similarity index 62%
copy from meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
copy to meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc
index 73d4013d..079772ad 100644
--- a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa-arago.inc
@@ -1,10 +1,11 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/pm-qa:"
 
 # Bump to 0.5.0+
 SRCREV = "e66966ef6a08cd3b491ee1df5c6c5d33baaf1f1c"
 
 SRC_URI += " \
 	file://0001-Return-non-zero-value-on-test-failure.patch \
-	file://0002-cpuidle-Avoid-relative-paths.patch"
+	file://0002-cpuidle-Avoid-relative-paths.patch \
+"
 
 PR:append = ".arago0"
diff --git a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
index 73d4013d..89d37b2a 100644
--- a/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
+++ b/meta-arago-distro/recipes-devtools/pm-qa/pm-qa_%.bbappend
@@ -1,10 +1,6 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
 
-# Bump to 0.5.0+
-SRCREV = "e66966ef6a08cd3b491ee1df5c6c5d33baaf1f1c"
+PM_QA_ARAGO = ""
+PM_QA_ARAGO:arago = "pm-qa-arago.inc"
 
-SRC_URI += " \
-	file://0001-Return-non-zero-value-on-test-failure.patch \
-	file://0002-cpuidle-Avoid-relative-paths.patch"
+require ${PM_QA_ARAGO}
 
-PR:append = ".arago0"
-- 
2.17.1


