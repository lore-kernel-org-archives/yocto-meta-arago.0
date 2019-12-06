Return-Path: <hnagalla@gmail.com>
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
	[209.85.210.47])
	by arago-project.org (Postfix) with ESMTPS id D314C529B5
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 20:18:29 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id g18so6842525otj.13
	for <meta-arago@arago-project.org>;
	Fri, 06 Dec 2019 12:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=vkL3H0FlaMRkyJC/TXgGa7/BL7JE+EJ4cGM6yfzO1/o=;
	b=SRtGAxrE+n1cOAl7YRjhS8SaREdbGvUsK9F9U4q4uF/Bz7boDN+c1HZogEAjyhmfDI
	1Mzb0Mz6V1aA/clr/YqVchQ+19n5IV23/7Aeq61pZdZzJjenZitTueDd4J6aFCs3NfId
	FfJ44tjpv8cvoT60p9abJLxMIbE+8o6TOoFttZGASeBN05WiQgPjiZ27WY0sKGVOdgjF
	a6qDL/Yb38yVcnvhicJgAG9UoERaeMeSm9AfmIrrqyn2+Sc/CL2/p//JZof9DKrJh7YD
	Qc90U1lsPlPVlC87oNmCwAvYPcn5ldMEBMUwXTRYWgDg7GRFdKxsc5qlNnfX7pR0Oi3I
	77jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=vkL3H0FlaMRkyJC/TXgGa7/BL7JE+EJ4cGM6yfzO1/o=;
	b=mS6VMRszuQJGpxSQLO8QHu6hSHuxXa2lk5q29HA8tEY8h3CZIxPbdM50dlTkk5JC5I
	hWrAGXEiJK/sHvZu/N9b82nuP6B283t0BctaX9cjqjgQsLOkN8NVTQ63uPB43n+Rxpd0
	QSIjqcZNE2cRj4iqP10LjMGXcl+xOjbAeU2hWC6rJpA2o6OcXJlQKFUmjpwvyeYDB15v
	7JBPezflAq+LenYQ67tYKapgEE+M+HFDurUp7xBlXbro25f7FOOQW3VecH7zHFGB079q
	i7j8t6FY1JXMJddVMu768RsYnknkYtuftbXOpZRLoaRMOxkbwRYgqRfZcvYV3vGXPBoa
	jaeQ==
X-Gm-Message-State: APjAAAU1NqOvoL8aLo/AKof8BzhYXbhmQkGWjzSebE8mIE7CpSeiovLg
	5NKtLYRuyAUApwCUwTyWLyzWA6PETRI=
X-Google-Smtp-Source: APXvYqyqNYM9LPsVhm2S1zhTxd/Ug2eoD+X2sebvkWZlxnBVXr2rsC5nW0L3v86LUn/Q6ZgALxEmuw==
X-Received: by 2002:a9d:70cb:: with SMTP id w11mr7807907otj.157.1575663416594; 
	Fri, 06 Dec 2019 12:16:56 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	f83sm5276155oia.43.2019.12.06.12.16.55
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 12:16:55 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  6 Dec 2019 14:16:38 -0600
Message-Id: <20191206201639.18381-1-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
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
X-List-Received-Date: Fri, 06 Dec 2019 20:18:30 -0000

---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 72b72d6c..a44c4063 100644
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
-- 
2.17.1


