Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DF8C152A4F
	for <meta-arago@arago-project.org>;
	Thu, 14 May 2015 14:28:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4EESaTm032390
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:36 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EESaEA022519
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 09:28:36 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4EESaGW032510;	Thu, 14 May 2015 09:28:36 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Ysu7n-0006nv-TD;
	Thu, 14 May 2015 10:28:35 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 May 2015 10:28:24 -0400
Message-ID: <1431613705-26086-9-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
References: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 8/9] av-examples: Move SRC_URI to git.ti.com.
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
X-List-Received-Date: Thu, 14 May 2015 14:28:38 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../av-examples/av-examples_1.0.bb                 |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
index 10c5082..65ff4f3 100644
--- a/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/av-examples/av-examples_1.0.bb
@@ -14,7 +14,7 @@ COMPATIBLE_MACHINE = "(omap3)"
 BRANCH ?= "master"
 SRCREV = "b67b11011a8a54a7598eed383f3a106c32b47c6d"
 
-SRC_URI = "git://gitorious.org/av_examples/av_examples.git;protocol=http;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/apps/av_examples.git;protocol=git;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.9.5


