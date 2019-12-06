Return-Path: <hnagalla@gmail.com>
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
	[209.85.167.176])
	by arago-project.org (Postfix) with ESMTPS id A65BC52A21
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2019 21:35:10 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id 6so1112132oix.7
	for <meta-arago@arago-project.org>;
	Fri, 06 Dec 2019 13:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=kr54ShWa4Kdtp976+0tNj04qUlrlFB0G0Ijjj77dPYo=;
	b=aLzUF47281IPNA2dh2rEqICot1sbkfdtn21TnOG5e7cvjrcKMiq4AuJtojsf0FO7xw
	2XR0CiyQrzf2iDVwHhLTLUWCFZtw20GrSGOsyVzBMuranxzyg16v5B5K0FpWf5MA3gN/
	uFIiec9fThJKKasiBOch99bexSCe1dRceXGUjdWwhHGMxwLk3e9PILJTp6FWwm/5/0fB
	/KHlU5MSY86Ep1v4JNni9fW4spwXhxyjD5Z0jet7l8jSAvnhSAkeNQjxOi0gZZ8xVkux
	rkfJHkqaDPM/yyRNG+RJ5HmVQ1d9QAjjy/il2on/qo+4eKI5oi7XK7u/4TV9wO53BpwR
	hXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kr54ShWa4Kdtp976+0tNj04qUlrlFB0G0Ijjj77dPYo=;
	b=CCxYm1qTYcAL5Rt9mHXKkBR8/Dx+xA3tLMla8p1HIJnFoDKvpFCXf0BgSRtmjFBL5f
	YOP10ysbXy5Znv2dom+VqMWr3iJJ4Fu6y61a414QklvYeQGkWwBe9qKAf6+rLE7YC2oL
	orl5Fjwe42Sb4LRAYiEexjVKW3obuDWUJYweOgnBAF2KJj5to09TBMTx2kdADqBYMINy
	yYA/jadcfyCjNRfyJzbnDMN1BDr8HCRXqXfqcAtuwNDNS3brY/4VW6E5k5abYtQkOKMK
	cu7ZrNYD0DG+JTiAH61RhPJd2uBJVP7eFD00YPH1O94TH1c1VV5gEQDW/O/rkmfy1tgj
	8PgA==
X-Gm-Message-State: APjAAAXTVe8UfcztjnHzTeAnOIgrokLgrKxPrc+RKLp+em5iyJbwfoy3
	Dwkyk9jlQROiu/QHh0q3KsrlIvRDwsc=
X-Google-Smtp-Source: APXvYqx8dD4Fn5eu14UtP60+BfmwpSaij/0V4hxL7sASLu+TOd3TKb5Zf+NufmQb7hQc/YQwnqdiRQ==
X-Received: by 2002:aca:aacf:: with SMTP id
	t198mr14681563oie.135.1575668017167; 
	Fri, 06 Dec 2019 13:33:37 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	e21sm5380991oib.16.2019.12.06.13.33.36
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 13:33:36 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  6 Dec 2019 15:33:17 -0600
Message-Id: <20191206213318.18971-1-hnagalla@gmail.com>
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
X-List-Received-Date: Fri, 06 Dec 2019 21:35:11 -0000

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


