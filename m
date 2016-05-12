Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id 99DAA52A80
	for <meta-arago@arago-project.org>;
	Thu, 12 May 2016 01:00:21 +0000 (UTC)
Received: from vz-proxy-l002.mx.aol.com ([64.236.82.148])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O7100DVWHG6YBR0@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 May 2016 20:00:06 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=hkQRW7prCrFMEwk2DGUM9Q==:117
	a=yrkiwgmsf1kA:10 a=sozttTNsAAAA:8	a=Q4-j1AaZAAAA:8 a=HihYlcsHAAAA:8
	a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8	a=oTr5iKUAbshDkryknSoA:9
Received: by 100.15.86.14 with SMTP id 2d0b7485; Thu, 12 May 2016 01:00:06 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id D5B5D161FDF;	Wed,
	11 May 2016 21:00:05 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 May 2016 21:00:05 -0400
Message-id: <1463014805-23729-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [oe-layersetup][PATCH] arago-krogoth-config: switch remaining layers to krogoth branch
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
X-List-Received-Date: Thu, 12 May 2016 01:00:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-krogoth-config.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/arago-krogoth-config.txt b/configs/arago-krogoth-config.txt
index 031ffa2..562828a 100644
--- a/configs/arago-krogoth-config.txt
+++ b/configs/arago-krogoth-config.txt
@@ -2,11 +2,11 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.30,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,master,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=meta-linaro-toolchain
+meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,HEAD,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,HEAD,layers=meta-linaro-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,krogoth,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.2.0


