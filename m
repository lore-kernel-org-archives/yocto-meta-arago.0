Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F3B5C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:45:50 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.38830.1741790741780157711
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:45:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=nTQh0faQ;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjekt1094851
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 12 Mar 2025 09:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790741;
	bh=WvQmZflHbpGqUTmF/Ocr0bKu5fOT9xOQtEr0HXM5Io0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=nTQh0faQ+h90q2G+ndxZ4Q2/FdlwW+ejFJVU3Yj+GPu8ezK4peMacxymzs2BR1AB+
	 T9RDOj0Cld1S1cWE2q0Ay0zbTiY8vYfwAI1iMrgbydCySfJwNOftBjZnmnrxTRwfSM
	 R3gBLCuOnZYbiVcP/65nUe96QsS0ay1bFzDHv1qE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjewO021524;
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:45:40 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:45:40 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjev3074622;
	Wed, 12 Mar 2025 09:45:40 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNL2-0003oA-Cr; Wed, 12 Mar 2025 09:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 03/10] piglit: Wrap the bbappend in a compliant manner
Date: Wed, 12 Mar 2025 09:45:33 -0500
Message-ID: <20250312144540.14210-4-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312144540.14210-1-reatmon@ti.com>
References: <20250312144540.14210-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15991

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-ti-bsp with ti-soc in the
MACHINE_OVERRIDES would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../{piglit_%.bbappend => piglit-ti.inc}      |  0
 .../recipes-graphics/piglit/piglit_%.bbappend | 32 ++-----------------
 2 files changed, 3 insertions(+), 29 deletions(-)
 copy meta-arago-test/recipes-graphics/piglit/{piglit_%.bbappend => piglit-ti.inc} (100%)

diff --git a/meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend b/meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
similarity index 100%
copy from meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend
copy to meta-arago-test/recipes-graphics/piglit/piglit-ti.inc
diff --git a/meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend b/meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend
index fb533533..d93e5d48 100644
--- a/meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend
+++ b/meta-arago-test/recipes-graphics/piglit/piglit_%.bbappend
@@ -1,30 +1,4 @@
-# add a config to point piglit at the default install location for deqp tests
-# if they are selected
+PIGLIT_TI = ""
+PIGLIT_TI:ti-soc = "piglit-ti.inc"
 
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-PACKAGECONFIG[deqp-gles] = ",,,opengl-es-cts"
-PACKAGECONFIG[deqp-vk] = ",,,vulkan-cts"
-
-do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-gles', 'true', 'false', d)}; then
-        printf "%s\n" \
-            "[deqp-egl]" \
-            "bin=/usr/lib/opengl-es-cts/deqp-egl" \
-            "[deqp-gles2]" \
-            "bin=/usr/lib/opengl-es-cts/deqp-gles2" \
-            "[deqp-gles3]" \
-            "bin=/usr/lib/opengl-es-cts/deqp-gles3" \
-            "[deqp-gles31]" \
-            "bin=/usr/lib/opengl-es-cts/deqp-gles31" \
-            >> ${D}/${libdir}/piglit/piglit.conf
-    fi
-    if ${@bb.utils.contains('PACKAGECONFIG', 'deqp-vk', 'true', 'false', d)}; then
-        printf "%s\n" \
-            "[deqp-vk]" \
-            "bin=/usr/lib/vulkan-cts/deqp-vk" \
-            "[deqp-vksc]" \
-            "bin=/usr/lib/vulkan-cts/deqp-vksc" \
-            >> ${D}/${libdir}/piglit/piglit.conf
-    fi
-}
+require ${PIGLIT_TI}
-- 
2.17.1


