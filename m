Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 42A7E529F8
	for <meta-arago@arago-project.org>;
	Mon,  2 Oct 2017 20:47:40 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v92KlUDR005328
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 15:47:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506977250;
	bh=tfFZZwcM0fFXo/UJooo6kFVHfiX0v7yJGECLCXJQKt4=;
	h=From:To:CC:Subject:Date;
	b=Qv+IYPWnMGSiz/3B6E6KHX2XQlyMZsDs4Et22Dt4DmpVjuppmhsIZyRYJjJ+o4hjq
	wcEL03i6qYj/v1XER+cL2R2TL30SwUjpnGQg80Mm+EJqfdVc8TpZTbBymDaW7ipg60
	xgL6RcHcIR5Q1p7365IR/8ynfcRGC6lT/vp5TfH0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92KlPCS008299
	for <meta-arago@arago-project.org>; Mon, 2 Oct 2017 15:47:25 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Mon, 2 Oct 2017 15:47:24 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Mon, 2 Oct 2017 15:47:24 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v92KlO5Y009899;
	Mon, 2 Oct 2017 15:47:24 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Oct 2017 16:47:23 -0400
Message-ID: <1506977243-6298-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] coresdk-2017.04-config: add config for 2017.04 release
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
X-List-Received-Date: Mon, 02 Oct 2017 20:47:40 -0000
Content-Type: text/plain

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2017.04-config.txt |   13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 configs/coresdk/coresdk-2017.04-config.txt

diff --git a/configs/coresdk/coresdk-2017.04-config.txt b/configs/coresdk/coresdk-2017.04-config.txt
new file mode 100644
index 0000000..e340920
--- /dev/null
+++ b/configs/coresdk/coresdk-2017.04-config.txt
@@ -0,0 +1,13 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.32,32a249cf33f79b579a2cf6224c7d23cdb20d376f,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.04,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,972cab7ca2402eafbe6d7f5be9756c2d225755b7,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,git://git.yoctoproject.org/meta-ti,morty,ti2017.04,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,morty,6c6a06bb806ecd496bb1c3ad723f074ccb454076,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-arago64.conf.sample
-- 
1.7.9.5


