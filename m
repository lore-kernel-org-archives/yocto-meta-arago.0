Return-Path: <h-gou@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 5352C52A2C
	for <meta-arago@arago-project.org>;
	Fri, 18 Sep 2015 22:36:06 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t8IMa5J4006281
	for <meta-arago@arago-project.org>; Fri, 18 Sep 2015 17:36:05 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t8IMa5Go021310
	for <meta-arago@arago-project.org>; Fri, 18 Sep 2015 17:36:05 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 18 Sep 2015 17:36:04 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t8IMa4Fj026181;	Fri, 18 Sep 2015 17:36:04 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Sep 2015 18:36:02 -0400
Message-ID: <1442615762-28197-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] branding-processor-sdk: set PREFERRED_VERSION for dspdce-fw
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
X-List-Received-Date: Fri, 18 Sep 2015 22:36:06 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 meta-arago-distro/conf/distro/include/branding-processor-sdk.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
index 3ef3009..b973322 100644
--- a/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
+++ b/meta-arago-distro/conf/distro/include/branding-processor-sdk.inc
@@ -40,3 +40,6 @@ SRCIPK_SHALLOW_DEPTH_pn-linux-ti-staging = "400"
 
 SRCIPK_CUSTOM_GIT_BRANCH_pn-u-boot-ti-staging = "processor-sdk-1.0"
 SRCIPK_CUSTOM_GIT_MESSAGE_pn-u-boot-ti-staging = "${SRCIPK_GIT_COMMIT_MESSAGE}"
+
+# Set PREFERRED_VERSION of dspdce to choose recompiling firmware from git source
+PREFERRED_VERSION_dspdce-fw = "1.00.00.%+git%"
-- 
1.9.1


