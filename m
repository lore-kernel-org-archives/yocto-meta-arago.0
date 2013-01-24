Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by arago-project.org (Postfix) with ESMTPS id 105B252AAF
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:57 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id ta14so1606737obb.28
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=PjX6Mw3+7J9iSyBxQ3k4YwdpORquZPzdEy7Rh5SKKBw=;
	b=pdd8nZJnHHz9ZZ38iTiWvF2Lrb8NUCObSUMY56IQWUJWs7ilHNzP82+0G9OGpNNqZF
	KZLNRUjrg+27sL1oVlR25NHy3zGDzayaYcyh0l36UufApn3/MEB8p6W8IuqMqvYCMTz0
	kXZ4HEjbPBqNQWkWAhKoOSrEgvXhCqo0N3XTWIdfiLTwgm+mLGwnYzu94SL4e8wxeyEi
	RW0KOXO2mEzWXKZ2ZIVRtA3IlsFGkqmpY5xfsCZN8fMyOd23bTO25LMtkd9Gm7FskHmo
	L+Huy7fMCE1WYEWTMZjbcL9QJzjhXgJakPg+fymuSjYaukXdvA1g8V+HgNVxNRAS1qSU
	mhuw==
X-Received: by 10.60.24.201 with SMTP id w9mr1603329oef.73.1359037316571;
	Thu, 24 Jan 2013 06:21:56 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.54
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:55 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:21 -0600
Message-Id: <1359037281-12610-16-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 47/47] matrix-gui-apps-git.inc: Update Matrix v2 applications
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:57 -0000

* Update Matrix v2 Audio Capture demo.
* Add check for soundcards
* Don't run demo if executed on the am335x starterkit

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 63e73f2..31fdf42 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "df5b70b2f7cd97148855fe4d0508789c710bcc4e"
+SRCREV = "24ed8977d232a6d706594a349549f481bd7087a4"
 BRANCH = "master"
-INC_PR = "r6"
+INC_PR = "r7"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


