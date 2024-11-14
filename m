Return-Path: <a-shenai@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD18D65C41
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 05:41:27 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.31135.1731562883870044642
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 13 Nov 2024 21:41:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=K7PPVWg4;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: a-shenai@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4AE5fNqx2950965
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Nov 2024 23:41:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731562883;
	bh=wGfeFi/s5ZJ1OtSQHUKIkkM3L5ZyfMsLNYWQS5Ev09M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=K7PPVWg4QwnMe2MKI4liBgHaSxSBVde6QwSkZzf1qKaAmDDgv1+JB2AavjhWYVM0/
	 x+i4oEG8Zf4Scvh9ELZjw6eXgZ8Bxy392vQ0lojHA5rBGdxbvjGzk2gMYM+Oa1oF7x
	 bNSHBtzT8A9+ODqGIOgWATQjYGZD5dSAESxjFQxM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AE5fNDU076192
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Wed, 13 Nov 2024 23:41:23 -0600
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 23:41:22 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 23:41:22 -0600
Received: from aashvij.dhcp.ti.com (aashvij.dhcp.ti.com [172.24.227.252])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AE5fDGN044998;
	Wed, 13 Nov 2024 23:41:21 -0600
From: Aashvij Shenai <a-shenai@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <c-shilwant@ti.com>, <reatmon@ti.com>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <kamlesh@ti.com>
Subject: [oe-layersetup][master][PATCH v1 1/1] oe-layersetup: Bringing meta-selinux into Yocto builds
Date: Thu, 14 Nov 2024 11:11:00 +0530
Message-ID: <20241114054100.2945239-2-a-shenai@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114054100.2945239-1-a-shenai@ti.com>
References: <20241114054100.2945239-1-a-shenai@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 14 Nov 2024 05:41:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15609

This patch downloads the meta-selinux layer for the scarthgap branch

Signed-off-by: Aashvij Shenai <a-shenai@ti.com>
---
 configs/arago-scarthgap-config.txt      | 1 +
 configs/arago-scarthgap-next-config.txt | 1 +
 configs/arago-scarthgap-wip-config.txt  | 1 +
 3 files changed, 3 insertions(+)

diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index f95056d..1fd092b 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -2,6 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
+meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,3aff015697fa056b4af83b1c9ba44eca346a8a37
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index cd69c01..dbdec3a 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -10,6 +10,7 @@ MOTD: NOTE: to point the recipe to the appropriate cicd/next branch for that rec
 MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
+meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,3aff015697fa056b4af83b1c9ba44eca346a8a37
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index 2dd8209..b93f76f 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -2,6 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
+meta-selinux,https://git.yoctoproject.org/meta-selinux,scarthgap,3aff015697fa056b4af83b1c9ba44eca346a8a37
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,1ed2254d72a4c25879014c98be287a7e3e22904c,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,scarthgap,HEAD,layers=
-- 
2.34.1


