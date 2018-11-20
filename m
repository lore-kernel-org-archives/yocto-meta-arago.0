Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 77F7752A19
	for <meta-arago@arago-project.org>;
	Tue, 20 Nov 2018 02:57:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5991C40AE2;
	Tue, 20 Nov 2018 02:57:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id OOepZkhRYy3e; Tue, 20 Nov 2018 02:57:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 27A5740A18;
	Tue, 20 Nov 2018 02:57:22 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id ABB7D165C0C;
	Mon, 19 Nov 2018 21:57:22 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 19 Nov 2018 21:57:21 -0500
Message-Id: <1542682641-12651-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-thud-config.txt: add initial config for thud release
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
X-List-Received-Date: Tue, 20 Nov 2018 02:57:34 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-thud-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/arago-thud-config.txt

diff --git a/configs/arago-thud-config.txt b/configs/arago-thud-config.txt
new file mode 100644
index 0000000..44a6bae
--- /dev/null
+++ b/configs/arago-thud-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.40,HEAD,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,HEAD,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,thud,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


