Return-Path: <karthik.ramanan@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 5066E529D2
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 11:53:50 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2GBroXT005231
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 06:53:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489665230;
	bh=RqzA7lKT9sEWmGukWUOqgKDh8rpCVokq/DvpinP8gj8=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=dDKok0x60wEuNnCNB6a/mVHl92+r/g9CD+Nl0PaYOi8Qfj2PzMhizhEyiPz9G6B6j
	yJwTvWVav3T7uhc9xmuoAmGSFUtO3/+9/D1NxqJITNf85w8QPuKx3rHZXpUSvmeC++
	YmtdIRD6OUBocCbsht+70e41++Mw1UmkPFuD73KM=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GBroOa000964
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 06:53:50 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 06:53:49 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2GBrkh6001278;
	Thu, 16 Mar 2017 06:53:49 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 16 Mar 2017 17:23:43 +0530
Message-ID: <1489665224-95346-2-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1489665224-95346-1-git-send-email-a0393906@ti.com>
References: <1489665224-95346-1-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
Subject: [morty] glsdk-example-apps: Include fix for HDMI testcases
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
X-List-Received-Date: Thu, 16 Mar 2017 11:53:50 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 .../recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
index 94c1362..3d3e155 100644
--- a/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
+++ b/meta-arago-extras/recipes-graphics/glsdk-example-apps/glsdk-example-apps.bb
@@ -14,9 +14,9 @@ inherit autotools pkgconfig
 SRC_URI = "git://git.ti.com/glsdk/example-applications.git;protocol=git \
 	 "
 
-SRCREV="8384727bef3368b95b690dd50e6735c9344a8590"
+SRCREV="f7562ecf76c559972205d7faaa3b50bdb43de238"
 
-PR = "r47"
+PR = "r49"
 
 do_install_append () {
     install -d ${D}${sysconfdir}/glsdkstatcoll
-- 
1.9.1


