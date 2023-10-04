Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B49E8FDD1
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 06:41:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.12703.1696401684967371311
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 23:41:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=F9LhIhZZ;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: a-limaye@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3946fOdD112216
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:41:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696401684;
	bh=y099uvnEhc+XIpGruUD3B9wK/NyD9LooSRBYxNrZVjg=;
	h=From:To:CC:Subject:Date;
	b=F9LhIhZZ4zRpptZBb8PomzeI2ei0F3HU3C8h06k2WPYh/tQCDNnIyMTECitSZbx/G
	 2TT1mfJUWOOgjqUmcah8fvC7IM1HCYklPvbNfiej92VqG0IUO+J4RdM5Hn5oFZWSLQ
	 r1iddRQCHQded3wPNRkTEjzelnteZcqd6xWkT7+E=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3946fOfa012916
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:41:24 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 01:41:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 01:41:23 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3946fMUY029695;
	Wed, 4 Oct 2023 01:41:23 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] arago-gpl-notice: Update script to look for updated GPL-3.0 identifier
Date: Wed, 4 Oct 2023 12:11:20 +0530
Message-ID: <20231004064120.704114-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Oct 2023 06:41:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14917

The license identifier was updated from GPLv3 to GPL-3.0

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../arago-gpl-notice/print-gplv3-packages.sh              | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
index 08cb3b4a..a47773f0 100644
--- a/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
+++ b/meta-arago-distro/recipes-core/arago-gpl-notice/arago-gpl-notice/print-gplv3-packages.sh
@@ -19,9 +19,9 @@
 
 gplv3_packages=""
 
-# find all files with GPLv3 in them that do not also have RLE
+# find all files with GPL-3.0 in them that do not also have RLE
 # exception listed.
-files=`grep License: /var/lib/opkg/info/*.control | grep -i GPLv3 | grep -v RLE | cut -d: -f1 | sort -u`
+files=`grep License: /var/lib/opkg/info/*.control | grep -i GPL-3.0 | grep -v RLE | cut -d: -f1 | sort -u`
 
 for i in $files
 do
@@ -36,11 +36,11 @@ then
 cat << EOM 2>&1
 ***************************************************************
 ***************************************************************
-NOTICE: This file system contains the following GPLv3 packages:
+NOTICE: This file system contains the following GPL-3.0 packages:
 EOM
     echo -e $gplv3_packages 2>&1
 cat << EOM 2>&1
-If you do not wish to distribute GPLv3 components please remove
+If you do not wish to distribute GPL-3.0 components please remove
 the above packages prior to distribution.  This can be done using
 the opkg remove command.  i.e.:
     opkg remove <package>
-- 
2.34.1


