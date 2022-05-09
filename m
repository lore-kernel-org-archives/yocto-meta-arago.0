Return-Path: <gadiyar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B22C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 14:13:45 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.32294.1652105617379878343
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 09 May 2022 07:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=GlrqKlfr;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: gadiyar@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 249EDZ5u061754;
	Mon, 9 May 2022 09:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1652105615;
	bh=Ly3kRPlyS4g7RpV8gUkCxtxRXZIY9kiWNiYGsIoLzes=;
	h=From:To:Subject:Date;
	b=GlrqKlfrdINUfRF29XoqWOalVySnb68zisz9PrXxkVf4i+0JvXyuA7PjqAUvL+bpf
	 tbspCKNGwZ+WMBwSJJkTWG8X298cZuRkTmQh4otZueg2N2FA8Rdpp3lRMLMq7DjJ1w
	 auys+Y93kUuMRBX4/lo/GgKBwHKsH+KEJFSlfBW0=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 249EDZ0b032395
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 9 May 2022 09:13:35 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 9
 May 2022 09:13:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 9 May 2022 09:13:35 -0500
Received: from uda0393673 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 249EDZTZ073995;
	Mon, 9 May 2022 09:13:35 -0500
Received: from a0393673 by uda0393673 with local (Exim 4.90_1)
	(envelope-from <gadiyar@ti.com>)
	id 1no48l-0000J6-Dj; Mon, 09 May 2022 09:13:35 -0500
From: Anand Gadiyar <gadiyar@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [dunfell/master] [PATCH] meta-arago-distro: drop custom PACKAGECONFIG
 option for curl
Date: Mon, 9 May 2022 09:13:35 -0500
Message-ID: <20220509141335.1130-1-gadiyar@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 09 May 2022 14:13:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13841

These options have the unfortunate side effect of disabling proxy
support and verbose debug. This affects git clone while behind a proxy.

There's probably no need to have these options any more and we can use
the default yocto recipe.

Signed-off-by: Anand Gadiyar <gadiyar@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 67468cc0..36a527e3 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -136,9 +136,6 @@ PACKAGECONFIG_append_pn-qtsvg = " examples"
 PACKAGECONFIG_append_pn-qtwayland = " examples"
 PACKAGECONFIG_append_pn-qtwebengine = " examples"
 
-# Prefer OpenSSL over GnuTLS for curl due to TSU exemptions
-PACKAGECONFIG_pn-curl = "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
-
 PACKAGECONFIG_pn-glmark2 = "drm-gles2 wayland-gles2"
 
 # Enable encryption support in open62541
-- 
2.17.1


