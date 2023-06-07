Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FB6AC87FE7
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.8316.1686168314874622052
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lLy9xqH0;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5C0S023512;
	Wed, 7 Jun 2023 15:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168312;
	bh=WiBvpzc1CcoFVFonuGnJQMzzM4qxiYl4fLHFjUeX8Uw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lLy9xqH0PErRayoAc1nSynWeEnHIIf6waDZUR1Vox4pu2Xo3dLuI8FDKV1bqJ78SP
	 hsLRGQoaQp05BbnqylozU/T3G1K5Oq56Uk7Epe/C+VLElsOmvNYsno77gEuLu24+ab
	 NWDvHxb/BEod5aQJKjad9ZqlCoSnOQ6RfYyKCr1U=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5CYS087599
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:12 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AL9125548;
	Wed, 7 Jun 2023 15:05:11 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 13/15] oe-layertool-setup: add a path sanity check for oebase
Date: Wed, 7 Jun 2023 15:05:02 -0500
Message-ID: <20230607200504.3810426-14-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230607200504.3810426-1-rs@ti.com>
References: <20230607200504.3810426-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 07 Jun 2023 20:05:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14533

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

OEBase can not have a space in it's name due to parsing limitations of
POSIX shell. Make sure to check this before doing anything.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 0928959..8694abd 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -966,6 +966,14 @@ do
     esac
 done
 
+# add early sanity check
+if printf '%s\n' "$oebase" | grep -q '\s'
+then
+   printf '%s\n' "OE-Base path has whitespace characters in it's path!" \
+                 "This is currently unsupported." ;
+   exit 1
+fi
+
 # create passed in directory if it doesn't exist
 mkdir -p "$oebase"
 
-- 
2.40.1


