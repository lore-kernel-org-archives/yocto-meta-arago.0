Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D1DBC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 05:24:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.14143.1713158649154911204
 for <meta-arago@lists.yoctoproject.org>;
 Sun, 14 Apr 2024 22:24:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ph/zPDZ7;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43F5O4e6108510;
	Mon, 15 Apr 2024 00:24:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713158644;
	bh=IAHoVkNyyoyrp6WLFQG7tdzFBVn21GSfpmW4F+aPXoU=;
	h=From:To:CC:Subject:Date;
	b=ph/zPDZ75eq9N92ZWsEYRjkii1eYYG0Ji80mzWTwnzucBbhSoZvcrDiku5GwpK4aO
	 LIBp2iWaA4hCjfkK2IGSx56aITP1jbmKCCEqQDQrSqXd5JxZPVrwoxuVdmq6HEBfkj
	 wi1haRzJWRwcz+c6L3Y3AhYYpGQGK+vrgjGWNfEQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43F5O4M5119784
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 15 Apr 2024 00:24:04 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 15
 Apr 2024 00:24:04 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 15 Apr 2024 00:24:04 -0500
Received: from localhost (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43F5O3HP012896;
	Mon, 15 Apr 2024 00:24:03 -0500
From: Chirag Shilwant <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Gyan Gupta <g-gupta@ti.com>
Subject: [meta-arago][master/scarthgap][PATCH] recipes-containers: docker: Remove redundant bbappend
Date: Mon, 15 Apr 2024 10:53:56 +0530
Message-ID: <20240415052356.3348993-1-c-shilwant@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 15 Apr 2024 05:24:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15280

The changes in this bbappend has been fixed upstream [1].
Hence, remove this bbappend.

[1]: https://git.yoctoproject.org/meta-virtualization/plain/recipes-containers/docker/docker.inc?h=scarthgap

Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
---
 .../recipes-containers/docker/docker%.bbappend            | 8 --------
 1 file changed, 8 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-containers/docker/docker%.bbappend

diff --git a/meta-arago-distro/recipes-containers/docker/docker%.bbappend b/meta-arago-distro/recipes-containers/docker/docker%.bbappend
deleted file mode 100644
index 1d3c37ba..00000000
--- a/meta-arago-distro/recipes-containers/docker/docker%.bbappend
+++ /dev/null
@@ -1,8 +0,0 @@
-PR:append = ".arago0"
-
-do_install:append() {
-	if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; then
-		install -d ${D}${sysconfdir}/init.d
-		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
-	fi
-}
-- 
2.34.1


