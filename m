Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DB3C3525B
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:37:44 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10591.1647614261665555217
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:37:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vZ4q1EiL;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbx9110651;
	Fri, 18 Mar 2022 09:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647614257;
	bh=Do6HpBOQs/YaK6CivSgb5X3KlmImY21kMLX6CCPxCL0=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vZ4q1EiLJo7cyxatOE9LOFuwFZBGwKVjBEG1P5hEHMEtaz/gGknTSzbAJ061GUe3V
	 miw3XfCwthPQDF2TT4fhj7TGh04vOv3sczFrWrPZEr96MY5uds+Bnum8P2TBozSxs0
	 bCCh85bVsfG+x9FmiuLx3RezVqC4PZETaOSU0Jrk=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEbbKs013336
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 09:37:37 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:37:37 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:37:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbwR072424;
	Fri, 18 Mar 2022 09:37:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2 03/12] tisdk-tiny-image: Add some usability
 notes
Date: Fri, 18 Mar 2022 09:37:26 -0500
Message-ID: <20220318143735.17642-4-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318143735.17642-1-nm@ti.com>
References: <20220318143735.17642-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:37:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13649

Lets clarify the usage of tiny image as something meant as a building
block and not something that folks can directly use.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v1:
* Review comments incorporated

V1: https://lore.kernel.org/all/20220309021316.28370-3-nm@ti.com/
 .../recipes-core/images/tisdk-tiny-image.bb              | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
index 85ae3728e86e..352cc2d1aa44 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-tiny-image.bb
@@ -1,3 +1,12 @@
+# Arago TI SDK super minimal base image for initramfs
+#
+# Image meant for basic boot of linux kernel. Intended as
+# bare system, this image does not package the kernel in the
+# standard /boot folder in rootfs. Instead, it provides a base
+# rootfs allowing kernel to be deployed elsewhere
+# (tftp/separate boot partition/jtag log etc..) and boot
+# the image.
+
 ARAGO_TINY_IMAGE_EXTRA_INSTALL ?= ""
 
 require arago-tiny-image.inc
-- 
2.31.1


