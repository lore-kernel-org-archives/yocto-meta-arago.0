Return-Path: <a-limaye@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2632C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 07:47:26 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web09.35760.1656661636834836918
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 00:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=N6W1/tY8;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: a-limaye@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 2617lCmQ059354;
	Fri, 1 Jul 2022 02:47:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1656661632;
	bh=2lnvYoqltmpGGMCgW2raPif+RNoUy/Z06p9L3d144KY=;
	h=From:To:CC:Subject:Date;
	b=N6W1/tY8ODrlRwdPAJTAv5RkiyWPSeu1N8LWudvPxMj7C8Rw9w61kFKzvLjBmQUZe
	 Fqk6SuoALFXNKnvrMD1kZ4MnmhuVwxyiwZkHVFy4mP/WmOTYBAVlNhR50FOsom/Ko3
	 xT8ESNk2fwYGsOl5hNq65E0DDahqAV5Dba5oo/e0=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 2617lCZW021509
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 1 Jul 2022 02:47:12 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 1
 Jul 2022 02:47:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 1 Jul 2022 02:47:12 -0500
Received: from edgeaipc1 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 2617lBeO105274;
	Fri, 1 Jul 2022 02:47:11 -0500
Received: from a0485100 by edgeaipc1 with local (Exim 4.90_1)
	(envelope-from <a-limaye@ti.com>)
	id 1o7BMr-00022j-TV; Fri, 01 Jul 2022 13:17:09 +0530
From: Aniket Limaye <a-limaye@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <denis@denix.org>, <reatmon@ti.com>, <l-weaver@ti.com>,
        Aniket Limaye <a-limaye@ti.com>
Subject: [meta-arago][dunfell][PATCH v2] conf: arago: Adding tracer-hooks
 build flag to gstreamer1.0
Date: Fri, 1 Jul 2022 13:17:05 +0530
Message-ID: <20220701074705.7408-1-a-limaye@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 01 Jul 2022 07:47:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13934

Enables GST_TRACERS : an optional utility for profiling gstreamer applications

Signed-off-by: Aniket Limaye <a-limaye@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 0e2f7ef1..61ae3c83 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -157,6 +157,9 @@ PACKAGECONFIG_append_pn-libsdl2 = " kmsdrm"
 # Enable cryptodev/devcrypto engine in OpenSSL 1.1
 PACKAGECONFIG_append_pn-openssl = " cryptodev-linux"
 
+# Enable GST_TRACER logging in gstreamer
+PACKAGECONFIG_append_pn-gstreamer1.0 = " tracer-hooks"
+
 # Disable pulseaudio routing in alsa by default
 PACKAGECONFIG_remove_pn-alsa-plugins = "pulseaudio"
 RDEPENDS_pulseaudio-server_remove = "alsa-plugins-pulseaudio-conf"
-- 
2.17.1


