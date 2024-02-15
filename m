Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC89CC48BC4
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 15:11:27 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.16264.1708009880709459050
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 07:11:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TaomBK6/;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: detheridge@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FFBIqo040171;
	Thu, 15 Feb 2024 09:11:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708009878;
	bh=bjkHRq/mXs5efq+laZXOaJ7ukB8a0qFeAMFjU/NFwF0=;
	h=From:To:CC:Subject:Date;
	b=TaomBK6/U2WBSsO4DuFOjCxs0FiZbjuZ1MOSccbLE+VlWfhRq9llMBbtLt11ggZ+S
	 WbFVGEnX0erUaBSZEMVYQKG4ppGXd3KN2y3sBoTTT+zBS1No77iBPMgt5iyv0Er/Wi
	 tt57VGKW63vofSOTYFWSMc99ogw5ttafx3rdYkbw=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FFBI5E035969
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 09:11:18 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 09:11:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 09:11:18 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FFBIsN003167;
	Thu, 15 Feb 2024 09:11:18 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] oe-layersetup:  really harmonize the meta-browser line
Date: Thu, 15 Feb 2024 09:10:50 -0600
Message-ID: <20240215151050.4041-1-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Feb 2024 15:11:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15193

From: Darren Etheridge <detheridge@ti.com>

My earlier patch missed adding the layer=meta-chromium onto the
meta-browser line and builds stop working very quickly.
We want this to match exactly what we have for
arago-kirkstone-chromium-config.txt so anybody can uncomment this line
and do a GPU enabled build of Chromium.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 configs/arago-kirkstone-config.txt      | 2 +-
 configs/arago-kirkstone-next-config.txt | 2 +-
 configs/arago-kirkstone-wip-config.txt  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-kirkstone-config.txt b/configs/arago-kirkstone-config.txt
index ac9bb4d..eb4565e 100644
--- a/configs/arago-kirkstone-config.txt
+++ b/configs/arago-kirkstone-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
diff --git a/configs/arago-kirkstone-next-config.txt b/configs/arago-kirkstone-next-config.txt
index 7dd3e3f..1c06748 100644
--- a/configs/arago-kirkstone-next-config.txt
+++ b/configs/arago-kirkstone-next-config.txt
@@ -11,7 +11,7 @@ MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
diff --git a/configs/arago-kirkstone-wip-config.txt b/configs/arago-kirkstone-wip-config.txt
index 19796c4..7df3461 100644
--- a/configs/arago-kirkstone-wip-config.txt
+++ b/configs/arago-kirkstone-wip-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,2.0,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,kirkstone-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,kirkstone,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,kirkstone,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,kirkstone,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-- 
2.36.1


