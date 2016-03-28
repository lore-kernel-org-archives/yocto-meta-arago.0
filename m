Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 4ADEC529E3
	for <meta-arago@arago-project.org>;
	Mon, 28 Mar 2016 22:10:24 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O4R00DDQS912A30@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 28 Mar 2016 17:10:24 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=Q4-j1AaZAAAA:8 a=HihYlcsHAAAA:8
	a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8	a=RDYso8mk09B2LROvk7cA:9
Received: by 100.15.86.14 with SMTP id 6b1b2a6c; Mon, 28 Mar 2016 22:10:24 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 78C0A161F45;	Mon,
	28 Mar 2016 18:10:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 28 Mar 2016 18:10:13 -0400
Message-id: <1459203013-15211-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [oe-layersetup][PATCH] coresdk-2015.03: add 2015.03 release config
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
X-List-Received-Date: Mon, 28 Mar 2016 22:10:24 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2015.03-config.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2015.03-config.txt

diff --git a/configs/coresdk/coresdk-2015.03-config.txt b/configs/coresdk/coresdk-2015.03-config.txt
new file mode 100644
index 0000000..061c2a8
--- /dev/null
+++ b/configs/coresdk/coresdk-2015.03-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.26,b09966906ef054834f0b465f0c5a2a937b4c4a4c,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,master,ti2015.03,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,9bfcf79fcd824efb9f2a9bd72ecbedfee1315c96,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,a7c1a2b0e6947740758136216e45ca6ca66321fc,layers=meta-networking:meta-ruby:meta-python:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,fido,ti2015.03,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,10b71bed9cfe76baa22c72806ff814cf85c2f73b,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.2.0


