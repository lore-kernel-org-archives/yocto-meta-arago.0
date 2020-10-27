Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 14B4F52986
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2020 18:44:28 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09RIfLKI056344
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 13:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603824081;
	bh=mbAfpal3xxMOK/HyIUOe0cic6uIEcwK8mOoZJhqK8Lg=;
	h=From:To:CC:Subject:Date;
	b=trnlihRdHVRx/HidJjNmNchBDPZDNOoF9RIObk6QRsxtKKx2qsIZtEsyAu/4ZWfKc
	6Uh8zgCiKMkXJM7faoGKZzA2zjYCncBnJyY9zdpOWYekvQeYoqhA5zAVtPCUcVG3lp
	92P4dSm7YB9BXDroB/4WATeisedLddxZ6mwsVH0g=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09RIfLji105557
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2020 13:41:21 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 27 Oct 2020 13:41:21 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 27 Oct 2020 13:41:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09RIfKLB093829;
	Tue, 27 Oct 2020 13:41:21 -0500
From: Dan Murphy <dmurphy@ti.com>
To: <denys@ti.com>, <meta-arago@arago-project.org>
Date: Tue, 27 Oct 2020 13:41:15 -0500
Message-ID: <20201027184115.23835-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] oe-layer-setup: Clean up -next configs that are no longer supported
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
X-List-Received-Date: Tue, 27 Oct 2020 18:44:28 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Dan Murphy <dmurphy@ti.com>

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 configs/arago-morty-next-config.txt     | 14 --------------
 configs/arago-morty-next-rel-config.txt | 14 --------------
 configs/arago-rocko-next-config.txt     | 13 -------------
 configs/arago-thud-next-config.txt      | 14 --------------
 4 files changed, 55 deletions(-)
 delete mode 100644 configs/arago-morty-next-config.txt
 delete mode 100644 configs/arago-morty-next-rel-config.txt
 delete mode 100644 configs/arago-rocko-next-config.txt
 delete mode 100644 configs/arago-thud-next-config.txt

diff --git a/configs/arago-morty-next-config.txt b/configs/arago-morty-next-config.txt
deleted file mode 100644
index a8553522860d..000000000000
--- a/configs/arago-morty-next-config.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty-next,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty-next,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/arago-morty-next-rel-config.txt b/configs/arago-morty-next-rel-config.txt
deleted file mode 100644
index dfd6f473b672..000000000000
--- a/configs/arago-morty-next-rel-config.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty-next-rel,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,morty-next-rel,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/arago-rocko-next-config.txt b/configs/arago-rocko-next-config.txt
deleted file mode 100644
index 01b1c66442ea..000000000000
--- a/configs/arago-rocko-next-config.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,1.36,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,rocko-next,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome
-meta-ti,git://git.yoctoproject.org/meta-ti,rocko-next,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,HEAD,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,rocko,HEAD,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
diff --git a/configs/arago-thud-next-config.txt b/configs/arago-thud-next-config.txt
deleted file mode 100644
index 5c930b1dab54..000000000000
--- a/configs/arago-thud-next-config.txt
+++ /dev/null
@@ -1,14 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,1.40,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,thud-next,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
-meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
-meta-ti,git://git.yoctoproject.org/meta-ti,thud-next,HEAD,layers=
-meta-linaro,http://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
-oe-core,git://git.openembedded.org/openembedded-core,thud,HEAD,layers=meta
-OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.28.0.585.ge1cfff676549


