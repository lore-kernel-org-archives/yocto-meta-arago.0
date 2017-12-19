Return-Path: <jake@udc0866934>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 672DA529D5
	for <meta-arago@arago-project.org>;
	Tue, 19 Dec 2017 19:18:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBJJIWvt007021
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 13:18:32 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513711112;
	bh=I365we5rSdGGtWFuhyImw+LOHJPYu/K///1K3zs2YlY=;
	h=From:To:CC:Subject:Date;
	b=ltmbn9U9koyDwZeE7PMSpLHvw7eQZ+IM2Yn0/PIe2Bl27SvuXvuvDbQQn8X6oKJDX
	HpBxVs/wEdpijfNcgQ3XTSohRmP4e52TOADXmrytKJBy1NUwgtyFm+bPXrpJcByGXV
	9qc8nTCUSfHNDDdE2afLB3sLOGEEU/0j1zSq83bw=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJJIR43023604
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 13:18:27 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 19 Dec 2017 13:18:27 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 19 Dec 2017 13:18:27 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJJIRM6007695;
	Tue, 19 Dec 2017 13:18:27 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1eRNPG-0007cW-VW; Tue, 19 Dec 2017 14:18:27 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Dec 2017 14:18:24 -0500
Message-ID: <1513711104-29260-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk: Update 4.1 x11 config
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
X-List-Received-Date: Tue, 19 Dec 2017 19:18:43 -0000
Content-Type: text/plain

* Update for various build and runtime issues

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt b/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
index bdb8d01..c68147b 100644
--- a/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
+++ b/configs/processor-sdk/processor-sdk-04.01.00.06-x11-config.txt
@@ -2,7 +2,7 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.32,887ea6d25cee5114365dfbf1130603599e13ee80,layers=
-meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,morty-x11-experimental,25e37e074b3a5f43588b3979c84e8684efb49c85,layers=
+meta-processor-sdk,git://arago-project.org/git/projects/meta-processor-sdk.git,morty-x11-experimental,cb3ee0c165ef4e71e1aad16812652ca1371a9c80,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,8f49ed67d0627a04ac72fd388fda7756273ba2d7,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,08576b03af624b65ad949c410d84c11c7d1f2e39,layers=
 meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,8a214032bfb7e8124bc1485c70c69f7d60abb819,layers=
-- 
1.9.1


