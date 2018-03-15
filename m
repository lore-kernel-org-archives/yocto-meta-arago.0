Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7770F529F2
	for <meta-arago@arago-project.org>;
	Thu, 15 Mar 2018 20:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B8EBB20B99;
	Thu, 15 Mar 2018 20:27:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 7O8fEjhLSkp5; Thu, 15 Mar 2018 20:27:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8A01E20862;
	Thu, 15 Mar 2018 20:27:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 05B4E163325;
	Thu, 15 Mar 2018 16:27:19 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Mar 2018 16:27:15 -0400
Message-Id: <1521145636-51889-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH 1/2] matrix-gui-hmi-demos: RDEPENDS on bash
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
X-List-Received-Date: Thu, 15 Mar 2018 20:28:15 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
index f2ea2ed..933a002 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-hmi-demos_2.0.bb
@@ -19,11 +19,13 @@ PACKAGES = "matrix-hmi-demo-evse \
 "
 
 RDEPENDS_matrix-hmi-demo-evse = " \
+    bash \
     ${HMI_RDEPENDS} \
     evse-hmi \
 "
 
 RDEPENDS_matrix-hmi-demo-protection-relays = " \
+    bash \
     ${HMI_RDEPENDS} \
     protection-relays-hmi \
 "
-- 
2.7.4


