Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 15299529CC
	for <meta-arago@arago-project.org>;
	Mon, 19 Nov 2018 19:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A06E940AE8;
	Mon, 19 Nov 2018 19:52:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id bGUCBEr3oWTL; Mon, 19 Nov 2018 19:52:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 50C1040AE0;
	Mon, 19 Nov 2018 19:52:01 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id A3AB4165BA8;
	Mon, 19 Nov 2018 14:52:00 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 19 Nov 2018 14:51:59 -0500
Message-Id: <1542657119-46946-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1542657119-46946-1-git-send-email-denis@denix.org>
References: <1542657119-46946-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 2/2] coresdk-2018.04: add config for ti2018.04 release
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
X-List-Received-Date: Mon, 19 Nov 2018 19:52:14 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2018.04-config.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2018.04-config.txt

diff --git a/configs/coresdk/coresdk-2018.04-config.txt b/configs/coresdk/coresdk-2018.04-config.txt
new file mode 100644
index 0000000..a3faa17
--- /dev/null
+++ b/configs/coresdk/coresdk-2018.04-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,rocko,ti2018.04,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-ti,git://git.yoctoproject.org/meta-ti,rocko,ti2018.04,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,rocko,7d518d342eb67d25aa071fb08d03f06d6da576c6,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


