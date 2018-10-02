Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1E22152079
	for <meta-arago@arago-project.org>;
	Tue,  2 Oct 2018 19:32:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w92JWcfg091934
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2018 14:32:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538508758;
	bh=Z2U1A1CsnPG+1z5UxC2ir7BtOE47M3bdRAVqPqliFhs=;
	h=From:To:CC:Subject:Date;
	b=l9f/gkWjLfmENn4NZyA6t+bh5YsVY1T31riOJknCX2OUzJk5EJcjeS0ZEoZoa/N+O
	tstEjaNvYFwKyJRWCBItqKJWdIU52v2evxYxXQdi+QiH+VS6R9EVleitJGmGAHMPzX
	VR+MzCntofxXt4jbE6jlDI8xY+FlSmaC0HR4tg3w=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w92JWchF004738
	for <meta-arago@arago-project.org>; Tue, 2 Oct 2018 14:32:38 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 2 Oct 2018 14:32:38 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 2 Oct 2018 14:32:38 -0500
Received: from puget.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w92JWbcU000927;
	Tue, 2 Oct 2018 14:32:38 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 2 Oct 2018 19:28:23 +0000
Message-ID: <20181002192823.17944-1-denys@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko/master][PATCH] weston-conf: add require-input=false to weston.ini
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
X-List-Received-Date: Tue, 02 Oct 2018 19:32:48 -0000
Content-Type: text/plain

This should allow Weston to start even when no input devices are found.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-graphics/wayland/weston-conf/ti43x/weston.ini     | 3 +++
 .../recipes-graphics/wayland/weston-conf/weston.ini           | 4 +++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
index b863ba83..3fb2018a 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/ti43x/weston.ini
@@ -1,3 +1,6 @@
+[core]
+require-input=false
+
 [shell]
 locking=false
 animation=zoom
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
index 615a6045..a78a8439 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
@@ -1,3 +1,6 @@
+[core]
+require-input=false
+
 [shell]
 locking=false
 animation=zoom
@@ -7,4 +10,3 @@ startup-animation=fade
 [screensaver]
 # Uncomment path to disable screensaver
 #path=@libexecdir@/weston-screensaver
-
-- 
2.17.1


