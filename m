Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by arago-project.org (Postfix) with ESMTPS id B614452A24
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:25:43 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id dn14so3046239obc.18
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=IiU6ZpcquUrJ9U/xDqX+1LkVvOPqJba6he+UAhEc8dU=;
	b=IBZ7cmA/gOK+ETDSyCLe85Z0/iHvBO3cTbp04LL2A/vzA+VPYPTeLPl5foBoVHGeby
	yyZolOfqgXvFwC9R2tkRu5KWIFNipDViaZ37Sf8n3hEwD/gN4J6avisSmB+QvONYU9cs
	ehUwVpvjblnDhHExRWJyqBpv67vc1yAHHnVYr/Cimghp6zoat4JmJ3KtlofP8/ZXYRSI
	lKYyhtHj9mvaTBFgwSNKEF047JVo/N8Fyj5jPU63d1IAipSVPJ2F2aNVMiBkfMuRO64U
	L/dwQsU341fvQUGm9uGWuyUH98WB8u7XytxveB3+CNlkXYoE5VeSzdw4DEvSSD0vcAAb
	sd2Q==
X-Received: by 10.60.32.67 with SMTP id g3mr11589615oei.77.1359393943134;
	Mon, 28 Jan 2013 09:25:43 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.25.41
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:25:42 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:03 -0600
Message-Id: <1359393932-31361-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/32] gettext: Mimic patch "Make gettext 0.16.1 extend native and nativesdk"
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
X-List-Received-Date: Mon, 28 Jan 2013 17:25:43 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Mimic commit 6322a1b3680d2480c96433fde5a913b3bf2d09ea from oe-core.
* This patch is no longer needed when switching to oe-core master or danny
  branch.
Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/gettext/gettext_0.16.1.bbappend   |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend

diff --git a/meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend b/meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend
new file mode 100644
index 0000000..58082a6
--- /dev/null
+++ b/meta-arago-extras/recipes-core/gettext/gettext_0.16.1.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
1.7.0.4


