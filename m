Return-Path: <g-tammana@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C9F0052970
	for <meta-arago@arago-project.org>;
	Thu, 17 Sep 2020 18:48:15 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08HIjJd4051040
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:45:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1600368319;
	bh=tHIVgf8uRdMk73Kdzc6P1XUWPvjRQm6WXPrE9qc7vGo=;
	h=From:To:CC:Subject:Date;
	b=vJsS7Q2B3JwUyzkOEBV1m2GhGhFQFYrIyDF1rWArEJoIoU2ilS8O31RROot8iAt2U
	qZhoSBWnSvfLjIjWf3LYe1lyaSyM8Sreul6yMDiwmn/reTXUMnBQcOZI/v9Z+un8Ct
	Ax7IYclzx8vWdfA6mZgDcCMBl9AsrIbTKZtJq538=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08HIjJMD081229
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 17 Sep 2020 13:45:19 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 17 Sep 2020 13:45:19 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 17 Sep 2020 13:45:19 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08HIjJZC009235;
	Thu, 17 Sep 2020 13:45:19 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.77.45])
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 08HIjJep016491;
	Thu, 17 Sep 2020 13:45:19 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>
Date: Thu, 17 Sep 2020 13:45:14 -0500
Message-ID: <20200917184514.964-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] arago-dunfell: Add meta-python2
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
X-List-Received-Date: Thu, 17 Sep 2020 18:48:16 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

qtwebengine has python2 dependency for its build and does not support
python3.

https://doc.qt.io/qt-5.14/qtwebengine-platform-notes.html

Yocto dunfell uses python3 as default, so add meta-python2 layer for
adding python2 support.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 configs/arago-dunfell-config.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index c9428d9..cdbb674 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -7,6 +7,7 @@ meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,HEAD,layers=meta-a
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,dunfell,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dunfell,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-ti,git://git.yoctoproject.org/meta-ti,dunfell,HEAD,layers=
 meta-arm,git://git.yoctoproject.org/meta-arm,dunfell,d13eb333bf96282c840c290c396d797da2e5e619,layers=meta-arm:meta-arm-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dunfell,HEAD,layers=meta
-- 
2.28.0


