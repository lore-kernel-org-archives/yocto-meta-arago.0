Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AF35C3525B
	for <webhook@archiver.kernel.org>; Wed,  6 Apr 2022 16:33:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.2827.1649204873408704267
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 05 Apr 2022 17:27:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xTL/t9W3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2360RqgE072900;
	Tue, 5 Apr 2022 19:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1649204872;
	bh=fsqo9vH7fRyzbzEPwLGRg0epS0vNy/XNzGTNBuHO/fQ=;
	h=From:To:Subject:Date;
	b=xTL/t9W3/x2chfWji/wQYwoOtLjfxOWRK8PHzFgyOs1NRGIdJjrkN0bLke4/MrJBZ
	 +Ci1oawtWnSA85STxZFrFFcn7ak1EIeBUESzZWNZpsr3hxon6Lf0DTdyN/Dw5biXKo
	 EsJQsdzy3eluuq4I9FyJ5lx55CJ7CURKQ+G5vdNk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2360RqZr078318
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 5 Apr 2022 19:27:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 5
 Apr 2022 19:27:51 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 5 Apr 2022 19:27:51 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2360Rp52055093;
	Tue, 5 Apr 2022 19:27:51 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nbtWZ-0003iz-CU; Tue, 05 Apr 2022 19:27:51 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [tisdk-build-scripts][master][PATCH] Remove build of ti-rtos-metadata
 from configs
Date: Tue, 5 Apr 2022 19:27:51 -0500
Message-ID: <20220406002751.14241-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 06 Apr 2022 16:33:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13772

The ti-rtos-metadata recipe has been defunct since a commit to
meta-ti in July 2021.  So the call to build the recipe is no
longer needed.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/farm/arago-dunfell-next.txt | 2 +-
 configs/farm/arago-dunfell.txt      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/farm/arago-dunfell-next.txt b/configs/farm/arago-dunfell-next.txt
index 2cf092c..53977a9 100644
--- a/configs/farm/arago-dunfell-next.txt
+++ b/configs/farm/arago-dunfell-next.txt
@@ -78,4 +78,4 @@ BB_GENERATE_MIRROR_TARBALLS="1"
 
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
-BITBAKE_COMMAND="ti-rtos-metadata ; -k tisdk-core-bundle tisdk-tiny-image ti-world"
+BITBAKE_COMMAND="-k tisdk-core-bundle tisdk-tiny-image ti-world"
diff --git a/configs/farm/arago-dunfell.txt b/configs/farm/arago-dunfell.txt
index 331ef0f..43b22ba 100644
--- a/configs/farm/arago-dunfell.txt
+++ b/configs/farm/arago-dunfell.txt
@@ -78,4 +78,4 @@ BB_GENERATE_MIRROR_TARBALLS="1"
 
 # This variable contains the command(s) that bitbake should run. Each command
 # should be seperated by a semicolon.
-BITBAKE_COMMAND="ti-rtos-metadata ; tisdk-core-bundle tisdk-tiny-image ti-world"
+BITBAKE_COMMAND="tisdk-core-bundle tisdk-tiny-image ti-world"
-- 
2.17.1


