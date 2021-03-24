Return-Path: <g-tammana@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 7771A529FA
	for <meta-arago@arago-project.org>;
	Wed, 24 Mar 2021 19:15:08 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12OJFQtg109475;
	Wed, 24 Mar 2021 14:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616613326;
	bh=1615ZdpfdU6O7K+T6JAZ+CrJbjxZ8kiw+vJ/F7wcGjA=;
	h=From:To:CC:Subject:Date;
	b=Gy5UAzJbfeHkE2GI9d/e32kRIG13nxtnHpu00/0qJvlIVeEIJfcu3KM5uGPZmDfkB
	78fHHfXIAPwt5eeeK/02DjiqIDAFaZmOP7ucXpIWX1L+37YW5i6K3eq2KpViOewjIu
	SO73aJoJSf+MvhKAhy5TGziEQboS8+/rchHTXL5s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12OJFQR6017842
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 24 Mar 2021 14:15:26 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 24 Mar 2021 14:15:26 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 24 Mar 2021 14:15:26 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12OJFQ8U047022;
	Wed, 24 Mar 2021 14:15:26 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.224] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 12OJFQ6M112320;
	Wed, 24 Mar 2021 14:15:26 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, <denys@konsulko.com>, Praneeth Bajjuri
	<praneeth@ti.com>
Date: Wed, 24 Mar 2021 14:15:22 -0500
Message-ID: <20210324191522.23836-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] arago.conf: enable examples pkg for qtdeclarative
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
X-List-Received-Date: Wed, 24 Mar 2021 19:15:08 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

qtdeclarative-examples package was disabled due to build issues.
Reenable it as there are no build issues now.

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 7c702814..3c715447 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -125,7 +125,7 @@ PACKAGECONFIG_append_pn-qtmultimedia = " gstreamer"
 
 # Add examples in Qt5 package configurations
 PACKAGECONFIG_append_pn-qtcharts = " examples"
-#PACKAGECONFIG_append_pn-qtdeclarative = " examples"
+PACKAGECONFIG_append_pn-qtdeclarative = " examples"
 PACKAGECONFIG_append_pn-qtlocation = " examples"
 PACKAGECONFIG_append_pn-qtmultimedia = " examples"
 PACKAGECONFIG_append_pn-qtscript = " examples"
-- 
2.31.0


