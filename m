Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id EAD3752988
	for <meta-arago@arago-project.org>;
	Tue, 31 Mar 2020 19:27:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 74FBD40C1F;
	Tue, 31 Mar 2020 19:25:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id QhLa9hATmQmc; Tue, 31 Mar 2020 19:25:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 57A7140A35;
	Tue, 31 Mar 2020 19:25:13 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id A623316DE83;
	Tue, 31 Mar 2020 15:25:12 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 31 Mar 2020 15:25:12 -0400
Message-Id: <1585682712-50924-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-dunfell-config: add initial config for dunfell release
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
X-List-Received-Date: Tue, 31 Mar 2020 19:27:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

For now only meta-qt5 branched off, other layers still use master.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-dunfell-config.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/arago-dunfell-config.txt

diff --git a/configs/arago-dunfell-config.txt b/configs/arago-dunfell-config.txt
new file mode 100644
index 0000000..42527b5
--- /dev/null
+++ b/configs/arago-dunfell-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,master,HEAD
+meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dunfell,HEAD,layers=
+meta-selinux,git://git.yoctoproject.org/meta-selinux,master,HEAD,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,master,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers-zeus-browser.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


