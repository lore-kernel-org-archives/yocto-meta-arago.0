Return-Path: <jake@udc0866934>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 3A90052A3C
	for <meta-arago@arago-project.org>;
	Wed, 22 Apr 2020 19:00:43 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03MIwOni101611
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2020 13:58:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1587581904;
	bh=n+V26RTkqniTKLPzQFoCrqm0Kp/mGsnJ44aCVaxr12k=;
	h=From:To:CC:Subject:Date;
	b=TUlp5+PrdsK8xEqPT2srTAqM4C+1ojXg7G7/bGSByo7Pf03H4LyltFXLdaVSNVpG5
	xRaUxex1zQVNypP+bot/zEQrYr4JnD2r8kYUvGdhZ8e7SwKm7jMZvmtlsX/xDliOg0
	NpVjEoEreSowL5fWvldTgNoyMDdAhN019iOdyJSA=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03MIwOhj043351
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 22 Apr 2020 13:58:24 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 22 Apr 2020 13:58:23 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 22 Apr 2020 13:58:24 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03MIwNUR061870;
	Wed, 22 Apr 2020 13:58:23 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1jRKZj-0004JK-Cl; Wed, 22 Apr 2020 14:58:23 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 22 Apr 2020 14:58:21 -0400
Message-ID: <1587581901-16538-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk: add 6.3.0.106 release config
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
X-List-Received-Date: Wed, 22 Apr 2020 19:00:43 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-06.03.00.106-config.txt | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-06.03.00.106-config.txt

diff --git a/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt b/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
new file mode 100644
index 0000000..35435ca
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-06.03.00.106-config.txt
@@ -0,0 +1,17 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.40,b690030efc87850951e8e3ecf4ae3c1dd1dc9b63
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,56d9d47f18eeec31a1086ca29e54b5956c46de84,layers=
+meta-aws,https://github.com/aws/meta-aws.git,thud,6432f1b38b9dcbbb55020167f5b1cfe55e858c6d,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,72068b17e4192b51e09c8dc633805a35edac8701,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,thud,70436496d2617b281c51390faa3d421814055cd6,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,5f365ef0f842ba4651efe88787cf9c63bc8b6cb3,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,e6e464c9ed9266ce46452f953c1bdcb0e7b2d95f,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,7685c7d415e0002c448007960837ae8898cd57a5,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,446bd615fd7cb9bc7a159fe5c2019ed08d1a7a93,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,thud,b27317ab4f9be931a66344ca502c7e3f4ec780e5,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,thud,615ea7561b844a3867cee4299d83d605c10b02ab,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,thud,e68991ceb5933f7d03b96697e8a0ba0829feb320,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


