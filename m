Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 184B052B91
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 02:35:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15N2ZdkX081846;
	Tue, 22 Jun 2021 21:35:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624415739;
	bh=/4i9hPs2rlUqvlOLgUa3AbqFtgAtvNm1JgVZqdyDUfc=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=b65bm/rDem4Ue4bn2FHlaJb2suMc26xIGgLDCABiphu7zBPdvtCVKuP2lUpxvSprp
	oWNOx8Yi17434/Q0bXTWn8iv4shzcrYRm/HMIxSGm7WZjKihlXWnwuhX+JuZNEvnes
	IbPZqGbsVi0fBVdkHLezrv5baYIXoQlyyiZf2omk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15N2Zd1j061924
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Jun 2021 21:35:39 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 22 Jun 2021 21:35:39 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 22 Jun 2021 21:35:39 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15N2ZdgO067062;
	Tue, 22 Jun 2021 21:35:39 -0500
From: Nishanth Menon <nm@ti.com>
To: <praneeth@ti.com>, <yogeshs@ti.com>, <denis@denix.org>
Date: Tue, 22 Jun 2021 21:35:38 -0500
Message-ID: <20210623023538.32735-4-nm@ti.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210623023538.32735-1-nm@ti.com>
References: <20210623023538.32735-1-nm@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: [oe-layersetup PATCH 3/3] configs: *.txt: Revise meta-arago repo towards yoctoproject.org primary
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
X-List-Received-Date: Wed, 23 Jun 2021 02:35:41 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Now that yoctoproject.org git repo is live, lets move references away
from arago-project.org.

This is one of the initial cleanup steps towards eventually sunsetting
the arago-project.org

See sample-files/gitconfig.sample for examples of how to redirect
repository using older urls to new locations

Signed-off-by: Nishanth Menon <nm@ti.com>
---
 configs/arago-daisy-config.txt        | 2 +-
 configs/arago-danny-config.txt        | 2 +-
 configs/arago-denzil-config.txt       | 2 +-
 configs/arago-dora-config.txt         | 2 +-
 configs/arago-dunfell-config.txt      | 2 +-
 configs/arago-dunfell-next-config.txt | 2 +-
 configs/arago-dylan-config.txt        | 2 +-
 configs/arago-fido-config.txt         | 2 +-
 configs/arago-krogoth-config.txt      | 2 +-
 configs/arago-master-config.txt       | 2 +-
 configs/arago-morty-config.txt        | 2 +-
 configs/arago-rocko-config.txt        | 2 +-
 configs/arago-thud-config.txt         | 2 +-
 configs/arago-zeus-config.txt         | 2 +-
 configs/arago-zeus-next-config.txt    | 2 +-
 configs/latest-all-head-config.txt    | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/configs/arago-daisy-config.txt b/configs/arago-daisy-config.txt
index 944ae3c1dbda..e864b6fc36e2 100644
--- a/configs/arago-daisy-config.txt
+++ b/configs/arago-daisy-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,daisy,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,17eb158c6d2cd290b054b5bd54311aa44a02d04d,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,daisy,HEAD,layers=
diff --git a/configs/arago-danny-config.txt b/configs/arago-danny-config.txt
index b3efb76348b3..44555004f363 100644
--- a/configs/arago-danny-config.txt
+++ b/configs/arago-danny-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,1.17.0,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,danny,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,danny,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,danny,HEAD,layers=toolchain-layer:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,danny,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,danny,HEAD,layers=
diff --git a/configs/arago-denzil-config.txt b/configs/arago-denzil-config.txt
index 818e4222bea9..079a8862ffb4 100644
--- a/configs/arago-denzil-config.txt
+++ b/configs/arago-denzil-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,denzil,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,denzil,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,HEAD,layers=toolchain-layer:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,denzil,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,HEAD,layers=
diff --git a/configs/arago-dora-config.txt b/configs/arago-dora-config.txt
index d4f4de9bf639..1e8fa5d891bf 100644
--- a/configs/arago-dora-config.txt
+++ b/configs/arago-dora-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.20,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dora,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,dora,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dora,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dora,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,dora,HEAD,layers=
diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
index 173499bb3f8e..464b835b7a30 100644
--- a/configs/arago-dunfell-config.txt
+++ b/configs/arago-dunfell-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
diff --git a/configs/arago-dunfell-next-config.txt b/configs/arago-dunfell-next-config.txt
index 9f5eeb9a83e7..9657a727fda1 100644
--- a/configs/arago-dunfell-next-config.txt
+++ b/configs/arago-dunfell-next-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.46,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,dunfell-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 # meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 # meta-python2,git://git.openembedded.org/meta-python2,dunfell,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
diff --git a/configs/arago-dylan-config.txt b/configs/arago-dylan-config.txt
index 3054a9dd7630..094ff0972dbf 100644
--- a/configs/arago-dylan-config.txt
+++ b/configs/arago-dylan-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,dylan,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,dylan,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,dylan,HEAD,layers=
diff --git a/configs/arago-fido-config.txt b/configs/arago-fido-config.txt
index 86a40773045e..42fd873b46cc 100644
--- a/configs/arago-fido-config.txt
+++ b/configs/arago-fido-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,fido,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,fido,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,fido,HEAD,layers=
diff --git a/configs/arago-krogoth-config.txt b/configs/arago-krogoth-config.txt
index 731a69d3a946..731c6ee2009d 100644
--- a/configs/arago-krogoth-config.txt
+++ b/configs/arago-krogoth-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.30,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,krogoth,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,krogoth,HEAD,layers=
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index f989ee125734..07886793a7ab 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 #meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
diff --git a/configs/arago-morty-config.txt b/configs/arago-morty-config.txt
index f4014fd3a988..c5b945d92a6e 100644
--- a/configs/arago-morty-config.txt
+++ b/configs/arago-morty-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
diff --git a/configs/arago-rocko-config.txt b/configs/arago-rocko-config.txt
index 14038aab407a..660d152599c0 100644
--- a/configs/arago-rocko-config.txt
+++ b/configs/arago-rocko-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.36,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,rocko,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,rocko,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome
diff --git a/configs/arago-thud-config.txt b/configs/arago-thud-config.txt
index 5df05738172a..8637289501f1 100644
--- a/configs/arago-thud-config.txt
+++ b/configs/arago-thud-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.40,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,thud,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,thud,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
 meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,HEAD,layers=
diff --git a/configs/arago-zeus-config.txt b/configs/arago-zeus-config.txt
index d33b277c5164..56b466788884 100644
--- a/configs/arago-zeus-config.txt
+++ b/configs/arago-zeus-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,zeus,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,zeus,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,zeus,HEAD,layers=
 meta-selinux,git://git.yoctoproject.org/meta-selinux,zeus,HEAD,layers=
diff --git a/configs/arago-zeus-next-config.txt b/configs/arago-zeus-next-config.txt
index 5377781692ba..9771c9df831d 100644
--- a/configs/arago-zeus-next-config.txt
+++ b/configs/arago-zeus-next-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.44,HEAD
-meta-arago,git://arago-project.org/git/meta-arago.git,zeus-next,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,zeus-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,zeus,HEAD,layers=
 meta-selinux,git://git.yoctoproject.org/meta-selinux,zeus,HEAD,layers=
diff --git a/configs/latest-all-head-config.txt b/configs/latest-all-head-config.txt
index aeb634d07ac0..0cf6c50130f4 100644
--- a/configs/latest-all-head-config.txt
+++ b/configs/latest-all-head-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://git.yoctoproject.org/meta-arago,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-angstrom,git://github.com/Angstrom-distribution/meta-angstrom.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=toolchain-layer:meta-oe:meta-gpe:meta-gnome:meta-efl:meta-xfce:meta-systemd:meta-multimedia:meta-initramfs
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
-- 
2.32.0


