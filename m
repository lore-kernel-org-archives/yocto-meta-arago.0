Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B2490529A6
	for <meta-arago@arago-project.org>;
	Wed, 28 Nov 2018 18:38:51 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wASIceYd110975
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 12:38:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543430320;
	bh=VBSl60IX3okdd5g9Ut9nmyXoioXhlvHX/tx17uUSit8=;
	h=From:To:CC:Subject:Date;
	b=UeqEnqZI9Nfwb6hhYaSURp6nOhMvEP1g2ykvyMpQ0BCM7XU3Vy3VyDLiXcXDMowyw
	a0VwZLv9wbG49VAQEycUy2PMATyZuYyIFcxWzzqCaVZii/sazjxADMJz1tPiBbCY2w
	H4QrJRxnn1gXmgabSOdqCs/VUsnCAxXDIFL+ifMs=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wASIceu1053027
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 28 Nov 2018 12:38:40 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 28 Nov 2018 12:38:40 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 28 Nov 2018 12:38:40 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wASIceqn017721;
	Wed, 28 Nov 2018 12:38:40 -0600
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1gS4jP-0006JG-QD; Wed, 28 Nov 2018 13:38:39 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 28 Nov 2018 13:38:38 -0500
Message-ID: <1543430318-24222-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [oe-layersetup][PATCH] processor-sdk-rocko-config: add meta-virtualization
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
X-List-Received-Date: Wed, 28 Nov 2018 18:38:52 -0000
Content-Type: text/plain

* And add dependent meta-filesystems from meta-openembedded.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 configs/processor-sdk/processor-sdk-rocko-config.txt | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/processor-sdk/processor-sdk-rocko-config.txt b/configs/processor-sdk/processor-sdk-rocko-config.txt
index c8b4427..6ea9a41 100644
--- a/configs/processor-sdk/processor-sdk-rocko-config.txt
+++ b/configs/processor-sdk/processor-sdk-rocko-config.txt
@@ -7,7 +7,8 @@ meta-ros,https://github.com/bmwcarit/meta-ros.git,master,e2566402ab108a19634354a
 meta-arago,http://arago-project.org/git/meta-arago.git,rocko,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,rocko,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-multimedia:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,rocko,HEAD,layers=
 meta-linaro,https://git.linaro.org/openembedded/meta-linaro.git,rocko,HEAD,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,rocko,HEAD,layers=meta
-- 
1.9.1


