Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37008C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:32 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.60917.1742236647466291067
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 11:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=QFdBPSx8;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbQve2847526
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 13:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742236646;
	bh=yIfHo6E96G3DYYTcjgjYtoBmEs94aLoQ2O+KzWcP9wY=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QFdBPSx8AZvASpV3aQpHfQYFA/3isuodVCAifDXdWByGFWz++JMsJgy4hBq3ge0CW
	 q3yAg5ReOUQVJi8uCCCh/ExHLnqS81sQwC2bGx31hZ7hFI4K43idfdd7iHWzyHa8/J
	 iz4EhjpLiJDYf0Pt+JJEY5pm95gKRSI9aHF16zeU=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbQTX104586;
	Mon, 17 Mar 2025 13:37:26 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 13:37:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 13:37:25 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbQOv029159;
	Mon, 17 Mar 2025 13:37:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuFL3-0008F9-Sa; Mon, 17 Mar 2025 13:37:25 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 11/14] libredblack: move and clean up
Date: Mon, 17 Mar 2025 13:37:21 -0500
Message-ID: <20250317183724.31563-13-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250317183724.31563-1-reatmon@ti.com>
References: <20250317183724.31563-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 17 Mar 2025 18:37:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16069

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Clean unnecessary comments

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../sysrepo}/libredblack_git.bb                             | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/libredblack => recipes-extended/sysrepo}/libredblack_git.bb (62%)

diff --git a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
similarity index 62%
rename from meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
rename to meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
index 412d08d8..80283c73 100644
--- a/meta-arago-extras/recipes-sysrepo/libredblack/libredblack_git.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/libredblack_git.bb
@@ -10,12 +10,8 @@ SRCREV = "a399310d99b61eec4d3c0677573ab5dddcf9395d"
 
 S = "${WORKDIR}/git"
 
-# NOTE: if this software is not capable of being built in a separate build directory
-# from the source, you should replace autotools with autotools-brokensep in the
-# inherit line
 inherit python3native autotools
 
-# Specify any options you want to pass to the configure script using EXTRA_OECONF:
-EXTRA_OECONF = " --without-rbgen "
+EXTRA_OECONF = "--without-rbgen"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


