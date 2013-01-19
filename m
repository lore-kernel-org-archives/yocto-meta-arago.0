Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by arago-project.org (Postfix) with ESMTPS id A632252A92
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:30 +0000 (UTC)
Received: by mail-ob0-f181.google.com with SMTP id oi10so4719490obb.40
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=DOgCTTANfShu7K1WXeyT8fbYkR9VhkOQnT1uqeR3w4M=;
	b=Ih7835MZSsoBiJz/ty2izVDwyRv1EeSzQizYH/oBP+0Rhzhi4EyTkmp4e965W4z4a4
	qwlz8fu4IyGZRVetKZzRzzAGw76dqoHNbQlC3JeieHq7mPXFWlgA2wf7AmP2YUVdXBCq
	DZDdRC4OmwlYq/VjvuixlFBFoFgBvfxp2l1jGQapdnEc6AXLaE5H6BZNi4U4LDp74yY/
	+Y0zNGIcRsIFuscJXbimJg5pCawnBcBIpcMQsKMJkkKHVVYH5zY9hBZgJesnu7eQyH76
	6EsiBYWoYR1eglQF5uo5hryYZCIVxLg93/FA9n4VW3iGFVb7ZkSCfJxcBgWetYSsmTSN
	2VEQ==
X-Received: by 10.182.152.9 with SMTP id uu9mr560093obb.9.1358632350020;
	Sat, 19 Jan 2013 13:52:30 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.28
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:29 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:41 -0600
Message-Id: <1358632316-12266-16-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 16/31] arago.conf: Use bluez-hcidump version 2.2
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:31 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index c8624e2..e8265a0 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -77,6 +77,7 @@ PREFERRED_VERSION_libnl = "2.0"
 PREFERRED_VERSION_crda = "1.1.1"
 PREFERRED_VERSION_obex = "0.34"
 PREFERRED_VERSION_bluez4 = "4.98"
+PREFERRED_VERSION_bluez-hcidump = "2.2"
 
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
-- 
1.7.0.4


