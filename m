Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by arago-project.org (Postfix) with ESMTPS id D6D11529E1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:50 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id j1so1067347oag.29
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gi44sFAcxE0A7A6oRlRbhOWYF7jhZG8RPDqnILEiOOs=;
	b=DYdJFtKk7kjtJXSJJWdVEC+udHqZ0fxvLONKFeKejN5xJVrvC9UM1xHREMaojHAmxA
	jEoHUqgUlImD62RybPpE3mdghIr0Ht/Aw75zHk67FfH4BUhLMKzU3ciAbQ4kBbvBWLgx
	KdNQcKjVHBRa2+aP17m2aaReGXX/IKzK3Phn8eTpRKob3c3qDOdB8cyfgb+stYUMX6c7
	chhCBWzfhin0kLRXOKotuAx2UEaeat1iaBFsEmrbmrfN2svcuZf8fessl5ICVLgz7QxO
	ZysX6V8PI8D8jry/ga+lby+8IyE+QeADSJ5DqQ11LHBGxht5kiQGI22CqXeSBP/3nnvm
	Y9MA==
X-Received: by 10.60.171.146 with SMTP id au18mr5555716oec.108.1359151130012; 
	Fri, 25 Jan 2013 13:58:50 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.47
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:49 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:09 -0600
Message-Id: <1359150851-23602-28-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 29/31] bash: Use non GPLv3 version of bash
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:51 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Select the version of bash that does not have a GPLv3 license.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 5942909..8f0906d 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -80,6 +80,7 @@ PREFERRED_VERSION_crda = "1.1.1"
 PREFERRED_VERSION_obex = "0.34"
 PREFERRED_VERSION_bluez4 = "4.98"
 PREFERRED_VERSION_bluez-hcidump = "2.2"
+PREFERRED_VERSION_bash = "3.2.48"
 
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
-- 
1.7.0.4


