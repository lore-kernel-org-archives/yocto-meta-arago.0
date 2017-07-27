Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 4F26052AB4
	for <meta-arago@arago-project.org>;
	Thu, 27 Jul 2017 22:28:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v6RMSK8N002858
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 17:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501194500;
	bh=1JHABixc5c7W1c47wX1NhPVxP80zruOxZr9zL59zevg=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=i9tF9u1AQ9P1+dXXVYuXPv6IVnm1FUYr69QvgEdNb1lRvIp+Ya5uut4lz0T4ETHAe
	TtIwlK+UbGbcGwm2oAfjTj/51Sn0loIz3iEa40MQfN2AEvMTkvZLtQui8CNY25W7rr
	S8hx9glf5F9G1opQSXlvKbQRdzN4OfeWaYMgJt2c=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v6RMSKOr004328
	for <meta-arago@arago-project.org>; Thu, 27 Jul 2017 17:28:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Jul 2017 17:28:19 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v6RMSJXO022464	for <meta-arago@arago-project.org>;
	Thu, 27 Jul 2017 17:28:19 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Jul 2017 18:28:12 -0400
Message-ID: <1501194495-48938-2-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
References: <1501194495-48938-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH 1/4] matrix-gui-apps-git: bump SRCREV to pick up the browser demos
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
X-List-Received-Date: Thu, 27 Jul 2017 22:28:21 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 0ae0d21..b805f5e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "7ab39e827e65c35f4e37d1142a45071f670395fe"
+SRCREV = "38afccb5335216ececa874cf4cf72a67c4164fc3"
 BRANCH = "master"
-INC_PR = "r46"
+INC_PR = "r47"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.9.1


