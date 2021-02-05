Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id CE21C529D5
	for <meta-arago@arago-project.org>;
	Fri,  5 Feb 2021 18:34:04 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 115IYCSt087487
	for <meta-arago@arago-project.org>; Fri, 5 Feb 2021 12:34:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1612550052;
	bh=hBmObCrmZ67N9LwfykP8EPqL4/TQKvFIDj5sW41hRsw=;
	h=From:To:CC:Subject:Date;
	b=TvKKp+GNvNS8BGyzyuXHSJL35ZnCgAMlsFHc05Q8dniSahpybwB+bX4NrTf8p5PS1
	pkou74W8RzbT/5IUoU/QBwG5gVN0cS37XHmfXLlSQ4biWSZbQlYuoeZG/I587ga40w
	S1WHGIZ+h49mMyoMMlDoe5vS1Ut+nS4V1binqMdo=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 115IYCaS107497
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 5 Feb 2021 12:34:12 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Fri, 5 Feb 2021 12:34:12 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Fri, 5 Feb 2021 12:34:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 115IYCWK118586;
	Fri, 5 Feb 2021 12:34:12 -0600
From: Dan Murphy <dmurphy@ti.com>
To: <meta-arago@arago-project.org>, <praneeth@ti.com>
Date: Fri, 5 Feb 2021 12:34:06 -0600
Message-ID: <20210205183406.32385-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master] [PATCH] Revert "arago-dunfell-next: Temporarily redirect meta-openembedded"
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
X-List-Received-Date: Fri, 05 Feb 2021 18:34:05 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This reverts commit 99f72a0bd64e3f7e0d395a0bb5c26017d745a185.
This re-direct does not need to be done now that the fix for the mariadb
has been merged in dunfell branch.

From: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Dan Murphy <dmurphy@ti.com>
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
2.29.2


