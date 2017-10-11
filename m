Return-Path: <jake@udc0866934>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 24D6E52961
	for <meta-arago@arago-project.org>;
	Wed, 11 Oct 2017 16:56:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9BGu8k7027961
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 11:56:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507740968;
	bh=jkmqyWE8jC65N/G1WJwoSkXyMUb7R1shgRDs3W66Awk=;
	h=From:To:CC:Subject:Date;
	b=scXXLEajZw6cj3cdmIOcDDRWtOD2kV+jqF1wcTJepr86dayPHcK4BBoyZ2M3Z2cuC
	daUI83W2kXvlMqGZkziP2ubbDdjoAYRYhaeXIA9ch5uWlf0B5Ny+9Fp/cXBWZFwYdO
	x8mF0ippUiSJNqPoNmjWAUuwHgdDIFOVCuXvLD5M=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BGu85w023784
	for <meta-arago@arago-project.org>; Wed, 11 Oct 2017 11:56:08 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 11 Oct 2017 11:56:08 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 11 Oct 2017 11:56:08 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9BGu8WR013254;
	Wed, 11 Oct 2017 11:56:08 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1e2KIh-0001rb-VL; Wed, 11 Oct 2017 12:56:07 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 11 Oct 2017 12:55:56 -0400
Message-ID: <1507740956-7132-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk-04.01.00.06-x11: add config for experimental x11 support
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
X-List-Received-Date: Wed, 11 Oct 2017 16:56:09 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk-04.01.00.06-x11-config.txt              | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt

diff --git a/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt b/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
new file mode 100644
index 0000000..bdb8d01
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,morty-x11-experimental,25e37e074b3a5f43588b3979c84e8684efb49c85,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,morty,8f49ed67d0627a04ac72fd388fda7756273ba2d7,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
+meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,fe5c83312de11e80b85680ef237f8acb04b4b26e,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
+meta-ti,git://git.yoctoproject.org/meta-ti,morty,a18d57af8384ced25996739bb66d197c69efb77b,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,49b0f32d7e955f250b0022d1b2f403f45a2c2d9c,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,morty,e3911133ee9aad7cc3ae89faea80a097f6614fab,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


