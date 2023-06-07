Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 377CCC87FDE
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 20:05:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.8315.1686168314698164428
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 13:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=L3HpdHZh;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: rs@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 357K5Btb106444;
	Wed, 7 Jun 2023 15:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686168311;
	bh=j8VLxptmubibkr1GBAVKuOPOQ4zj9U34XvkAM/m2FM8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=L3HpdHZhPd92C4o5Ro9UkI/naqXBLCik6AshWHYx7oYDMKXacV8YXN4F6hRvQoMaH
	 dpmn97TE05fmMSiKMbI26iryvmogjUZnhHOFb5lDR/RMP3eqq/GNDQbuIzQ5FKbZQ+
	 Ygmb0gWtQXkzrGgqF9RHsjykd4q96iuLhutOlqes=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 357K5B79036872
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jun 2023 15:05:11 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 Jun 2023 15:05:11 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 Jun 2023 15:05:11 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 357K5AL5125548;
	Wed, 7 Jun 2023 15:05:11 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <afd@ti.com>, <nm@ti.com>
CC: <meta-arago@lists.yoctoproject.org>,
        StaticRocket
	<35777938+StaticRocket@users.noreply.github.com>
Subject: [oe-layersetup][PATCH 09/15] oe-layertool-setup: use subshell execution with redirect
Date: Wed, 7 Jun 2023 15:04:58 -0500
Message-ID: <20230607200504.3810426-10-rs@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14530

From: StaticRocket <35777938+StaticRocket@users.noreply.github.com>

Shellcheck:
Consider using { cmd1; cmd2; } >> file instead of individual redirects.

Signed-off-by: StaticRocket <35777938+StaticRocket@users.noreply.github.com>
---
 oe-layertool-setup.sh | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index b824114..8e29f9a 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -818,16 +818,18 @@ EOM
 
     if [ -e "$oebase/tmp_append_local.conf" ]
     then
-        echo "" >> "$confdir/local.conf"
-        echo "#====================================================================" >> "$confdir/local.conf"
-        echo "# LOCALCONF: settings from config file:" >> "$confdir/local.conf"
-        echo "#   $inputfile" >> "$confdir/local.conf"
-        echo "#" >> "$confdir/local.conf"
-        echo "# Do not remove." >> "$confdir/local.conf"
-        echo "#--------------------------------------------------------------------" >> "$confdir/local.conf"
-        cat "$oebase/tmp_append_local.conf" >> "$confdir/local.conf"
-        echo "#====================================================================" >> "$confdir/local.conf"
-        echo "" >>  "$confdir/local.conf"
+        {
+            echo "";
+            echo "#====================================================================";
+            echo "# LOCALCONF: settings from config file:";
+            echo "#   $inputfile";
+            echo "#";
+            echo "# Do not remove.";
+            echo "#--------------------------------------------------------------------";
+            cat "$oebase/tmp_append_local.conf";
+            echo "#====================================================================";
+            echo "";
+        } >> "$confdir/local.conf"
         rm "$oebase/tmp_append_local.conf"
     fi
 }
-- 
2.40.1


