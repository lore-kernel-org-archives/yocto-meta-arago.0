Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTP id 5C4A052A23
	for <meta-arago@arago-project.org>;
	Wed, 23 Apr 2014 19:42:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I00KMC1F7SMB0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 14:42:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id CCF9C205E8; Wed,
	23 Apr 2014 15:42:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 15:42:28 -0400
Message-id: <1398282148-11547-6-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
In-reply-to: <1398282148-11547-1-git-send-email-denis@denix.org>
References: <1398282148-11547-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 5/5] amsdk-05.06.00.00: remove denzil-specific config
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
X-List-Received-Date: Wed, 23 Apr 2014 19:43:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/amsdk/amsdk-05.06.00.00-config.txt | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 configs/amsdk/amsdk-05.06.00.00-config.txt

diff --git a/configs/amsdk/amsdk-05.06.00.00-config.txt b/configs/amsdk/amsdk-05.06.00.00-config.txt
deleted file mode 100644
index a0d453a..0000000
--- a/configs/amsdk/amsdk-05.06.00.00-config.txt
+++ /dev/null
@@ -1,10 +0,0 @@
-# This file takes repo entries in the format
-# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
-
-bitbake,git://git.openembedded.org/bitbake,master,1.15.2,layers=
-meta-arago,http://arago-project.org/git/projects/meta-arago-amsdk.git,amsdk-05.06.00.00-integration,amsdk-05.06.00.00-release,layers=meta-arago-distro:meta-arago-extras
-meta-openembedded,git://git.openembedded.org/meta-openembedded,denzil,e77646bc2cf905fd671fc5c19ab6fd17f9b94b3f,layers=toolchain-layer:meta-oe
-meta-ti,http://arago-project.org/git/projects/meta-ti-amsdk.git,amsdk-05.06.00.00-integration,amsdk-05.06.00.00-release,layers=
-oe-core,git://git.openembedded.org/openembedded-core,denzil,c15fae372cf75403facc28cf76f973b1279425dd,layers=meta
-OECORELAYERCONF=./sample-files/bblayers-denzil.conf.sample
-OECORELOCALCONF=./sample-files/local-arago.conf.sample
-- 
1.9.2


