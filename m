Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 92B64529A7
	for <meta-arago@arago-project.org>;
	Fri, 24 Apr 2015 18:25:20 +0000 (UTC)
Received: from gandalf.denix.org ([108.28.31.169]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NNB00GPYPT7EWD0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 24 Apr 2015 13:24:54 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=B/MOC1ok c=1 sm=1 tr=0	a=fMO+sUsoiA3cqMJ/JkSOnA==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=e9J7MTPGsLIA:10
	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8	a=HihYlcsHAAAA:8 a=NEAV23lmAAAA:8
	a=4D75wMKgTkKMlfsMM8UA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 65C0720076;	Fri,
	24 Apr 2015 14:24:43 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 24 Apr 2015 14:24:43 -0400
Message-id: <1429899883-18420-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH][oe-layersetup] arago-daisy-config: bump bitbake to 1.26 for lightweight tag fixes
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
X-List-Received-Date: Fri, 24 Apr 2015 18:25:20 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-daisy-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arago-daisy-config.txt b/configs/arago-daisy-config.txt
index b92cf9e..ed70faf 100644
--- a/configs/arago-daisy-config.txt
+++ b/configs/arago-daisy-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.24,HEAD,layers=
+bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,daisy,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
-- 
2.2.0


