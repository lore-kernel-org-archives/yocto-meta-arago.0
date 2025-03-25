Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21040C3600C
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 15:37:23 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.68958.1742917036154352114
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 25 Mar 2025 08:37:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S1Bm0AHf;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFbFi01840440
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Mar 2025 10:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742917035;
	bh=fOhvcuZJUdhGUPFRWdvOTBIN7lj/CRIgI94cD0Hj1HU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=S1Bm0AHfZvGZ10uA47Y9y4PX0f1Bd9i3TE+c6VV867oUR/JREq7r1C716SUDCO7oU
	 dRWgrW2PpLO49+mx04+gSbqkwWid7Y2VY+KnQglojP49tiqT1VDy5uEp48I7W6TfMB
	 L0vTxorGklt65pxioTPNYGGP3Nj/3OixyUGORWPI=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFbFbh118551
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 25 Mar 2025 10:37:15 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Mar 2025 10:37:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Mar 2025 10:37:14 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PFbEPi034477;
	Tue, 25 Mar 2025 10:37:14 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tx6L4-00068D-Ki; Tue, 25 Mar 2025 10:37:14 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH v2 3/3]  packagegroup-arago-tisdk-multimedia: Wrap various packages in a compliant manner
Date: Tue, 25 Mar 2025 10:37:14 -0500
Message-ID: <20250325153714.23520-3-reatmon@ti.com>
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
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16153

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

 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 6a1b25b6..3aa1a051 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -7,12 +7,12 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 inherit packagegroup
 
 MULTIMEDIA = " \
-    ffmpeg \
     libcamera \
     libcamera-gst \
-    mpv \
 "
 
+MULTIMEDIA:append:arago = " ffmpeg mpv"
+
 MULTIMEDIA:omapl138 = ""
 
 MULTIMEDIA:append:dra7xx = " \
-- 
2.17.1


