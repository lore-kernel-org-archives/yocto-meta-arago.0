Return-Path: <aparnab@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C7BB952AB7
	for <meta-arago@arago-project.org>;
	Thu,  5 Jun 2014 18:26:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s55IQstr019763
	for <meta-arago@arago-project.org>; Thu, 5 Jun 2014 13:26:54 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s55IQrr3001854
	for <meta-arago@arago-project.org>; Thu, 5 Jun 2014 13:26:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 5 Jun 2014 13:26:53 -0500
Received: from localhost.localdomain (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s55IQrql000549;	Thu, 5 Jun 2014 13:26:53 -0500
From: Aparna Balasubramanian <aparnab@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Jun 2014 13:28:26 -0500
Message-ID: <1401992906-20248-1-git-send-email-aparnab@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <rng_tools_openembedded>
References: <rng_tools_openembedded>
MIME-Version: 1.0
Subject: [PATCH] rng-tools: Update rng-tools version to 4
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
X-List-Received-Date: Thu, 05 Jun 2014 18:26:55 -0000
Content-Type: text/plain

Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
---
 .../rng-tools/{rng-tools_2.bb => rng-tools_4.bb}   |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/rng-tools/{rng-tools_2.bb => rng-tools_4.bb} (84%)

diff --git a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
similarity index 84%
rename from meta-oe/recipes-support/rng-tools/rng-tools_2.bb
rename to meta-oe/recipes-support/rng-tools/rng-tools_4.bb
index 7803b28..f620d8a 100644
--- a/meta-oe/recipes-support/rng-tools/rng-tools_2.bb
+++ b/meta-oe/recipes-support/rng-tools/rng-tools_4.bb
@@ -7,8 +7,8 @@ SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${P}.tar.gz \
            file://init \
            file://default"
 
-SRC_URI[md5sum] = "63d503191eabed630324c104cc024475"
-SRC_URI[sha256sum] = "1126f0ecc8cab3af14a562cddc5d8ffeef47df7eba34a7aadcdee35a25ec2b1e"
+SRC_URI[md5sum] = "ae89dbfcf08bdfbea19066cfbf599127"
+SRC_URI[sha256sum] = "b71bdfd4222c05e8316001556be90e1606f2a1bac3efde60153bd84e873cc195"
 
 inherit autotools update-rc.d
 
-- 
1.7.0.4


