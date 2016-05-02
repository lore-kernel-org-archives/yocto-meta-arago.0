Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 7B355529A4
	for <meta-arago@arago-project.org>;
	Mon,  2 May 2016 16:25:30 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.157])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O6K00C875LF8290@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 02 May 2016 11:25:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=EDyElNE8DnJcdewKkuvZJw==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=Q4-j1AaZAAAA:8 a=HihYlcsHAAAA:8
	a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8	a=XoG7oBKwI_eaF7JT5cwA:9
Received: by 100.15.86.14 with SMTP id 1672c3df; Mon, 02 May 2016 16:25:06 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1FE8D161FD2;	Mon,
	2 May 2016 12:24:51 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 02 May 2016 12:24:50 -0400
Message-id: <1462206290-24002-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [oe-layersetup][PATCH] arago-krogoth-config: add config for krogoth release
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
X-List-Received-Date: Mon, 02 May 2016 16:25:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

For now only bitbake and oe-core are used from the release branch. Other will follow.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/{arago-master-config.txt => arago-krogoth-config.txt} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 copy configs/{arago-master-config.txt => arago-krogoth-config.txt} (83%)

diff --git a/configs/arago-master-config.txt b/configs/arago-krogoth-config.txt
similarity index 83%
copy from configs/arago-master-config.txt
copy to configs/arago-krogoth-config.txt
index bddb205..76f8caa 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-krogoth-config.txt
@@ -1,12 +1,12 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
+bitbake,git://git.openembedded.org/bitbake,1.30,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,master,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
+oe-core,git://git.openembedded.org/openembedded-core,krogoth,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.2.0


