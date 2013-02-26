Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by arago-project.org (Postfix) with ESMTPS id 04AE652A8F
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:10 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id m1so4414620oag.26
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PfKecffAB5Tzqg/CDeesWHGk1kAGNKxd86sBJogUzDI=;
	b=l5EOYUwCdAnK0o6dumpnEXAMAS9zZk51gr7lJbUCVTdw+2LlviXcPkgV2wuF0cMttW
	coDnI/tyrsoqiZeuWFScL7TEXz7xp6l0Ae1RzR7EtWvxzHzLLPvKjSQN95r1cEg0O2bO
	YpacShp6VCjMvbq0SbQBCY+A+jxQAwrPAbm+BS5Fa4XFPgl425gSAjJMUalCqlgLNd8L
	YrZ7ulL/iVu+pwJr3a4cx1Qmrsl5uTmWrcdpjDA9jpFSf9PsxCJv5YcBb9pFYQn6vsvF
	b0rHM1lDL7JQRVa5h/pftwFXQVt56MYOWFhFzht44JN+BfycJSxpd46QUGeiZXSCmtHb
	a+uA==
X-Received: by 10.60.170.20 with SMTP id ai20mr150251oec.33.1361849590509;
	Mon, 25 Feb 2013 19:33:10 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.33.08
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:33:09 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:50 -0600
Message-Id: <1361849574-7710-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361849574-7710-1-git-send-email-fcooper@ti.com>
References: <1361849574-7710-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 06/10] packagegroup-arago-tisdk-matrix: Add PRU Matrix demos for am180x-evm
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:11 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-tisdk-matrix.bb             |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
index 46c9a2a..2093178 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-matrix.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
-PR = "r10"
+PR = "r11"
 
 inherit packagegroup
 
@@ -96,6 +96,7 @@ MATRIX_APPS_append_am180x-evm = "   \
     matrix-gui-bluetooth-demos      \
     matrix-gui-wifi-direct-demo     \
     matrix-gui-wifi-battleship-demo \
+    matrix-gui-pru-demos            \
 "
 
 RDEPENDS_${PN} = "        \
-- 
1.7.0.4


