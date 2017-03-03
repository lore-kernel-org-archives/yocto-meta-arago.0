Return-Path: <a0850405@a0850405-t7500>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 725C152A69
	for <meta-arago@arago-project.org>;
	Fri,  3 Mar 2017 14:26:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v23EQIEx029076
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 08:26:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1488551178;
	bh=ulJ6OttopwvHoh6ggfS0+WDh9jcE0mdxozcN1pi7pwE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WTB3yVtuZZIf+OTFG/lIEogBx1Lb7fZqSHKR+J9SSHTdH6L4WnQcSD+q9zgM9HNCl
	TwdRB6XmMWBYzkDb6JAVBz9UWnADixmI5OlY573c8bD6ov04Ve59/MlBzZPSx9eIXu
	Iqk7EEQnRdpqryfBJQBFJcQR+DlNYEzbH5mu5zEc=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23EQITC002344
	for <meta-arago@arago-project.org>; Fri, 3 Mar 2017 08:26:18 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 3 Mar 2017 08:26:17 -0600
Received: from a0850405-T7500 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v23EQH00027741;
	Fri, 3 Mar 2017 08:26:18 -0600
Received: from a0850405 by a0850405-T7500 with local (Exim 4.86_2)
	(envelope-from <a0850405@a0850405-t7500>)	id 1cjo9u-000AHI-Pz;
	Fri, 03 Mar 2017 09:26:14 -0500
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 3 Mar 2017 09:25:49 -0500
Message-ID: <1488551149-39460-2-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1488551149-39460-1-git-send-email-ceh@ti.com>
References: <1488551149-39460-1-git-send-email-ceh@ti.com>
MIME-Version: 1.0
Cc: yan-liu@ti.com
Subject: [PATCH 2/2] ltp-ddt: update to latest version
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
X-List-Received-Date: Fri, 03 Mar 2017 14:26:19 -0000
Content-Type: text/plain

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
index 3bb17c8f8535..8908092e8e09 100644
--- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
+++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20160510.bb
@@ -14,7 +14,7 @@ RDEPENDS_${PN} += "pm-qa serialcheck"
 
 inherit autotools-brokensep
 
-SRCREV = "429d12779e28e1997f656db19c5bf73edf9e9365"
+SRCREV = "7b43afae8b931541388b0a7e6f65d7ceb6d01b3e"
 BRANCH ?= "master"
 
 SRC_URI = "git://arago-project.org/git/projects/test-automation/ltp-ddt.git;branch=${BRANCH}"
-- 
2.7.4


