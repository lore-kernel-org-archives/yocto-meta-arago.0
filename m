Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04909C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 22:04:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.68168.1675721079630061055
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 06 Feb 2023 14:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=IAWRceob;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 316M4bsm068568;
	Mon, 6 Feb 2023 16:04:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675721077;
	bh=V4be1oQ0nnXq3vjnOPgkithpB4ys4Z/RqHg8Whmeyv4=;
	h=From:To:Subject:Date;
	b=IAWRceobeL3+dN0DDPmQKIFXOeBThCit+sDgVXLYF13Js5otIEdlht6CaDvvA4lTA
	 aknqQRVegyBBT9BetZ4KOVD17BK0nbeBMTMrjr6qr9TXaMIPEZ527dvtctaEV3qQh5
	 D8ccnnFAdo+Z5P55FfFi+OaLtwSZwSHMduZKa2Ts=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 316M4bYN028880
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Feb 2023 16:04:37 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 6
 Feb 2023 16:04:37 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 6 Feb 2023 16:04:37 -0600
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 316M4blq055101;
	Mon, 6 Feb 2023 16:04:37 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pP9bJ-0000Fo-9p; Mon, 06 Feb 2023 16:04:37 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] stream: Enable stream benchmark again
Date: Mon, 6 Feb 2023 16:04:37 -0600
Message-ID: <20230206220437.936-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 06 Feb 2023 22:04:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14202

We have worked through the hosting issues and found a new home for the stream
benchmark.  Fix the SRC_URI and add the package back into the packagegroups.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb            | 1 +
 meta-arago-distro/recipes-core/packagegroups/ti-test.bb         | 1 +
 meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb       | 2 +-
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index cb972078..a00d0ad5 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -45,6 +45,7 @@ UTILS:append:ti43x = " mmc-utils \
 UTILS:append:omap-a15 = " mmc-utils \
                           switch-config \
                           libdrm-omap \
+                          stream-openmp \
                           pru-icss \
                           ti-ipc-rtos-fw \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
index ca4e254e..da52d47a 100644
--- a/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/ti-test.bb
@@ -37,6 +37,7 @@ ARAGO_TEST = "\
     linuxptp \
     openntpd \
     nbench-byte \
+    stream \
 "
 
 ARAGO_TEST:append:armv7a = " \
diff --git a/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb b/meta-arago-extras/recipes-benchmark/stream/stream_5.10.bb
index 73b791e4..cdde9b20 100644
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


