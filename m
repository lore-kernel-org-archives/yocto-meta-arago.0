Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83F96C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 21:27:40 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.6850.1742419650592117176
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 19 Mar 2025 14:27:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=D9qVdsjb;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52JLRUwN3030098
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:27:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742419650;
	bh=XKVRi00yutY5i2oYY+QQGMJmYLC5gXEKBfyTm87orH8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=D9qVdsjbYXfMaMkpfuNsTvdTdDSe9kSrwVUpNrWVNLRcW4eQdPbKwdE0btDE+pewZ
	 N4j0JTnvsXXmdlygI0Xr1mlYEthK90s0BZSPSIpbIhmolFtNvn/jfANUmwIh/xGWif
	 m7yX6fORGzHzq5Mrg1bGZkyBqSkFClsYR4BqJ7QM=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLRU8v094204
	for <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 16:27:30 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 19
 Mar 2025 16:27:29 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 19 Mar 2025 16:27:29 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52JLRT1x026491;
	Wed, 19 Mar 2025 16:27:29 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-ti][scarthgap/master][PATCH v6 3/3] recipes-graphics: port gc320 libs to work on kernel 6.12
Date: Wed, 19 Mar 2025 16:27:29 -0500
Message-ID: <20250319212729.336516-4-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250319212729.336516-1-a-christidis@ti.com>
References: <20250319212729.336516-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 19 Mar 2025 21:27:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16099

From: Antonios Christidis <a-christidis@ti.com>

The user mode libraries needed recompiling with the scarthgap revision of gcc to
remove all the warnings about 32bit API usage during the linking stage, new
SRCREV includes this changes. Versions of the libraries remain the same.

Signed-off-by: Antonios Christidis <a-christidis@ti>
---
v6:
 - Instead of"append" on the FILES variable, use "+=", also
   specifically state which file in the ${libdir} we want to include
   in the ${PN} package. Makes it easier to read and understand why
   appending to the default FILES rules for a ${PN} is necessary, the reason
   being it's a symb link which would not typically be included.

v5:
 - Move the symb link of libGAL.so within the ${PN} package. While making
   sure the header files are part of the ${PN}-dev package.
  
 v3:
 - Removed commented lines and extra lib directory that was being created
   in do_install()
 
 v2:
 - No longer include withing the PN package /usr/include file and symb
   link to library file. This is done by not chaning the FILES/PACKAGES
   variables, thus creating a -dev package.

 .../recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb    | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
index 807f421c..fc70e1ed 100644
--- a/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
+++ b/meta-ti-bsp/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
@@ -14,7 +14,7 @@ CLEANBROKEN = "1"
 BRANCH = "ti-${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-gc320-libs.git;protocol=https;branch=${BRANCH}"
-SRCREV = "c0afab259de59909cfe74c01f3f7fbaa147f94b5"
+SRCREV = "85c175e8425c33dda6e272aeb45afe0f69a79096"
 
 RRECOMMENDS:${PN} = "ti-gc320-driver"
 
@@ -43,4 +43,8 @@ do_install() {
     chown -R root:root ${D}
 }
 
-INSANE_SKIP:${PN} += "ldflags"
+PACKAGES = "${PN} ${PN}-dev"
+FILES:${PN} += "${libdir}/libGAL.so"
+FILES:${PN}-dev = "/usr/include"
+
+INSANE_SKIP:${PN} += "ldflags already-stripped dev-so"
-- 
2.34.1


