Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 98F1C52B92
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 02:35:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15N2Zd3M129652;
	Tue, 22 Jun 2021 21:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624415739;
	bh=6omLl6XSGLRnVv1LUV20OX+7biX/F2+/I+zV1BuJqeA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oOE28jukzdkRXAdkt73V94JnwvarCmfjpp+pp7aWQt9GpCRbRw345vuXE8aHzyvqZ
	nKjPrCRlVk4oakJejIdTgNsfNAhQbUg7wdeRF9f0g6yus3l1I1A6d2ZgbIdiz0jUFS
	PQDLDw4E1sjpUJ7NKJB5YtVwDDxEJDYsl2l1TgeQ=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15N2ZdUN017168
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Jun 2021 21:35:39 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 22 Jun 2021 21:35:39 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 22 Jun 2021 21:35:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15N2ZduK063754;
	Tue, 22 Jun 2021 21:35:39 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denis@denix.org>
Date: Tue, 22 Jun 2021 21:35:37 -0500
Message-ID: <20210623023538.32735-3-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210623023538.32735-1-nm@ti.com>
References: <20210623023538.32735-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup PATCH 2/3] configs: Redirect older meta-ti to yoctoproject primary repo
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
X-List-Received-Date: Wed, 23 Jun 2021 02:35:40 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Redirect the older meta-ti references from arago-project to yoctoproject
primary repository.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 configs/arago-daisy-config.txt     | 2 +-
 configs/arago-danny-config.txt     | 2 +-
 configs/arago-denzil-config.txt    | 2 +-
 configs/arago-dora-config.txt      | 2 +-
 configs/arago-dylan-config.txt     | 2 +-
 configs/arago-fido-config.txt      | 2 +-
 configs/latest-all-head-config.txt | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/configs/arago-daisy-config.txt b/configs/arago-daisy-config.txt
index 5b5bb841b140..944ae3c1dbda 100644
--- a/configs/arago-daisy-config.txt
+++ b/configs/arago-daisy-config.txt
@@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,daisy,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,daisy,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-danny-config.txt b/configs/arago-danny-config.txt
index 88334d244c87..b3efb76348b3 100644
--- a/configs/arago-danny-config.txt
+++ b/configs/arago-danny-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,danny,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,HEAD,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,danny,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,danny,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,HEAD,layers=
 oe-core,git://git.openembedded.org/openembedded-core,danny,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-denzil-config.txt b/configs/arago-denzil-config.txt
index 6a627c45a828..818e4222bea9 100644
--- a/configs/arago-denzil-config.txt
+++ b/configs/arago-denzil-config.txt
@@ -4,7 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,denzil,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,HEAD,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,denzil,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,HEAD,layers=
 oe-core,git://git.openembedded.org/openembedded-core,denzil,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers-denzil.conf.sample
diff --git a/configs/arago-dora-config.txt b/configs/arago-dora-config.txt
index 84366c254fbb..d4f4de9bf639 100644
--- a/configs/arago-dora-config.txt
+++ b/configs/arago-dora-config.txt
@@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,1.20,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,dora,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dora,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dora,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dora,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,dora,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dora,HEAD,layers=meta-linaro-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dora,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-dylan-config.txt b/configs/arago-dylan-config.txt
index 7fcd48dc47ad..3054a9dd7630 100644
--- a/configs/arago-dylan-config.txt
+++ b/configs/arago-dylan-config.txt
@@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf6290
 meta-arago,git://arago-project.org/git/meta-arago.git,dylan,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,dylan,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,HEAD,layers=meta-linaro-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-fido-config.txt b/configs/arago-fido-config.txt
index 2fe6152ad847..86a40773045e 100644
--- a/configs/arago-fido-config.txt
+++ b/configs/arago-fido-config.txt
@@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,fido,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,fido,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,fido,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,HEAD,layers=meta-linaro-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/latest-all-head-config.txt b/configs/latest-all-head-config.txt
index f6f164bd5897..aeb634d07ac0 100644
--- a/configs/latest-all-head-config.txt
+++ b/configs/latest-all-head-config.txt
@@ -4,7 +4,7 @@ bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-angstrom,git://github.com/Angstrom-distribution/meta-angstrom.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=toolchain-layer:meta-oe:meta-gpe:meta-gnome:meta-efl:meta-xfce:meta-systemd:meta-multimedia:meta-initramfs
-meta-ti,git://arago-project.org/git/meta-ti.git,master,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
2.32.0


