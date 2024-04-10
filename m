Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CE76CD1296
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 21:14:32 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.2027.1712783666305737356
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 10 Apr 2024 14:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Qh3CjuxW;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43ALEOJj027910;
	Wed, 10 Apr 2024 16:14:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712783664;
	bh=RA02ZqfSNdidowwciaSBT9LMFcop21bAmHAS4p/yfl8=;
	h=From:To:Subject:Date;
	b=Qh3CjuxWOrGMUJa3YT98ESEX1DyOCM5Lim3FL0K4XSFFWsHSMAQzGHhb4/2LqIEKo
	 ePQATWsCkH1a7aaJ7zqQROhIS8xuv78RD4HsmMQgVO4MRrM/aDk/RGkF2XErJIoY6b
	 f94I7hXfeO/q3Qd9BtyT8XUFnkXI7Ry226JKTG5s=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43ALEOL5007735
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 10 Apr 2024 16:14:24 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 10
 Apr 2024 16:14:24 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 10 Apr 2024 16:14:24 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43ALEO8a104649;
	Wed, 10 Apr 2024 16:14:24 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rufGy-0005wu-3a; Wed, 10 Apr 2024 16:14:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] configs: Update scarthgap configs for meta-virtualization
Date: Wed, 10 Apr 2024 16:14:24 -0500
Message-ID: <20240410211424.22828-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Wed, 10 Apr 2024 21:14:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15262

meta-virutalization has created a scarthgap branch, so update the
appropriate configs to point to it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/arago-scarthgap-config.txt      | 2 +-
 configs/arago-scarthgap-next-config.txt | 2 +-
 configs/arago-scarthgap-wip-config.txt  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index a881cc5..5f36770 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index f059da0..2445cba 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -13,7 +13,7 @@ bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index fd422e7..0f5e75f 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -5,7 +5,7 @@ bitbake,https://git.openembedded.org/bitbake,2.8,HEAD
 meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=meta-arago-distro:meta-arago-extras:meta-arago-demos:meta-arago-test
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-virtualization,https://git.yoctoproject.org/meta-virtualization,scarthgap,HEAD,layers=
 meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
-- 
2.17.1


