Return-Path: <h-gou@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8DAC852988
	for <meta-arago@arago-project.org>;
	Wed,  3 Jan 2018 19:38:47 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w03JckAX000383
	for <meta-arago@arago-project.org>; Wed, 3 Jan 2018 13:38:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515008326;
	bh=P/u3YSWciNxBn8++rX8WteZQ3hBqV9kZNQDV+J5j52U=;
	h=From:To:CC:Subject:Date;
	b=bhqJ5QC2OIVbwenquahIlRARJEEFoOvapoQRykrMlMsj8loRZoARovJG5GhQVRfkG
	DKDpNM76iBYsvUNHh1ja+wW0jW52mYtGHsurB18wsPQD0fKr4IEFD1rrfy8qIdWpnJ
	MoP1oy6g3VZT80tO6ptnAmtcUVPMIcqA45EGTTPQ=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w03JckDp031521
	for <meta-arago@arago-project.org>; Wed, 3 Jan 2018 13:38:46 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 3 Jan 2018 13:38:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 3 Jan 2018 13:38:46 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w03Jck8R002508;
	Wed, 3 Jan 2018 13:38:46 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 3 Jan 2018 14:38:40 -0500
Message-ID: <1515008320-2265-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [oe-layersetup] [PATCH] processor-sdk-04.02.00.09: add Processor SDK 4.2.0.9 release config
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
X-List-Received-Date: Wed, 03 Jan 2018 19:38:48 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../processor-sdk/processor-sdk-04.02.00.09-config.txt   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 configs/processor-sdk/processor-sdk-04.02.00.09-config.txt

diff --git a/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt b/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt
new file mode 100644
index 0000000..e9f5272
--- /dev/null
+++ b/configs/processor-sdk/processor-sdk-04.02.00.09-config.txt
@@ -0,0 +1,16 @@
+# This file takes repo entries in the format
+# repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
+
+bitbake,git://git.openembedded.org/bitbake,1.32,5f5e13bacde95a93633f621ec6b94a022c476a58,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,master,eaac60268857bc56bf89625df93935a272b63341,layers=
+meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e01c6ace0d4f9d700449edad3781e9cd505b5e10,layers=
+meta-arago,git://arago-project.org/git/meta-arago.git,morty,d34c861f846f35d089e1caf224ec43079be7b202,layers=meta-arago-distro:meta-arago-extras
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
+meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
+meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,2c9f0e4eb0e9097f6f872ec1e1d81768a8ab5f1b,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,b40116cf457b88a2db14b86fda9627fb34d56ae6,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome:meta-multimedia
+meta-ti,git://git.yoctoproject.org/meta-ti,morty,351ccf1928a18c2b69fd19b09b980c9aa3af2e26,layers=
+meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,5d2cb685217794293ea2bab18d7e62019c329d06,layers=meta-linaro-toolchain:meta-optee
+oe-core,git://git.openembedded.org/openembedded-core,morty,1718f0a6c1de9c23660a9bebfd4420e3c4ed37e6,layers=meta
+OECORELAYERCONF=./sample-files/bblayers.conf.sample
+OECORELOCALCONF=./sample-files/local-processor-sdk-64.conf.sample
-- 
1.9.1


