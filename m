Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 05E9852974
	for <meta-arago@arago-project.org>;
	Mon, 23 Jun 2014 15:21:09 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N7M008J1NYDEA60@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 23 Jun 2014 10:20:53 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B2CD520086; Mon,
	23 Jun 2014 11:20:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 23 Jun 2014 11:20:37 -0400
Message-id: <1403536837-30197-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.0
Subject: [oe-layersetup][PATCH] arago-daisy-config: add config file for Daisy
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
X-List-Received-Date: Mon, 23 Jun 2014 15:21:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-daisy-config.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/arago-daisy-config.txt

diff --git a/configs/arago-daisy-config.txt b/configs/arago-daisy-config.txt
new file mode 100644
index 0000000..899ca46
--- /dev/null
+++ b/configs/arago-daisy-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.22,HEAD,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,daisy,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,daisy,HEAD,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,daisy,HEAD,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,daisy,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
2.0.0


