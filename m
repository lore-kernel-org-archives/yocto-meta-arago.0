Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f182.google.com (mail-ob0-f182.google.com
	[209.85.214.182])
	by arago-project.org (Postfix) with ESMTPS id 2412652ADE
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:38 +0000 (UTC)
Received: by mail-ob0-f182.google.com with SMTP id uo13so1033178obb.27
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=D5SMllAWevXyyg6WWZSdX/Y2vtpVxaX1F/8kBlsbUHM=;
	b=lxEYP8iRDwlztCV9TUQe2KYo2IUi12FUl1qLzDHiUbA41nywwph+Z6ceVPp/WB0WpL
	4UNcin8T4QcwTdY8/0HNXcGf+bIiInWB1ui/+ISVxircbI5QP+7sF6s4PWjPO6s60wGq
	Pp4xIK559nu6JelO4Hi7CzPacc+eqrlfu+MH2DOFdj7b/zMt9EzM886tKOJbV78SsqBs
	aZxJ2GId3Wsc7eEwNGSjKzCKglUHg9D0JhsxsmlnmwpMqxyMok/NFrLKriq6q2M8yqEP
	AynCcKTno5+RGdtKVwQKabIK17NFIipY3Cv7+QMrlDZxXnMxsLsXCFJQSziPUmhZGWAP
	c/XA==
X-Received: by 10.182.188.101 with SMTP id fz5mr5792485obc.0.1359151117176;
	Fri, 25 Jan 2013 13:58:37 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.35
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:36 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:02 -0600
Message-Id: <1359150851-23602-21-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 22/31] arago.conf: Set PREFERRED_VERSION for readline-native
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:38 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add PREFERRED_VERSION for readline-native. This matches the PREFERRED_VERSION
  readline.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 4e11251..5942909 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -72,6 +72,8 @@ PREFERRED_PROVIDER_jpeg_armv5te = "jpeg"
 # application that does not have a GPLv3 license
 PREFERRED_VERSION_gdbm = "1.8.3"
 PREFERRED_VERSION_readline = "5.2"
+PREFERRED_VERSION_readline-native = "5.2"
+PREFERRED_VERSION_readline-nativesdk = "5.2"
 
 PREFERRED_VERSION_libnl = "2.0"
 PREFERRED_VERSION_crda = "1.1.1"
-- 
1.7.0.4


