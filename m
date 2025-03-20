Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA50C3600D
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 18:10:53 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.1885.1742494251186705877
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 11:10:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=qxZFFvwC;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAoMX075290
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 13:10:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742494250;
	bh=HrblENm/KttJrPg//EqPTqh0woVf04Cqawa1nDGu5dI=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=qxZFFvwCMZwWrnZUD/eufAHz2iK9ZG0iVoDFAGXHdfdya5Gcxf3CBeFuNMx6CDg6o
	 8LnKihqaY22CKswotdAj96aIFKM8qNGZ3yWIqO0JthccYZI9Hm7bW5Ygj9IjzEKKJ7
	 G5m1tXog8JkMQ5BbI6grdmjEY+RnNFLPvA9+ZAZY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52KIAosB020277
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 20 Mar 2025 13:10:50 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 20
 Mar 2025 13:10:49 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 20 Mar 2025 13:10:49 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52KIAnYB126247;
	Thu, 20 Mar 2025 13:10:49 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tvKLx-0001On-On; Thu, 20 Mar 2025 13:10:49 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 22/26] cifs-utils: Wrap the bbappend in a compliant manner
Date: Thu, 20 Mar 2025 13:10:43 -0500
Message-ID: <20250320181047.18035-23-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250320181047.18035-1-reatmon@ti.com>
References: <20250320181047.18035-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 20 Mar 2025 18:10:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16124

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../cifs/{cifs-utils_7.0.bbappend => cifs-utils-arago.inc}  | 2 +-
 .../recipes-support/cifs/cifs-utils_7.0.bbappend            | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)
 copy meta-arago-distro/recipes-support/cifs/{cifs-utils_7.0.bbappend => cifs-utils-arago.inc} (62%)

diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend b/meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
similarity index 62%
copy from meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
copy to meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
index c145cf63..87b49cc6 100644
--- a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
+++ b/meta-arago-distro/recipes-support/cifs/cifs-utils-arago.inc
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS:prepend := "${THISDIR}/cifs-utils:"
 
 SRC_URI += "file://0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch"
 
diff --git a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend b/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
index c145cf63..4c9ce8db 100644
--- a/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
+++ b/meta-arago-distro/recipes-support/cifs/cifs-utils_7.0.bbappend
@@ -1,4 +1,4 @@
-FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://0001-cifs-utils-Make-automake-treat-sbin-as-exec-not-data.patch"
+CIFS_UTILS_ARAGO = ""
+CIFS_UTILS_ARAGO:arago = "cifs-utils-arago.inc"
 
+require ${CIFS_UTILS_ARAGO}
-- 
2.17.1


