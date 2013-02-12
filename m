Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by arago-project.org (Postfix) with ESMTPS id C6FD652A7D
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:39 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id i10so7035724oag.0
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=m4vg5ScwqcsB2yCa7gY3i617ScONP23UB6/byQ1r72A=;
	b=0w/l4ljKSzHPqfhArCoM2aiY/vKBS9m6N3FV9CJYoC5a55i76CqJoXIKt8zaYo7YPk
	d9NjYlnBEsP/LHXIluA7HYXCzk7zGnI9KY6FOByZfIlE6/jGU4bFtzuCTjyzkCjn7D6S
	aJQSacGg4D0+G+UONVVrXlA6XKR+0ZxdBts1YRVgwhy7MSwXrVABuiEEvSxPZKS1+8Yb
	7EL1eFb0gVAGsXCnaHafJlLa++LFYvE9lcyrCSRZyqirQvyYtSm134BHzlXw4FlhUaJq
	skBKA0+QP7CHPKPtTs8atlj8QEJrtsEkDdMA5efPSj1aBTOI67nRQRysxHu2clYbw3LF
	SgDw==
X-Received: by 10.60.19.36 with SMTP id b4mr12399583oee.44.1360629998896;
	Mon, 11 Feb 2013 16:46:38 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.37
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:37 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:08 -0600
Message-Id: <1360629979-24789-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 07/18] arago.conf: Add SUPPORTS_SGX variable
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:40 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add SUPPORTS_SGX variable to arago.conf.
* Create a variable that specifies if a board or device has SGX support.
* This will determine which tasks are pulled in to various filesystem and SDK
  images.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 8330115..691c5b8 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -45,9 +45,12 @@ PREFERRED_VERSION_hostap-daemon = "2.0-devel-ti"
 PREFERRED_VERSION_omap3-sgx-modules = "4.08.00.01"
 PREFERRED_VERSION_libgles-omap3 = "4.08.00.01"
 
-ARAGO_QT_PROVIDER = "qt4-embedded"
-# Enable Qt+GLES for ARM v7a devices
-ARAGO_QT_PROVIDER_armv7a = "qt4-embedded-gles"
+SUPPORTS_SGX = "YES"
+
+# No omapl138 variant includes SGX
+SUPPORTS_SGX_omapl138 = "NO"
+
+ARAGO_QT_PROVIDER = "${@base_conditional('SUPPORTS_SGX', 'YES', 'qt4-embedded-gles', 'qt4-embedded', d)}"
 
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
-- 
1.7.0.4


