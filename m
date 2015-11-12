Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTPS id 732A452AC8
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2015 20:03:08 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173025.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NXP0002ZX03VMN0@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 12 Nov 2015 14:02:42 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=qtqOOiqGOCEA:10 a=sozttTNsAAAA:8
	a=Q4-j1AaZAAAA:8 a=HihYlcsHAAAA:8	a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
	a=29j1c5WjWDn-_df73FUA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 204F5161D10;	Thu,
	12 Nov 2015 15:02:27 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 12 Nov 2015 15:02:26 -0500
Message-id: <1447358546-16428-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [oe-layersetup][PATCH] arago-fido-config: actually pick up jethro branch instead of master
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
X-List-Received-Date: Thu, 12 Nov 2015 20:03:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Master has recently merged 5.6-alpha, which is unstable, while jethro
contains latest 5.5.1 stable instead.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-fido-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arago-fido-config.txt b/configs/arago-fido-config.txt
index 21d546a..cae923b 100644
--- a/configs/arago-fido-config.txt
+++ b/configs/arago-fido-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,fido,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,HEAD,layers=meta-linaro-toolchain
-- 
2.2.0


