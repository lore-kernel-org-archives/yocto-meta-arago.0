Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gg0-f175.google.com (mail-gg0-f175.google.com
	[209.85.161.175])
	by arago-project.org (Postfix) with ESMTPS id 6F87952A89
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:55 +0000 (UTC)
Received: by mail-gg0-f175.google.com with SMTP id l1so464145ggn.20
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=8yIDw61W65tUBQ8eOCKlNLYOCYm3H+VZqxfoAY+yWYk=;
	b=sK9XDNW0bBhJFN9kQOG3D7f/Z0k11qIiJX2UhVBvj/35tSMyecLwx1tbdxlnFbWwWz
	j14UzlUycfLNOiG9YWXgX2u7QincvfL/kA2tnWb/7nMZmbJ/P4WC8hCUYdLQ0Nc5HPBC
	csIqmzrENIiQjh1MG8jl/rT42qoInIjL7N4LhLEAresAhgo8gZkW2xKPydrKwC9SciKC
	FgUU04cjrHIUnzatlCZs3abCCNJ14wMFKNkb6iFSZ6SiwQBn6AoKleoCjkF585VD4LKD
	MKq8x3/cBcavhsrhDRHXLJbMHVjmu6IaEnwUQItkpIQgKcz7YUyKNLBFCHvhiLB45Gay
	ecbw==
X-Received: by 10.236.114.13 with SMTP id b13mr17269906yhh.11.1361141634829;
	Sun, 17 Feb 2013 14:53:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.53
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:53 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:12 -0600
Message-Id: <1361141595-1687-17-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 17/20] nativesdk-packagegroup-arago-sdk-host: Fix No module named distutils
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:55 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Fix "ImportError: No module named distutils" error by adding missing package.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../nativesdk-packagegroup-arago-sdk-host.bb       |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index a6c89fd..1db12aa 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r3"
+PR = "r4"
 LICENSE = "MIT"
 
 inherit nativesdk packagegroup
@@ -8,4 +8,5 @@ RDEPENDS_${PN} = "\
     nativesdk-pkgconfig \
     nativesdk-opkg \
     nativesdk-libtool \
+    nativesdk-python-distutils \
     "
-- 
1.7.0.4


