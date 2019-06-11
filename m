Return-Path: <yuanzhao@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A81F4529B1
	for <meta-arago@arago-project.org>;
	Tue, 11 Jun 2019 19:31:14 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5BJUZ5Z081424
	for <meta-arago@arago-project.org>; Tue, 11 Jun 2019 14:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560281435;
	bh=hcU3Oj2QHH86RuBdGq1TlQ7MSWoo9SbcFLtYwips1ao=;
	h=From:To:CC:Subject:Date;
	b=ULphJN+DPsF34E6+tjDn212cPGfdk+UtihWNr538mkn1Wheq2ZgUqQgp/LE1sdt/8
	Vjc7KfHzHHmG+7xMRJKsPBuwj3bUU1kU0iCb5RS59jKAhWPNLmuGkatsp2JtxVoj/T
	l+qNjDIt+iH1ycIJ1gX/wPgBxvmJAd69SivxsTTI=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5BJUZbO033764
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 11 Jun 2019 14:30:35 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 11 Jun 2019 14:30:34 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 11 Jun 2019 14:30:34 -0500
Received: from sdomc-build0.hou.asp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5BJUYv8096429;
	Tue, 11 Jun 2019 14:30:34 -0500
From: Yuan Zhao <yuanzhao@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Jun 2019 14:30:11 -0500
Message-ID: <20190611193011.9057-1-yuanzhao@ti.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] tidl-api: Fix tidl-viewer x86_64 build CXXFLAGS
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
X-List-Received-Date: Tue, 11 Jun 2019 19:31:15 -0000
Content-Type: text/plain

Signed-off-by: Yuan Zhao <yuanzhao@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
index 9a2cff13..c97b3a3b 100644
--- a/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
+++ b/meta-arago-extras/recipes-ti/tidl-api/tidl-viewer_git.bb
@@ -5,7 +5,7 @@ LICENSE = "BSD"
 
 include tidl-api.inc
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 DEPENDS = "boost boost-native ti-cgt6x-native clocl-native"
 
@@ -15,6 +15,9 @@ TARGET_class-target = "arm"
 TARGET_class-native = "x86"
 TARGET_class-nativesdk = "x86"
 
+CXXFLAGS_append_class-native    = " -DPLATFORM_64BIT "
+CXXFLAGS_append_class-nativesdk = " -DPLATFORM_64BIT "
+
 EXTRA_OEMAKE = " -C ${S}/viewer \
                  TARGET=${TARGET} \
                  TARGET_ROOTDIR=${STAGING_DIR_HOST} \
-- 
2.14.1


