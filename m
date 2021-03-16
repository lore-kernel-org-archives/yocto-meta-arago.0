Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 4D7A452A31
	for <meta-arago@arago-project.org>;
	Tue, 16 Mar 2021 17:08:44 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12GH90VU105093;
	Tue, 16 Mar 2021 12:09:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615914540;
	bh=H26+nsaEyvtJG4Bjg7TCxqzsZrpQJNpB4h2XdoHyAQI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=OpPUuZTcZ5vFKsbmOpH+Nh3hYeu9w07fLZyEq0W1bhW+d/EXm90ATQFiouFC0E7Bu
	W/2gcSe/IfS0C0BdE6pDveuwkYYSxmBe0/PtRSoKUw/bUAgJcvHuNuYeE1rHiGijdw
	4ciHf8rTCem358sdxNsK6A/WHRjw6S6K57IT+ZKc=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12GH90YK126168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 Mar 2021 12:09:00 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 16 Mar 2021 12:08:59 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 16 Mar 2021 12:08:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12GH8xE5068395;
	Tue, 16 Mar 2021 12:08:59 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <denis@denix.org>
Date: Tue, 16 Mar 2021 12:08:56 -0500
Message-ID: <20210316170857.9547-2-nm@ti.com>
X-Mailer: git-send-email 2.25.1.377.g2d2118b814c1
In-Reply-To: <20210316170857.9547-1-nm@ti.com>
References: <20210316170857.9547-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup][PATCH 1/2] Revert "arago-dunfell-next: Temporarily redirect meta-openembedded"
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Tue, 16 Mar 2021 17:08:45 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This reverts commit 99f72a0bd64e3f7e0d395a0bb5c26017d745a185.

MariaDB issue has been resolved in upstream, no need to use a TI private
repository for build.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 configs/arago-dunfell-next-config.txt | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index 14e6fa8c9d6a..8d629c4bf42d 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -6,8 +6,7 @@ meta-arago,git://arago-project.org/git/meta-arago.git,dunfell-next,HEAD,layers=m
 #meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
-#meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-openembedded,ssh://git@bitbucket.itg.ti.com/coresdk_pub/meta-openembedded.git,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell-next,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,c4f04f3fb66f8f4365b08b553af8206372e90a63,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
-- 
2.25.1.377.g2d2118b814c1


