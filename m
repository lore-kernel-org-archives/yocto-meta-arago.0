Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by arago-project.org (Postfix) with ESMTPS id 8969B5299F
	for <meta-arago@arago-project.org>;
	Wed,  3 Aug 2016 00:00:27 +0000 (UTC)
Received: from vz-proxy-m008.mx.aol.com ([64.236.83.1])
	by vms173007.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBB00D5Y3ZZFS70@vms173007.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 02 Aug 2016 19:00:09 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=IfeYs1eZmZ/JIJO4DN4ZPw==:117
	a=iGHA9ds3AAAA:8 a=7z1cN_iqozsA:10	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8
	a=HihYlcsHAAAA:8 a=NEAV23lmAAAA:8	a=KKAkSRfTAAAA:8
	a=9G4higdtcPzW7MCTOfYA:9
Received: by 100.15.86.14 with SMTP id 7a789df8; Wed, 03 Aug 2016 00:00:09 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id DC53A161B38;	Tue,  2 Aug 2016 19:59:58 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 02 Aug 2016 19:59:58 -0400
Message-id: <1470182398-30979-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] configs/{krogoth, master}: meta-ti to use git.yoctoproject.org server
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
X-List-Received-Date: Wed, 03 Aug 2016 00:00:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-krogoth-config.txt | 2 +-
 configs/arago-master-config.txt  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arago-krogoth-config.txt b/configs/arago-krogoth-config.txt
index 6e5aead..acafb20 100644
--- a/configs/arago-krogoth-config.txt
+++ b/configs/arago-krogoth-config.txt
@@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,1.30,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,krogoth,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,HEAD,layers=meta-linaro-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,krogoth,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
diff --git a/configs/arago-master-config.txt b/configs/arago-master-config.txt
index bddb205..b06a7b9 100644
--- a/configs/arago-master-config.txt
+++ b/configs/arago-master-config.txt
@@ -5,7 +5,7 @@ bitbake,git://git.openembedded.org/bitbake,master,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,master,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,master,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,master,HEAD,layers=meta-linaro-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,master,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
2.7.4


