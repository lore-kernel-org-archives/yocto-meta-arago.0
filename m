Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22986C35FF5
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:40:40 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.11390.1741862431820916310
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 03:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DpI0gBF8;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeUo71799187
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 05:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741862430;
	bh=xTCEBVMN5I7Gh9RDI2UCvUw0uUUifVNWHT1Jfv3bgcw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DpI0gBF8aZEnc3LwA8dBuPhSnAeBde/QEFEl4gpti9/ZOpSdmxjBWgLMfDQFlZAr7
	 uaB5eGaNXRQi5G9/3LWAWLniayb03Rswnt7suAmD9+pyTxmRuJsRsRKCH9+u5Rad/y
	 urWHY6u+oo1njIv6I7/2XuDkHdFR04HJZjeh6Pf0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeUvZ023151
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 05:40:30 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 05:40:30 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DAeTrJ015583;
	Thu, 13 Mar 2025 05:40:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsfzJ-0003uY-Oz; Thu, 13 Mar 2025 05:40:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 02/13] libyang: Remove recipe in favor of newer upstream version
Date: Thu, 13 Mar 2025 05:40:18 -0500
Message-ID: <20250313104029.14977-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313104029.14977-1-reatmon@ti.com>
References: <20250313104029.14977-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 10:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16023

meta-openembedded has a newer version, so we no longer need to carry
this in meta-arago-extras.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-sysrepo/libyang/libyang_git.bb    | 23 -------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb

diff --git a/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb b/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
deleted file mode 100644
index ef5fed40..00000000
--- a/meta-arago-extras/recipes-sysrepo/libyang/libyang_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "YANG data modelling language parser and toolkit"
-DESCRIPTION = "libyang is YANG data modelling language parser and toolkit written (and providing API) in C. The library is used e.g. in libnetconf2, Netopeer2 or sysrepo projects."
-SECTION = "libs"
-LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=f3916d7d8d42a6508d0ea418cfff10ad"
-
-SRC_URI = "git://github.com/CESNET/libyang.git;protocol=https;branch=devel"
-
-PV = "2.1.77+git"
-SRCREV = "a804113c9bbac3e36c53221be469c1ca5af5b435"
-
-S = "${WORKDIR}/git"
-
-DEPENDS = "libpcre2"
-
-FILES:${PN} += "${datadir}/yang/modules/libyang/*"
-
-inherit cmake pkgconfig
-
-# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
-EXTRA_OECMAKE = " -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_BUILD_TYPE:String=Release "
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.17.1


