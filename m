Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB7EC6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 13:30:30 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.11975.1712064623901160854
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 02 Apr 2024 06:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lUAzlxoY;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 432DUMZI103286;
	Tue, 2 Apr 2024 08:30:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712064622;
	bh=befQHsni/Cz/+BZ8MHSMA6UoPM7KhDhnSJ9LezgwgJQ=;
	h=From:To:Subject:Date;
	b=lUAzlxoYKdxeEswAiFtYHkE5qCA2+rqy4qnyGfeVjFYSHKg07cOi/JJ5zZM2ZG7dv
	 PxcRFiP59CxbXALLGSNWVhgq4xl2+81SaK3/uD0eBpu1vaz+o6MVo52rDCLTn8jWr8
	 +BvJQdn8O2oydwZteC0+PVf+j9xtIO9fIJ+NCwME=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 432DUMZd022227
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 2 Apr 2024 08:30:22 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 2
 Apr 2024 08:30:22 -0500
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 2 Apr 2024 08:30:22 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 432DUMTH057992;
	Tue, 2 Apr 2024 08:30:22 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1rreDW-0007KE-7x; Tue, 02 Apr 2024 08:30:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][master][PATCH] arago-scarthgap-*: Add meta-multimedia from meta-openeembedded
Date: Tue, 2 Apr 2024 08:30:22 -0500
Message-ID: <20240402133022.28118-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 02 Apr 2024 13:30:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15256

Add meta-multimedia to pick up some recipes that we do not need to carry
of our own in meta-arago.  I missed this when creating the scarthgap
configs.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 configs/arago-scarthgap-config.txt      | 2 +-
 configs/arago-scarthgap-next-config.txt | 2 +-
 configs/arago-scarthgap-wip-config.txt  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/arago-scarthgap-config.txt b/configs/arago-scarthgap-config.txt
index 9af018c..a881cc5 100644
--- a/configs/arago-scarthgap-config.txt
+++ b/configs/arago-scarthgap-config.txt
@@ -6,7 +6,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap,HEAD,layers=meta-ar
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
-meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
diff --git a/configs/arago-scarthgap-next-config.txt b/configs/arago-scarthgap-next-config.txt
index 3e1791c..4759c64 100644
--- a/configs/arago-scarthgap-next-config.txt
+++ b/configs/arago-scarthgap-next-config.txt
@@ -14,7 +14,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-next,HEAD,layers=me
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
-meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-next,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
diff --git a/configs/arago-scarthgap-wip-config.txt b/configs/arago-scarthgap-wip-config.txt
index 20a407d..fd422e7 100644
--- a/configs/arago-scarthgap-wip-config.txt
+++ b/configs/arago-scarthgap-wip-config.txt
@@ -6,7 +6,7 @@ meta-arago,https://git.yoctoproject.org/meta-arago,scarthgap-wip,HEAD,layers=met
 #meta-browser,https://github.com/OSSystems/meta-browser.git,master,d3d16b47e17dc899e5298cff698dc32e5e639ab4,layers=meta-chromium
 meta-qt5,https://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,https://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
-meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-openembedded,https://git.openembedded.org/meta-openembedded,scarthgap,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems:meta-multimedia
 meta-ti,https://git.yoctoproject.org/meta-ti,scarthgap-wip,HEAD,layers=meta-ti-extras:meta-ti-bsp
 meta-arm,https://git.yoctoproject.org/meta-arm,master,HEAD,layers=meta-arm:meta-arm-toolchain
 meta-clang,https://github.com/kraj/meta-clang,master,HEAD,layers=
-- 
2.17.1


