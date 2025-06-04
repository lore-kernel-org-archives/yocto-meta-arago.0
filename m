Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8357DC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 18:07:45 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.23632.1749060458757012126
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 04 Jun 2025 11:07:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VexbOh1x;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 554I7bNp3883537;
	Wed, 4 Jun 2025 13:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749060457;
	bh=0SVZOrc3RpxgupADjys1ND749R/Z4L6w7b2/2IdVHL4=;
	h=From:To:Subject:Date;
	b=VexbOh1x85lGB9Ye8cNEgi+JVlT3W/Cax4YXF0eadNk/VEinDzDVljEb5ZUs+VvWH
	 yHnqaIGtyCrdYUhYytftdhjPmp7LjrbdkqoMcKgxZXvtz6O7vCUF6ENRJk/RPNsmoW
	 4ts9RgHHVHfOpWs0R0UsTc+nyCZ/r/G4eolTdmdg=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 554I7biS537051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 4 Jun 2025 13:07:37 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Jun 2025 13:07:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Jun 2025 13:07:37 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 554I7btN2440063;
	Wed, 4 Jun 2025 13:07:37 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uMsWX-0004SK-5u; Wed, 04 Jun 2025 13:07:37 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] Revert "sbc: Fix for gcc 15 compile error"
Date: Wed, 4 Jun 2025 13:07:37 -0500
Message-ID: <20250604180737.17089-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Jun 2025 18:07:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16253

This reverts commit bec69eb41ffb641c5eb63f42be7af8956e7889f5.

oe-core accepted the patch [1], so this is no longer needed.

[1] https://git.openembedded.org/openembedded-core/commit/?id=2dc0664e966cd8d4c99798cc997c192785773e31

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc  | 1 -
 meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend | 4 ----
 2 files changed, 5 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc
 delete mode 100644 meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc b/meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc
deleted file mode 100644
index 39725139..00000000
--- a/meta-arago-distro/recipes-multimedia/sbc/sbc-arago.inc
+++ /dev/null
@@ -1 +0,0 @@
-CFLAGS += "-std=gnu17"
diff --git a/meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend b/meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend
deleted file mode 100644
index 295b58a4..00000000
--- a/meta-arago-distro/recipes-multimedia/sbc/sbc_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-SBC_ARAGO = ""
-SBC_ARAGO:arago = "sbc-arago.inc"
-
-require ${SBC_ARAGO}
-- 
2.17.1


