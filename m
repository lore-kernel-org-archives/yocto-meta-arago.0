Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 67598529B6
	for <meta-arago@arago-project.org>;
	Tue, 18 Feb 2014 03:22:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1600CU39CIWRA0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 17 Feb 2014 21:21:59 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 262422008E; Mon,
	17 Feb 2014 22:21:54 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 17 Feb 2014 22:21:53 -0500
Message-id: <1392693713-1600-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [oe-layersetup][PATCH] arago-dora-config: add a config for dora-based meta-arago/meta-ti setup
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
X-List-Received-Date: Tue, 18 Feb 2014 03:22:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-dora-config.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/arago-dora-config.txt

diff --git a/configs/arago-dora-config.txt b/configs/arago-dora-config.txt
new file mode 100644
index 0000000..dc2aa12
--- /dev/null
+++ b/configs/arago-dora-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.20,HEAD,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,dora,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dora,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,dora,HEAD,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dora,HEAD,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dora,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.8.3.2


