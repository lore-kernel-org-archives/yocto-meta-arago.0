Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E180C87FE1
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.8427.1686168314466445607
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SboAByil;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5C40106453;
	Wed, 7 Jun 2023 15:05:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168312;
	bh=J/rmZgREshmbK0jtUJ527YK5NsRjK78jlX1nIaMUFNc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SboAByilY4dgT/zn2Afnda/IK+RPN2OklH73XW2+7bFEuYv+e29t1vXai31IWDU9S
	 NdlvvO1HpGdHRX5ZINhlz40NufaLFVK0AeBETWSA+duOaIhUKS+zRG0bl61wRlAY3k
	 LJwa0xVFwMN78IAni4OdE/nSdXHdfWeuXjDzkKfc=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5CGC070129
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:12 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5ALB125548;
	Wed, 7 Jun 2023 15:05:11 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 15/15] oe-layertool-setup: add sanity check for layer names
Date: Wed, 7 Jun 2023 15:05:04 -0500
Message-ID: <20230607200504.3810426-16-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14522

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

Due to POSIX shell string parsing limitations we currently can't parse
layer names with spaces. Display an error message and bail out when
detected.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 2b05550..16b7844 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -211,6 +211,13 @@ parse_repo_line() {
     then
         temp_layers=""
         temp=$(printf '%s\n' "$parsed_layers" | cut -d= -f2)
+        # sanity check for whitespace in layer names string
+        if printf '%s\n' "$temp" | grep -q '\s'
+        then
+            printf '%s\n' "Whitespace character detected in layer names string!" \
+                          "This is currently unsupported." ;
+            exit 1
+        fi
         # use tr to split the layers since we assume layer names don't have
         # whitespace characters later anyway
         for x in $(printf '%s\n' "$temp" | tr ':' ' ')
-- 
2.40.1


