Return-Path: <jake@udc0866934>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id AA55052988
	for <meta-arago@arago-project.org>;
	Mon, 21 Oct 2019 21:43:54 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9LLgZmO098800
	for <meta-arago@arago-project.org>; Mon, 21 Oct 2019 16:42:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571694155;
	bh=C3OL5iWJPnlbB3rZw0oo+bgKORGuFsOYURA8obRVzuE=;
	h=From:To:CC:Subject:Date;
	b=LlEu+rzRm45QoGjKHQO0UMqD4voaUvwEP/Wqjw07duZmqmzSygC1osrOP83ggMI4y
	rntsh8cQOzof948vuyeeCcIi+FGlWcTvR+tu4b1UMQ+kCp7c0CGoTNRvMLLn4cv4tS
	tRJuQm1PqweAFUw+MarlmFZuCj7jXTGAXEgFoW+o=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9LLgZ94099393
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 21 Oct 2019 16:42:35 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 21 Oct 2019 16:42:26 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 21 Oct 2019 16:42:26 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9LLgZM9063649;
	Mon, 21 Oct 2019 16:42:35 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1iMfRi-0003Sw-Rd; Mon, 21 Oct 2019 17:42:34 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 21 Oct 2019 17:42:30 -0400
Message-ID: <1571694150-13290-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk: add 6.1.0.8 release config
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
X-List-Received-Date: Mon, 21 Oct 2019 21:43:55 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-06.01.00.08-config.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-06.01.00.08-config.txt

diff --git a/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt b/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt
new file mode 100644
index 0000000..54adc52
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-06.01.00.08-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.40,6b045e074c6fea97d4e305a5a3c8bf82135d95eb
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,0d3220f2aa26c6069df78c68bb6009a35067866c,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,ti2019.03,9736c7d3e5c4c5a823e9caa712aa27ae24a40e4e,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,2d088d252624b19df384aecc434d23afb636178f,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,ti2019.03,a65f0a338d8f4dcce902cde64fb1413727f1ac20,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,thud,cd7cf933b3235560ec71576d8f3836dff736a39f,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


