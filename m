Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id B3E5E52986
	for <meta-arago@arago-project.org>;
	Tue, 14 Jan 2014 21:10:50 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.18.138.84])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MZE00HYQTI0WX40@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 14 Jan 2014 15:10:49 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A8D7320076; Tue,
	14 Jan 2014 16:10:48 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 14 Jan 2014 16:10:42 -0500
Message-id: <1389733843-16055-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [oe-layersetup][PATCH] coresdk-2013.12.01: add config for point release, unlock some layers
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
X-List-Received-Date: Tue, 14 Jan 2014 21:10:51 -0000

From: Denys Dmytriyenko <denys@ti.com>

Unlock meta-ti, meta-arago, as well as meta-openembedded and oe-core to pull
in new fixes.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2013.12.01-config.txt |   12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2013.12.01-config.txt

diff --git a/configs/coresdk/coresdk-2013.12.01-config.txt b/configs/coresdk/coresdk-2013.12.01-config.txt
new file mode 100644
index 0000000..810e1bd
--- /dev/null
+++ b/configs/coresdk/coresdk-2013.12.01-config.txt
@@ -0,0 +1,12 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,ti2013.12.x,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
+oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.7.9.5


