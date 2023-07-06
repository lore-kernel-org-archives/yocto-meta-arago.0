Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04B5FEB64D9
	for <webhook@archiver.kernel.org>; Thu,  6 Jul 2023 15:29:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.27217.1688657373081879657
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 08:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OCEHnR4W;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 366FTSEc085406;
	Thu, 6 Jul 2023 10:29:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688657369;
	bh=EtWb5tHzns2AxZi8MkacIVIveXN0rO6K8/KtmTGlONU=;
	h=From:To:CC:Subject:Date;
	b=OCEHnR4WpUZcdKZWxg6nf4W5eygjaYcXu/DgFN35rwFJGYEobL/88kNUT6InciNhj
	 EQIx+ULWcQQP8LSn74h54fqNiqb0A+UOb3YK6aUfYmvMJoX0VzARSWNqFNnnpNMqDF
	 mygYqtmW8od4XwyGHNMJp+8p2LmoHaYSowDZOjRs=
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 366FTSur116396
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Jul 2023 10:29:28 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Jul 2023 10:29:28 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Jul 2023 10:29:28 -0500
Received: from rs-desk.dhcp.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 366FTSnM106378;
	Thu, 6 Jul 2023 10:29:28 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <khasim@ti.com>,
        Randolph Sapp
	<rs@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] arago-tiny-image: set ARAGO_SYSVINIT properly
Date: Thu, 6 Jul 2023 10:29:22 -0500
Message-ID: <20230706152922.1722000-1-rs@ti.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 06 Jul 2023 15:29:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14769

From: Randolph Sapp <rs@ti.com>

Set ARAGO_SYSVINIT init properly so the init system and login service
gets configured properly. Also add the bite back in from my old patch to
drop the sysvinit distro feature when systemd is selected so we don't
have legacy init scripts and modern init scripts mixed in the images
that use systemd.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf                   | 1 +
 meta-arago-distro/recipes-core/images/arago-tiny-image.inc | 6 +-----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index e0087ab7..e00dddd4 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -66,6 +66,7 @@ VIRTUAL-RUNTIME_initramfs = "${@'sysvinit-initramfs' if oe.types.boolean(d.getVa
 VIRTUAL-RUNTIME_login_manager = "${@'busybox' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else 'shadow-base'}"
 
 DISTRO_FEATURES:append = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' systemd'}"
+DISTRO_FEATURES:remove = " ${@'' if oe.types.boolean(d.getVar('ARAGO_SYSVINIT')) else ' sysvinit'}"
 
 # Distro-specific package configuration
 PACKAGECONFIG:append:pn-systemd = " coredump networkd resolved serial-getty-generator"
diff --git a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
index 242e763c..e5c75946 100644
--- a/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
+++ b/meta-arago-distro/recipes-core/images/arago-tiny-image.inc
@@ -1,9 +1,5 @@
-ARAGO_SYSVINIT = "1"
-
 require arago-image.inc
 
 IMAGE_FEATURES:remove = "splash"
 
-IMAGE_INSTALL = " \
-	packagegroup-arago-sysvinit-boot \
-"
+ARAGO_SYSVINIT[export] := "1"
-- 
2.41.0


