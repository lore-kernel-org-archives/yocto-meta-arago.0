Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C27FCEE4992
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 21:23:54 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.1825.1692393831809595981
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Aug 2023 14:23:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EbKYT3U6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37ILNocQ024941;
	Fri, 18 Aug 2023 16:23:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1692393830;
	bh=titrrF0OQ+mNBgRBXO/HaJ35UF08na4IDgaRmp3WgzM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EbKYT3U67AlrEWU8TgBN6bDtVUAdDoM/mzR6JOOOwCucaJSKh9lzSZq1ot4dQifFk
	 P8+XCpmvr482EU0/P24xXPsd9Ol3UMjcRdniJfY3r5d3abT9GWu1bxhwmlmanGcG0l
	 tYR4wiQ9dpyiZdhJQfi9vcJN6WrOVJJxBUGUMEc0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37ILNote061066
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Aug 2023 16:23:50 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 18
 Aug 2023 16:23:50 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 18 Aug 2023 16:23:50 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37ILNnKL057297;
	Fri, 18 Aug 2023 16:23:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qX6wf-0000Hy-SU; Fri, 18 Aug 2023 16:23:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] ti-test: Move to meta-arago-extras
Date: Fri, 18 Aug 2023 16:23:49 -0500
Message-ID: <20230818212349.1060-3-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230818212349.1060-1-reatmon@ti.com>
References: <20230818212349.1060-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Aug 2023 21:23:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14858

To support our upstream testing we will be making some changes related
to the ti-test package group.  The upstream testing flow builds against
poky and not arago, so we want to migrate all of the testing tools into
meta-ti.  The first step is just allowing meta-arago-extras to be loaded
with poky.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/ti-test.bb                         | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-arago-distro => meta-arago-extras}/recipes-core/packagegroups/ti-test.bb (100%)

diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-extras/recipes-core/packagegroups/ti-test.bb
similarity index 100%
rename from meta-arago-distro/recipes-core/packagegroups/ti-test.bb
rename to meta-arago-extras/recipes-core/packagegroups/ti-test.bb
-- 
2.17.1


