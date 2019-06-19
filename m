Return-Path: <e-ruei1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id A5B40520E1
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 13:14:17 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JDDau5127133
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 08:13:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560950016;
	bh=fSEYgQHV8otRGHuR5gBrGATQwpXJNsuCWRW0zp6MdI4=;
	h=From:To:Subject:Date;
	b=ZUYrH2be6L0KZu/x64alnmIVl+t2YHtVwPROJeNS5HegaSXoGiGUPPJ3JAHQvdcee
	AiEP/E/lmIAjGE7TBqOQ1wnSv0ck0sD956usKwkMvg00VgBwIzCpWvPlBDjxKgrbnp
	z26kejYdoiGUD0+7VEE7QKBU6FRWmJoA46d6wLoQ=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JDDabT112398
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 08:13:36 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 08:13:35 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 08:13:35 -0500
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JDDZQO075067
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 08:13:35 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jun 2019 09:13:14 -0400
Message-ID: <20190619131314.12011-1-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/ti2019.01][PATCH] matrix-gui-apps-git:bump SRCREV to run video analytic demo over Weston
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
X-List-Received-Date: Wed, 19 Jun 2019 13:14:18 -0000
Content-Type: text/plain

Restore the video analytic demo to be run on top of Weston instead of
qt-compositor because the display problem has been fixed at Weston 5.0

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 487f1544..f4c095ed 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "2b41ee1f8e0dfe6b5f78d56e13a51aab115aaff0"
+SRCREV = "c621180046554c0a24998fea165f3abadc75c25e"
 BRANCH = "master"
-INC_PR = "r70"
+INC_PR = "r71"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
2.17.1


