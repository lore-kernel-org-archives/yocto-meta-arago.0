Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD318C4725D
	for <webhook@archiver.kernel.org>; Fri, 19 Jan 2024 23:42:32 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.8327.1705707750011663906
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 19 Jan 2024 15:42:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=JE02CNjT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40JNgSXU011097;
	Fri, 19 Jan 2024 17:42:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1705707748;
	bh=FNKfAFBWC6niQLQawCyMwqnJ1tr6snYTnwUtAziz4I0=;
	h=From:To:Subject:Date;
	b=JE02CNjTRRjzExR/2kA+me7jDaonlnBILgnFy4qEv8F3agz57HbtfA3j+6Ylqenh6
	 /U5Fbte+WEliKmgsW7Ofyv3qvXwmXUVzM/D3V52b03SVUPZXARIKfteRGcEZz5XQO7
	 LR++jIMIPyZXLAivktXxtxDAwcDPZgcJmWkfhXjo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40JNgSda054953
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Jan 2024 17:42:28 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Jan 2024 17:42:28 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Jan 2024 17:42:28 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40JNgSZj072852;
	Fri, 19 Jan 2024 17:42:28 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rQyVH-0006r3-R4; Fri, 19 Jan 2024 17:42:27 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] layer.conf: Add multimedia-layer as a LAYERDEPENDS
Date: Fri, 19 Jan 2024 17:42:27 -0600
Message-ID: <20240119234227.24477-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 Jan 2024 23:42:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15074

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
index 74833343..086b0411 100644
--- a/meta-arago-distro/conf/layer.conf
+++ b/meta-arago-distro/conf/layer.conf
@@ -16,6 +16,7 @@ LAYERDEPENDS_meta-arago-distro = " \
     meta-ti-extras \
     openembedded-layer \
     networking-layer \
+    multimedia-layer \
     meta-python \
     qt5-layer \
     meta-arago-extras \
-- 
2.17.1


