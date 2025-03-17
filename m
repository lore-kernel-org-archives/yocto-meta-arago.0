Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D466C35FF8
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:32 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.60918.1742236647469203733
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 11:37:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xuoEC2ud;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbQbZ2373302
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Mar 2025 13:37:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742236646;
	bh=s/80BH9yzerSCqSnI1zqE2uDkaXFpDfOVrqt4tg4nVE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=xuoEC2udBjazQGI+jUg7oPOFmwLkePK/fIkdjL2gkJ5Los3ZBtVv22JlTF8cay8W4
	 rjjEll4DTH1H/ZbjTi1COYRmiH8M4LXQCu30aN3224IdvBWExMk5jMt8qLABkXyKIJ
	 rJzAPcPlex+1AnGccszWqrXyDylcob0k+6Qgv1kk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbQ1S076460
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Mar 2025 13:37:26 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 13:37:25 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 13:37:26 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbQ1m029162;
	Mon, 17 Mar 2025 13:37:26 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuFL4-0008FF-0E; Mon, 17 Mar 2025 13:37:26 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 12/14] nw-configurator: move and clean up
Date: Mon, 17 Mar 2025 13:37:22 -0500
Message-ID: <20250317183724.31563-14-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16071

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Set SUMMARY instead of DESCRIPTION
* FILES_${PN}-dev is incorrect - old syntax and is not needed
* Tabs/spaces cleanup

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../sysrepo}/nw-configurator.bb                               | 4 +---
 .../sysrepo/nw-configurator}/nw-configurator.c                | 0
 2 files changed, 1 insertion(+), 3 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator => recipes-extended/sysrepo}/nw-configurator.bb (84%)
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator/files => recipes-extended/sysrepo/nw-configurator}/nw-configurator.c (100%)

diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
similarity index 84%
rename from meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
rename to meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
index c5d9a86b..7769334a 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Sysrepo based repo to configure EST"
+SUMMARY = "Sysrepo based repo to configure EST"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://nw-configurator.c;beginline=1;endline=33;md5=3538caaf9bfb8372347877ad393660fa"
@@ -7,8 +7,6 @@ SRC_URI = "file://nw-configurator.c"
 
 S = "${WORKDIR}"
 
-FILES_${PN}-dev = "${includedir}"
-
 DEPENDS = "sysrepo"
 
 inherit autotools pkgconfig
diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-configurator.c b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator/nw-configurator.c
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-configurator.c
rename to meta-arago-extras/recipes-extended/sysrepo/nw-configurator/nw-configurator.c
-- 
2.17.1


