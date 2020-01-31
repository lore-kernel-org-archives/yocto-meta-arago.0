Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id DF37F529DF
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2020 22:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A379840BDA;
	Fri, 31 Jan 2020 22:30:11 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id D6QO3ISBbK9N; Fri, 31 Jan 2020 22:30:11 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8A46D4096B;
	Fri, 31 Jan 2020 22:30:10 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 4401F170F48;
	Fri, 31 Jan 2020 17:30:10 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 31 Jan 2020 17:30:09 -0500
Message-Id: <1580509809-37563-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] coresdk-2019.06-config: add config for 2019.06 release
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
X-List-Received-Date: Fri, 31 Jan 2020 22:32:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2019.06-config.txt | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2019.06-config.txt

diff --git a/configs/coresdk/coresdk-2019.06-config.txt b/configs/coresdk/coresdk-2019.06-config.txt
new file mode 100644
index 0000000..1cbc915
--- /dev/null
+++ b/configs/coresdk/coresdk-2019.06-config.txt
@@ -0,0 +1,14 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
+meta-arago,git://arago-project.org/git/meta-arago.git,thud,ti2019.06,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,thud,ti2019.06,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,thud,e68991ceb5933f7d03b96697e8a0ba0829feb320,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


