Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A7BC41513
	for <webhook@archiver.kernel.org>; Mon, 16 Oct 2023 21:18:43 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.180432.1697491122447609385
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 16 Oct 2023 14:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nEDGGrJL;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39GLIfTn059127;
	Mon, 16 Oct 2023 16:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1697491121;
	bh=mYSINGZ6VV0gn4D9Is9u/6Zc87bp0+B8dbfOoD5c00o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=nEDGGrJLtWeW2Iz8SKPX4SP2NzOR+UJu2vJPdBs9fRK4+cJkH7Ex3MCzmrWvp97lQ
	 fn7Hvdn2MSKW6RBdxUpBFNH742wRi8zutrIzURxGyDBjj+vywbmxS+qPxac5cXTyig
	 e0f8hZDH8I8gXqlj8r9ZN1yNhsnWyDYSqKSJYXss=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39GLIf69031100
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Oct 2023 16:18:41 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Oct 2023 16:18:41 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Oct 2023 16:18:40 -0500
Received: from ula0226330.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39GLIeqW047105;
	Mon, 16 Oct 2023 16:18:40 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 2/2] shadow-securetty: Do not allow root login over telnet
Date: Mon, 16 Oct 2023 16:18:40 -0500
Message-ID: <20231016211840.23815-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231016211840.23815-1-afd@ti.com>
References: <20231016211840.23815-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 16 Oct 2023 21:18:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14938

I'm sure I don't have to explain why this was a bad idea..

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../shadow/shadow-securetty_%.bbappend            | 15 ---------------
 1 file changed, 15 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend

diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
deleted file mode 100644
index 62999d2a..00000000
--- a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_%.bbappend
+++ /dev/null
@@ -1,15 +0,0 @@
-PR:append = ".arago0"
-
-do_install:append () {
-    # Allow telnet sessions to login as root
-    securetty_file=${D}${sysconfdir}/securetty
-
-    echo '' >> $securetty_file
-    echo '# Allow 5 telnet login' >> $securetty_file
-    echo 'pts/0' >> $securetty_file
-    echo 'pts/1' >> $securetty_file
-    echo 'pts/2' >> $securetty_file
-    echo 'pts/3' >> $securetty_file
-    echo 'pts/4' >> $securetty_file
-
-}
-- 
2.39.2


