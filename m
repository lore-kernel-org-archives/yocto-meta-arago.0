Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2FBC48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 18:24:47 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.179.1707935081849252711
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 10:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=uKcscjma;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: detheridge@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41EIOejC106006;
	Wed, 14 Feb 2024 12:24:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707935080;
	bh=FrDM/Jog+8b0Pw+S9ZRHZ3qI/nlEi+6rZhaiadtD5Ek=;
	h=From:To:CC:Subject:Date;
	b=uKcscjmaTKSUFLSN1e4v3BZ5Kgjr6VG12wfEo+TvJ4gttNpnQEsaBCFqRiwunOkGS
	 nMoQjBqdW3zNZNjf22EN3xek59dRfDAIvbrhKRlx1xYnl03YpRpq3gwnR6X+vkri+i
	 bRP9L3kNsd45DJnCIzFVsrGi2gD7JE0pkVdOTYso=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41EIOexv039353
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Feb 2024 12:24:40 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 12:24:40 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 12:24:40 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41EIOeAD040965;
	Wed, 14 Feb 2024 12:24:40 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] oe-layersetup: harmonize meta-browser commits in kirkstone configs
Date: Wed, 14 Feb 2024 12:24:31 -0600
Message-ID: <20240214182431.19857-1-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 14 Feb 2024 18:24:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15185

From: Darren Etheridge <detheridge@ti.com>

Make the meta-browser commit match the
arago-kirkstone-chromium-config.txt commit.  Even though these a
commented out, lets make them match so anybody can uncomment them
and generate a chromium build with GPU acceleration enabled without
having to use a different config file.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 configs/arago-kirkstone-config.txt      | 2 +-
 configs/arago-kirkstone-next-config.txt | 2 +-
 configs/arago-kirkstone-wip-config.txt  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
index 43a8a0b..ac9bb4d 100644
--- a/configs/arago-kirkstone-config.txt
+++ b/configs/arago-kirkstone-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
diff --git a/configs/arago-kirkstone-next-config.txt b/configs/arago-kirkstone-next-config.txt
index 9d173df..7dd3e3f 100644
--- a/configs/arago-kirkstone-next-config.txt
+++ b/configs/arago-kirkstone-next-config.txt
@@ -11,7 +11,7 @@ MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
diff --git a/configs/arago-kirkstone-wip-config.txt b/configs/arago-kirkstone-wip-config.txt
index dfe8bd6..19796c4 100644
--- a/configs/arago-kirkstone-wip-config.txt
+++ b/configs/arago-kirkstone-wip-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-- 
2.36.1


