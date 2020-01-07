Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id B01FB52994
	for <meta-arago@arago-project.org>;
	Tue,  7 Jan 2020 21:18:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 007LGV54058998
	for <meta-arago@arago-project.org>; Tue, 7 Jan 2020 15:16:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578431791;
	bh=YycKRg69m7QRYPKTGBKjmZHWXNKwehGF3txnqlvVhOc=;
	h=From:To:CC:Subject:Date;
	b=cvYeJFrke92Hr6P/bymz6QFIcBUAUNQqn9JSLSaPZDNwrn8SHk8+UhlO4r8CtsjrB
	cM+vJa1UOoMiiTHrjVFyhYchhcyDjNNhkux8PaTVQAQhvqYF6uJRATdTKx1V69Yk6Q
	RF0t+63RPftHix7xadE/tkO/yIvQ+TBztM8ggKow=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007LGVOS063463
	for <meta-arago@arago-project.org>; Tue, 7 Jan 2020 15:16:31 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 7 Jan 2020 15:16:31 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 7 Jan 2020 15:16:31 -0600
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 007LGUew033898;
	Tue, 7 Jan 2020 15:16:30 -0600
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Jan 2020 20:57:04 +0000
Message-ID: <20200107205704.13230-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] arago-thud, arago-thud-next: pin meta-linaro to working commit for now
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
X-List-Received-Date: Tue, 07 Jan 2020 21:18:16 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-thud-config.txt      | 2 +-
 configs/arago-thud-next-config.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arago-thud-config.txt b/configs/arago-thud-config.txt
index aff44f2..4b3586b 100644
--- a/configs/arago-thud-config.txt
+++ b/configs/arago-thud-config.txt
@@ -8,7 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,HEAD,layers=
-meta-linaro,http://git.linaro.org/openembedded/meta-linaro.git,thud,HEAD,layers=meta-linaro-toolchain:meta-optee
+meta-linaro,http://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,thud,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/arago-thud-next-config.txt b/configs/arago-thud-next-config.txt
index d4cc6dd..5c930b1 100644
--- a/configs/arago-thud-next-config.txt
+++ b/configs/arago-thud-next-config.txt
@@ -8,7 +8,7 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud-next,HEAD,layers=
-meta-linaro,http://git.linaro.org/openembedded/meta-linaro.git,thud,HEAD,layers=meta-linaro-toolchain:meta-optee
+meta-linaro,http://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,thud,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.17.1


