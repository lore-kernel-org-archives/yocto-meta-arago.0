Return-Path: <hnagalla@gmail.com>
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
	[209.85.167.178])
	by arago-project.org (Postfix) with ESMTPS id 8D4D952A43
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 21:35:11 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id v10so1079564oiv.12
	for <meta-arago@arago-project.org>;
	Fri, 06 Dec 2019 13:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=kr54ShWa4Kdtp976+0tNj04qUlrlFB0G0Ijjj77dPYo=;
	b=c1KPTaEl/GZ8mOEFCqPnL5xBUhLUv0IqtesFOuz+uRYzYh/YelFnyKUeCv/1zJfdCB
	d2WK737K80WiLGkGqpEEAZ3Ep8lCQcUmB8v4CMRbMRK1xpldkpmEM64CUGK3r4iixkAX
	YFHYrZCXFvDBJ0s0yXclgaJPA9TxG8YpFa23NNLvX4RwGnhKq2PmygLaWZsxjsF+S1lm
	+04BYeVb1n3BKG4zLAOsNzzrtJIsbmqx7j6Dy51P6GVnr/ddnUNj/EDI1h/cE1/sfpyQ
	8jBk9oW14b71+lWmLY8v01gHGzGaDspppbskmKwKo7MkrtMloPYhnr7hxeu5SbgZnzKK
	RXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=kr54ShWa4Kdtp976+0tNj04qUlrlFB0G0Ijjj77dPYo=;
	b=feYLUs68fs/l5YwrYSjYlf5glXKUKdEw00XUbuSs5FDltJKSDs3aizNUwkJ/kN9RSB
	d9MN6a3ciJdxqBSYIerntOeSB028KT4Spj0Rr8XhCi955cSep12eBiO9vDXfqYo3GGGw
	SuidrV7Ywx0V5wV1zvvYhiVdj+cjNx1QcO9jd+eo4kFawekDYWFg7hDPWslWjKwpwCkm
	vQ/6PATbLSiKbACJ9P+g9egv2WTMFxDA7m/Nvzv5kcFgVNeLMvYoRU61GJENtTs9mM/s
	g+sEmHugasBtGFoEJPPJHRAJ01f6lt5e7xgDNG09Ft0XQvVpxMNuIQa63jS+iRukPkSU
	NMqA==
X-Gm-Message-State: APjAAAUfSFBkZm/XMz3QNHbXpFd8m13X66aGAMTblssmqkwTCSu1VCJd
	g5i6+Y8gTMQKG89w4/Dn/WwyEPm/p2k=
X-Google-Smtp-Source: APXvYqxHbE5bql+tStEwGGrAGEO+n6PYb0mtgDnJI7H/2luY/CPvFVNuYmnuwiTzK/sdolXSA4JENA==
X-Received: by 2002:a54:4e94:: with SMTP id c20mr7424868oiy.27.1575668018299; 
	Fri, 06 Dec 2019 13:33:38 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	e21sm5380991oib.16.2019.12.06.13.33.37
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 13:33:37 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  6 Dec 2019 15:33:18 -0600
Message-Id: <20191206213318.18971-2-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206213318.18971-1-hnagalla@gmail.com>
References: <20191206213318.18971-1-hnagalla@gmail.com>
Subject: [ 1/1] Use wireless-regdb-static for K4.15 and later
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
X-List-Received-Date: Fri, 06 Dec 2019 21:35:12 -0000

---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb   | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 72b72d6c..23f31075 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -8,13 +8,13 @@ inherit packagegroup
 
 # WLAN support packages.
 # These are the packages that all platforms use for WLAN support
-# add wireless-regdb
+# add wireless-regdb-static
 WLAN_COMMON = "\
     iw \
     softap-udhcpd-config \
     eventdump \
     wlconf \
-    wireless-regdb \
+    wireless-regdb-static \
     linux-firmware-iwlwifi-8000c \
     linux-firmware-iwlwifi-8265 \
     linux-firmware-iwlwifi-3160-17 \
@@ -45,7 +45,6 @@ BT_COMMON = "\
 "
 
 BT_TI = "\
-    uim-sysfs \
     bt-enable \
     bt-fw \
 "
-- 
2.17.1


