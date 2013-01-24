Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by arago-project.org (Postfix) with ESMTPS id 223B652A74
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:36 +0000 (UTC)
Received: by mail-ob0-f177.google.com with SMTP id wc20so8694342obb.8
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zAVMJDvCrD848qxhENBccn7tK8d9HSw3Zeo5sKEoc3Q=;
	b=qoOvkiRWHJTlbNJY0imtqRyD5pwQ4XALHJ6o1HhgNtKIuryyO+hyIyB2FWqtd8yIai
	UmHGaZ12YKcaX+flDC2AHHDk1tJWPChzc6XuLjoZRTWozR2QlST19z5Ob93PPJce9Ksb
	YjJ+Nq1rqnQRDTNmbuO/g7pkGyLb4e3x0eQcHGnjDT3kzXP2zVs8jGhMWCgPQDe5vetg
	SAcXP9Dbq8z5hA10pf/b0WzPOezi4uT/d9BSVDrx95WXypoKwSAx0+4icqzjPgt3ic7z
	WUnMC1TUVCH21+1FTsKS9+bW/XdQUZt6GUYhB8WimLCAH/WzpTnImpkhhzPb4kp1j9fV
	XOkA==
X-Received: by 10.60.32.37 with SMTP id f5mr1577794oei.19.1359037295599;
	Thu, 24 Jan 2013 06:21:35 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.33
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:34 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:09 -0600
Message-Id: <1359037281-12610-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 35/47] arago.conf: Remove commercial license whitelisting
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:36 -0000

* Remove whitelisting for recipes with a commercial licence flag due to
  commercial licensing restrictions.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |   12 ++++--------
 1 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index e8265a0..c0e06ae 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -85,11 +85,7 @@ POLKITAUTH = ""
 # Enable generation of source packages for SDKs
 require arago-source-ipk.conf
 
-# Whitelist several recipes that have commercial licenses
-# Need to verify with legal that the following recipes are ok to distribute
-# with the SDK
-LICENSE_FLAGS_WHITELIST = "\
-    commercial_gst-plugins-ugly \
-    commercial_mpeg2dec \
-    commercial_lame \
-"
+# Set ENTERPRISE_DISTRO flag to insure that recipes that have been flagged 
+# do not attempt to enable features that have potential commercial
+# licensing issues.
+ENTERPRISE_DISTRO = "1"
-- 
1.7.0.4


