Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 189ED52AB6
	for <meta-arago@arago-project.org>;
	Tue, 19 Aug 2014 16:46:07 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JGk6ZN006984
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:06 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JGk6wh001762
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:46:06 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 11:46:06 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7JGk5H1007725;	Tue, 19 Aug 2014 11:46:05 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7JGjsqN017239;	Tue, 19 Aug 2014 22:16:03 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Aug 2014 11:45:52 -0500
Message-ID: <1408466752-4458-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408466752-4458-1-git-send-email-fcooper@ti.com>
References: <1408466752-4458-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 8/8] wayland: Updated commit for Wayland 1.5.0
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
X-List-Received-Date: Tue, 19 Aug 2014 16:46:07 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Newer version of Weston requires newer version of Wayland

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wayland/wayland_1.5.0.bbappend                 |    3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/wayland_1.5.0.bbappend

diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland_1.5.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/wayland_1.5.0.bbappend
new file mode 100644
index 0000000..47ff4db
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/wayland/wayland_1.5.0.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+SRCREV = "b24fa4c8216e3f0f7b644c7b8c6949925f19ada9"
-- 
1.7.9.5


