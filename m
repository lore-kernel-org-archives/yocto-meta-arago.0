Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 4153952970
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:50:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEnMxI029237
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:49:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521470962;
	bh=AGamTzepbSr0U1HuuMgxUQqP7qvPm+H0byg6+3Um+o0=;
	h=From:To:Subject:Date;
	b=fGrT2o7LQCr9rN2Zv34eYR+c2oINclO43gP7Z6O+HMwG1sKwQK5xDJ0OVn0WxI1Qy
	HMeOYOqjwd50sTnSoiL6ri+WJWS7Jkr5T9ogVcMgceC9lK/AlYi5aqioDtcxAg3gxJ
	t0p1+ubPh560kovag9diW+p5gKBnh/P4yWBG0H9U=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEnM10032467
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:49:22 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:49:21 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:49:21 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEnLNP018252
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:49:21 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:49:20 -0400
Message-ID: <1521470960-22973-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] usb-lld-rtos: Update to version 01.00.00.13
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
X-List-Received-Date: Mon, 19 Mar 2018 14:50:20 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend

diff --git a/recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend b/recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend
new file mode 100644
index 0000000..16dd9bc
--- /dev/null
+++ b/recipes-bsp/usb-lld/usb-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.USB_LLD.01.00.00.13"
+USB_LLD_SRCREV = "bac7156bac2b11c964f67a79752e1d6178fb1e86"
+
+PV = "01.00.00.13"
+PR = "r0"
-- 
1.9.1


