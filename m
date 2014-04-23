Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id E437E52A1E
	for <meta-arago@arago-project.org>;
	Wed, 23 Apr 2014 19:43:00 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I00LXG1EUUW21@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 14:42:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CA62E204E2; Wed,
	23 Apr 2014 15:42:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 15:42:27 -0400
Message-id: <1398282148-11547-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398282148-11547-1-git-send-email-denis@denix.org>
References: <1398282148-11547-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 4/5] arago-denzil-config: remove denzil-specific config
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
X-List-Received-Date: Wed, 23 Apr 2014 19:43:01 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-denzil-config.txt | 11 -----------
 1 file changed, 11 deletions(-)
 delete mode 100644 configs/arago-denzil-config.txt

diff --git a/configs/arago-denzil-config.txt b/configs/arago-denzil-config.txt
deleted file mode 100644
index 6a627c4..0000000
--- a/configs/arago-denzil-config.txt
+++ /dev/null
@@ -1,11 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,denzil,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,HEAD,layers=toolchain-layer:meta-oe
-meta-ti,git://arago-project.org/git/meta-ti.git,denzil,HEAD,layers=
-meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,denzil,HEAD,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,HEAD,layers=meta
-OECORELAYERCONF=./sample-files/bblayers-denzil.conf.sample
-OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.9.2


