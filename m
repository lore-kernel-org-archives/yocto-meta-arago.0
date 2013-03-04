Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by arago-project.org (Postfix) with ESMTPS id EE2E652ACB
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:50 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id wd20so2102788obb.23
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=5FR3MN8dvlPezFSPsoLVlG+dX1DvtHiQv+xqFYd26/I=;
	b=lkbCAJAgTOlXhSZ88IfqSKUG6TJozuQKWDMHYKRrQnZW/Gd77uDLssXIEWqSxEzMiN
	JR6mDgh7lalKHVFSyK2c7JDzh2m7i4kNPa/QBgiz5+PWUWVG+sGXNQ2oxRCXoUynbZon
	EKJjwUGmPMcbmrQHmGyKhu5J99aMOgi7VjORWb0NU4WErwk1e1VJUPxesG+iFK53OScX
	raUPAwRNEKQsToFPnrC31JIEYBjdCXtxo4wEK/Uy89hjhpvPWPpKUhRFyV7NpxXPl/I3
	n7YrDDN1Re4rh5JSsAgDmyO5NCq88aWN9j2Lgq/c03unuFDg3pw1r7i6TDoWgYyo5uAV
	jlqA==
X-Received: by 10.60.170.20 with SMTP id ai20mr17215159oec.33.1362427310476;
	Mon, 04 Mar 2013 12:01:50 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.48
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:49 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:27 -0600
Message-Id: <1362427289-18057-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 08/10] arago.conf: Enable white list gst-ffmpeg
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:51 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Gst-ffmpeg is flagged as having a commercial license.
* For an Arago SDK mp3, and dolby related libraries can't be enabled by
  default unless special procedures are followed.
* Since we disable these troublesome pieces of software shipping gst-ffmpeg
  shouldn't be a problem as long as we continue to disable any software that
  legal tells us is problematic.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 575e89a..295c34c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -110,3 +110,9 @@ require arago-source-ipk.conf
 # do not attempt to enable features that have potential commercial
 # licensing issues.
 ENTERPRISE_DISTRO = "1"
+
+# oe-core uses external libav instead of internal libav for gst-ffmpeg. We
+# disable by default the codecs in libav that causes issues with shipping an
+# Arago based SDK. No need to prevent gst-ffmpeg from being used since we
+# disable troublesome software.
+LICENSE_FLAGS_WHITELIST = "commercial_gst-ffmpeg"
-- 
1.7.0.4


