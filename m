Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 47B7C5298A
	for <meta-arago@arago-project.org>;
	Wed,  2 Jan 2019 15:46:21 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x02Fk8Xi099408
	for <meta-arago@arago-project.org>; Wed, 2 Jan 2019 09:46:08 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1546443968;
	bh=iqWcnrc5pQgagKzsTaF9CchtFcTUwBCKN1/M/Zr1PQM=;
	h=From:To:CC:Subject:Date;
	b=BmjGSe1va3th9GbD3v4VHiegJw/YvvJZgfYxHtg0G4/eYXv+6gQF0SioHi0LOWAgn
	LIfAh1Ed1Xw5knB1uBMV+4WCxWceR24/B9fnzrTf+YKfxpfRiXXzxd79Exe2ybgZip
	85zI4CuO0fM2dKxPikq5gSwSA0LOQOy8DO5/6MLA=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x02Fk830083093
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 2 Jan 2019 09:46:08 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 2 Jan 2019 09:46:08 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 2 Jan 2019 09:46:08 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id x02Fk8If007925;
	Wed, 2 Jan 2019 09:46:08 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1geiid-0000EJ-Qs; Wed, 02 Jan 2019 10:46:07 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 2 Jan 2019 10:46:04 -0500
Message-ID: <1546443964-808-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk: add 5.2.0.10 release config
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
X-List-Received-Date: Wed, 02 Jan 2019 15:46:22 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-05.02.00.10-config.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-05.02.00.10-config.txt

diff --git a/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt b/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt
new file mode 100644
index 0000000..8a8a84d
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-05.02.00.10-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.36,0c7cf572b8350e7ec1e451d207d67f1f7ce018cb,layers=
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,378823175fb71bc7073ff4b745d62ee5b37de7bf,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,rocko,44707eb4de002040aac8444030e0f5feae238e6c,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,b704c689b67639214b9568a3d62e82df27e9434f,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,rocko,e9b069beb92f00e6947cdd0f503747774b189358,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,rocko,3638cb32ba9ba32b4d498fc31ab7fdf82f0d2495,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


