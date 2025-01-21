Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F162C02182
	for <webhook@archiver.kernel.org>; Tue, 21 Jan 2025 17:52:44 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.21967.1737481954473805834
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 21 Jan 2025 09:52:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=W1Mot7v6;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50LHqXTx846971
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 21 Jan 2025 11:52:33 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737481953;
	bh=nRKfI2JmNpm4Om58h9eB4FmAMywLXtki0wG3ZPu6kDc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=W1Mot7v6UC/bJUoXut3UBlRK+pNDx/VarAxQUQ9/pzBPNaoTZVZETC22cE4jt7BSt
	 7x0cAhhlOJibDNQaWszZ2mrlPkdjDz9D70ePOagZ5Qse4orvG/qByz0SNfw62IBYGF
	 EGCcli4G316rmEM9mF/h06/n29uG7QVNoCWA8KK0=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LHqXha043547;
	Tue, 21 Jan 2025 11:52:33 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 21
 Jan 2025 11:52:33 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 21 Jan 2025 11:52:33 -0600
Received: from fllvsmtp8.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50LHqV9D097709;
	Tue, 21 Jan 2025 11:52:33 -0600
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][scarthgap/master][PATCH v2 6/7] arago.conf: Remove unneeded LICENSE_FLAGS_ACCEPTED items
Date: Tue, 21 Jan 2025 11:52:30 -0600
Message-ID: <20250121175231.27183-6-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250121175231.27183-1-afd@ti.com>
References: <20250121175231.27183-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 21 Jan 2025 17:52:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15724

netperf is no longer marked as non-commercial (587fe5877 in meta-oe).

faad2 is still marked commercial and AAC is still covered under several
patents that may require royalties. Not sure why we decided to whitelist
this, the commit adding it has no message. So, what can be added without
explanation can be removed without explanation :)

gst-ffmpeg is no longer a package, remove this too.

Signed-off-by: Andrew Davis <afd@ti.com>
---

Changes for v2:
 - Explain each change better in commit message

 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 9f51ac26..033b8fcd 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -167,7 +167,7 @@ SKIP_META_VIRT_SANITY_CHECK = "1"
 # disable by default the codecs in libav that causes issues with shipping an
 # Arago based SDK. No need to prevent gst-ffmpeg from being used since we
 # disable troublesome software.
-LICENSE_FLAGS_ACCEPTED = "commercial_gst-ffmpeg commercial_gstreamer1.0-libav commercial_faad2 non-commercial_netperf"
+LICENSE_FLAGS_ACCEPTED = "commercial_gstreamer1.0-libav"
 
 # Do not package own copy of perl into devkit, rely on host one
 ASSUME_PROVIDED += "nativesdk-perl"
-- 
2.39.2


