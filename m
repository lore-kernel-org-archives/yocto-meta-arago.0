Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6C1ED52A4F
	for <meta-arago@arago-project.org>;
	Thu, 14 May 2015 14:28:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4EESXH7032384
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:33 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EESXEM032586
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 09:28:33 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4EESXnj017595;	Thu, 14 May 2015 09:28:33 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Ysu7l-0006nj-9e;
	Thu, 14 May 2015 10:28:33 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 May 2015 10:28:20 -0400
Message-ID: <1431613705-26086-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
References: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 4/9] matrix-gui: Move SRC_URI to git.ti.com.
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
X-List-Received-Date: Thu, 14 May 2015 14:28:35 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
index 7e52380..67276b2 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui_2.0.bb
@@ -20,7 +20,7 @@ SRCREV = "35029f8c4a3688ca1b176c9a91febd0e541edd15"
 
 MATRIX_INITSCRIPT = "${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DISTRO_FEATURES', 'wayland', 'init', 'init.eglfs', d), 'init', d)}"
 
-SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2.git;protocol=http;branch=${BRANCH} \
+SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2.git;protocol=git;branch=${BRANCH} \
            file://${MATRIX_INITSCRIPT} \
            file://php.ini \
            ${@base_conditional('QT_PROVIDER', 'qt5', base_contains('DISTRO_FEATURES', 'wayland', '', 'file://0001-execute_command-Stop-matrix-when-running-a-GUI-demo.patch', d), '', d)} \
-- 
1.7.9.5


