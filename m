Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by arago-project.org (Postfix) with ESMTPS id 51A9852A99
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:20 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id h2so3035879oag.21
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KMVjKykClHWTq8qTFqU3GgVlhrFv8VI0YdmGvQcYuQU=;
	b=PMwDVzJTPHd+zfvnV+A+HRsaeX92Voh5TAiMqUNtXQBBf/gkfy3STIwGvDBTqyKfPo
	XdKYtqC2x5P0r0XHKJRq9VNVpu+cTLooYrRPAdTwVRFT7RWjgZ6YYyVxjxzYl4Suoi2L
	1HRI3mh53abT7t49p3JKV35Dqc0Kz5IH+Tgt94pmhXC5cEghoLoMfJ3amIdwTJe8Eotu
	j1Ga95RQnk05iXPELLBJNzWjsZJTkDB0slGvoS/2gXniQZkekE3fDOnpkwXleJr8bGfb
	/jqywq+gOZVVAvWFTVX7+Ek9/abOGGWJ5XpxvGtS7DtVDAaOgJAAciXLSbk8HCfqz8kP
	4w4A==
X-Received: by 10.60.0.136 with SMTP id 8mr11709503oee.35.1359393979868;
	Mon, 28 Jan 2013 09:26:19 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.18
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:18 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:23 -0600
Message-Id: <1359393932-31361-23-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 23/32] dosfstools: Increase FAT partition size and large file support
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:20 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add large file and partition support.
* Previously fat partitions were limited to 1GB.
* Adding CFLAGS to fix the file and partition size limit.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../dosfstools/dosfstools_2.11.bbappend            |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/dosfstools/dosfstools_2.11.bbappend

diff --git a/meta-arago-extras/recipes-devtools/dosfstools/dosfstools_2.11.bbappend b/meta-arago-extras/recipes-devtools/dosfstools/dosfstools_2.11.bbappend
new file mode 100644
index 0000000..52a539b
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/dosfstools/dosfstools_2.11.bbappend
@@ -0,0 +1,5 @@
+PR_append = "-arago0"
+
+# Add large file support and increase allowable FAT partition size.
+CFLAGS_append = " -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64"
+CFLAGS_append_libc-uclibc = ' ${@base_contains("DISTRO_FEATURES", "largefile", "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64", "", d)}'
-- 
1.7.0.4


