Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 00E8452092
	for <meta-arago@arago-project.org>;
	Tue,  9 Oct 2018 14:09:46 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w99E9cBW011088
	for <meta-arago@arago-project.org>; Tue, 9 Oct 2018 09:09:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1539094178;
	bh=GG2NLPbDxFZWqPdpFjFTuqkBwa/edCPolcWFaQiUKqk=;
	h=From:To:CC:Subject:Date;
	b=k8ODBVIZ1pIdBlWUjczSaXm/nlKE6fn74OVuXdvc2D6E4iC2wRHj2/vOrYqnHClvC
	dqFyAHzYXUv9SPyMVa1PpcQ/ZNwsj0lDl4UNss8Bd0wPHwjx+fjJR7thR0T5/2XLqt
	3NU4Mh3MSVxIRq5Wcng+ofQlDz2c8EdEgw/nkZaE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w99E9ckE016570
	for <meta-arago@arago-project.org>; Tue, 9 Oct 2018 09:09:38 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 9 Oct 2018 09:09:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 9 Oct 2018 09:09:38 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w99E9b0m004998;
	Tue, 9 Oct 2018 09:09:37 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1g9shd-0008P4-De; Tue, 09 Oct 2018 10:09:37 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Oct 2018 10:09:35 -0400
Message-ID: <1539094175-32270-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk: add 5.1.0.11 release config
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
X-List-Received-Date: Tue, 09 Oct 2018 14:09:48 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-05.01.00.11-config.txt    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-05.01.00.11-config.txt

diff --git a/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt b/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
new file mode 100644
index 0000000..33c29d9
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-05.01.00.11-config.txt
@@ -0,0 +1,15 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.36,8bd16328a9332c57b03198826e22b48fadcd21d9,layers=
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,012bf1c42b1826380ca7557e5185fe88f939a93c,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,ti2018.03,85f191c83f7cd7b3b4fb6df08b22fabe24e25773,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,682ad61c071a9710e9f9d8a32ab1b5f3c14953d1,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
+meta-ti,git://git.yoctoproject.org/meta-ti,ti2018.03,3f26d1f94fbc87740fdfe33292c904e865257e81,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,75dfb67bbb14a70cd47afda9726e2e1c76731885,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,rocko,7d518d342eb67d25aa071fb08d03f06d6da576c6,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


