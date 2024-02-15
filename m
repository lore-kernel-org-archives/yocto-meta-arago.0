Return-Path: <detheridge@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAEC5C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 15:45:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.16954.1708011909075073230
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 07:45:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=ZtMzmu6l;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: detheridge@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FFj7GZ050214;
	Thu, 15 Feb 2024 09:45:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708011907;
	bh=K0+zLlFfXR4YaYaRc3XoFNm7ul21dh7RETA3638qLVY=;
	h=From:To:CC:Subject:Date;
	b=ZtMzmu6lo09modsXnuK+tfEhic0Ge8C7HpXxUUjlvf5Mnj0e6o/nk4Wm48Rjml5ex
	 3scS+Cq/MEpN+KQeFxHObZ9XCaGnkjzOyYfAx86+Ck0ZkWDRWLsWBkGnFC67zPsK4T
	 Ky7xoiNUmG3D+0QV2JXK3BA9+/bA3eDJXZH2c/pg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FFj7Mn108268
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 09:45:07 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 09:45:07 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 09:45:06 -0600
Received: from uda0867391.dal.design.ti.com (uda0867391.dhcp.ti.com [128.247.81.32])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FFj7qm052909;
	Thu, 15 Feb 2024 09:45:07 -0600
From: <detheridge@ti.com>
To: <meta-arago@lists.yoctoproject.org>, <reatmon@ti.com>,
        <denys@konsulko.com>
CC: <rs@ti.com>, <detheridge@ti.com>
Subject: [meta-arago][oe-layersetup][PATCH] oe-layersetup: master configs update meta-browser entry for chromium
Date: Thu, 15 Feb 2024 09:44:50 -0600
Message-ID: <20240215154450.4670-1-detheridge@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Feb 2024 15:45:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15195

From: Darren Etheridge <detheridge@ti.com>

Following on from the patch to fix kirkstone configs to include
specifying the correct layer to include the chromium browser into the
build.  Do the same for the master configs.   Still keeping the
meta-browser layer commented in the non-chromium configs, to avoid the
extra build time for now.

Signed-off-by: Darren Etheridge <detheridge@ti.com>
---
 configs/arago-master-chromium-config.txt | 2 +-
 configs/arago-master-config.txt          | 2 +-
 configs/arago-master-next-config.txt     | 2 +-
 configs/arago-master-wip-config.txt      | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/arago-master-chromium-config.txt b/configs/arago-master-chromium-config.txt
index 94dfc53..1ff5fed 100644
--- a/configs/arago-master-chromium-config.txt
+++ b/configs/arago-master-chromium-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index ca58dd2..b06d51c 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
diff --git a/configs/arago-master-next-config.txt b/configs/arago-master-next-config.txt
index 74c497e..570d4f8 100644
--- a/configs/arago-master-next-config.txt
+++ b/configs/arago-master-next-config.txt
@@ -11,7 +11,7 @@ MOTD: NOTE:
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
diff --git a/configs/arago-master-wip-config.txt b/configs/arago-master-wip-config.txt
index cf70ead..a96e127 100644
--- a/configs/arago-master-wip-config.txt
+++ b/configs/arago-master-wip-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,https://git.openembedded.org/bitbake,master,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,master-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
-#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+#meta-browser,https://github.com/OSSystems/meta-browser.git,master,HEAD,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
-- 
2.36.1


