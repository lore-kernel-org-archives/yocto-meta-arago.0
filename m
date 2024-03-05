Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B3FC54798
	for <webhook@archiver.kernel.org>; Tue,  5 Mar 2024 23:07:17 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.2988.1709680029626894176
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 15:07:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Aby0ISMS;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 425N786Y019473;
	Tue, 5 Mar 2024 17:07:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1709680028;
	bh=psXHKVsblRUkot8jyXQJ0SRB5PSIMXa2t+qyxsYAovQ=;
	h=From:To:Subject:Date;
	b=Aby0ISMSzXTsslw55yviWtrlKIMck06BG/53ID5bdRFPAuKsanIOn+VTp3D53+poi
	 NcLtgBsVKwElFipqx3ASFiMMSFd1k7zWm0ANowD8KAGS7iGShYnxCEEJZD7ToWANKo
	 irVaZdNHfXPJ6JVsZhquuOC1vQ2PaQ6RrxnafbV0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 425N78pi057708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Mar 2024 17:07:08 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 5
 Mar 2024 17:07:08 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 5 Mar 2024 17:07:08 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 425N77VV008555;
	Tue, 5 Mar 2024 17:07:08 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rhdsJ-0006Q8-NA; Tue, 05 Mar 2024 17:07:07 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] websocketd: Add GOPROXY variable
Date: Tue, 5 Mar 2024 17:07:07 -0600
Message-ID: <20240305230707.24641-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 05 Mar 2024 23:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15225

As of go v1.21, GOPROXY is required to be set to something other than
or you get the following error:

go: github.com/gorilla/websocket@v1.4.0: GOPROXY list is not the empty string, but contains no entries

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-devtools/websocketd/websocketd_0.4.1.bb             | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
index 66475726..207cd38a 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -7,6 +7,8 @@ inherit go-mod
 
 GO_IMPORT = "github.com/joewalnes/websocketd"
 
+export GOPROXY = "https://proxy.golang.org,direct"
+
 SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master"
 SRCREV = "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
 
-- 
2.17.1


