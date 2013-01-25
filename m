Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by arago-project.org (Postfix) with ESMTPS id 7B988529E1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:26 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wp18so1046174obc.1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JQe5CisNqlkN6RvmPDaQj4np4zYRN/ESW8ZdXtc72nU=;
	b=KLrpIYAA+4Z6CjTcTUuaU/jien+6/Z1aSamcZvofbRHPaeMXmBN2M0ImbVuZKDCbPQ
	zf3sZ/HECeERbpokpafCLGa7kY2WGRdwWnqRa3DWh9WRJD6m9PBM6lu9hVv8wxNN7QC4
	gTjdB++zd2H+kcnHRoGAguPhyIOTYOO4VIKITRbxrIrupzTPE8Pd1ripReILeG9lEwRv
	OEOYlGPwinAI+lSmdVAjzE9OHFOojYb5o0AxQvP+NLsYVdmFgXZodpSRJ/y1lSrsSTQ7
	l/8GUAs+8a7KwPr7plM5DFVwJ8rthNLrke+iw9mE97bmvKS3mALkbQQbYM5eA0Qf6Ve6
	pIUw==
X-Received: by 10.60.10.227 with SMTP id l3mr5626677oeb.119.1359151105988;
	Fri, 25 Jan 2013 13:58:25 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.24
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:24 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:56 -0600
Message-Id: <1359150851-23602-15-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 16/31] task-arago-standalone-sdk-target: Fix PREFERRED_PROVIDER
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:26 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* A PREFERRED_PROVIDER is set for jpeg. The jpeg provider depends on the ARM
  architecture.
* Therefore, the jpeg development library to use should also depend on which
  PREFERRED_PROVIDER has been set.
* This change fixes the "Multiple .bb files are due to be built which each
  provide jpeg" due to the proper development package not being chosen.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-standalone-sdk-target.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/tasks/task-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/tasks/task-arago-standalone-sdk-target.bb
index 29b129d..cfce86e 100644
--- a/meta-arago-extras/recipes-core/tasks/task-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/tasks/task-arago-standalone-sdk-target.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Target packages for the standalone SDK"
-PR = "r1"
+PR = "r2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -21,7 +21,7 @@ RDEPENDS_${PN} = "\
     curl-dev \
     i2c-tools-dev \
     freetype-dev \
-    jpeg-dev \
+    ${@base_conditional('PREFERRED_PROVIDER_jpeg', 'libjpeg-turbo', 'libjpeg-turbo-dev', 'jpeg-dev', d)}  \
     lzo-dev \
     libopkg-dev \
     libpng-dev \
-- 
1.7.0.4


