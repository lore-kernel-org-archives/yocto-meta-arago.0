Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2112AC83003
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 18:12:06 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.1435.1686247918321162386
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 08 Jun 2023 11:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=fpdYBOwO;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: b-brnich@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 358IBr90031986;
	Thu, 8 Jun 2023 13:11:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686247913;
	bh=HCx7GVibeB3swX9DFMAwwOWG08lpbJytg3fwpevflRE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=fpdYBOwOo5kBWR78iAFrrdZc7jSc4R5qWyjPYsGa9AIW6/UdfOy8Fw269Yq86Rh5I
	 Yz6IR5mzhe3AzqkGtEWOZL631JBXhox+XX+iegJRI+vNtYdjxRvZNYtVa3o/pW31fD
	 xlmve6vKdGu9eS3+ptVD7Vp3zGDBCmnzIKopoK2s=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 358IBrpT092400
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 8 Jun 2023 13:11:53 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 8
 Jun 2023 13:11:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 8 Jun 2023 13:11:53 -0500
Received: from udba0500997.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 358IBrk2010364;
	Thu, 8 Jun 2023 13:11:53 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: Darren Etheridge <detheridge@ti.com>, <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
Subject: [meta-arago][master/kirkstone][PATCH v2 1/2] conf: arago: Add support for kmssink
Date: Thu, 8 Jun 2023 13:11:52 -0500
Message-ID: <20230608181153.1560497-2-b-brnich@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608181153.1560497-1-b-brnich@ti.com>
References: <20230608181153.1560497-1-b-brnich@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 08 Jun 2023 18:12:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14543

kmssink is frequently used for quick video rendering straight from
gstreamer pipelines.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 59ee9926..ddad682e 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -113,6 +113,9 @@ PACKAGECONFIG:append:pn-openssl = " cryptodev-linux"
 # Enable GST_TRACER logging in gstreamer
 PACKAGECONFIG:append:pn-gstreamer1.0 = " tracer-hooks"
 
+# Enable kmssink in gstreamer
+PACKAGECONFIG:append:pn-gstreamer1.0-plugins-bad = " kms"
+
 # Disable pulseaudio routing in alsa by default
 PACKAGECONFIG:remove:pn-alsa-plugins = "pulseaudio"
 RDEPENDS:pulseaudio-server:remove = "alsa-plugins-pulseaudio-conf"
-- 
2.34.1


