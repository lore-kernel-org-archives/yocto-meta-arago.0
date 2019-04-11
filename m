Return-Path: <jake@udc0866934>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id C7F3A529DA
	for <meta-arago@arago-project.org>;
	Thu, 11 Apr 2019 12:29:51 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x3BCTVG8104085
	for <meta-arago@arago-project.org>; Thu, 11 Apr 2019 07:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1554985771;
	bh=LTryOUzyFypKNIC3bkXIo5p5fUi6VehH2iJiVjRF0eU=;
	h=From:To:CC:Subject:Date;
	b=nI+9FZvUxDLAcsggwIodI3bfW45vN8PdFM3m7rqjHVAbTmUaOTLdLL/AWVcIDkHzF
	7NzezTtSzyINF3s5BSoknHENM9TZSDKKz3nE7J2EG5v5gc3ZU5cqY2BXXBFchrPHXd
	6olQ1uFt56x22ORIo4guaW1OVrvw/40CuXP347nI=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x3BCTV7L092199
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 11 Apr 2019 07:29:31 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 11 Apr 2019 07:29:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 11 Apr 2019 07:29:31 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x3BCTVne094815;
	Thu, 11 Apr 2019 07:29:31 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1hEYpf-0001bm-02; Thu, 11 Apr 2019 08:29:31 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 11 Apr 2019 08:29:23 -0400
Message-ID: <1554985763-6150-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk: add 5.3.0.7 release config
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
X-List-Received-Date: Thu, 11 Apr 2019 12:29:52 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../processor-sdk/processor-sdk-05.03.00.07-config.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-05.03.00.07-config.txt

diff --git a/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt b/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt
new file mode 100644
index 0000000..f2cd5ff
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-05.03.00.07-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.36,582f1d7a8d150cf5917dfc1efa844f40131ae4bf,layers=
+meta-processor-sdk,http://arago-project.org/git/projects/meta-processor-sdk.git,master,f33a37ac6baa8155302fa1faea99f1be5461779e,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a934788109422cf409,layers=
+meta-arago,http://arago-project.org/git/meta-arago.git,rocko,d4bc00af838df7a77f4ddbd3546755c5bad5b880,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,d8b531530fa42b59aa0a5b123d87a30d749cbcc4,layers=
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,b704c689b67639214b9568a3d62e82df27e9434f,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,eae996301d9c097bcbeb8046f08041dc82bb62f8,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
+meta-ti,git://git.yoctoproject.org/meta-ti,rocko,02e852b1a069463f937ea594e13fe5f88ce9b74d,layers=
+meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,cd9ee776044a2d8943be4cb019f063271e9c684d,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,rocko,3638cb32ba9ba32b4d498fc31ab7fdf82f0d2495,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


