Return-Path: <jake@udc0866934>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6DA8F5203A
	for <meta-arago@arago-project.org>;
	Mon,  2 Apr 2018 13:46:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w32DkZEB023529
	for <meta-arago@arago-project.org>; Mon, 2 Apr 2018 08:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1522676795;
	bh=jD4FYYRhPFOxiMXcIQ7W0D3GLx2fDxfNrCUtvVKx2fo=;
	h=From:To:CC:Subject:Date;
	b=wr4jGYh9VJFPhvMs+Nq2IWvnxaP+gfhwcWC+sTX9x768KbpPuAiCy0Rv9hmLlERZC
	jaedR1hMYjV4La0ew8+ae5MyOnLOIpouwHahgwYrU+sNbygVAdHjWjBcROCq7gI5Nx
	Jnkl0I44yfrE4VN7O7qxNz4MFOiCCsNl84YtQ6YY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w32DkZcE007471
	for <meta-arago@arago-project.org>; Mon, 2 Apr 2018 08:46:35 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 2 Apr 2018 08:46:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 2 Apr 2018 08:46:35 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w32DkZSH028341;
	Mon, 2 Apr 2018 08:46:35 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1f2zn8-0002nJ-VG; Mon, 02 Apr 2018 09:46:35 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 2 Apr 2018 09:46:33 -0400
Message-ID: <1522676793-10709-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk: add 4.3.0.5 release config
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
X-List-Received-Date: Mon, 02 Apr 2018 13:46:38 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-04.03.00.05-config.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-04.03.00.05-config.txt

diff --git a/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt b/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt
new file mode 100644
index 0000000..9837395
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-04.03.00.05-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.32,da85da9b58ed252c7b80a437fb5babff9e6dde48,layers=
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,92db4d8023d88ab59fab2953e7447ec0bd5a6db1,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,morty,5b2a44b0c4d989133bc13d59398fd10375d351bb,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome:meta-multimedia
+meta-ti,git://git.yoctoproject.org/meta-ti,morty,3dc08477529b31ce887bb22a08201a843ded48f0,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,d73e794c7e7ebb1cc5bf495a52a72b26fb118250,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,morty,39fd8c129e2bff7f2f1649b7f6e036ccc50fd5d8,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


