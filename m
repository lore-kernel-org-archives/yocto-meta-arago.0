Return-Path: <g-tammana@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 6210A520EA
	for <meta-arago@arago-project.org>;
	Wed, 14 Oct 2020 21:11:17 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09EL8ELX029427
	for <meta-arago@arago-project.org>; Wed, 14 Oct 2020 16:08:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602709694;
	bh=qF2ZJ6bo1JT+t8AQfmYCMVcPsJ5QJ/jss73uqbn7X2Q=;
	h=From:To:CC:Subject:Date;
	b=qfliQU8lwGxAk232Un5fF5REMTPGo1HTzW2qcG4vOuBHr5XwskOqMGj8r3Clyy3LM
	suvQxi4IuU2jNrgzwSss3TNbl/3lPlqI6nyUhum0QdN1+S7isVQ7jXr8cKk5AW+IaW
	6VtYQi645M80FerA9Q7J+atbzyYF1WLQ6OMZCvHQ=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09EL8Ewq118186
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 14 Oct 2020 16:08:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 14 Oct 2020 16:08:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 14 Oct 2020 16:08:14 -0500
Received: from lelv0597.itg.ti.com (lelv0597.itg.ti.com [10.181.64.32])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09EL8E0r048191;
	Wed, 14 Oct 2020 16:08:14 -0500
Received: from uda0271916b.dhcp.ti.com (uda0271916b.dhcp.ti.com
	[128.247.81.246] (may be forged))
	by lelv0597.itg.ti.com (8.14.7/8.14.7) with ESMTP id 09EL8D25079827;
	Wed, 14 Oct 2020 16:08:13 -0500
From: Gowtham Tammana <g-tammana@ti.com>
To: <meta-arago@arago-project.org>, Denys Dmytriyenko <denys@ti.com>, Dan
	Murphy <dmurphy@ti.com>
Date: Wed, 14 Oct 2020 16:08:12 -0500
Message-ID: <20201014210812.12609-1-g-tammana@ti.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [dunfell/master][PATCH] img-pvr-sdk: update arm64 wayland bins
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
X-List-Received-Date: Wed, 14 Oct 2020 21:11:17 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
---
 .../recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index d1f9e059..6c9953d0 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -7,9 +7,9 @@ CLEANBROKEN = "1"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
-SRCREV = "bb8b74cdd1323e76697b3eb2258f863b15fee287"
+SRCREV = "e52592c843ad16be31db411b85c4059d82c4a6b9"
 
-PR = "r18"
+PR = "r19"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x|k3"
 
-- 
2.17.1


