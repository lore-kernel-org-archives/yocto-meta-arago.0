Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id 1E56852970
	for <meta-arago@arago-project.org>;
	Wed, 18 Feb 2015 20:01:02 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.89.130]) by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NJZ003Y8GWZ0BB0@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 18 Feb 2015 14:00:46 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Ko/6AtSI c=1 sm=1 tr=0	a=ckUr7rGttv+NBxkAVUaaIw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=0HtSIViG9nkA:10
	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8	a=HihYlcsHAAAA:8 a=NEAV23lmAAAA:8
	a=WqsuHfO78bQgwFywuhMA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A361920091;	Wed,
	18 Feb 2015 15:00:35 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 18 Feb 2015 15:00:35 -0500
Message-id: <1424289635-22982-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [oe-layersetup][PATCH] arago-daisy-config: bump bitbake branch from 1.22 to 1.24
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
X-List-Received-Date: Wed, 18 Feb 2015 20:01:02 -0000

From: Denys Dmytriyenko <denys@ti.com>

Recent changes in meta-qt5/master (that we need for qt-5.4) started using
bb.utils.contains_any() that was added around 1.23.1 version of bitbake.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-daisy-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arago-daisy-config.txt b/configs/arago-daisy-config.txt
index ee2c227..b92cf9e 100644
--- a/configs/arago-daisy-config.txt
+++ b/configs/arago-daisy-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.22,HEAD,layers=
+bitbake,git://git.openembedded.org/bitbake,1.24,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-- 
2.2.0


