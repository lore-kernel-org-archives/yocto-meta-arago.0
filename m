Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF7DC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 15:27:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.16114.1714750016957983118
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 May 2024 08:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xZQudFxA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 443FQtl9024991;
	Fri, 3 May 2024 10:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1714750015;
	bh=DgtWiWcj8MIfVXh+rUkK+AH2GGY02pugf/mztNN6Ses=;
	h=From:To:Subject:Date;
	b=xZQudFxAx/AQQi0VDGBlTSIIL5WsV+Zch+Ka9U1QobdYF86vr+hwxtRU2KknMaFMi
	 yhXzJY4w1YHaHPpE7maIw158UT5BvuWUsF6uKFa9PVTAkKX7/4LLbD9/lScWsA2j3b
	 jXAPFv+x01cz1PpVv5/1wVgik3ozQYNC1ott5ExI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 443FQtu4029708
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 May 2024 10:26:55 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 3
 May 2024 10:26:55 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 3 May 2024 10:26:55 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 443FQtUv104199;
	Fri, 3 May 2024 10:26:55 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1s2uoI-0001K6-TI; Fri, 03 May 2024 10:26:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] README: update meta-qt5 with scarthgap specific info
Date: Fri, 3 May 2024 10:26:54 -0500
Message-ID: <20240503152654.5044-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 May 2024 15:27:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15326

meta-qt5 has created the scarthgap branch.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-demos/README  | 2 +-
 meta-arago-distro/README | 2 +-
 meta-arago-extras/README | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-demos/README b/meta-arago-demos/README
index 0e8d5e55..8d40e48e 100644
--- a/meta-arago-demos/README
+++ b/meta-arago-demos/README
@@ -24,7 +24,7 @@ revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: scarthgap
 revision: HEAD
 
 Send pull requests to meta-arago@lists.yoctoproject.org
diff --git a/meta-arago-distro/README b/meta-arago-distro/README
index b4027f43..8712de4e 100644
--- a/meta-arago-distro/README
+++ b/meta-arago-distro/README
@@ -24,7 +24,7 @@ revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: scarthgap
 revision: HEAD
 
 URI: git://git.yoctoproject.org/meta-arago
diff --git a/meta-arago-extras/README b/meta-arago-extras/README
index ebf278b8..58ac7df2 100644
--- a/meta-arago-extras/README
+++ b/meta-arago-extras/README
@@ -24,7 +24,7 @@ revision: HEAD
 layers: meta-oe, meta-networking, meta-python
 
 URI: https://github.com/meta-qt5/meta-qt5
-branch: master
+branch: scarthgap
 revision: HEAD
 
 Send pull requests to meta-arago@lists.yoctoproject.org
-- 
2.17.1


