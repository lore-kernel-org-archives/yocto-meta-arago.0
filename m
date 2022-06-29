Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5FBDC43334
	for <webhook@archiver.kernel.org>; Wed, 29 Jun 2022 10:53:23 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web08.10010.1656499995077319377
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 29 Jun 2022 03:53:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gIrWiGUI;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 25TArEj1048150
	for <meta-arago@lists.yoctoproject.org>; Wed, 29 Jun 2022 05:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656499994;
	bh=2HurnLe86YsfmH/HzsNHmqG6NdMIEjuY/FrxEjbKA6c=;
	h=From:To:CC:Subject:Date;
	b=gIrWiGUIjbYCPWnOzFgRxf0hYRKltB3Rogwkkv3s3MGcGJAu2qjq7Zvjs1LzgcgJP
	 pk9igbNBLiK6Jxm0iLwrr0MXKQTNzySZmgy4mJBfzebqDKP+4/HFLHWzs3uG5sRiRJ
	 b5Ae14UTxObDGHphNWQTYALuYqQW26V5o0Z4eLqQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 25TArECH020946
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 29 Jun 2022 05:53:14 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 29
 Jun 2022 05:53:13 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 29 Jun 2022 05:53:13 -0500
Received: from edgeaipc1 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 25TArDfe046310;
	Wed, 29 Jun 2022 05:53:13 -0500
Received: from a0485100 by edgeaipc1 with local (Exim 4.90_1)
	(envelope-from <a-limaye@ti.com>)
	id 1o6VJn-00047A-N8; Wed, 29 Jun 2022 16:23:11 +0530
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <reatmon@ti.com>, <l-weaver@ti.com>,
        Aniket Limaye
	<a-limaye@ti.com>
Subject: [meta-arago][dunfell][PATCH] gstreamer: Adding tracer-hooks build
 flag to enable GST_TRACERS
Date: Wed, 29 Jun 2022 16:23:04 +0530
Message-ID: <20220629105304.15355-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 29 Jun 2022 10:53:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13921

Enables GST_TRACERS : an optional utility for profiling gstreamer applications

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 .../gstreamer/gstreamer1.0_1.16.%.bbappend                   | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
new file mode 100644
index 00000000..d7bdaa04
--- /dev/null
+++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0_1.16.%.bbappend
@@ -0,0 +1,5 @@
+
+PACKAGECONFIG_append = " tracer-hooks"
+
+PR_append = ".arago0"
+
-- 
2.17.1


