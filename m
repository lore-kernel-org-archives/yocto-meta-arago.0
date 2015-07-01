Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTPS id 0C6EF52A22
	for <meta-arago@arago-project.org>;
	Wed,  1 Jul 2015 17:29:32 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173023.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NQT0042UKKUJNF0@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 01 Jul 2015 12:29:18 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=S6gku9YP c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=0gcC27t9AAAA:8 a=oR5dmqMzAAAA:8	a=-9mUelKeXuEA:10 a=zOBTXjUuO1YA:10
	a=sozttTNsAAAA:8 a=Q4-j1AaZAAAA:8	a=HihYlcsHAAAA:8 a=NEAV23lmAAAA:8
	a=KKAkSRfTAAAA:8 a=97dhl3DsuGVv6zqMvSYA:9
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id F057B161ABC;	Wed,
	1 Jul 2015 13:29:17 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 01 Jul 2015 13:29:16 -0400
Message-id: <1435771757-4156-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [oe-layersetup][PATCH 1/2] arago-fido-config: add meta-python, remove toolchain-layer
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
X-List-Received-Date: Wed, 01 Jul 2015 17:29:33 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-fido-config.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arago-fido-config.txt b/configs/arago-fido-config.txt
index 260e9bb..21d546a 100644
--- a/configs/arago-fido-config.txt
+++ b/configs/arago-fido-config.txt
@@ -4,9 +4,9 @@
 bitbake,git://git.openembedded.org/bitbake,1.26,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,master,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,HEAD,layers=toolchain-layer:meta-networking:meta-ruby:meta-oe
+meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,fido,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,HEAD,layers=meta-linaro-toolchain
 oe-core,git://git.openembedded.org/openembedded-core,fido,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-OECORELOCALCONF=./sample-files/local-arago.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.2.0


