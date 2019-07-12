Return-Path: <jake@udc0866934>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 2236F52092
	for <meta-arago@arago-project.org>;
	Fri, 12 Jul 2019 14:23:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6CEMj5k095522
	for <meta-arago@arago-project.org>; Fri, 12 Jul 2019 09:22:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562941365;
	bh=IVztAUQ4fRzCcGuvxuwCBHCUyN/XYR4SfpiPwxQqOb0=;
	h=From:To:CC:Subject:Date;
	b=YzTR3uFQVFrKAQdjYw9oIndnhpSRDbM01VQP+XHwR37aCDUmP3KUJdmEQsQwaoreb
	unFuT7EAgUrl8pM+Wir88MV0jFgRf/OlErIw45KNo/EKnT5hLGQHvRxmAZP1p94mZ3
	GATpBZgQjvamFPYasE7jVDLmmf+vN2ye0EMKYgdY=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6CEMjMn001793
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 12 Jul 2019 09:22:45 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 12 Jul 2019 09:22:45 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 12 Jul 2019 09:22:45 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6CEMiSs040821;
	Fri, 12 Jul 2019 09:22:45 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1hlwRg-0000lQ-Mc; Fri, 12 Jul 2019 10:22:44 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 12 Jul 2019 10:22:42 -0400
Message-ID: <1562941362-2902-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk: add 6.0.0.7 release config
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
X-List-Received-Date: Fri, 12 Jul 2019 14:23:42 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-06.00.00.07-config.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-06.00.00.07-config.txt

diff --git a/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt b/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt
new file mode 100644
index 0000000..09f58d3
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-06.00.00.07-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.40,4ce92f43eeac6a4bfd06e8567fa6891614b5b3b0
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,e5b633c0aa6d924ab6bea15906e3790c01c86633,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,ti2019.01,9373674c699c8ad98f8b6b3eac45473448f55e94,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,1520d5b2b2beec5e1c3209d3178219e93ef08bca,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,bbc38dc9d6d02e73c08df289bb22a292c2264e9b,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,9b3b907f30b0d5b92d58c7e68289184fda733d3e,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,ti2019.01,28a2f128fbadd37463060eb5ee40c7c9a47cc530,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,b30036d4ef7ce9fe746833fc54de6ac7b0e00638,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,thud,f162d5bfe6eaeca24f441c83c87252c8d05744fc,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


