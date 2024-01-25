Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A23AC48260
	for <webhook@archiver.kernel.org>; Thu, 25 Jan 2024 16:58:46 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.23560.1706201920357807612
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 25 Jan 2024 08:58:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=K24cY6Wi;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 40PGwchl058544;
	Thu, 25 Jan 2024 10:58:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1706201918;
	bh=C76yUOPazHzt63Oi9qpCNMEDNiNoQ6xmd4lJGB7vrfQ=;
	h=From:To:Subject:Date;
	b=K24cY6Wi7gyMpnUtWgh13Yw3sMGRYW4VNSOA5RGUwQeKpG2CEbwK3e2BCwhkQfQZo
	 SZSpfuZMJRn8TKZNM9GjHA9D3Vo8Op1AgsNZC4K8K+HAiNGlkJZ6N0ZIpANYqvCOh2
	 lyft2F0A6N814kHH4wdI9ai2I6SqBR5dPVmOHMSk=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 40PGwcOS033114
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Jan 2024 10:58:38 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 25
 Jan 2024 10:58:38 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 25 Jan 2024 10:58:38 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 40PGwcPk032206;
	Thu, 25 Jan 2024 10:58:38 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rT33m-0001S2-Ak; Thu, 25 Jan 2024 10:58:38 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] tisdk-*-image: Fix SYSTEMD_DEFAULT_TARGET assignment
Date: Thu, 25 Jan 2024 10:58:38 -0600
Message-ID: <20240125165838.5539-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 25 Jan 2024 16:58:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15096

The use of the variable SYSTEMD_DEFAULT_TARGET is as a filename target.
But the extra whitespace in the string caused by the link breaks and
indents added spaces between the directory and the filename which
resulted in the following error:

run.set_systemd_default_target.23991: line 147: [: too many arguments

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-distro/recipes-core/images/tisdk-default-image.bb  | 4 +---
 .../recipes-core/images/tisdk-thinlinux-image.bb              | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
index 33ed0f57..7761ac34 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-default-image.bb
@@ -8,9 +8,7 @@ require arago-image.inc
 ARAGO_DEFAULT_IMAGE_EXTRA_INSTALL ?= ""
 
 # we're assuming some display manager is being installed with opengl
-SYSTEMD_DEFAULT_TARGET = " \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','graphical.target','multi-user.target',d)} \
-"
+SYSTEMD_DEFAULT_TARGET = "${@bb.utils.contains('DISTRO_FEATURES','opengl','graphical.target','multi-user.target',d)}"
 
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
diff --git a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
index f266b14a..13e86902 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-thinlinux-image.bb
@@ -9,9 +9,7 @@ require arago-image.inc
 ARAGO_THIN_IMAGE_EXTRA_INSTALL ?= ""
 
 # we're assuming some display manager is being installed with opengl
-SYSTEMD_DEFAULT_TARGET = " \
-    ${@bb.utils.contains('DISTRO_FEATURES','opengl','graphical.target','multi-user.target',d)} \
-"
+SYSTEMD_DEFAULT_TARGET = "${@bb.utils.contains('DISTRO_FEATURES','opengl','graphical.target','multi-user.target',d)}"
 
 IMAGE_INSTALL += "\
     packagegroup-arago-base \
-- 
2.17.1


