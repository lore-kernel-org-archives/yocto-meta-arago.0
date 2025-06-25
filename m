Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4B60C77B7C
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 18:06:21 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.22863.1750874772985179266
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 25 Jun 2025 11:06:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=J4TZrRy9;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55PI6Cjc2182640;
	Wed, 25 Jun 2025 13:06:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750874772;
	bh=H950gAWSFlWWX/GOcJxfzUz70w3dv0drZwA3UEa1Hfk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=J4TZrRy9kBhrX8Q3+DpBM3w+PDryuRrW7LtZicZ1Mg1I20C67WGz0qBiD4k6SP/Ft
	 GpeeizfNyC1Uw+HdDkQwsCBFnTG7daQY3NXzIK5v0S2xmgBoSglxKSthhT39DVxKwS
	 soX4asRZsltegP/pqpQe5hsJNZhmFxiYzqJithDg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55PI6BB61224508
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 25 Jun 2025 13:06:11 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 25
 Jun 2025 13:06:11 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 25 Jun 2025 13:06:11 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55PI6BZK3810819;
	Wed, 25 Jun 2025 13:06:11 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uUUVf-0004bQ-Ew; Wed, 25 Jun 2025 13:06:11 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 4/5] meta-argo/all: Remove S where not needed
Date: Wed, 25 Jun 2025 13:06:09 -0500
Message-ID: <20250625180610.17641-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250625180610.17641-1-reatmon@ti.com>
References: <20250625180610.17641-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 25 Jun 2025 18:06:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16267

The default setting for S works fine, there is no nead to change the
value.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb          | 2 --
 meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb | 1 -
 2 files changed, 3 deletions(-)

diff --git a/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
index 5642dbd2..f073894f 100644
--- a/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
+++ b/meta-arago-test/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -15,8 +15,6 @@ SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/${BP}.tar.gz \
 SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
 SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
 
-S = "${WORKDIR}/${BP}"
-
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
diff --git a/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb b/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
index 842332df..6a3c64d1 100644
--- a/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
+++ b/meta-arago-test/recipes-connectivity/openntpd/openntpd_6.8p1.bb
@@ -11,7 +11,6 @@ SRC_URI = "https://cdn.openbsd.org/pub/OpenBSD/OpenNTPD/${P}.tar.gz"
 SRC_URI[md5sum] = "7c68ce2627b2ea13f2b95db1ef4fcfc5"
 SRC_URI[sha256sum] = "8582db838a399153d4a17f2a76518b638cc3020f58028575bf54127518f55a46"
 
-S = "${WORKDIR}/openntpd-${PV}"
 inherit autotools
 
 LDFLAGS += "-lrt"
-- 
2.17.1


