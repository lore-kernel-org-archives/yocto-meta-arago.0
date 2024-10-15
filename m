Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED374D1D88B
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 16:31:19 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.1386.1729009879205235726
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 15 Oct 2024 09:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rhhppkN3;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49FGVHp0086871;
	Tue, 15 Oct 2024 11:31:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729009877;
	bh=3v4RqJeRoRk+8R2fHC+W19xF/ELvHkvTIqHhnbXHvMc=;
	h=From:To:Subject:Date;
	b=rhhppkN3JSadsDEVZUrrBqKTwnXwy1ye7B3IOLXkr/73FNqzm80V88BjXBGWVUXvF
	 kllxUbzxnS4O5iIHzbguD/qGIkymQvafCy+rJ5FgygjBw1imhwEhkyH1UCVtaeYKzv
	 bElgsah5PJUpYyBJX/t24N6gb80kDwJealL8tSE0=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49FGVHNT021327;
	Tue, 15 Oct 2024 11:31:17 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 15
 Oct 2024 11:31:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 15 Oct 2024 11:31:17 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49FGVH1d106369;
	Tue, 15 Oct 2024 11:31:17 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t0kS5-0006C3-5B; Tue, 15 Oct 2024 11:31:17 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH] makedumpfile: Remove outdated recipe
Date: Tue, 15 Oct 2024 11:31:17 -0500
Message-ID: <20241015163117.23765-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 15 Oct 2024 16:31:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15574

An upstream change [1] is now requiring makedumpfile for all builds, but
this older recipe no longer builds correctly.  Remove it so that we
fallback to the newer version supported in upstream.

[1] https://git.openembedded.org/openembedded-core/commit/?id=8534e6427622ec76e100b7d10ee11d180cf5980a

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../makedumpfile/makedumpfile_1.5.0.bb         | 18 ------------------
 1 file changed, 18 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb

diff --git a/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb b/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
deleted file mode 100644
index 29e6c18d..00000000
--- a/meta-arago-extras/recipes-support/makedumpfile/makedumpfile_1.5.0.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Make dump file utility"
-LICENSE = "GPL-2.0-only"
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-
-SRC_URI = "http://sourceforge.net/projects/makedumpfile/files/makedumpfile/1.5.0/makedumpfile-${PV}.tar.gz;name=makedumpfile"
-
-SRC_URI[makedumpfile.md5sum] = "e22277d77752c71525a79eab148abf55"
-SRC_URI[makedumpfile.sha256sum] = "8a771a22c6ba79dc505e55727f0cfd357ccb3c97defe21cefd5a67b64452fca7"
-
-DEPENDS = "zlib elfutils bzip2"
-
-EXTRA_OEMAKE = "TARGET=${TARGET_ARCH}"
-
-do_install() {
-	install -d ${D}${bindir}/
-	install -c -m 755 ${S}/makedumpfile ${D}${bindir}/
-}
-- 
2.17.1


