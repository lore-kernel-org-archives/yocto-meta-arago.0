Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 993BB52982
	for <meta-arago@arago-project.org>;
	Fri,  5 May 2017 01:15:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v451FXaX004403
	for <meta-arago@arago-project.org>; Thu, 4 May 2017 20:15:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493946933;
	bh=twob5FRubpqHTn4HtFaOAMqnPV63A08b1bFedNu0oIQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qBf9Yti4zOq7MOb+LGdlytSRqah50BR/hV/eRnkRV1am9rNY4TSIJ04GzyuK0ikjO
	YPkH70CUHofbcYu9LFIYyI85CwETmmwW9tJdh98JMqUTxHVR9O+woyKr+QGRuCiA+r
	91Noth+ZNDissU7Q2UpwXdq5qPEXBwrOAnjljlr4=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v451FSQc009175
	for <meta-arago@arago-project.org>; Thu, 4 May 2017 20:15:28 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 4 May 2017 20:15:28 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v451FPxg023374;	Thu, 4 May 2017 20:15:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 May 2017 21:15:23 -0400
Message-ID: <1493946923-64498-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1493946923-64498-1-git-send-email-sam.nelson@ti.com>
References: <1493946923-64498-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH 2/2] arago-tisdk-addons: Add ti-ipc-examples-linux package for omap-a15
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
X-List-Received-Date: Fri, 05 May 2017 01:15:43 -0000
Content-Type: text/plain

ti-ipc-examples-linux adds binaries for examples that demonstrate Host
Linux to Slave RTOS IPC

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 9ed9bc2..6d46a8d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -55,6 +55,7 @@ UTILS_append_omap-a15 = " mmc-utils \
                           ti-ipc-rtos-fw \
                           uio-test-pruss \
                           uio-module-drv-test \
+                          ti-ipc-examples-linux \
 "
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
-- 
1.9.1


