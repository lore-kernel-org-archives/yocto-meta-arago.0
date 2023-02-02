Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0827C05027
	for <webhook@archiver.kernel.org>; Thu,  2 Feb 2023 15:49:46 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.17864.1675352985198382565
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 02 Feb 2023 07:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FtkhHLOa;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 312Fng1C112305;
	Thu, 2 Feb 2023 09:49:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675352983;
	bh=yDLp1b98GGsdLiQ5dgDrQiUzjBtpSw2CsdFxU+X/li4=;
	h=From:To:Subject:Date;
	b=FtkhHLOaX8lyb9lXqZTodWhRYbwgT+/doEICiKIhkqYZ9GPKh8r+qSgLmfpOW7y0p
	 BkqZlhWkjbAAAj6HF4ODHmdc23tGasVyvcUp314we08eJAHCxCKH/SrN8n6CUDlUpH
	 vpx7WfK5qcri8BmfQ9pirX2efrZymOFKpynE1pr0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 312Fngob029106
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 2 Feb 2023 09:49:42 -0600
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 2
 Feb 2023 09:49:42 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Thu, 2 Feb 2023 09:49:42 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 312FngQ8114810;
	Thu, 2 Feb 2023 09:49:42 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pNbqI-0007la-Cc; Thu, 02 Feb 2023 09:49:42 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone/dunfell][PATCH] stream: Enable stream benchmark again
Date: Thu, 2 Feb 2023 09:49:42 -0600
Message-ID: <20230202154942.29815-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 02 Feb 2023 15:49:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14198

We have worked through the hosting issues and found a new home for the stream
benchmark.  Fix the SRC_URI and add the package back into the packagegroups.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 1 +
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb         | 1 +
 meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb       | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 073740a2..23fae8e0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -49,6 +49,7 @@ UTILS_append_ti43x = " mmc-utils \
 UTILS_append_omap-a15 = " mmc-utils \
                           switch-config \
                           libdrm-omap \
+                          stream-openmp \
                           pru-icss \
                           ti-ipc-rtos-fw \
                           uio-test-pruss \
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index 5c33f5aa..53a8cd47 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -37,6 +37,7 @@ ARAGO_TEST = "\
     linuxptp \
     openntpd \
     nbench-byte \
+    stream \
 "
 
 ARAGO_TEST_append_armv7a = " \
diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
index fef8eb8f..d14fc884 100644
--- a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
+++ b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
@@ -9,7 +9,7 @@ PR = "r0"
 BRANCH ?= "master"
 SRCREV = "b66f2bab5d6d0b35732ef8406ae03873725a3306"
 
-SRC_URI = "git://git.ti.com/git/sitara-linux/stream.git;protocol=https;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/git/arago-project-org/stream.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1


