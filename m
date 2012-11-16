Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id EA5AF52A6F
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2012 04:31:41 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eq6so2249832obc.38
	for <meta-arago@arago-project.org>;
	Thu, 15 Nov 2012 20:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=tWjkaWAQLCF/1KDMIwZ1oIkeAbQjcipAjmao+7SuQQc=;
	b=EDgf3L9hYvxPLnEi/Nft19wSQJfonSTB8E/TkscKxs0wuAT3CkFlNye8jzIApMoizj
	oVPaf6n2K1vbDrS7knPgfd1Qa6X3NR5gfbzO9BJPuf9hztg+rcUQSRd8oAQ1/y8o1fQF
	MQCgx7nuKBVvGTpcZW6EIGgKMuo6G4NBJ5JedtGDAwqvPV0ZbT4t9z7Ib3D5tIaIAlXi
	OuBRiQuK94+67NRwRLgxODatHpSaxLHA2vc4iI3A7xl3ToY3qpW9XqigQcAIyBME43P/
	+WWhtRTJ2b69h4L3cL/okfZ6/73Z+gMrqmO1wIWxBVE971yru8OEmeLPaHRD6SRbrE8S
	n8MQ==
Received: by 10.182.12.40 with SMTP id v8mr2873137obb.12.1353040301702;
	Thu, 15 Nov 2012 20:31:41 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m8sm481759oeb.3.2012.11.15.20.31.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 20:31:41 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Nov 2012 22:31:29 -0600
Message-Id: <1353040290-26030-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1353040290-26030-1-git-send-email-fcooper@ti.com>
References: <1353040290-26030-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 4/5] arago.conf: Remove commercial license whitelisting
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
X-List-Received-Date: Fri, 16 Nov 2012 04:31:42 -0000

* Remove whitelisting for recipes with a commercial licence flag due to
  commercial licensing restrictions.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    9 ---------
 1 files changed, 0 insertions(+), 9 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 8674158..3e37969 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -83,12 +83,3 @@ POLKITAUTH = ""
 
 # Enable generation of source packages for SDKs
 require arago-source-ipk.conf
-
-# Whitelist several recipes that have commercial licenses
-# Need to verify with legal that the following recipes are ok to distribute
-# with the SDK
-LICENSE_FLAGS_WHITELIST = "\
-    commercial_gst-plugins-ugly \
-    commercial_mpeg2dec \
-    commercial_lame \
-"
-- 
1.7.0.4


