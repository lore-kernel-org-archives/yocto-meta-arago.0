Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586B1C36002
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 18:37:32 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.60684.1742236646622940061
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 17 Mar 2025 11:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=dpPJeHIG;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52HIbPID2847514
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 17 Mar 2025 13:37:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742236645;
	bh=xTCEBVMN5I7Gh9RDI2UCvUw0uUUifVNWHT1Jfv3bgcw=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=dpPJeHIGfcNFAYHoWELFvHi2me/Y/KystOjxahKADXZYHjVc2lSc4hyu1AO9gVoGE
	 o3d6y/+nccgHUinHX3wlVYcNLIqnvyvbTDe1Aq1bbNT7pl7lKT8T5w+GUvMCdd7jRE
	 pLxeeF1FDUxMKMdG+Au7PI66NOKukKXdz17Egl6c=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbPUY104573;
	Mon, 17 Mar 2025 13:37:25 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Mar 2025 13:37:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Mar 2025 13:37:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52HIbO4A000459;
	Mon, 17 Mar 2025 13:37:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tuFL2-0008EG-QQ; Mon, 17 Mar 2025 13:37:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH 02/14] libyang: Remove recipe in favor of newer upstream version
Date: Mon, 17 Mar 2025 13:37:12 -0500
Message-ID: <20250317183724.31563-4-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16062

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


