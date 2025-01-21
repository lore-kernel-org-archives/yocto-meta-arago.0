Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9389DC0218D
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 17:52:34 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.21963.1737481953853804946
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 09:52:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Tq9ZsGEx;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqWk8045920
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 21 Jan 2025 11:52:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737481953;
	bh=DSPODuMR4Y/SpvFLAw4v7Thj6z5l6VAxJ6dox8T0CLw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=Tq9ZsGExCpvFBLhEwy9rZAR5jrUwBn8ZBx9uZHFh+bBW2RnqkNrHTr4kLNOoTY+VI
	 0BFtUen05VnhHqjQF+9Zlv6wPdewmDQlgAKHnVh5GeyRkMgDVPYvT4bz0+LN7+fm9Z
	 5zI6iUSsYvkNUhtMO2anDDQWSVGdM1q/cpv8cZc0=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LHqWUF043538;
	Tue, 21 Jan 2025 11:52:32 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 11:52:32 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 11:52:32 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LHqV99097709;
	Tue, 21 Jan 2025 11:52:32 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2 2/7] arago.conf: Remove leftover comments around security protections
Date: Tue, 21 Jan 2025 11:52:26 -0600
Message-ID: <20250121175231.27183-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250121175231.27183-1-afd@ti.com>
References: <20250121175231.27183-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 17:52:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15721

These flags, along with many more updated ones, can all be set using
security_flags.inc from oe-core now.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - No changes

 meta-arago-distro/conf/distro/arago.conf | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6e8c6cb9..f1948523 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -153,10 +153,6 @@ ARAGO_SYSTEST_ENABLE ?= "0"
 ARAGO_KERNEL_SUFFIX:append = "${@oe.utils.conditional("ARAGO_SYSTEST_ENABLE", "1", "-systest", "", d)}"
 IMAGE_FSTYPES:remove = "${@['','ubi ubifs'][d.getVar('ARAGO_SYSTEST_ENABLE') == '1']}"
 
-# Enable basic stack and buffer overflow protections
-#TARGET_CPPFLAGS += "-fstack-protector -D_FORTIFY_SOURCE=1"
-#TARGET_CPPFLAGS += "-fstack-protector"
-
 # Load default preferences
 require conf/distro/include/arago-prefs.inc
 
-- 
2.39.2


