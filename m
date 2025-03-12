Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4416FC28B30
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:45:50 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web10.38833.1741790742857413129
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 12 Mar 2025 07:45:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=sj1/T7ch;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfRI1525236
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 12 Mar 2025 09:45:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741790741;
	bh=sXbFHXN4DwTAhG58jzoN8N3O3R0+KXXPgqHMh+4JTnU=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=sj1/T7chd+iXm88+MzorrBiFM68KUvqnBc1nRwLDeSmxScIond2NnavQIkW1H9ge3
	 hnHAnNnjryTVYigrGIJ1QLMZ9Hei82Y6aelz/kEuuL31oX/8JWLDNYtJYaaO8l99bf
	 61ZQoz2JDt9I/56zM/sBdaOImfJnaWfr4+wthCWo=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52CEjfjO097210
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Mar 2025 09:45:41 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 12
 Mar 2025 09:45:41 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 12 Mar 2025 09:45:41 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52CEjfoP007016;
	Wed, 12 Mar 2025 09:45:41 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tsNL2-0003sQ-U3; Wed, 12 Mar 2025 09:45:40 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/scarthgap][PATCH 08/10] glfw: Wrap the bbappend in a compliant manner
Date: Wed, 12 Mar 2025 09:45:38 -0500
Message-ID: <20250312144540.14210-9-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250312144540.14210-1-reatmon@ti.com>
References: <20250312144540.14210-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 12 Mar 2025 14:45:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16000

Wrap the bbappend in a yocto-check-layer compliant manner so that only
if you are building this recipe under meta-arago-distro with the arago
DISTRO_OVERRIDE would the bbappend apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../glfw/{glfw_%.bbappend => glfw-arago.inc}           |  0
 .../recipes-graphics/glfw/glfw_%.bbappend              | 10 +++-------
 2 files changed, 3 insertions(+), 7 deletions(-)
 copy meta-arago-extras/recipes-graphics/glfw/{glfw_%.bbappend => glfw-arago.inc} (100%)

diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend b/meta-arago-extras/recipes-graphics/glfw/glfw-arago.inc
similarity index 100%
copy from meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
copy to meta-arago-extras/recipes-graphics/glfw/glfw-arago.inc
diff --git a/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend b/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
index 8352a866..8aa73700 100644
--- a/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
+++ b/meta-arago-extras/recipes-graphics/glfw/glfw_%.bbappend
@@ -1,8 +1,4 @@
-# Add some wayland configuration options until meta-oe adds some good
-# PACKAGECONFIGS
+GLFW_ARAGO = ""
+GLFW_ARAGO:arago = "glfw-arago.inc"
 
-PR:append = ".arago1"
-
-PACKAGECONFIG[wayland] = "-DGLFW_USE_WAYLAND=ON,,wayland wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
-
-PACKAGECONFIG += " wayland"
+require ${GLFW_ARAGO}
-- 
2.17.1


