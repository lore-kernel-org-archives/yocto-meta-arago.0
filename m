Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id BCB3252A88
	for <meta-arago@arago-project.org>;
	Thu, 25 May 2017 19:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 033A620BF6;
	Thu, 25 May 2017 19:03:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id FKCnBmZ5-cPs; Thu, 25 May 2017 19:03:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DB470207BD;
	Thu, 25 May 2017 19:03:07 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 89A1F1624C8;
	Thu, 25 May 2017 15:03:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 25 May 2017 15:03:05 -0400
Message-Id: <1495738985-4472-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1495738985-4472-1-git-send-email-denis@denix.org>
References: <1495738985-4472-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 2/2] coresdk-2017.01: add config for 2017.01 release
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
X-List-Received-Date: Thu, 25 May 2017 19:03:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2017.01-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2017.01-config.txt

diff --git a/configs/coresdk/coresdk-2017.01-config.txt b/configs/coresdk/coresdk-2017.01-config.txt
new file mode 100644
index 0000000..7e74037
--- /dev/null
+++ b/configs/coresdk/coresdk-2017.01-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.01,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,morty,7d37ae2adec5cc5ea27367ce125bc7bce2310ca1,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.01,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d84874bad834657dd04ea69c35a74dd9dbd535b8,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,morty,ddf907ca95a19f54785079b4396935273b3747f6,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


