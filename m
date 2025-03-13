Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575F8C35FFA
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:40:40 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.11654.1741862431252589519
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 13 Mar 2025 03:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=hd1ZG6IH;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeU5e1358785
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 05:40:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741862430;
	bh=fcNvUgFPxBh3V4CDhFj2y3GPF+K8Vt+RlOwEdG02Zf8=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hd1ZG6IHgSc/XITcxBU1O/7rXgBLzes+8Q89r3g+oNsBfmF6DqBwc1PU8InCKT08E
	 U2aXzV13LGGvlBg1khgD05/WQN5whwNAkcHrBKt0ONG3yKFF+QOLC4as1j4xYegf73
	 LWI6UW/YuvZUk2oKoZA5awMfvTqqB7kzbO3fsKM0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52DAeUcG023147
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 13 Mar 2025 05:40:30 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 13
 Mar 2025 05:40:29 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 13 Mar 2025 05:40:29 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52DAeTUQ083610;
	Thu, 13 Mar 2025 05:40:29 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsfzJ-0003uV-Ly; Thu, 13 Mar 2025 05:40:29 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master][PATCH 01/13] libnetconf2: Wrap libpam dependency
Date: Thu, 13 Mar 2025 05:40:17 -0500
Message-ID: <20250313104029.14977-2-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313104029.14977-1-reatmon@ti.com>
References: <20250313104029.14977-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 13 Mar 2025 10:40:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16016

Check the DISTRO_FEATURES to make sure that pam is turned on before
depending on libpam.  The libpam recipe is gated behind this check and
this recipe will fail if you do not have pam enabled.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-sysrepo/libnetconf2/libnetconf2_git.bb            | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
index 196b36fe..c62d3faa 100644
--- a/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
+++ b/meta-arago-extras/recipes-sysrepo/libnetconf2/libnetconf2_git.bb
@@ -11,7 +11,9 @@ SRCREV = "91cd6d75722c65de5c005d908f6d645b48cee89b"
 
 S = "${WORKDIR}/git"
 
-DEPENDS = "libssh openssl libyang libxcrypt libpam"
+DEPENDS = "libssh openssl libyang libxcrypt \
+    ${@bb.utils.contains('DISTRO_FEATURES','pam','libpam','',d)} \
+"
 
 FILES:${PN} += "${datadir}/yang/modules/libnetconf2/*"
 
-- 
2.17.1


