Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88741C3ABB0
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 15:33:18 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.53622.1746459191128575732
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 05 May 2025 08:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=DIE7vN4M;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 545FXAIR803629
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 May 2025 10:33:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746459190;
	bh=lsJ2YrCaY6pcGaCtLYyELi9UT0tyrlJpVcDSgVmefTs=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DIE7vN4MBJXnuBy59bhJUer+dqfWDbhReOGqSvv3ko+nJDhUJHxfrWQs2PCiwCGiT
	 Uc0uV9RqODPzTaIFQ8b2QL1QvHEA3pudgntZC66cttbeuZ7CNytHuZvTy4akaz+MU5
	 zsG+5QQDHRUGQpVDJI8T59Wwukiq/smYamJD7gpg=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 545FXAXF041440
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 5 May 2025 10:33:10 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 5
 May 2025 10:33:10 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 5 May 2025 10:33:09 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 545FX969026218;
	Mon, 5 May 2025 10:33:09 -0500
From: <a-christidis@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>
Subject: [meta-arago][scarthgap][PATCH v1 1/3] meta-arago-test: recipes-extended: Remove opencl c headers bbappend
Date: Mon, 5 May 2025 10:33:07 -0500
Message-ID: <20250505153309.1739313-2-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250505153309.1739313-1-a-christidis@ti.com>
References: <20250505153309.1739313-1-a-christidis@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 05 May 2025 15:33:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16176

From: Antonios Christidis <a-christidis@ti.com>

Remove the opencl c headers bbappend and respective inc file.

The meta-oe recipe (that the bbapend file is building off of ) is not
utilizing the cmake build system of the repo, only copying the header
files to the filesystem. The build system is needed as it generates
config.cmake files which are required by the c++ headers cmake build
system.

Instead of editing the opencl_headers-ti.inc file to override all of the
behavior of the meta-oe recipe, delete the .bbappend and .inc files and
introduce new opencl-headers recipe within meta-arago (this will be done
in later commits).

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-extended/opencl/opencl-headers_%.bbappend         | 4 ----
 meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc | 1 -
 2 files changed, 5 deletions(-)
 delete mode 100644 meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
 delete mode 100644 meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc

diff --git a/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend b/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
deleted file mode 100644
index c890ecb7..00000000
--- a/meta-arago-test/recipes-extended/opencl/opencl-headers_%.bbappend
+++ /dev/null
@@ -1,4 +0,0 @@
-OPENCL_HEADERS_TI = ""
-OPENCL_HEADERS_TI:ti-soc = "opencl_headers-ti.inc"
-
-require ${OPENCL_HEADERS_TI}
diff --git a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc b/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
deleted file mode 100644
index 4dff02d9..00000000
--- a/meta-arago-test/recipes-extended/opencl/opencl_headers-ti.inc
+++ /dev/null
@@ -1 +0,0 @@
-SRCREV = "8275634cf9ec31b6484c2e6be756237cb583999d"
-- 
2.34.1


