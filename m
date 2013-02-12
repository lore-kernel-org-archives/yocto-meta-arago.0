Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by arago-project.org (Postfix) with ESMTPS id 7EAC952A25
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:41 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id i10so6921276oag.28
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=iJseZlNuJkcr2tpmx+qYO4d3ITRvrEpIVxS4w9xhWzA=;
	b=lKmxBrGtrRfuOqUe20CcISftmNICFuU4YK95FwZAos3a/wDEY39NSaTFeZ9mLP9cUs
	NaQBsubbRSCB/hj+QaUiFNVpRBDX8wk2+irgjVbP+W7fz/bW8xTyCx7ZJpZqjb4UUn2a
	8uxqyPpptQEN9BhqO3BqyzzLJ5oSlYBfGnWV9U7Li8K1E6IYdFLgeqthbSY10AckguSX
	UuGbb0C+sJXm6jmERESr27IG+3X9c2/RIJztY/6p+0QXet7QUXLIwG4b6BTaSRBvEEWx
	kLqXSIhQFPCf83ckPUxXf3M9caEz5eF7a2oblLzjZtY+cuist3j5GQRKU0wiDb8vYwIh
	4AzQ==
X-Received: by 10.60.169.203 with SMTP id ag11mr12038183oec.124.1360630000626; 
	Mon, 11 Feb 2013 16:46:40 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:39 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:09 -0600
Message-Id: <1360629979-24789-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 08/18] recipes: Only pull in SGX related tasks if SUPPORTS_SGX is set to YES
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:42 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/tisdk-rootfs-image.bb      |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index f5215d1..41254cd 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -5,6 +5,7 @@ require arago-base-tisdk-image.bb
 
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
+    ${@base_conditional('SUPPORTS_SGX', 'YES','packagegroup-arago-tisdk-graphics', '',d)} \
     packagegroup-arago-tisdk-graphics \
     packagegroup-arago-tisdk-qte \
     packagegroup-arago-tisdk-addons \
-- 
1.7.0.4


