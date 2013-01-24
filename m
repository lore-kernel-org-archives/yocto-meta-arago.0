Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by arago-project.org (Postfix) with ESMTPS id E08AC52AA5
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:37 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id n16so9922836oag.9
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=WagK6w4/GO99qq7dS5iYdnlxeIvPwVksPGtJfLyf0c8=;
	b=OxZvgkjQ4s83bkmbpaCrDoh5gCpbWpQ1/ujYLLixR4ukEnkAAKTGrJPPrR5UW9ylIy
	6IWnybApWeF+Coa/D2/cWqGmm2RQjsP6qeVFOtPTxpNKwlufyXmNkGxQgJKWuUzwMA7q
	zbTSb30sbe1RojNk0Y3sdiFIvJ/nzLnc5KMVFV2eAEp3B3QpaxIeb/CNAWAWndLtZHlR
	lbXG6RqIg11sh/Q+n4zQrjEATEIa18dQGMns1SYnZlCBhO6/pyniuo6ikwOzd8cV7ATN
	Zx7aT8LaS9I0p/0FzDyDjq3mYBV56ikRlZvUvZ+g4sLU4Exf1i/k0/H8AS+MLoz1PUOU
	SQRw==
X-Received: by 10.60.19.133 with SMTP id f5mr1592510oee.105.1359037297414;
	Thu, 24 Jan 2013 06:21:37 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:36 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:10 -0600
Message-Id: <1359037281-12610-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 36/47] arago-amsdk-image: use gz compression instead of bz2
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:38 -0000

From: Chase Maupin <Chase.Maupin@ti.com>

* Use gzip compression instead of bzip2 to save on extraction
  time.
* This has a tradeoff in file size but using bz2 takes too long
  to extract on many systems leading to a slow installation.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
index ccb25b1..9ce7754 100644
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -1,7 +1,7 @@
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58"
 
-IMAGE_FSTYPES = "tar.bz2"
+IMAGE_FSTYPES = "tar.gz"
 
 inherit tisdk-image
 
-- 
1.7.0.4


