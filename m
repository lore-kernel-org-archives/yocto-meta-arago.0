Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6646FE8FDD0
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 06:39:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.12613.1696401590537239480
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 03 Oct 2023 23:39:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uljay3Me;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3946dobN079521
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:39:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696401590;
	bh=nQbSvHO8kezyWl3RUF27lCNXSpAJluVhNcdZOizBQPo=;
	h=From:To:CC:Subject:Date;
	b=uljay3Me2utszqlHFSRwFJMTuUk5/lHt7b8TNuoa/o6VGZh+j+4CJAv3YUjcr8ZH2
	 On0pvKPybP+mjYdMARjEDLlwxa0nRg0XOZNKOw6cosJKFWACAAE0fS5Qml3mL9nFSh
	 rycIvhuG0oBkEYcYBehUbTTb6iK3FPWxylXYWqxY=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3946douw115406
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 4 Oct 2023 01:39:50 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 4
 Oct 2023 01:39:49 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 4 Oct 2023 01:39:49 -0500
Received: from PSDKL-Workstation0.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3946dluX011122;
	Wed, 4 Oct 2023 01:39:48 -0500
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <reatmon@ti.com>, Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] tisdk-bundle: Fix generate_sw_manifest_table
Date: Wed, 4 Oct 2023 12:09:45 +0530
Message-ID: <20231004063945.703846-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 04 Oct 2023 06:39:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14916

The generated manifest file is expected to strictly have 7 columns,
delimited by '|' while the License section also sometimes has '|'
character. Replace this one by 'or' to fix manifest file

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-distro/classes/tisdk-bundle.bbclass
index 1ebdb6fb..d2d31381 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -553,7 +553,7 @@ EOF
         package="`cat $i | grep Package: | awk {'print $2'}`"
         version="`cat $i | grep Version: | awk {'print $2'} | cut -f1-2 -d-`"
         long_version="`cat $i | grep Version: | awk {'print $2'}`"
-        license="`cat $i | grep License: | cut -d: -f2 `"
+        license="`cat $i | grep License: | cut -d: -f2 | sed 's/|/or/g' `"
         architecture="`cat $i | grep Architecture: | awk {'print $2'}`"
         sources="`cat $i | grep Source: | cut -d ':' -f2-`"
         location="$package""_""$long_version""_""$architecture"".ipk"
-- 
2.34.1


