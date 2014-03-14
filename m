Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id A7950529B6
	for <meta-arago@arago-project.org>;
	Fri, 14 Mar 2014 04:44:28 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N2E00KO9T5EDT50@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 13 Mar 2014 23:44:13 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9AC6220092; Fri,
	14 Mar 2014 00:44:02 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 14 Mar 2014 00:44:02 -0400
Message-id: <1394772242-3501-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [oe-layersetup][PATCH] coresdk-2013.12.01: lock down and use release tags for meta-ti and meta-arago
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
X-List-Received-Date: Fri, 14 Mar 2014 04:44:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2013.12.01-config.txt | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/coresdk/coresdk-2013.12.01-config.txt b/configs/coresdk/coresdk-2013.12.01-config.txt
index 810e1bd..5494aea 100644
--- a/configs/coresdk/coresdk-2013.12.01-config.txt
+++ b/configs/coresdk/coresdk-2013.12.01-config.txt
@@ -2,11 +2,11 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,master,bbb4fa427739912ff3b87379bf629066f6662458,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,ti2013.12.x,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/meta-arago.git,ti2013.12.x,ti2013.12.01,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,cefaba69a785c5221463f0eb496b749d5ddf8a5a,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,dylan,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,dylan,cb182019c4f7485713cb50623240c01882448ffd,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-ti,git://arago-project.org/git/meta-ti.git,dylan,ti2013.12.01,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,dylan,c9f78d6eff14ada3f2bc960e81883b27a10afecc,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,dylan,HEAD,layers=meta
+oe-core,git://git.openembedded.org/openembedded-core,dylan,c3f1bedb2494a2465db23a4d89b9f998db953f0d,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.8.3.2


