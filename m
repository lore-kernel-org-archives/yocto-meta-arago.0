Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C87C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:40:39 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.11659.1741862432625106786
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 03:40:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bS/9MV3n;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeVQl1799193
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 05:40:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741862431;
	bh=sESLfz00SnWpe5uvcLYBLXPAx0m5ZkeONyruYDWj/xs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bS/9MV3nJvK7ZQaQzwiIuoD9IX92PWHBzKkmtWhDBAQ5SY0OdPUMFAv7pHbEWTrMc
	 vh3zKcUoG7u5od4Gbpem8ODMafkyriOUqcCIrsdxD3qQMUMAEezNqWeM5Cb8JeFt/2
	 HHXdCBtGYzO4r2oyilWMamhB2x6GezU+rWcsQFAo=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeVaH056869
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 05:40:31 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 05:40:30 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 05:40:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DAeUVd083641;
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsfzK-0003vU-Os; Thu, 13 Mar 2025 05:40:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 11/13] nw-configurator: move and clean up
Date: Thu, 13 Mar 2025 05:40:27 -0500
Message-ID: <20250313104029.14977-12-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313104029.14977-1-reatmon@ti.com>
References: <20250313104029.14977-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 10:40:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16027

From: Denys Dmytriyenko <denys@konsulko.com>

* Move into recipes-extended
* Set SUMMARY instead of DESCRIPTION
* FILES_${PN}-dev is incorrect - old syntax and is not needed
* Tabs/spaces cleanup

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../sysrepo}/nw-configurator.bb                             | 6 ++----
 .../sysrepo/nw-configurator}/nw-configurator.c              | 0
 2 files changed, 2 insertions(+), 4 deletions(-)
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator => recipes-extended/sysrepo}/nw-configurator.bb (74%)
 rename meta-arago-extras/{recipes-sysrepo/nw-configurator/files => recipes-extended/sysrepo/nw-configurator}/nw-configurator.c (100%)

diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
similarity index 74%
rename from meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
rename to meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
index b383571d..50debb36 100644
--- a/meta-arago-extras/recipes-sysrepo/nw-configurator/nw-configurator.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "Sysrepo based repo to configure EST"
+SUMMARY = "Sysrepo based repo to configure EST"
 
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://nw-configurator.c;beginline=1;endline=33;md5=3538caaf9bfb8372347877ad393660fa"
@@ -8,14 +8,12 @@ SRC_URI = "file://nw-configurator.c"
 S = "${WORKDIR}/sources"
 UNPACKDIR = "${S}"
 
-FILES_${PN}-dev = "${includedir}"
-
 DEPENDS = "sysrepo"
 
 inherit autotools pkgconfig
 
 do_compile() {
-	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${S}/nw-configurator.c -o nw-configurator -lsysrepo
+	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR} ${S}/nw-configurator.c -o nw-configurator -lsysrepo
 }
 
 BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-configurator.c b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator/nw-configurator.c
similarity index 100%
rename from meta-arago-extras/recipes-sysrepo/nw-configurator/files/nw-configurator.c
rename to meta-arago-extras/recipes-extended/sysrepo/nw-configurator/nw-configurator.c
-- 
2.17.1


