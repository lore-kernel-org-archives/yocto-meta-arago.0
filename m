Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by arago-project.org (Postfix) with ESMTPS id BA36E52A12
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:28 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id i18so6995665oag.1
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=mdbpzSVtHG+j4HrXJ2mpOroteCHh5qBr1GG68k7KNds=;
	b=eUOLQ96KpgFQNQuuxAH/BMaCnGWzoSylZBXGzjX+bxlk89s86zQPOmi5Jy7iYAZJtc
	jLxWOAJFg38pIbFJdNr0Vth+CIbFUHYoeGgjCZGREUblbUnsVWFslD4GZzvtw414wC4H
	+mlDl6J22KGprgaRs1cyhvfh5XgSNGp9gSTNRyVj3mJc2J7F7PyxykiK2ydXlsvsANjL
	CB6CJUTNi1rm+jPyn6t1byEEBGuAjR+B7xmrllLVBs2fAIKTP/wG7Eh0KHgdA6tf6rzp
	3do11uMUefZrgq2A70IPWW2AdiYYpqENgAo+5UNnMpli3/Y/B9q3RszB5XhuSWQ+JJkf
	Y6tQ==
X-Received: by 10.60.170.232 with SMTP id ap8mr12150755oec.29.1360629987690;
	Mon, 11 Feb 2013 16:46:27 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.24
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:26 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:02 -0600
Message-Id: <1360629979-24789-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 01/18] linux-libc-headers: Add linux-libc-headers version 2.6.37.2
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:29 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add linux-libc-headers version 2.6.37.2 which is needed by machines who use a
  2.6.37 kernel.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux-libc-headers_2.6.37.2.bb                 |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb

diff --git a/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
new file mode 100644
index 0000000..5c00af5
--- /dev/null
+++ b/meta-arago-extras/recipes-kernel/linux-libc-headers/linux-libc-headers_2.6.37.2.bb
@@ -0,0 +1,10 @@
+require recipes-kernel/linux-libc-headers/linux-libc-headers.inc
+
+FILESEXTRAPATHS_append := "${THISDIR}/${PN}:${COREBASE}/meta/recipes-kernel/linux-libc-headers/${PN}"
+
+PR = "r1"
+
+SRC_URI += " file://connector-msg-size-fix.patch"
+SRC_URI[md5sum] = "89f681bc7c917a84aa7470da6eed5101"
+SRC_URI[sha256sum] = "2920c4cd3e87fe40ebee96d28779091548867e1c36f71c1fc3d07e6d5802161f"
+
-- 
1.7.0.4


