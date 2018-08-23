Return-Path: <x0038811@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 62A0B52A4A
	for <meta-arago@arago-project.org>;
	Thu, 23 Aug 2018 07:48:22 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7N7mEMW067483
	for <meta-arago@arago-project.org>; Thu, 23 Aug 2018 02:48:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535010494;
	bh=tLKNWNjZzbhYNM45R7YMoKAw5XfuMm3aSRWrlHn4Lzs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=ozRfRlc1BmgvGVQHZOu4SF8ROHb6t7yT12oeEPhRHnB0FRU4+dqZ+qDbjpVF/KeY6
	LFccg7JAHRcRVTTZty3LVJrYPyXcWCc6GsjuI/BANOJC3xPFq9IckekHcRfmQ4mXuW
	z2oAmK42Ee6DA05tvcAUA/tBpe/UDYhEexnVSZvM=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N7mEiP028578
	for <meta-arago@arago-project.org>; Thu, 23 Aug 2018 02:48:14 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 23 Aug 2018 02:48:14 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 23 Aug 2018 02:48:14 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7N7mBPR026238;
	Thu, 23 Aug 2018 02:48:13 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Aug 2018 13:18:09 +0530
Message-ID: <1535010489-14848-2-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1535010489-14848-1-git-send-email-x0038811@ti.com>
References: <1535010489-14848-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 1/1] example-applications: Update SRCREV
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
X-List-Received-Date: Thu, 23 Aug 2018 07:48:22 -0000
Content-Type: text/plain

This update adds a new wayland client application to example-application
repositiory to demonstrate glReadPixels() featcure with wayland display.

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index e44bee9..3e2452f 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -14,9 +14,9 @@ inherit autotools pkgconfig
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
 "
 
-SRCREV="6197386b99383849fbf7c1017d2420742860a88c"
+SRCREV="52466430609c402a9f1c0667ccf727d096336d0d"
 
-PR = "r51"
+PR = "r52"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/glsdkstatcoll
-- 
1.9.1


