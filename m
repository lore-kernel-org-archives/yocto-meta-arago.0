Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.16856.1639080378926218924
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 12:06:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xQBeS7ig;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: yogeshs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1B9K6GdG040465;
	Thu, 9 Dec 2021 14:06:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639080376;
	bh=Rok3LLZPycJ+TwxFW7CJrrTv7XbS72A/xiCkmiTuvPI=;
	h=From:To:Subject:Date;
	b=xQBeS7igDTYIvWAaP3czQYLItmTVlMV0N19m/nN7EDMkdejB2fn5GhYeQjO+aMfkB
	 KwIpBehgwpgl53bnoQ5d4mb8UUk0p9kG8+LiCVl5OWrv12EJasEhNyeS4adYyZvntq
	 DpyiyG6rnyPi2i8SHGLgxapeGDdbajeZcZVwHBPs=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1B9K6GiF019910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 14:06:16 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 14:06:16 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 14:06:16 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1B9K6GEe066805;
	Thu, 9 Dec 2021 14:06:16 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [oe-layersetup][PATCH] config: dunfell: fix typo where branch and commit id is interchanged
Date: Thu, 9 Dec 2021 20:06:16 +0000
Message-ID: <20211209200616.27345-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

Fix typo with branch and commit id is interchanged for oe-core

Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 Sending new patch instead of v2 since v2 will need force update

 configs/arago-dunfell-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index 8ae2a69..e6559fd 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -10,7 +10,7 @@ meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,f61fcb6e176f19f1e768ce63a693f238713c8887,HEAD,layers=meta
+oe-core,git://git.openembedded.org/openembedded-core,dunfell,f61fcb6e176f19f1e768ce63a693f238713c8887,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 # if meta-browser/5f365ef0f842ba4651efe88787cf9c63bc8b6cb3 above is enabled,
 # use below for OECORELAYERCONF to mark it compatible with dunfell
-- 
2.17.1

