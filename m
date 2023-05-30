Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C0DC7EE2F
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:48:16 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1349.1685483286328136835
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 30 May 2023 14:48:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=SRt6ghme;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34ULm3C0055282;
	Tue, 30 May 2023 16:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685483283;
	bh=G1oHHlLi+h4BmMr63n2kZ+DkmRPsMvgCESIx4zii7rg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SRt6ghmeNNbvBpLNFCR9Trc1tpuEW5szEigHqYW6/xZ14YkeFTfoA3SN0OPy+W0jR
	 3qpHtzchRKHlI04p6T9F6JKqg/Mgohw8Zdq7v3FrzIVskMvZCzBUjedLbzt5Ln7fMh
	 /9bQyyY8XWGyH6Alegx34b2KfrY4p6A8wiMI53IY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34ULm34i020348
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 30 May 2023 16:48:03 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 30
 May 2023 16:48:03 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 30 May 2023 16:48:03 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34ULm2rK026159;
	Tue, 30 May 2023 16:48:03 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <detheridge@ti.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH 1/2] arago.conf: add opencl as a distro feature
Date: Tue, 30 May 2023 16:47:56 -0500
Message-ID: <20230530214757.3693099-2-rs@ti.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230530214757.3693099-1-rs@ti.com>
References: <20230530214757.3693099-1-rs@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 30 May 2023 21:48:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14481

From: Randolph Sapp <rs@ti.com>

Rogue devices now have limited support for opencl. Further testing is
required but this is safe to enable now.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 379b1d44..a6425fae 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -47,7 +47,7 @@ DISTRO_FEATURES = "${DISTRO_FEATURES_DEFAULT} ${DISTRO_FEATURES_LIBC}"
 
 # Add additional distro features
 DISTRO_FEATURES:append = " pam wayland opengl"
-#DISTRO_FEATURES:append = " opencl"
+DISTRO_FEATURES:append = " opencl"
 DISTRO_FEATURES:append = " vulkan"
 DISTRO_FEATURES:append = " opencv"
 DISTRO_FEATURES:append = " openmp"
-- 
2.40.1


