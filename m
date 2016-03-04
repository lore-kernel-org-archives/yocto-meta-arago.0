Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id F093152A2E
	for <meta-arago@arago-project.org>;
	Fri,  4 Mar 2016 16:18:06 +0000 (UTC)
Received: from vz-proxy-l007.mx.aol.com ([64.236.82.151])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3I0088OVXDJL80@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 04 Mar 2016 10:17:38 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=Nc0brD34 c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=NEAV23lmAAAA:8 a=Q4-j1AaZAAAA:8
	a=HihYlcsHAAAA:8 a=KKAkSRfTAAAA:8	a=bx4o7g0SYcHKd1mDW0kA:9
Received: by 100.15.86.14 with SMTP id 742d930a; Fri, 04 Mar 2016 16:17:38 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A82BE161EF9;	Fri,
	4 Mar 2016 11:17:37 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 04 Mar 2016 11:17:37 -0500
Message-id: <1457108257-19085-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [oe-layersetup][PATCH] arago-fido-config: pin oe-core to avoid OpenSSL CVE fix that breaks crda
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
X-List-Received-Date: Fri, 04 Mar 2016 16:18:07 -0000

From: Denys Dmytriyenko <denys@ti.com>

crda uses python-m2crypto, which uses SSLv2, but latest OpenSSL CVE for DROWN
attack disables SSLv2 calls as being vulnerable. Until those dependencies are
fixed, don't pull the latest OpenSSL CVE fix for now.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-fido-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arago-fido-config.txt b/configs/arago-fido-config.txt
index cae923b..6d840ee 100644
--- a/configs/arago-fido-config.txt
+++ b/configs/arago-fido-config.txt
@@ -7,6 +7,6 @@ meta-qt5,git://github.com/meta-qt5/meta-qt5.git,jethro,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,fido,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://arago-project.org/git/meta-ti.git,fido,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,fido,HEAD,layers=meta-linaro-toolchain
-oe-core,git://git.openembedded.org/openembedded-core,fido,HEAD,layers=meta
+oe-core,git://git.openembedded.org/openembedded-core,fido,12520d7f729fe3d07c2f94b813994718edb2d987,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
 OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
2.2.0


