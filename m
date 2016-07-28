Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 88FA9529F1
	for <meta-arago@arago-project.org>;
	Thu, 28 Jul 2016 17:04:28 +0000 (UTC)
Received: from vz-proxy-m003.mx.aol.com ([64.236.83.2])
	by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OB10028PBEN8D80@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 28 Jul 2016 12:04:09 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=EDCZS3Slg7tGr17y9w9vtg==:117
	a=cAmyUtKerLwA:10 a=sozttTNsAAAA:8	a=Q4-j1AaZAAAA:8 a=HihYlcsHAAAA:8
	a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8	a=VG8tWVyoPSWjoNX224UA:9
Received: by 100.15.86.14 with SMTP id 5a707678; Thu, 28 Jul 2016 17:04:08 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id D8EBB1620BD;	Thu, 28 Jul 2016 13:03:57 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 28 Jul 2016 13:03:57 -0400
Message-id: <1469725437-7974-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-krogoth-config: pin down meta-qt5 before _prepend bug
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
X-List-Received-Date: Thu, 28 Jul 2016 17:04:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-krogoth-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arago-krogoth-config.txt b/configs/arago-krogoth-config.txt
index 562828a..6e5aead 100644
--- a/configs/arago-krogoth-config.txt
+++ b/configs/arago-krogoth-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.30,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,HEAD,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,HEAD,layers=meta-linaro-toolchain
-- 
2.7.4


