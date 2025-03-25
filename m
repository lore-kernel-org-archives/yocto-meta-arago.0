Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23013C3600D
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 15:37:23 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.68960.1742917036536042539
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 08:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=HaYIKccN;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFbF421880904
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Mar 2025 10:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742917035;
	bh=2ltVV42C5J1UAasKSvPye9P0EHZZAJAHCSdfPhWXAa4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HaYIKccNQxt2l/gIJB28XV8YREC5CbPKNc1DRfJStBPSv8iply7w394p7qCMhAotT
	 0Yh88VGKNL3AHvNgp1lpPOKCXCGq3P9GJLDEu5S58Ww8S5ozgawspU4ByK5TP14088
	 5XST3q4vgmLMyIghxSbMMsM2X29V3nwETyeqd9nQ=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFbFCh005060
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Mar 2025 10:37:15 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Mar 2025 10:37:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Mar 2025 10:37:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PFbEcp034474;
	Tue, 25 Mar 2025 10:37:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tx6L4-000687-HT; Tue, 25 Mar 2025 10:37:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v2 2/3] packagegroup-arago-gst: Wrap various packages in a compliant manner
Date: Tue, 25 Mar 2025 10:37:13 -0500
Message-ID: <20250325153714.23520-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250325153714.23520-1-reatmon@ti.com>
References: <20250325153714.23520-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 25 Mar 2025 15:37:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16155

yocto-check-layer does not load the conf/distro/arago.conf file during
its execution.  This means that the LICENSE_FLAGS_ACCEPTED variable is not
set according to what we are willing to accept.

If a packagegroup is trying to include a recipe that is marked as being
"commercial" and the LICENSE_FLAGS_ACCEPTED is not set, then yocto-check-layer
fails.

The solution is to wrap the inclusion of these recipes in the packagegroup
in a complaint manner.  Only if the DISTRO_OVERRIDE says that this is an
"arago" build, should the package be included and this under the direction
of the LICENSE_FLAGS_ACCEPTED variable.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v2: Swtich from += to append assignment,

 .../recipes-core/packagegroups/packagegroup-arago-gst.bb       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index 0aee4773..d987ba80 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -14,9 +14,10 @@ GSTREAMER_DEPS = " \
     gstreamer1.0-plugins-base-meta \
     gstreamer1.0-plugins-good-meta \
     gstreamer1.0-plugins-bad-meta \
-    gstreamer1.0-libav \
 "
 
+GSTREAMER_DEPS:append:arago = " gstreamer1.0-libav"
+
 #    gstreamer1.0-plugins-hevc 
 GSTREAMER_DEPS:append:dra7xx = " \
 "
-- 
2.17.1


