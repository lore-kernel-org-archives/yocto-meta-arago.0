Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 044D3529DB
	for <meta-arago@arago-project.org>;
	Thu, 24 Oct 2019 17:02:10 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9OH0qlK005814
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2019 12:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571936452;
	bh=dNzhkU6Sd6iyp4V+1HPgVVT5ndqRkx0pt6QgI+JZs/Y=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GFeYWRHfNUPy+JUxa6Jp0nB/xYUlWzJUE7XuoMjCoDBstXtQ3Y+02IK8A++DGp2w/
	UVE+6RHFViugLT8/7TCC7MsTA1cPv9sEyk1DhT1WVI6eclFZ4Vjn3Y4+9U5s/F8Uxn
	6ZjA1AhioxikN88y4zDD+HRkMTqfPXrY3vcxYa/0=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9OH0qrb029079
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 24 Oct 2019 12:00:52 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 24 Oct 2019 12:00:41 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 24 Oct 2019 12:00:41 -0500
Received: from UDA0271529.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9OH0m32129790;
	Thu, 24 Oct 2019 12:00:51 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 24 Oct 2019 12:58:11 -0400
Message-ID: <20191024165813.21958-2-a0271529@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191024165813.21958-1-a0271529@ti.com>
References: <20191024165813.21958-1-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [thud/master] [PATCH 1/3] flatbuffers: create version 1.11.0
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
X-List-Received-Date: Thu, 24 Oct 2019 17:02:11 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../{flatbuffers_1.10.0.bb => flatbuffers_1.11.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arago-extras/recipes-devtools/flatbuffers/{flatbuffers_1.10.0.bb => flatbuffers_1.11.0.bb} (94%)

diff --git a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
similarity index 94%
rename from meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
rename to meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
index 452e1e65..abcbbba5 100644
--- a/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.10.0.bb
+++ b/meta-arago-extras/recipes-devtools/flatbuffers/flatbuffers_1.11.0.bb
@@ -10,7 +10,7 @@ RDEPENDS_${PN}-dev += "${PN}-compiler"
 
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a873c5645c184d51e0f9b34e1d7cf559"
 
-SRCREV = "c0698cc33f1e534bb59c455909b88cc2726089af"
+SRCREV = "bf9eb67ab9371755c6bcece13cadc7693bcbf264"
 
 SRC_URI = "git://github.com/google/flatbuffers.git"
 
-- 
2.17.1


