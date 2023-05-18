Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4216AC77B7A
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 13:26:47 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.17317.1684416400989560322
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 May 2023 06:26:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MGB5UXki;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IDQeW6125432
	for <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 08:26:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684416400;
	bh=IMNcw+C72W4dkYaZl6NFT+kGlXL2Q9AxVufhR0/P8Rs=;
	h=From:To:CC:Subject:Date;
	b=MGB5UXki09bc5k7WyAfeDIjvOzghjvhPqhx4vMdGQOZLTGjzYTE5cmuudr8G6hPF3
	 FiSgFTeUMdqtGN9pQsG/ejr1SQBQN4ZNjaA+CAF3YNYbFO7jGy9tAatmYVwtnVrXgN
	 n0aOszDk48rEnGqZ56oNYM6EO1Ep++vxUXbFYDmc=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IDQepi053954
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 08:26:40 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 08:26:40 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 08:26:40 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34IDQcZt006060;
	Thu, 18 May 2023 08:26:39 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: <j-choudhary@ti.com>, <a-bhatia1@ti.com>, <b-brnich@ti.com>,
        <devarsht@ti.com>, <r-ravikumar@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] conf: arago: Add flag to enable kmssink plugin
Date: Thu, 18 May 2023 18:56:36 +0530
Message-ID: <20230518132636.17398-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 13:26:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14418

Enable building kmssink plugin in gstreamer1.0-plugins-bad

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 379b1d44..e32259a9 100644
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
2.17.1


