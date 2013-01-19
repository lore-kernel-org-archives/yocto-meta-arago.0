Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by arago-project.org (Postfix) with ESMTPS id A585852AB2
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:12 +0000 (UTC)
Received: by mail-ob0-f172.google.com with SMTP id za17so4860144obc.3
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fkqWBww1xXc4hCmnnSxra4YYFaXoqBSCeRW1eTiw9a4=;
	b=gcTMAzVqPGjSOWNMYSk4DSu1YVVosEQYA93rpZmjK49WjPkeaD/7EZtZRTthZjRTMi
	mS8icyRHzoGmqiGGD7Q6xfNZLysuzpH9+5HLXI5TDzQvkK2U2mUqArWYlHA+qu94Cx7w
	ijSyt5jW+xkpsvyR/6TgG5rWsCsacf1MGoWJfi5qMVJSx9hb0xCeMKFH5JWDSOVjIGWt
	l7awMqZg3D89B7yoEnlGdZjZ0be5BIOJ+kVw9gB+dba3zdDUgWgRMZAi/vqvzReIMJhn
	tOoSxsQ0tqVgGZrznLg7zeLHDs1on6NKEUO3xVtj5OnDj3hr5R2qRtHI4Kmx3IFi7+g0
	4d5Q==
X-Received: by 10.182.156.81 with SMTP id wc17mr10653355obb.21.1358632332145; 
	Sat, 19 Jan 2013 13:52:12 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.10
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:11 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:31 -0600
Message-Id: <1358632316-12266-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 06/31] arago.conf: Use crda version 1.1.1
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:12 -0000

* Use crda version 1.1.1 since it is known to work with the WL1271 daughter
  card.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 9208a7c..008967d 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -74,6 +74,7 @@ PREFERRED_VERSION_gdbm = "1.8.3"
 PREFERRED_VERSION_readline = "5.2"
 
 PREFERRED_VERSION_libnl = "2.0"
+PREFERRED_VERSION_crda = "1.1.1"
 PREFERRED_VERSION_obex = "0.34"
 
 # Disable polkit's systemd configuration from meta-oe
-- 
1.7.0.4


