Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C1CAD52A44
	for <meta-arago@arago-project.org>;
	Tue,  7 Aug 2018 13:24:41 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w77DOXkP056834
	for <meta-arago@arago-project.org>; Tue, 7 Aug 2018 08:24:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1533648273;
	bh=3cvIXCbMX01rsfiH988HL8AY5BSr9jaIIQHEBZihVQ4=;
	h=From:To:CC:Subject:Date;
	b=cFB/NBA7n4evWL7r3rszi/l6aBWUnvxaMAMG87OLBhDVR+wxUH0d+2Cuqn1v1/H8Y
	Eqqwn/L+B/iOh/JKdojEDVMfwPBOXq7zJLfSNBBPDOZwfJdG1AqIx5aWjyL5PzGMi/
	TlMjnDDlBTuk8qUowcO1qM+3Ntgoyoo4n3yZfFjw=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77DOXYQ024373
	for <meta-arago@arago-project.org>; Tue, 7 Aug 2018 08:24:33 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 7 Aug 2018 08:24:33 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 7 Aug 2018 08:24:33 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w77DOXIW022091;
	Tue, 7 Aug 2018 08:24:33 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1fn1yS-00047u-Th; Tue, 07 Aug 2018 09:24:32 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 7 Aug 2018 09:24:29 -0400
Message-ID: <1533648270-15829-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH 1/2] processor-sdk: add 5.0.0.15 release config
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
X-List-Received-Date: Tue, 07 Aug 2018 13:24:42 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-05.00.00.15-config.txt    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-05.00.00.15-config.txt

diff --git a/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt b/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt
new file mode 100644
index 0000000..e7a7bd4
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-05.00.00.15-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.36,d0fb46eead1f23356d8c3bd53a85047521ef29a7,layers=
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,264dc66c689e0e4212c43358382986ee470619d4,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,ti2018.01,d54e9d6c1d461dbf3189e691088d328bf4c4fb19,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,352531015014d1957d6444d114f4451e241c4d23,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
+meta-ti,git://git.yoctoproject.org/meta-ti,ti2018.01,8555084679dc5c668e5fb60a16425ca32b10ff21,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,rocko,931a52e8698f684ccbb26ddec18764ad9d9a3e8f,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


