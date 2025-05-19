Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E06C54795
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:15 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.385.1747674073606996999
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:01:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dH6ebx9L;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1BLF955232;
	Mon, 19 May 2025 12:01:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674071;
	bh=w6/HWpB5ADUOuKVrO3Ge1TzTQrx5j9y+igKb8h7f910=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=dH6ebx9LT5mYzaH6bJNNEIIxtrZTCGTVjrQ5TlScJLVNcQ5VmX4xeXW4r3Dp9nvm+
	 C6e6tODjo81OgBqnbf37oNMNU4TR9PHGK/LWDXOK/6uXdy7+1Ka+HMt3FwrIMjhB0h
	 smg6BDqErcohjnlBW+YApil/iTmikRMOa6i+yAXE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54JH1BPM888488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 19 May 2025 12:01:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:01:11 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:01:11 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1Bbd111310;
	Mon, 19 May 2025 12:01:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rT-0005sY-8k; Mon, 19 May 2025 12:01:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 8/8] check_yocto_rules: Add new config file
Date: Mon, 19 May 2025 12:01:10 -0500
Message-ID: <20250519170110.22506-9-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250519170110.22506-1-reatmon@ti.com>
References: <20250519170110.22506-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16226

TI is starting to run an automated checker for all incoming patches to
the mailing list.  One of the checks is to scan all of the files in the
repository looking for things that we have flagged as the "right way" of
doing recipes.  This file contains a set of exceptions that the checking
script is finding but can be skipped due to manual review.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 check_yocto_rules.json

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
new file mode 100644
index 00000000..9cf776df
--- /dev/null
+++ b/check_yocto_rules.json
@@ -0,0 +1,27 @@
+{
+    "APPEND-1" : {
+        "skip_vars" : [ "FILES", "RDEPENDS" ]
+    },
+    "APPEND-2" : {
+        "skip_vars" : [ "PR", "PV" ],
+        "files" : {
+            "meta-arago-distro/conf/distro/include/arago-prefs.inc" : {
+                "skip_vars": [ "PREFERRED_PROVIDER_virtual/kernel" ]
+            }
+        }
+    },
+    "GUARD-1" : {
+        "skip_files" : [
+            "meta-arago-distro/dynamic-layers/chromium-browser-layer/recipes-core/images/tisdk-default-image.bbappend",
+            "meta-arago-distro/dynamic-layers/selinux/recipes-core/images/tisdk-default-image.bbappend",
+            "meta-arago-distro/dynamic-layers/selinux/recipes-kernel/linux/linux-ti-staging_%.bbappend",
+            "meta-arago-extras/recipes-extended/sysrepo/libyang_%.bbappend",
+            "meta-arago-test/dynamic-layers/qt6-layer/recipes-core/packagegroups/ti-test.bbappend",
+            "meta-arago-test/recipes-benchmark/stream/stream_%.bbappend",
+            "meta-arago-test/recipes-extended/bc/bc_%.bbappend"
+        ]
+    },
+    "GUARD-2" : {
+        "skip_vars" : [ "arago" , "ti-soc" ]
+    }
+}
-- 
2.17.1


