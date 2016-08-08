Return-Path: <denis@denix.org>
Received: from vms173019pub.verizon.net (vms173019pub.verizon.net
	[206.46.173.19])
	by arago-project.org (Postfix) with ESMTPS id C2BE252A5B
	for <meta-arago@arago-project.org>;
	Mon,  8 Aug 2016 18:08:26 +0000 (UTC)
Received: from vz-proxy-m006.mx.aol.com ([64.236.83.10])
	by vms173019.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0OBL0043ARPNXJ10@vms173019.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 08 Aug 2016 13:08:11 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=btqxfxui c=1 sm=1 tr=0	a=pKq81LsWol7b8sI3Hpopew==:117
	a=7z1cN_iqozsA:10 a=sozttTNsAAAA:8	a=Q4-j1AaZAAAA:8 a=HihYlcsHAAAA:8
	a=NEAV23lmAAAA:8 a=iGHA9ds3AAAA:8	a=KKAkSRfTAAAA:8
	a=iF5EuHz_pmAfWI63RUkA:9
Received: by 100.15.86.14 with SMTP id 56abedf2; Mon, 08 Aug 2016 18:08:11 GMT
Received: from sam.denix (sam [192.168.0.5])	by gandalf.denix.org (Postfix)
	with ESMTP id B40361620AC;	Mon,  8 Aug 2016 14:08:10 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 08 Aug 2016 14:08:10 -0400
Message-id: <1470679690-17743-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-krogoth: un-pin meta-qt5, as _prepend fix got upstreamed
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
X-List-Received-Date: Mon, 08 Aug 2016 18:08:27 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-krogoth-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arago-krogoth-config.txt b/configs/arago-krogoth-config.txt
index acafb20..df016e8 100644
--- a/configs/arago-krogoth-config.txt
+++ b/configs/arago-krogoth-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.30,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,krogoth,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,48b4084675a15fe3fd10b58f54728dfaa2bd6c72,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,krogoth,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,krogoth,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
 meta-ti,git://git.yoctoproject.org/meta-ti,krogoth,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,krogoth,HEAD,layers=meta-linaro-toolchain
-- 
2.7.4


