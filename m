Return-Path: <gadiyar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90461C433EF
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 14:50:57 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.5986.1652885449833295214
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 18 May 2022 07:50:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cK2czoCX;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: gadiyar@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 24IEoknp125828;
	Wed, 18 May 2022 09:50:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652885446;
	bh=Zx6hw+yCc3p8yI8BNu4nAO6Vt+zhbIilghGr2awj1Ko=;
	h=From:To:Subject:Date;
	b=cK2czoCXc9XiLSEEKIi4vY+owLoIBowKxl3fhbdXnuxUWbREViqQFpQKEqokvekfm
	 yBCNJIWvKiI7lH/ATJtH4YNZIGuiyBDdff2CcszxeZFOH6m+f+vr6m9GMO3tYqLxSo
	 tInR+yk/tglcFOAxWLm2ynf21CRT+inraz/n1tHU=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 24IEok2C001854
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 18 May 2022 09:50:46 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 18
 May 2022 09:50:46 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 18 May 2022 09:50:46 -0500
Received: from uda0393673 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 24IEokeI032257;
	Wed, 18 May 2022 09:50:46 -0500
Received: from a0393673 by uda0393673 with local (Exim 4.90_1)
	(envelope-from <gadiyar@ti.com>)
	id 1nrL0g-0006Er-Ap; Wed, 18 May 2022 09:50:46 -0500
From: Anand Gadiyar <gadiyar@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [PATCH v2] meta-arago-distro: curl: add proxy and verbose support
Date: Wed, 18 May 2022 09:50:46 -0500
Message-ID: <20220518145046.23942-1-gadiyar@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 18 May 2022 14:50:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13866

Our PACKAGECONFIG override for curl was done to prefer OpenSSL for curl
but seems to have the side effect of overriding other build flags
enabled in the upstream recipe, specifically the ones that enable
verbose debug prints and proxy support.

This affects git clone while behind a proxy.

Explicitly enable these in arago.conf.

Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
---
This supercedes the previous patch I sent out that was removing our
custom PACKAGECONFIG option, as Ryan felt we would have issues with TSU
exemptions as the comment states. So this version just enables the two
options we care about.

A third option in the upstream recipe that is similarly affected is
threaded_resolver but we don't currently know if it is essential. So I'm
not touching that in this patch. Let me know if someone disagrees with
this and I can resubmit enabling that as well.

 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 67468cc0..eb380c63 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -137,7 +137,7 @@ PACKAGECONFIG_append_pn-qtwayland = " examples"
 PACKAGECONFIG_append_pn-qtwebengine = " examples"
 
 # Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
-PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
+PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} proxy ssl verbose zlib"
 
 PACKAGECONFIG_pn-glmark2 = "drm-gles2 wayland-gles2"
 
-- 
2.17.1


