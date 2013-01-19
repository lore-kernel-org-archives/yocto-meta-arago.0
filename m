Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by arago-project.org (Postfix) with ESMTPS id DD08052ABB
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:42 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp18so4848900obc.15
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=1NgZBGasIoLVb9sT/8fn+5QAOkmltZ1WvS00iJgtyGU=;
	b=Eyj4tCYq94nei7NHL59ueiCTiArRmpWe7uZ3rja4jA5a54pe2MpAL8JNZ34qOk90LE
	MHKrgNQVvi2/Iu80TcyMEep+/yapqeWcmG1YU6lrf413yl6PPvAVe7NNtiONi8toWdk3
	JRvikMN/Ta6umBI9sDVgBUrdFCFOiP2RuF36XGBM3cyVTPby7E38vA9n8qal9NYl2fVD
	XyJCQYsWTeEIPtYLjoNYn6EoHNbkxryXN1ic1SXAjOqHPQtFkn6+twHdVgiHKBgQsaLC
	kQX5JaHCamVXBdwSPl+1ckTZwrQQbql3kUl7NP/w9O2TltwRHtAv3Pfcx9TtUgZDcXIA
	a/0w==
X-Received: by 10.60.19.161 with SMTP id g1mr10654971oee.117.1358632362377;
	Sat, 19 Jan 2013 13:52:42 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.40
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:41 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:48 -0600
Message-Id: <1358632316-12266-23-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 23/31] task-arago-tisdk-matrix: Fix syntax for am180x-evm for MATRIX_APPS_append
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:43 -0000

---
 .../recipes-core/tasks/task-arago-tisdk-matrix.bb  |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
index 3169026..2656c4c 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-matrix.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to include Matrix v2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r6"
+PR = "r7"
 
 inherit task
 
@@ -92,7 +92,7 @@ MATRIX_APPS_append_am37x-evm = "    \
     matrix-gui-wifi-battleship-demo \
 "
 
-RDEPENDS_append_am180x-evm = "      \
+MATRIX_APPS_append_am180x-evm = "   \
     matrix-gui-wifi-demos           \
     matrix-gui-bluetooth-demos      \
     matrix-gui-wifi-direct-demo     \
-- 
1.7.0.4


