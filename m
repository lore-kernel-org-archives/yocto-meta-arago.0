Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8705C35FF1
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 15:08:30 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.39441.1741792106299889112
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 08:08:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sphEwUS6;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8OPk1615068
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 10:08:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741792104;
	bh=8lQISMAVU2efOew8UVoFIOyqNY2OiHCMijja4kMVVlI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=sphEwUS6OPAI2BMsp8yXoL0kZarx+U774tkhoyno+YL9xPsfqVTNejIQIIb+P/VDu
	 efhNCZrx8MwUh/4k7uLIIO2Rs/KAzzm1RXsnMtHRPREbMGUuI1CrwJGS7dWoiSirDz
	 E+yNvC6shZwk05cBJLHXpSUEbZE0OQ1LnbI+hSO8=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CF8OqW110244
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 10:08:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 10:08:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CF8OVc034654;
	Wed, 12 Mar 2025 10:08:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNh2-0001iz-5V; Wed, 12 Mar 2025 10:08:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 1/6] statcol: Add COMPATIBLE_MACHINE
Date: Wed, 12 Mar 2025 10:08:19 -0500
Message-ID: <20250312150824.6579-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312150824.6579-1-reatmon@ti.com>
References: <20250312150824.6579-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 15:08:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16006

The ti-rpmsg-char recipe has a COMPATIBLE_MACHINE setting that limits
it to just k3 devices.  Since this package depends on it, we need the
same setting.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-devtools/statcol/statcol.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index 223989ef..24ee3772 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -10,6 +10,7 @@ SRCREV = "279bf455bc3dec69f374d46a8225687935f4323a"
 SRC_URI = "git://git.ti.com/git/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 DEPENDS = "ti-rpmsg-char websocketd"
+
 RDEPENDS:${PN} = "bash"
 
 S = "${WORKDIR}/git"
@@ -21,3 +22,5 @@ do_install() {
 }
 
 INSANE_SKIP:${PN} = "ldflags"
+
+COMPATIBLE_MACHINE = "^(k3)$"
-- 
2.17.1


