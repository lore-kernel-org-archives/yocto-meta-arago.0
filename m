Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 6350952A92
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:09 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4919086oag.24
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=RJ+I+0N+dlOOU7SBeHbJdEz5rL3hnE6KvKGi6udLsus=;
	b=MMaH2wBDGGQGMeiDOsL88G39SLUlkDqp2aaxkxwi5RwgqU5995h7rCeLHxqwV3E4a1
	vNPKCeFO5WouBVUmWuwT2BKarKs0/rdOrIuWTxuYt+Di4oTtNnwr3R2IsP1ebPcTXaXF
	tu7yGxfmhUkDhhNHtOhZgctQdEEcCnccRzfAJ0RLlURZOqPncZSqWTbZmvGgFo2mzdy+
	bsacw+5cNJZjVPfNFd9OVIydgXOniE2onvZ6N46SQmWy/Ncw/yXPQyHp8SO/RJgeLskk
	tKiIesbaFtmr+dEuZkp8ULN3M/ApqFQFNkvZoUizNW8W4zIJZxzu3F327V5rDHeynWgE
	ktHg==
X-Received: by 10.182.36.8 with SMTP id m8mr10416046obj.93.1358632328957;
	Sat, 19 Jan 2013 13:52:08 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.07
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:08 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:29 -0600
Message-Id: <1358632316-12266-4-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 04/31] arago.conf Use libnl version 2.0
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:09 -0000

* Using libnl version 2.0 located in oe-core.
* Previously libnl version 3.2.9 from meta-oe was being used.
* The line "ln -sf libnl3/netlink netlink" under do_install was conflicting
  with our Arago external toolchain recipe and is only seen in the 3.2.9 version
  of the recipe.
* Crda also had to be upgraded to work with libnl 3.2.9 which could potential
  cause problems for the WL1271 daughter card.
* Using version 2.0 which is known to work with the software stack for the
  WL1271 daughter card and also fix the issues mentioned above.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index ab8fcae..9208a7c 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -73,6 +73,7 @@ PREFERRED_PROVIDER_jpeg_armv5te = "jpeg"
 PREFERRED_VERSION_gdbm = "1.8.3"
 PREFERRED_VERSION_readline = "5.2"
 
+PREFERRED_VERSION_libnl = "2.0"
 PREFERRED_VERSION_obex = "0.34"
 
 # Disable polkit's systemd configuration from meta-oe
-- 
1.7.0.4


