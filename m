Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 809EFC76195
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 13:50:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.73145.1679579428934740252
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Mar 2023 06:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bZkjVWv3;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32NDoRVc094064;
	Thu, 23 Mar 2023 08:50:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1679579427;
	bh=g4rrbcM54QGKOUk2OH1zMi2wuosfjq4s6ycEIFX3dYk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=bZkjVWv3m/i8/rne/3ekfY5N8yiiRvOSRaPovG1fzkj6P1/N0cLqloat4dH2AsIcw
	 1nCbeFtFpk1+5JLvlMcYWAQyGnPnAKPwtqmGNg40fcSObot2QOFUqKYenLMjtvpyGG
	 rhOrgr3OxdSY7soUvBB1AYHXYnhhuqslB9OUraDw=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32NDoRAm040185
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Mar 2023 08:50:27 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 23
 Mar 2023 08:50:27 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 23 Mar 2023 08:50:26 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 32NDoRNu022007;
	Thu, 23 Mar 2023 08:50:27 -0500
From: Nishanth Menon <nm@ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Denys Dmytriyenko <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, Randolph Sapp <rs@ti.com>,
        Nishanth
 Menon <nm@ti.com>
Subject: [oe-layersetup][master][PATCH V2 1/2] sample-files: gitconfig.sample: Stop using git:// urls
Date: Thu, 23 Mar 2023 08:50:25 -0500
Message-ID: <20230323135026.1842186-2-nm@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230323135026.1842186-1-nm@ti.com>
References: <20230323135026.1842186-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Mar 2023 13:50:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14277

We did this in meta-ti and meta-arago but didn't propagate back into
oe-layersetup yet so I'll give it a go. git:// is no longer functional
proxies over on latest git versions (example: poky crops container for
ubuntu 22.04[1]), also git:// is highly susceptible to man-in-the-middle
attacks[2]. Dump git:// in favor of https.

[1] https://hub.docker.com/r/crops/poky/tags 22.04
[2] https://github.blog/2021-09-01-improving-git-protocol-security-github/

Signed-off-by: Nishanth Menon <nm@ti.com>
---
New patch in the series.

 sample-files/gitconfig.sample | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/sample-files/gitconfig.sample b/sample-files/gitconfig.sample
index 2d06bdcd80b9..14533650a781 100644
--- a/sample-files/gitconfig.sample
+++ b/sample-files/gitconfig.sample
@@ -3,14 +3,17 @@
 # See https://git-scm.com/docs/git-config for further information
 # To debug, use GIT_CURL_VERBOSE=1 GIT_TRACE=1
 
-[url "git://git.yoctoproject.org/meta-arago"]
+[url "https://git.yoctoproject.org/meta-arago"]
 	insteadOf = git://arago-project.org/git/meta-arago
 	insteadOf = http://arago-project.org/git/meta-arago
+	insteadOf = git://git.yoctoproject.org/meta-arago
 
-[url "git://git.yoctoproject.org/meta-ti"]
+[url "https://git.yoctoproject.org/meta-ti"]
 	insteadOf = git://arago-project.org/git/meta-ti
 	insteadOf = http://arago-project.org/git/meta-ti
+	insteadOf = git://git.yoctoproject.org/meta-ti
 
-[url "git://git.ti.com/arago-project/oe-layersetup"]
+[url "https://git.ti.com/arago-project/oe-layersetup"]
 	insteadOf = git://arago-project.org/git/projects/oe-layersetup
 	insteadOf = http://arago-project.org/git/projects/oe-layersetup
+	insteadOf = git://git.ti.com/arago-project/oe-layersetup
-- 
2.40.0


