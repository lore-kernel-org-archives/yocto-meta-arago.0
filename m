Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B19FC25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 19:45:41 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.22778.1717184736105900640
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 31 May 2024 12:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tY7GD06W;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjYXv074301;
	Fri, 31 May 2024 14:45:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1717184734;
	bh=L5LH7WlAtNBayKCCaAM8+aCZk/VgkpprYnFeqqcuGTQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=tY7GD06WJxRWGRuZXnb0ahqU4MU57rWe0G75SvxDUtmUAyJdlise4bnMd2EGwm6bm
	 y/XUYCun/5pHfrDezJYdkU/3HqLFybdozKiAppGZGmmgyyKqGKDsKZ5dWLV1zB9ebG
	 FOnGTzoL7TnHeGX6lb//IvU3wT7z67kNseLU4RQQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 44VJjYkB039348
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 31 May 2024 14:45:34 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 31
 May 2024 14:45:34 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 31 May 2024 14:45:34 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 44VJjYrL033172;
	Fri, 31 May 2024 14:45:34 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1sD8By-0006Es-Ev; Fri, 31 May 2024 14:45:34 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH v3 3/3] websocketd: Add required GO_SRCURI_DESTSUFFIX
Date: Fri, 31 May 2024 14:45:33 -0500
Message-ID: <20240531194533.23925-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240531194533.23925-1-reatmon@ti.com>
References: <20240531194533.23925-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 31 May 2024 19:45:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15348

Part of the UNPACKDIR changes for Go modules is the requirement for Go
recipes to include ;destsuffix=${GO_SRCURI_DESTSUFFIX} in the SRC_URI.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-devtools/websocketd/websocketd_0.4.1.bb             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
index 207cd38a..1f5f8f5d 100644
--- a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.4.1.bb
@@ -9,7 +9,7 @@ GO_IMPORT = "github.com/joewalnes/websocketd"
 
 export GOPROXY = "https://proxy.golang.org,direct"
 
-SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master"
+SRC_URI = "git://${GO_IMPORT};protocol=https;branch=master;destsuffix=${GO_SRCURI_DESTSUFFIX}"
 SRCREV = "035c18cc3e6962dabd5ea2ad8845260726a4a99e"
 
 # bitbake only exports proxy variables during fetching, but go handles
-- 
2.17.1


