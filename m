Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id CDA1A52986
	for <meta-arago@arago-project.org>;
	Thu, 12 Dec 2013 00:14:42 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.231.138.104])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MXO00JDJ3C2H580@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 11 Dec 2013 18:14:42 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 8DA842016B; Wed,
	11 Dec 2013 19:14:26 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 11 Dec 2013 19:14:24 -0500
Message-id: <1386807264-20855-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [oe-layersetup][PATCH] coresdk-2013.12.00-config: add config for ti2013.12.00 release
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
X-List-Received-Date: Thu, 12 Dec 2013 00:14:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2013.12.00-config.txt | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2013.12.00-config.txt

diff --git a/configs/coresdk/coresdk-2013.12.00-config.txt b/configs/coresdk/coresdk-2013.12.00-config.txt
new file mode 100644
index 0000000..4facead
--- /dev/null
+++ b/configs/coresdk/coresdk-2013.12.00-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,ti2013.12.x,80b30bec4190790ad75bc7bbb24fa5707661dddf,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,44754206632dd5b0725aeb43e99e4ff9e0245dca,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,dylan,b764ba4c14d1a9ff7ff04a77de28b828880d6e8d,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dylan,32c064e567aaba18dfb07b171dde9cc43d0e6de8,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.8.3.2


