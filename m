Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 18E9652A4F
	for <meta-arago@arago-project.org>;
	Thu, 14 May 2015 14:28:36 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4EESYRm006156
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:34 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EESYjw022473
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:34 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 09:28:34 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4EESYne032441;	Thu, 14 May 2015 09:28:34 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Ysu7l-0006nm-W3;
	Thu, 14 May 2015 10:28:34 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 May 2015 10:28:21 -0400
Message-ID: <1431613705-26086-6-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
References: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 5/9] refresh-screen: Move SRC_URI to git.ti.com.
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
X-List-Received-Date: Thu, 14 May 2015 14:28:36 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/refresh-screen_2.0.bb      |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
index 09fad98..90f6ac5 100644
--- a/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/refresh-screen_2.0.bb
@@ -14,7 +14,7 @@ PR = "r9"
 SRCREV = "4c8817e28ceed2dd886761e3ec1971b11436ba33"
 BRANCH ?= "master"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/refresh-screen.git;protocol=http;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/matrix-gui-v2/refresh-screen.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


