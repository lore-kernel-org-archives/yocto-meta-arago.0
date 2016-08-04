Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id AA31E52A7A
	for <meta-arago@arago-project.org>;
	Thu,  4 Aug 2016 22:35:57 +0000 (UTC)
Received: from vz-proxy-m001.mx.aol.com ([64.236.83.14])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBE00GNOPFNM260@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 04 Aug 2016 17:35:57 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=MJxOpqxZADbEbEImuSX/mw==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=Q4-j1AaZAAAA:8 a=HihYlcsHAAAA:8
	a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8	a=0nkqcwn4NtTMHTo71dwA:9
Received: by 100.15.86.14 with SMTP id 6975404a; Thu, 04 Aug 2016 22:35:57 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id BFBA61620AC;	Thu,  4 Aug 2016 18:35:46 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 04 Aug 2016 18:35:46 -0400
Message-id: <1470350146-24577-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-2016.02: add config for CoreSDK ti2016.02 release
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
X-List-Received-Date: Thu, 04 Aug 2016 22:35:57 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2016.02-config.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2016.02-config.txt

diff --git a/configs/coresdk/coresdk-2016.02-config.txt b/configs/coresdk/coresdk-2016.02-config.txt
new file mode 100644
index 0000000..f9e03f2
--- /dev/null
+++ b/configs/coresdk/coresdk-2016.02-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.30,25859009b710cb35ac8f9ee9eb3a7305f9e13402,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,ti2016.02,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,247b1267bbe95719cd4877d2d3cfbaf2a2f4865a,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,krogoth,ti2016.02,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,krogoth,dd330056ace289c8a9c5d77b6bb6e860b9f0913e,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.7.4


