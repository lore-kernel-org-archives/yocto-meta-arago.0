Return-Path: <jake@udc0866934>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 29AEB52978
	for <meta-arago@arago-project.org>;
	Mon, 24 Jul 2017 17:03:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6OH3Mpb002096
	for <meta-arago@arago-project.org>; Mon, 24 Jul 2017 12:03:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1500915802;
	bh=NUzxzDAIiROHQocUtdUh+RDFSWUjFdBavNhui4w7b0c=;
	h=From:To:CC:Subject:Date;
	b=ko+rsPAVbSHDBUduPtauJOgV6y1O7WuULyqqHfYsC0uqsiifczrpK2YeD2TKGB5dQ
	rZ8+Z4OSe7SiON/L8ui32UdW8lvEZpwN1ZulUpaqYjL4nF/xj4lIyq7P7GUPK7xCD5
	mcSTQaUny+xbUPuiP7e7NcEQ2NXhTHdi1aonKqZ0=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6OH3MqZ004545
	for <meta-arago@arago-project.org>; Mon, 24 Jul 2017 12:03:22 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 24 Jul 2017 12:03:22 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6OH3Mvd016649;
	Mon, 24 Jul 2017 12:03:22 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1dZglN-0007fL-VS; Mon, 24 Jul 2017 13:03:22 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 24 Jul 2017 13:03:20 -0400
Message-ID: <1500915800-29435-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [oe-layersetup][PATCH] processor-sdk-morty-config: add config for morty baseline
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
X-List-Received-Date: Mon, 24 Jul 2017 17:03:23 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/processor-sdk/processor-sdk-morty-config.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-morty-config.txt

diff --git a/configs/processor-sdk/processor-sdk-morty-config.txt b/configs/processor-sdk/processor-sdk-morty-config.txt
new file mode 100644
index 0000000..49d4957
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-morty-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,HEAD,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,git://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


