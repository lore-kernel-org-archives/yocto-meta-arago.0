Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f45.google.com (mail-oa0-f45.google.com
	[209.85.219.45])
	by arago-project.org (Postfix) with ESMTPS id 34DE052AB9
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 21:52:27 +0000 (UTC)
Received: by mail-oa0-f45.google.com with SMTP id i18so4880833oag.4
	for <meta-arago@arago-project.org>;
	Sat, 19 Jan 2013 13:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=hj7UYp1NYrXbYQg3TGS/BUbxDWtlDUuyuHQjJ58JXHQ=;
	b=0KaHxnDeHK4vTvcvEQ9jaVdpxVrfrvCSia1COhlfnkdEsotTmdMK7pgqhWV392NlFO
	NWJmcUtuWurC1yThDvFlArUveo2s6w+as0RjN+VqtT6lBmRasJ0VaDz2UvgACjHGCcXu
	UfBV88hurb6N+t5mxltOnDALFwn2cMKi41HFzbZd0vYr2J2G+3XEQCav2xi0PPciuv9V
	5BzULVz9T3pI5F4bNFLnxONjtvFgo58eRklpLNBEFsD9TdOYPCyX1zMD1lE2yko4HQN6
	9gPx4GfNXUQzSf8xYkNFXVIPJCNToFcU+v4Ex252k062nXyThCcetTOXrXADJCR7Qofk
	/L+g==
X-Received: by 10.60.28.74 with SMTP id z10mr10483425oeg.29.1358632346575;
	Sat, 19 Jan 2013 13:52:26 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b3sm6845496obo.6.2013.01.19.13.52.24
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 19 Jan 2013 13:52:25 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat, 19 Jan 2013 15:51:39 -0600
Message-Id: <1358632316-12266-14-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358632316-12266-1-git-send-email-fcooper@ti.com>
References: <1358632316-12266-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 14/31] arago.conf: Use bluez4 version 4.98
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
X-List-Received-Date: Sat, 19 Jan 2013 21:52:27 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 008967d..c8624e2 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -76,6 +76,7 @@ PREFERRED_VERSION_readline = "5.2"
 PREFERRED_VERSION_libnl = "2.0"
 PREFERRED_VERSION_crda = "1.1.1"
 PREFERRED_VERSION_obex = "0.34"
+PREFERRED_VERSION_bluez4 = "4.98"
 
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
-- 
1.7.0.4


