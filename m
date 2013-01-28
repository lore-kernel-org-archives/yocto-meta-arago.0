Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by arago-project.org (Postfix) with ESMTPS id EF27252A24
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:21 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wc18so1697745obb.22
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=NdDZv/qgckgV26xKZ+HapNIvKpO5+bxzUJUDydhovis=;
	b=z4i6vJ+I8E30oNE/eEuZdKeeOUgIGNUrFm61L8UexgOHCZIZ/xTOMkiVs6mw8Cmm5C
	GjiezvCKIeCEEwpiFD3hmaRMg1yysNvGlxZ949o0MvRxP0f8TbCAbnWDna77205MGBsO
	WF1Hn2BmGhStw/SEwk2FJzXBDGwznnU0AE6u4ZGlrK0Z0sSNy16WJkwH+5uARSBQj4/H
	kj1tmEP5biX7/T880pA2BUWN6XjC9+jQg+r98cUPlZR+0vSdmV8Sg+pj0pf1SdhL6fzO
	GPOrv4YBJQQLhLnQu+24xmNBU/KgivnlRtNfBgcebDgwN1imUzBiXIYK8FGlO433qYl7
	gb1g==
X-Received: by 10.60.1.8 with SMTP id 8mr11562507oei.42.1359393981546;
	Mon, 28 Jan 2013 09:26:21 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:20 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:24 -0600
Message-Id: <1359393932-31361-24-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 24/32] oprofile-example: Use updated PACKAGE_STRIP syntax
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:22 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../oprofile-example/oprofile-example_git.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
index 79278fb..681a47d 100644
--- a/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
+++ b/meta-arago-extras/recipes-core/oprofile-example/oprofile-example_git.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://signal_parent.c;beginline=1;endline=37;md5=3c72149bb4
 
 SECTION = "system"
 
-PACKAGE_STRIP = "no"
+INHIBIT_PACKAGE_STRIP = "1"
 
-PR = "r0"
+PR = "r1"
 
 BRANCH ?= "master"
 SRCREV = "875147fcaf0706f91b1bcbf9d80821de78257955"
-- 
1.7.0.4


